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
    copy.mapIDs = copy.mapIDs or nil
    copy.instanceMapIDs = copy.instanceMapIDs or nil
    copy.difficulties = copy.difficulties or nil
    copy.instanceTypes = copy.instanceTypes or nil
    copy.tags = copy.tags or nil
    return copy
end

local locationTypeToSection = {
    zones = "zone",
    subZones = "subZone",
    instances = "instance",
    raids = "raid",
}

local function normalizeLocationRecord(locationType, key, record)
    local sectionName = locationTypeToSection[locationType]
    if not sectionName then
        return nil, nil
    end

    local entries = {}
    local factionIDs = record.factionIDs or {}
    for _, factionID in ipairs(factionIDs) do
        entries[#entries + 1] = {
            factionID = factionID,
            weight = record.weight,
            mapIDs = record.mapIDs,
            instanceMapIDs = record.instanceMapIDs,
            aliases = record.aliases,
            difficulties = record.difficulties,
            instanceTypes = record.instanceTypes,
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
            entry.instanceMapIDs = entry.instanceMapIDs or record.instanceMapIDs
            entry.aliases = entry.aliases or record.aliases
            entry.difficulties = entry.difficulties or record.difficulties
            entry.instanceTypes = entry.instanceTypes or record.instanceTypes
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

        for rawKey, record in pairs((payload.locations or {})[locationType] or {}) do
            merged.locations[sectionName][rawKey] = record
        end
    end

    local function mergeMapSection(sectionName, payload)
        for rawKey, entries in pairs((payload.map or emptyMap)[sectionName] or {}) do
            for _, entry in ipairs(entries) do
                local normalized = normalizeEntry(entry, sectionName)
                addKey(merged.map[sectionName], rawKey, normalized)

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
    local section = self.activeData.map.subZone or {}
    local results = {}

    if mapID and rawKey then
        local compositeKey = Utils:NormalizeKey(string.format("%s:%s", tostring(mapID), tostring(rawKey)))
        if compositeKey and section[compositeKey] then
            for _, entry in ipairs(section[compositeKey]) do
                results[#results + 1] = entry
            end
        end
    end

    if rawKey then
        local simpleKey = Utils:NormalizeKey(rawKey)
        if simpleKey and section[simpleKey] then
            for _, entry in ipairs(section[simpleKey]) do
                results[#results + 1] = entry
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
    local subZoneRecord, subZoneKey = self:GetSubZoneRecord(context.mapID, context.subZoneName)
    local zoneMatches = self:FindMatchesByMapID("zone", context.mapID)
    local subZoneMatches = self:FindSubZoneMatches(context.mapID, context.subZoneName)

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
        zoneHasMapping = #zoneMatches > 0,
        subZoneHasMapping = #subZoneMatches > 0,
        zoneFromClientSeed = hasTag(zoneRecord, "generated") or (zoneRecord and zoneRecord.source == "client_seed") or false,
        subZoneFromClientSeed = hasTag(subZoneRecord, "generated") or (subZoneRecord and subZoneRecord.source == "client_seed") or false,
    }
end

ns.Data:RegisterFlavorData("shared", {
    map = emptyMap,
})
