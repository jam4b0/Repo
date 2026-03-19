local _, ns = ...

local RETAIL_PARENT_ORDER = {
    [2600] = 1, -- Die Durchtrennten Fäden
    [2653] = 2, -- Die Kartelle von Lorenhall
}

local sourceBonuses = {
    raid = 120,
    instance = 100,
    zone = 70,
    subZone = 60,
    inferred = 35,
    fallback = 10,
    test = 5,
}

local classBonuses = {
    city = 28,
    major_faction = 24,
    group = 18,
    hub = 16,
    child = 10,
    subzone = 12,
    zone = 0,
    instance = 8,
    raid = 8,
    event = -10,
    companion = -200,
    unknown = 0,
}

function ns.Scoring:Prioritize(matches, rawFactions, context, options)
    local profile = ns.State:GetProfile()
    local watchedFactionID = context.watchedFactionID
    local lastRelevantFactionID = ns.State:GetRuntimeValue("lastRelevantFactionID")
    local prioritized = {}

    if options and options.forceTest then
        for index, faction in ipairs(rawFactions.list) do
            prioritized[#prioritized + 1] = {
                factionID = faction.factionID,
                faction = faction,
                name = faction.name,
                sourceType = "test",
                sourceKey = tostring(index),
                score = 100 - index,
                isDirect = false,
                isFallback = true,
            }
            if #prioritized >= profile.maxBars then
                break
            end
        end
        return prioritized
    end

    local seen = {}

    for _, match in ipairs(matches) do
        local faction = match.faction
        local score = (match.baseWeight or 0) + (sourceBonuses[match.sourceType] or 0)

        if match.isMapChain then
            if (match.chainDepth or 0) == 0 then
                score = score + 18
            else
                score = score - ((match.chainDepth or 0) * 90)
            end
        end

        if faction.factionID and faction.factionID == watchedFactionID then
            score = score + 40
        end
        if faction.factionID and faction.factionID == lastRelevantFactionID then
            score = score + 20
        end
        if not faction.isExalted then
            score = score + 25
        end
        if faction.isMajorFaction then
            score = score + 10
        end
        if match.isInherited then
            score = score - 12
        end

        score = score + (classBonuses[match.factionClass or "unknown"] or 0)

        if match.tags then
            for _, tag in ipairs(match.tags) do
                if tag == "primary" then
                    score = score + 30
                elseif tag == "dungeon" or tag == "raid" then
                    score = score + 10
                elseif tag == "local" then
                    score = score + 5
                end
            end
        end

        score = score + (faction.progressPct or 0) / 10

        local candidate = {
            factionID = faction.factionID,
            faction = faction,
            name = faction.name,
            sourceType = match.sourceType,
            sourceKey = match.sourceKey,
            score = score,
            isDirect = true,
            isFallback = false,
            isInherited = match.isInherited and true or false,
            note = match.note,
            tags = match.tags,
            factionClass = match.factionClass,
        }

        local key = faction.factionID or faction.name
        if not seen[key] or seen[key].score < candidate.score then
            seen[key] = candidate
        end
    end

    for _, candidate in pairs(seen) do
        prioritized[#prioritized + 1] = candidate
    end

    if #prioritized == 0 then
        local fallbackFaction = watchedFactionID and rawFactions.byID[watchedFactionID] or nil
        if not fallbackFaction and context and context.isInInstance and lastRelevantFactionID then
            fallbackFaction = rawFactions.byID[lastRelevantFactionID]
        end

        if fallbackFaction then
            prioritized[1] = {
                factionID = fallbackFaction.factionID,
                faction = fallbackFaction,
                name = fallbackFaction.name,
                sourceType = "fallback",
                sourceKey = fallbackFaction.factionID == watchedFactionID and "watched" or "lastRelevantInstance",
                score = sourceBonuses.fallback,
                isDirect = false,
                isFallback = true,
                factionClass = "unknown",
            }
        end
    end

    table.sort(prioritized, function(left, right)
        local leftParent = left.parentFactionID or left.factionID or 0
        local rightParent = right.parentFactionID or right.factionID or 0
        local leftParentOrder = RETAIL_PARENT_ORDER[leftParent]
        local rightParentOrder = RETAIL_PARENT_ORDER[rightParent]

        if leftParentOrder and rightParentOrder and leftParentOrder ~= rightParentOrder then
            return leftParentOrder < rightParentOrder
        end
        if leftParentOrder and not rightParentOrder then
            return true
        end
        if rightParentOrder and not leftParentOrder then
            return false
        end

        if leftParent ~= rightParent then
            if left.score ~= right.score then
                return left.score > right.score
            end
            if (left.faction.progressPct or 0) ~= (right.faction.progressPct or 0) then
                return (left.faction.progressPct or 0) > (right.faction.progressPct or 0)
            end
            return (left.name or "") < (right.name or "")
        end

        if left.parentFactionID ~= right.parentFactionID then
            if left.parentFactionID and not right.parentFactionID then
                return false
            end
            if right.parentFactionID and not left.parentFactionID then
                return true
            end
        end

        if left.score ~= right.score then
            return left.score > right.score
        end
        if (left.faction.progressPct or 0) ~= (right.faction.progressPct or 0) then
            return (left.faction.progressPct or 0) > (right.faction.progressPct or 0)
        end
        return (left.name or "") < (right.name or "")
    end)

    return prioritized
end
