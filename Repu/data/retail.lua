local _, ns = ...

local retailPayload = {
    locations = {
        zones = {},
        subZones = {},
        instances = {},
        raids = {},
    },
    map = {
        zone = {},
        subZone = {},
        instance = {},
        raid = {},
    },
}

local function appendEntries(targetSection, sourceSection)
    for key, entries in pairs(sourceSection or {}) do
        targetSection[key] = targetSection[key] or {}
        for _, entry in ipairs(entries) do
            targetSection[key][#targetSection[key] + 1] = entry
        end
    end
end

local function appendLocationRecords(targetSection, sourceSection)
    for key, record in pairs(sourceSection or {}) do
        targetSection[key] = record
    end
end

for _, payload in ipairs(ns.Data.retailModules or {}) do
    appendLocationRecords(retailPayload.locations.zones, payload.locations and payload.locations.zones)
    appendLocationRecords(retailPayload.locations.subZones, payload.locations and payload.locations.subZones)
    appendLocationRecords(retailPayload.locations.instances, payload.locations and payload.locations.instances)
    appendLocationRecords(retailPayload.locations.raids, payload.locations and payload.locations.raids)

    appendEntries(retailPayload.map.zone, payload.map and payload.map.zone)
    appendEntries(retailPayload.map.subZone, payload.map and payload.map.subZone)
    appendEntries(retailPayload.map.instance, payload.map and payload.map.instance)
    appendEntries(retailPayload.map.raid, payload.map and payload.map.raid)
end

local generatedMap = ns.Data:BuildMapFromLocationDB(retailPayload.locations)
appendEntries(retailPayload.map.zone, generatedMap.zone)
appendEntries(retailPayload.map.subZone, generatedMap.subZone)
appendEntries(retailPayload.map.instance, generatedMap.instance)
appendEntries(retailPayload.map.raid, generatedMap.raid)

if not next(retailPayload.map.zone) and not next(retailPayload.map.subZone) and not next(retailPayload.map.instance) and not next(retailPayload.map.raid) then
    retailPayload.map = generatedMap
end

ns.Data:RegisterFlavorData("retail", retailPayload)
