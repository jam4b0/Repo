local savedVarsPath = arg and arg[1] or "/mnt/d/Battlenet/World of Warcraft/_retail_/WTF/Account/120661425#1/SavedVariables/Repu.lua"

dofile(savedVarsPath)

local captures = (((RepuDB or {}).debug or {}).captures) or {}

local function addCount(bucket, key, delta)
    if not key or key == "" then
        return
    end
    bucket[key] = (bucket[key] or 0) + (delta or 1)
end

local function sortedPairs(map)
    local rows = {}
    for key, count in pairs(map or {}) do
        rows[#rows + 1] = { key = key, count = count }
    end
    table.sort(rows, function(a, b)
        if a.count == b.count then
            return a.key < b.key
        end
        return a.count > b.count
    end)
    return rows
end

local function topJoined(map, limit)
    local rows = sortedPairs(map)
    local out = {}
    for index = 1, math.min(#rows, limit or 5) do
        out[#out + 1] = string.format("%s x%d", rows[index].key, rows[index].count)
    end
    return table.concat(out, ", ")
end

local grouped = {}

for _, capture in ipairs(captures) do
    local context = capture.context or {}
    local coverage = capture.coverage or {}
    local mapID = context.mapID or 0
    local zoneName = context.zoneName or "?"
    local subZoneName = context.subZoneName or ""
    local zoneKey = string.format("zone:%s:%s", tostring(mapID), tostring(zoneName))
    local subZoneKey = subZoneName ~= "" and string.format("subzone:%s:%s", tostring(mapID), tostring(subZoneName)) or nil

    local function ensure(key, kind, name)
        if not key then
            return nil
        end
        grouped[key] = grouped[key] or {
            key = key,
            kind = kind,
            mapID = mapID,
            zoneName = zoneName,
            name = name,
            captures = 0,
            mapped = 0,
            inferred = 0,
            fallback = 0,
            locationOnly = 0,
            watched = {},
            visible = {},
            raw = {},
            subZones = {},
            zoneHasRecord = coverage.zoneHasRecord or false,
            zoneHasMapping = coverage.zoneHasMapping or false,
            subZoneHasRecord = coverage.subZoneHasRecord or false,
            subZoneHasMapping = coverage.subZoneHasMapping or false,
        }
        return grouped[key]
    end

    local zoneItem = ensure(zoneKey, "zone", zoneName)
    local subZoneItem = ensure(subZoneKey, "subzone", subZoneName)

    local function feed(item)
        if not item then
            return
        end
        item.captures = item.captures + 1
        if subZoneName ~= "" then
            addCount(item.subZones, subZoneName, 1)
        end

        local visibleCount = #(capture.visible or {})
        local hadMapped = false
        local hadInferred = false
        local hadFallback = false

        for _, candidate in ipairs(capture.visible or {}) do
            local label = string.format("%s:%s", tostring(candidate.factionID), tostring(candidate.name))
            if candidate.isFallback then
                hadFallback = true
            elseif candidate.sourceType == "inferred" then
                hadInferred = true
            else
                hadMapped = true
                addCount(item.visible, label, 1)
            end
        end

        if hadMapped then
            item.mapped = item.mapped + 1
        elseif hadInferred then
            item.inferred = item.inferred + 1
        elseif hadFallback or visibleCount > 0 then
            item.fallback = item.fallback + 1
        else
            item.locationOnly = item.locationOnly + 1
        end

        for _, faction in ipairs(capture.factions or {}) do
            local label = string.format("%s:%s", tostring(faction.factionID), tostring(faction.name))
            addCount(item.raw, label, 1)
            if faction.isWatched then
                addCount(item.watched, label, 1)
            end
        end
    end

    feed(zoneItem)
    feed(subZoneItem)
end

local rows = {}
for _, item in pairs(grouped) do
    local hasMapping = item.kind == "zone" and item.zoneHasMapping or item.subZoneHasMapping
    rows[#rows + 1] = item
    item.needsMapping = not hasMapping
    item.signalScore = (item.mapped * 100) + (item.inferred * 25) + (item.fallback * 10) + (item.locationOnly * 2)
end

table.sort(rows, function(a, b)
    if a.needsMapping ~= b.needsMapping then
        return a.needsMapping
    end
    if a.signalScore == b.signalScore then
        if a.mapID == b.mapID then
            return a.name < b.name
        end
        return a.mapID < b.mapID
    end
    return a.signalScore > b.signalScore
end)

for _, item in ipairs(rows) do
    if item.needsMapping then
        print(string.format(
            "%s mapID=%s zone=%s name=%s captures=%d mapped=%d inferred=%d fallback=%d locationOnly=%d watched=[%s] visible=[%s] raw=[%s] subZones=[%s]",
            item.kind,
            tostring(item.mapID),
            tostring(item.zoneName),
            tostring(item.name),
            item.captures,
            item.mapped,
            item.inferred,
            item.fallback,
            item.locationOnly,
            topJoined(item.watched, 4),
            topJoined(item.visible, 4),
            topJoined(item.raw, 6),
            topJoined(item.subZones, 6)
        ))
    end
end
