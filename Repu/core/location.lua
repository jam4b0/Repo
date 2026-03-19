local _, ns = ...

local Utils = ns.Utils

function ns.Location:BuildContext()
    local zoneName = ns.Compat:GetZoneText()
    local subZoneName = ns.Compat:GetSubZoneText()
    local instance = ns.Compat:GetInstanceContext()
    local map = ns.Compat:GetMapContext()

    return {
        zoneName = zoneName,
        zoneKey = Utils:NormalizeKey(zoneName),
        subZoneName = subZoneName,
        subZoneKey = Utils:NormalizeKey(subZoneName),
        mapID = map.mapID,
        mapName = map.mapName,
        mapKey = map.mapNameKey,
        mapChain = map.mapChain or {},
        instanceName = instance.name,
        instanceKey = instance.nameKey,
        instanceType = instance.type,
        instanceDifficultyID = instance.difficultyID,
        difficultyName = instance.difficultyName,
        instanceMapID = instance.instanceMapID,
        isInInstance = instance.isInInstance or false,
        watchedFactionID = ns.Compat:GetWatchedFactionID(),
        activeFlavor = ns.Data:GetActiveFlavor(),
    }
end
