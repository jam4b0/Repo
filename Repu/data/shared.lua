local _, ns = ...

local Utils = ns.Utils

local defaultWeights = {
    raid = 400,
    instance = 350,
    zone = 250,
    subZone = 225,
}

local rankColors = {
    [1] = { 0.78, 0.13, 0.13 },
    [2] = { 0.84, 0.27, 0.12 },
    [3] = { 0.85, 0.52, 0.14 },
    [4] = { 0.75, 0.75, 0.20 },
    [5] = { 0.20, 0.67, 0.25 },
    [6] = { 0.18, 0.60, 0.62 },
    [7] = { 0.22, 0.52, 0.88 },
    [8] = { 0.64, 0.30, 0.83 },
}

local emptyMap = {
    zone = {},
    subZone = {},
    instance = {},
    raid = {},
}

local function addKey(container, key, entry)
    local normalizedKey = Utils:NormalizeKey(key)
    if not normalizedKey then
        return
    end

    container[normalizedKey] = container[normalizedKey] or {}
    table.insert(container[normalizedKey], entry)
end

local function normalizeEntry(entry, sourceType)
    local copy = Utils:ShallowCopy(entry)
    copy.weight = copy.weight or defaultWeights[sourceType] or 100
    copy.sourceType = sourceType
    copy.aliases = copy.aliases or nil
    copy.zoneKeys = copy.zoneKeys or nil
    copy.subZoneKeys = copy.subZoneKeys or nil
    copy.mapIDs = copy.mapIDs or nil
    copy.instanceMapIDs = copy.instanceMapIDs or nil
    copy.difficulties = copy.difficulties or nil
    copy.instanceTypes = copy.instanceTypes or nil
    copy.factionGroups = copy.factionGroups or nil
    copy.tags = copy.tags or nil
    return copy
end

local locationTypeToSection = {
    zones = "zone",
    subZones = "subZone",
    instances = "instance",
    raids = "raid",
}

local function buildSubZoneKeys(key, record)
    local keys = {}
    local seen = {}

    local function add(value)
        local normalized = Utils:NormalizeKey(value)
        if not normalized or seen[normalized] then
            return
        end
        seen[normalized] = true
        keys[#keys + 1] = value
    end

    for _, value in ipairs(record.subZoneKeys or {}) do
        add(value)
    end

    add(record.name)

    if type(key) == "string" then
        local suffix = key:match("^[^:]+:(.+)$")
        add(suffix)
    end

    return #keys > 0 and keys or nil
end

local function normalizeLocationRecord(locationType, key, record)
    local sectionName = locationTypeToSection[locationType]
    if not sectionName then
        return nil, nil
    end

    local derivedSubZoneKeys = sectionName == "subZone" and buildSubZoneKeys(key, record) or record.subZoneKeys

    local entries = {}
    local factionIDs = record.factionIDs or {}
    for _, factionID in ipairs(factionIDs) do
        entries[#entries + 1] = {
            factionID = factionID,
            weight = record.weight,
            mapIDs = record.mapIDs,
            parentMapID = record.parentMapID,
            instanceMapIDs = record.instanceMapIDs,
            aliases = record.aliases,
            zoneKeys = record.zoneKeys,
            subZoneKeys = derivedSubZoneKeys,
            difficulties = record.difficulties,
            instanceTypes = record.instanceTypes,
            factionGroups = record.factionGroups,
            tags = record.tags,
            note = record.notes,
            source = record.source,
            confidence = record.confidence,
        }
    end

    if record.factions then
        for _, faction in ipairs(record.factions) do
            local entry = Utils:ShallowCopy(faction)
            entry.source = entry.source or record.source
            entry.confidence = entry.confidence or record.confidence
            entry.tags = entry.tags or record.tags
            entry.note = entry.note or record.notes
            entry.weight = entry.weight or record.weight
            entry.mapIDs = entry.mapIDs or record.mapIDs
            entry.parentMapID = entry.parentMapID or record.parentMapID
            entry.instanceMapIDs = entry.instanceMapIDs or record.instanceMapIDs
            entry.aliases = entry.aliases or record.aliases
            entry.zoneKeys = entry.zoneKeys or record.zoneKeys
            entry.subZoneKeys = entry.subZoneKeys or derivedSubZoneKeys
            entry.difficulties = entry.difficulties or record.difficulties
            entry.instanceTypes = entry.instanceTypes or record.instanceTypes
            entry.factionGroups = entry.factionGroups or record.factionGroups
            entries[#entries + 1] = entry
        end
    end

    if #entries == 0 then
        return nil, nil
    end

    return sectionName, {
        key = key,
        entries = entries,
    }
end

function ns.Data:Init()
    self.registry = self.registry or {}
    self.activeFlavor = ns.Compat:GetFlavor()
    self.activeData = self:BuildActiveData(self.activeFlavor)
end

function ns.Data:RegisterFlavorData(flavor, payload)
    self.registry = self.registry or {}
    self.registry[flavor] = payload or {}
end

function ns.Data:RegisterRetailModule(payload)
    self.retailModules = self.retailModules or {}
    self.retailModules[#self.retailModules + 1] = payload
end

function ns.Data:BuildMapFromLocationDB(locationDB)
    local map = {
        zone = {},
        subZone = {},
        instance = {},
        raid = {},
    }

    for locationType, records in pairs(locationDB or {}) do
        for key, record in pairs(records or {}) do
            local sectionName, normalized = normalizeLocationRecord(locationType, key, record)
            if sectionName and normalized then
                map[sectionName][normalized.key] = map[sectionName][normalized.key] or {}
                for _, entry in ipairs(normalized.entries) do
                    map[sectionName][normalized.key][#map[sectionName][normalized.key] + 1] = entry
                end
            end
        end
    end

    return map
end

function ns.Data:BuildActiveData(flavor)
    local merged = {
        flavor = flavor,
        locations = {
            zone = {},
            subZone = {},
            instance = {},
            raid = {},
        },
        map = {
            zone = {},
            subZone = {},
            instance = {},
            raid = {},
        },
        index = {
            zoneByMapID = {},
            subZoneByMapID = {},
            subZoneByParentMapID = {},
            subZoneRecordByParentMapID = {},
            instanceByMapID = {},
            raidByMapID = {},
        },
    }

    local sharedPayload = self.registry.shared or {}
    local flavorPayload = self.registry[flavor] or {}

    local function mergeLocationSection(sectionName, payload)
        local locationType = sectionName == "zone" and "zones"
            or sectionName == "subZone" and "subZones"
            or sectionName == "instance" and "instances"
            or sectionName == "raid" and "raids"

        local function addSubZoneRecordIndex(record)
            if sectionName ~= "subZone" or not record or not record.parentMapID then
                return
            end

            local target = merged.index.subZoneRecordByParentMapID
            target[record.parentMapID] = target[record.parentMapID] or {}
            for _, subZoneKey in ipairs(buildSubZoneKeys(nil, record) or {}) do
                local normalized = Utils:NormalizeKey(subZoneKey)
                if normalized then
                    target[record.parentMapID][normalized] = record
                end
            end
        end

        for rawKey, record in pairs((payload.locations or {})[locationType] or {}) do
            merged.locations[sectionName][rawKey] = record
            addSubZoneRecordIndex(record)
        end
    end

    local function mergeMapSection(sectionName, payload)
        local function addSubZoneMatchIndex(entry)
            if sectionName ~= "subZone" or not entry or not entry.parentMapID then
                return
            end

            local target = merged.index.subZoneByParentMapID
            target[entry.parentMapID] = target[entry.parentMapID] or {}

            for _, subZoneKey in ipairs(entry.subZoneKeys or {}) do
                local normalized = Utils:NormalizeKey(subZoneKey)
                if normalized then
                    target[entry.parentMapID][normalized] = target[entry.parentMapID][normalized] or {}
                    table.insert(target[entry.parentMapID][normalized], entry)
                end
            end
        end

        for rawKey, entries in pairs((payload.map or emptyMap)[sectionName] or {}) do
            for _, entry in ipairs(entries) do
                local normalized = normalizeEntry(entry, sectionName)
                addKey(merged.map[sectionName], rawKey, normalized)
                addSubZoneMatchIndex(normalized)

                if normalized.aliases then
                    for _, alias in ipairs(normalized.aliases) do
                        addKey(merged.map[sectionName], alias, normalized)
                    end
                end

                local mapIDs = normalized.mapIDs
                if sectionName == "instance" or sectionName == "raid" then
                    mapIDs = normalized.instanceMapIDs or normalized.mapIDs
                end

                if mapIDs then
                    local targetIndex = merged.index[sectionName .. "ByMapID"]
                    for _, mapID in ipairs(mapIDs) do
                        targetIndex[mapID] = targetIndex[mapID] or {}
                        table.insert(targetIndex[mapID], normalized)
                    end
                end
            end
        end
    end

    mergeLocationSection("zone", sharedPayload)
    mergeLocationSection("subZone", sharedPayload)
    mergeLocationSection("instance", sharedPayload)
    mergeLocationSection("raid", sharedPayload)
    mergeLocationSection("zone", flavorPayload)
    mergeLocationSection("subZone", flavorPayload)
    mergeLocationSection("instance", flavorPayload)
    mergeLocationSection("raid", flavorPayload)

    mergeMapSection("zone", sharedPayload)
    mergeMapSection("subZone", sharedPayload)
    mergeMapSection("instance", sharedPayload)
    mergeMapSection("raid", sharedPayload)
    mergeMapSection("zone", flavorPayload)
    mergeMapSection("subZone", flavorPayload)
    mergeMapSection("instance", flavorPayload)
    mergeMapSection("raid", flavorPayload)

    return merged
end

function ns.Data:GetActiveFlavor()
    return self.activeFlavor
end

function ns.Data:GetRankColor(standingID)
    return unpack(rankColors[standingID] or { 0.45, 0.45, 0.45 })
end

function ns.Data:FindMatches(sourceType, rawKey)
    if not rawKey then
        return {}
    end

    local key = Utils:NormalizeKey(rawKey)
    if not key then
        return {}
    end

    local section = self.activeData.map[sourceType] or {}
    return section[key] or {}
end

function ns.Data:FindMatchesByMapID(sourceType, mapID)
    if not mapID then
        return {}
    end

    local indexName = sourceType .. "ByMapID"
    local section = self.activeData.index[indexName] or {}
    return section[mapID] or {}
end

function ns.Data:FindSubZoneMatches(mapID, rawKey)
    local results = {}
    local seen = {}
    local section = self.activeData.map.subZone or {}

    local function append(entry)
        local key = table.concat({
            tostring(entry.factionID or entry.name or ""),
            tostring(entry.weight or ""),
            tostring(entry.parentMapID or ""),
            tostring(entry.note or ""),
        }, "::")
        if seen[key] then
            return
        end
        seen[key] = true
        results[#results + 1] = entry
    end

    if mapID and rawKey then
        local parentMapIndex = self.activeData.index.subZoneByParentMapID or {}
        local byParent = parentMapIndex[mapID] or {}
        local normalized = Utils:NormalizeKey(rawKey)
        if normalized and byParent[normalized] then
            for _, entry in ipairs(byParent[normalized]) do
                append(entry)
            end
        end

        local compositeKey = Utils:NormalizeKey(string.format("%s:%s", tostring(mapID), tostring(rawKey)))
        if compositeKey and section[compositeKey] then
            for _, entry in ipairs(section[compositeKey]) do
                append(entry)
            end
        end
    end

    if rawKey then
        local simpleKey = Utils:NormalizeKey(rawKey)
        if simpleKey and section[simpleKey] then
            for _, entry in ipairs(section[simpleKey]) do
                append(entry)
            end
        end
    end

    return results
end

function ns.Data:GetLocationRecord(sourceType, rawKey)
    if not rawKey then
        return nil
    end

    local section = self.activeData.locations[sourceType] or {}
    return section[rawKey]
end

function ns.Data:GetLocationRecordByMapID(sourceType, mapID)
    if not mapID then
        return nil
    end

    local section = self.activeData.locations[sourceType] or {}
    return section[mapID]
end

function ns.Data:GetSubZoneRecord(mapID, rawKey)
    if mapID and rawKey then
        local byParent = self.activeData.index.subZoneRecordByParentMapID or {}
        local normalized = Utils:NormalizeKey(rawKey)
        if normalized and byParent[mapID] and byParent[mapID][normalized] then
            return byParent[mapID][normalized], normalized
        end
    end

    if mapID and rawKey then
        local composite = string.format("%s:%s", tostring(mapID), tostring(rawKey))
        local compositeKey = Utils:NormalizeKey(composite)
        if compositeKey then
            local compositeRecord = self:GetLocationRecord("subZone", compositeKey)
            if compositeRecord then
                return compositeRecord, compositeKey
            end
        end
    end

    if rawKey then
        local simpleKey = Utils:NormalizeKey(rawKey)
        if simpleKey then
            return self:GetLocationRecord("subZone", simpleKey), simpleKey
        end
    end

    return nil, nil
end

function ns.Data:GetCoverage(context)
    context = context or {}

    local zoneRecord = self:GetLocationRecordByMapID("zone", context.mapID)
    if not zoneRecord and context.zoneName then
        zoneRecord = self:GetLocationRecord("zone", context.zoneName)
    end
    local subZoneRecord, subZoneKey = self:GetSubZoneRecord(context.mapID, context.subZoneName)
    local zoneMatches = self:FindMatchesByMapID("zone", context.mapID)
    local subZoneMatches = self:FindSubZoneMatches(context.mapID, context.subZoneName)

    local function matchesContext(entry)
        local contextZoneKey = Utils:NormalizeKey(context and context.zoneKey)
        local contextSubZoneKey = Utils:NormalizeKey(context and context.subZoneKey)

        if entry.zoneKeys and contextZoneKey then
            local allowed = false
            for _, zoneKey in ipairs(entry.zoneKeys) do
                if Utils:NormalizeKey(zoneKey) == contextZoneKey then
                    allowed = true
                    break
                end
            end
            if not allowed then
                return false
            end
        end

        if entry.subZoneKeys and contextSubZoneKey then
            local allowed = false
            for _, subZoneKeyEntry in ipairs(entry.subZoneKeys) do
                if Utils:NormalizeKey(subZoneKeyEntry) == contextSubZoneKey then
                    allowed = true
                    break
                end
            end
            if not allowed then
                return false
            end
        end

        if entry.factionGroups and context.playerFactionGroup then
            local allowed = false
            for _, factionGroup in ipairs(entry.factionGroups) do
                if factionGroup == context.playerFactionGroup then
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

    local filteredZoneMatches = {}
    for _, match in ipairs(zoneMatches) do
        if matchesContext(match) then
            filteredZoneMatches[#filteredZoneMatches + 1] = match
        end
    end

    local filteredSubZoneMatches = {}
    for _, match in ipairs(subZoneMatches) do
        if matchesContext(match) then
            filteredSubZoneMatches[#filteredSubZoneMatches + 1] = match
        end
    end

    local function hasTag(record, needle)
        for _, tag in ipairs(record and record.tags or {}) do
            if tag == needle then
                return true
            end
        end
        return false
    end

    return {
        zoneRecord = zoneRecord,
        subZoneRecord = subZoneRecord,
        subZoneKey = subZoneKey,
        zoneHasRecord = zoneRecord ~= nil,
        subZoneHasRecord = subZoneRecord ~= nil,
        zoneHasMapping = #filteredZoneMatches > 0,
        subZoneHasMapping = #filteredSubZoneMatches > 0,
        zoneFromClientSeed = hasTag(zoneRecord, "generated") or (zoneRecord and zoneRecord.source == "client_seed") or false,
        subZoneFromClientSeed = hasTag(subZoneRecord, "generated") or (subZoneRecord and subZoneRecord.source == "client_seed") or false,
        zoneNoLocalReputation = hasTag(zoneRecord, "no-local-reputation"),
        subZoneNoLocalReputation = hasTag(subZoneRecord, "no-local-reputation"),
    }
end

ns.Data:RegisterFlavorData("shared", {
    map = emptyMap,
})
