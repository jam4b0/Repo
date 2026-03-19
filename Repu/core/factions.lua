local _, ns = ...

local Utils = ns.Utils
local RETAIL_COMPANION_FACTION_IDS = {
    [2640] = true, -- Brann Bronzebart
    [2744] = true, -- Valeera Sanguinar
}
local KNOWN_RETAIL_PARENT_FACTIONS = {
    [2710] = {
        children = {
            [2711] = { name = "Magister" },
            [2712] = { name = "Blutritter" },
            [2714] = { name = "Schemen der Gasse" },
            [2713] = { name = "Weltenwanderer" },
        },
    },
    [2600] = {
        children = {
            [2605] = { name = "Der General" },
            [2607] = { name = "Der Wesir" },
            [2601] = { name = "Die Weberin" },
        },
    },
    [2653] = {
        children = {
            [2677] = { name = "Dampfdruckkartell" },
            [2675] = { name = "Schwarzmeer AG" },
            [2673] = { name = "Bilgewasserkartell" },
            [2671] = { name = "Venture Company" },
            [2685] = { name = "Garbagio Treueclub" },
        },
    },
}
local KNOWN_VIRTUAL_PARENT_FACTIONS = {
    [9000111] = {
        name = "Shattrath",
        children = {
            [935] = { name = "Die Sha'tar" },
            [932] = { name = "Die Aldor" },
            [934] = { name = "Die Seher" },
            [1011] = { name = "Unteres Viertel" },
            [1031] = { name = "Himmelswache der Sha'tari" },
            [1077] = { name = "Offensive der Zerschmetterten Sonne" },
        },
    },
}
local KNOWN_RETAIL_CHILD_TO_PARENT = {
    [2711] = 2710,
    [2712] = 2710,
    [2714] = 2710,
    [2713] = 2710,
    [2605] = 2600,
    [2607] = 2600,
    [2601] = 2600,
    [2677] = 2653,
    [2675] = 2653,
    [2673] = 2653,
    [2671] = 2653,
    [2685] = 2653,
}

function ns.Factions:GetKnownChildFactionIDs(parentFactionID)
    local childIDs = {}
    local seen = {}
    local runtime = ns.State and ns.State.runtime or nil
    local rawFactions = runtime and runtime.rawFactions or nil
    local dynamicChildren = rawFactions and rawFactions.childIDsByParent and rawFactions.childIDsByParent[parentFactionID] or nil

    for _, factionID in ipairs(dynamicChildren or {}) do
        if not seen[factionID] then
            seen[factionID] = true
            childIDs[#childIDs + 1] = factionID
        end
    end

    local parent = KNOWN_RETAIL_PARENT_FACTIONS[parentFactionID]
    for factionID in pairs(parent and parent.children or {}) do
        if not seen[factionID] then
            seen[factionID] = true
            childIDs[#childIDs + 1] = factionID
        end
    end

    local virtualParent = KNOWN_VIRTUAL_PARENT_FACTIONS[parentFactionID]
    for factionID in pairs(virtualParent and virtualParent.children or {}) do
        if not seen[factionID] then
            seen[factionID] = true
            childIDs[#childIDs + 1] = factionID
        end
    end

    if #childIDs == 0 then
        return nil
    end

    table.sort(childIDs)
    return childIDs
end

local function getKnownChildDefinition(parentFactionID, childFactionID)
    local parent = KNOWN_RETAIL_PARENT_FACTIONS[parentFactionID]
    if parent and parent.children and parent.children[childFactionID] then
        return parent.children[childFactionID]
    end

    local virtualParent = KNOWN_VIRTUAL_PARENT_FACTIONS[parentFactionID]
    if virtualParent and virtualParent.children and virtualParent.children[childFactionID] then
        return virtualParent.children[childFactionID]
    end

    return nil
end

local function matchApplies(match, context)
    if match.factionGroups and context.playerFactionGroup then
        local allowed = false
        for _, factionGroup in ipairs(match.factionGroups) do
            if factionGroup == context.playerFactionGroup then
                allowed = true
                break
            end
        end
        if not allowed then
            return false
        end
    end

    if match.instanceTypes and context.instanceType then
        local allowed = false
        for _, instanceType in ipairs(match.instanceTypes) do
            if instanceType == context.instanceType then
                allowed = true
                break
            end
        end
        if not allowed then
            return false
        end
    end

    if match.difficulties and context.instanceDifficultyID then
        local allowed = false
        for _, difficultyID in ipairs(match.difficulties) do
            if difficultyID == context.instanceDifficultyID then
                allowed = true
                break
            end
        end
        if not allowed then
            return false
        end
    end

    return true
end

local function normalizeFaction(row)
    if row.isHeader or not row.hasRep or not row.name then
        return nil
    end

    local minValue = row.barMin or 0
    local maxValue = row.barMax or 0
    local value = row.barValue or 0
    local progressValue = math.max(0, value - minValue)
    local progressMax = math.max(0, maxValue - minValue)
    local progressPct = progressMax > 0 and (progressValue / progressMax) * 100 or 0
    local standingID = row.standingID or 0

    return {
        index = row.index,
        factionID = row.factionID,
        name = row.name,
        nameKey = Utils:NormalizeKey(row.name),
        description = row.description,
        standingID = standingID,
        standingLabel = row.isMajorFaction and "Ruhmstufe" or ns.Compat:GetStandingLabel(standingID),
        min = minValue,
        max = maxValue,
        value = value,
        progressValue = progressValue,
        progressMax = progressMax,
        progressPct = progressPct,
        isWatched = row.isWatched or false,
        isChild = row.isChild or false,
        isExalted = standingID >= 8,
        isAccountWide = row.isAccountWide or false,
        isMajorFaction = row.isMajorFaction or false,
        hasRepEntry = true,
        parentFactionID = row.parentFactionID,
        renownLevel = row.renownLevel,
        friendshipRepID = row.friendshipRepID,
        hasBonusRepGain = row.hasBonusRepGain or false,
        majorFactionData = row.majorFactionData,
        raw = row.raw,
    }
end

local function createSyntheticFaction(match)
    if not match then
        return nil
    end

    local factionData = match.factionID and ns.Compat:GetFactionDataByID(match.factionID) or nil
    local name = match.name or (factionData and factionData.name) or UNKNOWN
    local description = match.description or (factionData and factionData.description) or nil
    local hasRepEntry = factionData and (factionData.hasRep == true or factionData.hasRepEntry == true or (factionData.renownLevel and factionData.renownLevel > 0)) or false
    local standingLabel = "Kein Rufeintrag"
    local minValue = factionData and (factionData.min or factionData.barMin) or 0
    local maxValue = factionData and (factionData.max or factionData.barMax) or 0
    local value = factionData and (factionData.value or factionData.barValue) or 0
    local progressValue = factionData and factionData.progressValue
    local progressMax = factionData and factionData.progressMax
    local progressPct = factionData and factionData.progressPct

    if progressValue == nil or progressMax == nil then
        progressValue = math.max(0, value - minValue)
        progressMax = math.max(0, maxValue - minValue)
        progressPct = progressMax > 0 and (progressValue / progressMax) * 100 or 0
    end

    if hasRepEntry then
        if factionData.isMajorFaction and factionData.renownLevel and factionData.renownLevel > 0 then
            standingLabel = "Ruhmstufe"
        else
            standingLabel = ns.Compat:GetStandingLabel(factionData.standingID or 0)
        end
    end

    return {
        index = 0,
        factionID = match.factionID,
        name = name,
        nameKey = Utils:NormalizeKey(name),
        description = description,
        standingID = factionData and factionData.standingID or 0,
        standingLabel = standingLabel,
        min = minValue,
        max = maxValue,
        value = value,
        progressValue = progressValue or 0,
        progressMax = progressMax or 0,
        progressPct = progressPct or 0,
        isWatched = false,
        isChild = factionData and factionData.isChild or false,
        isExalted = factionData and factionData.isExalted or false,
        isAccountWide = factionData and factionData.isAccountWide or false,
        isMajorFaction = factionData and factionData.isMajorFaction or false,
        hasRepEntry = hasRepEntry,
        isKnownMissing = not hasRepEntry,
        parentFactionID = factionData and factionData.parentFactionID or (match.factionID and KNOWN_RETAIL_CHILD_TO_PARENT[match.factionID]) or nil,
        renownLevel = factionData and factionData.renownLevel or nil,
        friendshipRepID = factionData and factionData.friendshipRepID or nil,
        hasBonusRepGain = false,
        majorFactionData = factionData and factionData.majorFactionData or nil,
        raw = factionData,
    }
end

local function createVirtualGroupFaction(factionID, name)
    return {
        index = 0,
        factionID = factionID,
        name = name or "Fraktionsgruppe",
        nameKey = Utils:NormalizeKey(name or "Fraktionsgruppe"),
        description = "Gruppierte Ortsfraktionen dieses Gebiets.",
        standingID = 0,
        standingLabel = "",
        min = 0,
        max = 1,
        value = 0,
        progressValue = 0,
        progressMax = 0,
        progressPct = 0,
        isWatched = false,
        isChild = false,
        isExalted = false,
        isAccountWide = false,
        isMajorFaction = false,
        hasRepEntry = false,
        isKnownMissing = false,
        isVirtualGroup = true,
        hasBonusRepGain = false,
    }
end

local function createSyntheticKnownChildFaction(factionID, name, parentFactionID)
    local factionName = name or ("Fraktion " .. tostring(factionID))
    return {
        index = 0,
        factionID = factionID,
        name = factionName,
        nameKey = Utils:NormalizeKey(factionName),
        description = nil,
        standingID = 0,
        standingLabel = "",
        min = 0,
        max = 1,
        value = 0,
        progressValue = 0,
        progressMax = 0,
        progressPct = 0,
        isWatched = false,
        isChild = true,
        isExalted = false,
        isAccountWide = false,
        isMajorFaction = false,
        hasRepEntry = false,
        isKnownMissing = true,
        parentFactionID = parentFactionID,
        hasBonusRepGain = false,
    }
end

local function indexFaction(collection, faction)
    if faction.factionID then
        collection.byID[faction.factionID] = faction
    end
    if faction.nameKey then
        collection.byName[faction.nameKey] = faction
    end
    collection.list[#collection.list + 1] = faction
end

local function addMatch(results, faction, match)
    local scoreSeed = match.weight or 0
    results[#results + 1] = {
        factionID = faction.factionID,
        faction = faction,
        name = faction.name,
        sourceType = match.sourceType,
        sourceKey = match.sourceKey,
        baseWeight = scoreSeed,
        note = match.note,
        isDirect = true,
        isWatched = faction.isWatched,
        isExalted = faction.isExalted,
        progressPct = faction.progressPct,
        tags = match.tags,
        isMapChain = match.isMapChain and true or false,
        chainDepth = match.chainDepth or 0,
        parentFactionID = faction.parentFactionID or (faction.factionID and KNOWN_RETAIL_CHILD_TO_PARENT[faction.factionID]) or nil,
    }
end

local function isRetailCompanionFaction(faction)
    if not faction then
        return false
    end

    if faction.factionID and RETAIL_COMPANION_FACTION_IDS[faction.factionID] then
        return true
    end

    local nameKey = Utils:NormalizeKey(faction.name or "")
    local descriptionKey = Utils:NormalizeKey(faction.description or "")

    if nameKey == "valeera sanguinar" or nameKey == "brann bronzebart" then
        return true
    end

    return descriptionKey and string.find(descriptionKey, "tiefengefahrtin", 1, true) ~= nil
end

function ns.Factions:CollectAll()
    local rows = ns.Compat:CollectFactionRows()
    local collection = {
        list = {},
        byID = {},
        byName = {},
        childIDsByParent = {},
    }

    for _, row in ipairs(rows) do
        local faction = normalizeFaction(row)
        if faction then
            indexFaction(collection, faction)
            if faction.parentFactionID and faction.factionID then
                collection.childIDsByParent[faction.parentFactionID] = collection.childIDsByParent[faction.parentFactionID] or {}
                collection.childIDsByParent[faction.parentFactionID][#collection.childIDsByParent[faction.parentFactionID] + 1] = faction.factionID
            end
        end
    end

    return collection
end

function ns.Factions:BuildMatches(rawFactions, context)
    local results = {}
    local seen = {}
    local hasSubZoneMatch = false

    local function appendMatch(match, faction, sourceType, sourceKey)
        if not faction or not matchApplies(match, context) then
            return
        end

        local dedupeKey = table.concat({
            tostring(sourceType),
            tostring(sourceKey),
            tostring(faction.factionID or faction.name),
            tostring(match.note or ""),
        }, "::")

        if seen[dedupeKey] then
            return
        end
        seen[dedupeKey] = true

        local resolved = Utils:ShallowCopy(match)
        resolved.sourceKey = sourceKey
        resolved.sourceType = sourceType
        addMatch(results, faction, resolved)
    end

    local function resolve(sourceType, rawKey)
        local matches = ns.Data:FindMatches(sourceType, rawKey)
        for _, match in ipairs(matches) do
            local faction = match.factionID and rawFactions.byID[match.factionID] or nil
            if not faction and match.name then
                faction = rawFactions.byName[Utils:NormalizeKey(match.name)]
            end
            if not faction then
                faction = createSyntheticFaction(match)
            end
            appendMatch(match, faction, sourceType, rawKey)
        end
    end

    local function resolveByMapID(sourceType, mapID, sourceKey)
        local matches = ns.Data:FindMatchesByMapID(sourceType, mapID)
        for _, match in ipairs(matches) do
            local faction = match.factionID and rawFactions.byID[match.factionID] or nil
            if not faction and match.name then
                faction = rawFactions.byName[Utils:NormalizeKey(match.name)]
            end
            if not faction then
                faction = createSyntheticFaction(match)
            end
            appendMatch(match, faction, sourceType, sourceKey or mapID)
        end
    end

    local function resolveSubZone(mapID, rawKey)
        local matches = ns.Data:FindSubZoneMatches(mapID, rawKey)
        for _, match in ipairs(matches) do
            local faction = match.factionID and rawFactions.byID[match.factionID] or nil
            if not faction and match.name then
                faction = rawFactions.byName[Utils:NormalizeKey(match.name)]
            end
            if not faction then
                faction = createSyntheticFaction(match)
            end
            appendMatch(match, faction, "subZone", rawKey or mapID)
            hasSubZoneMatch = true
        end
    end

    local function resolveMapChain(sourceType)
        local chain = context.mapChain or {}
        for index, node in ipairs(chain) do
            local matches = ns.Data:FindMatchesByMapID(sourceType, node.mapID)
            for _, match in ipairs(matches) do
                local faction = match.factionID and rawFactions.byID[match.factionID] or nil
                if not faction and match.name then
                    faction = rawFactions.byName[Utils:NormalizeKey(match.name)]
                end
                if not faction then
                    faction = createSyntheticFaction(match)
                end

                local resolved = Utils:ShallowCopy(match)
                resolved.sourceKey = node.name or node.mapID
                resolved.sourceType = sourceType
                resolved.isMapChain = true
                resolved.chainDepth = index - 1
                appendMatch(resolved, faction, sourceType, node.name or node.mapID)
            end
        end
    end

    if context.instanceType == "raid" then
        resolveByMapID("raid", context.instanceMapID, context.instanceName or context.instanceMapID)
        resolve("raid", context.instanceName)
    elseif context.instanceType and context.instanceType ~= "none" then
        resolveByMapID("instance", context.instanceMapID, context.instanceName or context.instanceMapID)
        resolve("instance", context.instanceName)
    end

    resolveMapChain("zone")
    resolve("zone", context.zoneName)
    resolveSubZone(context.mapID, context.subZoneName)

    if context.subZoneName and not hasSubZoneMatch then
        for _, match in ipairs(results) do
            if match.sourceType == "zone" then
                match.isInherited = true
                if match.note and match.note ~= "" then
                    match.note = string.format("%s | Used as zone fallback for current subzone", match.note)
                else
                    match.note = "Used as zone fallback for current subzone"
                end
            end
        end
    end

    local inferred = ns.Inference:BuildMatches(rawFactions, context, results)
    for _, match in ipairs(inferred) do
        results[#results + 1] = match
    end

    return results
end

function ns.Factions:SelectVisible(prioritized, context)
    local profile = ns.State:GetProfile()
    local visible = {}
    local runtime = ns.State.runtime or {}
    local rawFactions = runtime.rawFactions or {}
    local byID = rawFactions.byID or {}
    local seenFactionIDs = {}

    local function canInclude(candidate, index)
        local include = true

        if profile.hideExalted and candidate.faction.isExalted and not candidate.isDirect then
            include = false
        end

        if include and not profile.showRetailCompanions and context and context.activeFlavor == "retail" and isRetailCompanionFaction(candidate.faction) then
            include = false
        end

        if include then
            candidate.isActive = index == 1 and #visible == 0
        end

        return include
    end

    local function appendVisible(candidate, index)
        if not candidate or not candidate.factionID or seenFactionIDs[candidate.factionID] then
            return
        end

        if not canInclude(candidate, index) then
            return
        end

        seenFactionIDs[candidate.factionID] = true
        visible[#visible + 1] = candidate
    end

    local appendKnownChildren

    local function appendVirtualGroup(parentFactionID, score)
        local definition = KNOWN_VIRTUAL_PARENT_FACTIONS[parentFactionID]
        if not definition or seenFactionIDs[parentFactionID] then
            return false
        end

        local hasVisibleChild = false
        for childFactionID in pairs(definition.children or {}) do
            if byID[childFactionID] then
                hasVisibleChild = true
                break
            end
            local childData = ns.Compat:GetFactionDataByID(childFactionID)
            if childData then
                hasVisibleChild = true
                break
            end
        end

        if not hasVisibleChild then
            return false
        end

        local parentCandidate = {
            factionID = parentFactionID,
            faction = createVirtualGroupFaction(parentFactionID, definition.name),
            name = definition.name,
            sourceType = "group",
            sourceKey = definition.name,
            score = score or 0,
            isDirect = false,
            isFallback = false,
            hasKnownChildren = true,
        }

        appendVisible(parentCandidate, #visible + 1)
        if visible[#visible] == parentCandidate then
            appendKnownChildren(parentCandidate)
            return true
        end

        return false
    end

    local function maybeAppendLegacyVirtualGroup(candidate)
        if not candidate or not candidate.factionID then
            return false
        end

        if context and context.mapID == 111 then
            local shattrathChildren = KNOWN_VIRTUAL_PARENT_FACTIONS[9000111].children
            if shattrathChildren[candidate.factionID] then
                if seenFactionIDs[9000111] then
                    return true
                end
                return appendVirtualGroup(9000111, candidate.score or 0)
            end
        end

        return false
    end

    appendKnownChildren = function(parentCandidate)
        if not parentCandidate or not parentCandidate.factionID then
            return
        end

        local childIDs = self:GetKnownChildFactionIDs(parentCandidate.factionID)
        if not childIDs or #childIDs == 0 then
            return
        end

        local childCandidates = {}
        for _, childFactionID in ipairs(childIDs) do
            local childFaction = byID[childFactionID]
            if not childFaction then
                childFaction = ns.Compat:GetFactionDataByID(childFactionID)
            end
            if not childFaction then
                local childDefinition = getKnownChildDefinition(parentCandidate.factionID, childFactionID)
                if childDefinition then
                    childFaction = createSyntheticKnownChildFaction(childFactionID, childDefinition.name, parentCandidate.factionID)
                end
            end

            if childFaction and not seenFactionIDs[childFactionID] then
                childCandidates[#childCandidates + 1] = {
                    factionID = childFactionID,
                    faction = childFaction,
                    name = childFaction.name,
                    sourceType = "child",
                    sourceKey = tostring(parentCandidate.factionID),
                    score = (parentCandidate.score or 0) - 1 - (#childCandidates / 100),
                    isDirect = false,
                    isFallback = false,
                    isChildOfVisibleParent = true,
                    parentFactionID = parentCandidate.factionID,
                    note = "Known child faction of visible parent",
                    tags = { "child", "local" },
                }
            end
        end

        table.sort(childCandidates, function(left, right)
            if left.faction.isExalted ~= right.faction.isExalted then
                return not left.faction.isExalted
            end
            if (left.faction.progressPct or 0) ~= (right.faction.progressPct or 0) then
                return (left.faction.progressPct or 0) > (right.faction.progressPct or 0)
            end
            return (left.name or "") < (right.name or "")
        end)

        for _, childCandidate in ipairs(childCandidates) do
            appendVisible(childCandidate, #visible + 1)
            if #visible >= profile.maxBars then
                break
            end
        end
    end

    for index, candidate in ipairs(prioritized) do
        local handledByVirtualGroup = maybeAppendLegacyVirtualGroup(candidate)
        if not handledByVirtualGroup then
            appendVisible(candidate, index)
            if visible[#visible] == candidate then
                appendKnownChildren(candidate)
            end
        end

        if #visible >= profile.maxBars then
            break
        end
    end

    local allowFallback = true
    if context and context.mapID then
        local hasZoneMapping = #ns.Data:FindMatchesByMapID("zone", context.mapID) > 0
        local hasSubZoneMapping = #ns.Data:FindSubZoneMatches(context.mapID, context.subZoneName) > 0
        allowFallback = not (hasZoneMapping or hasSubZoneMapping)
    end

    if #visible == 0 and allowFallback then
        local watchedID = context.watchedFactionID
        local fallbackFaction = nil

        if watchedID then
            fallbackFaction = byID[watchedID]
        elseif context and context.isInInstance then
            local lastRelevantID = ns.State:GetRuntimeValue("lastRelevantFactionID")
            fallbackFaction = byID[lastRelevantID or 0]
        end

        if fallbackFaction then
            visible[1] = {
                factionID = fallbackFaction.factionID,
                faction = fallbackFaction,
                name = fallbackFaction.name,
                sourceType = "fallback",
                sourceKey = watchedID and "watched" or "lastRelevantInstance",
                score = 1,
                isDirect = false,
                isFallback = true,
                isActive = true,
            }
        end
    end

    return visible
end
