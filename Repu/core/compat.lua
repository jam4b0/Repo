local _, ns = ...

local Utils = ns.Utils

local FLAVOR_RETAIL = "retail"
local FLAVOR_CLASSIC = "classic"
local FLAVOR_TBC = "tbc"
local FLAVOR_WRATH = "wrath"
local FLAVOR_CATA = "cata"
local FLAVOR_MOP = "mop"

local function getMajorFactionData(factionID)
    if not factionID or not _G.C_MajorFactions then
        return nil
    end

    if type(C_MajorFactions.GetMajorFactionData) == "function" then
        local ok, result = pcall(C_MajorFactions.GetMajorFactionData, factionID)
        if ok then
            return result
        end
    end

    return nil
end

local function getCurrentRenownLevel(factionID)
    if not factionID or not _G.C_MajorFactions then
        return nil
    end

    if type(C_MajorFactions.GetCurrentRenownLevel) == "function" then
        local ok, result = pcall(C_MajorFactions.GetCurrentRenownLevel, factionID)
        if ok and type(result) == "number" and result > 0 then
            return result
        end
    end

    return nil
end

local function normalizeRetailFactionData(index, data)
    if not data then
        return nil
    end

    local majorFactionData = getMajorFactionData(data.factionID)
    local renownLevel = data.renownLevel
        or getCurrentRenownLevel(data.factionID)
        or (majorFactionData and majorFactionData.renownLevel)
        or nil
    local isMajorFaction = data.isMajorFaction or (type(renownLevel) == "number" and renownLevel > 0) or majorFactionData ~= nil
    local currentValue = data.currentStanding or data.currentStandingValue or 0
    local minValue = data.currentReactionThreshold or 0
    local maxValue = data.nextReactionThreshold or data.reactionThreshold or currentValue

    if majorFactionData then
        currentValue = majorFactionData.renownReputationEarned
            or majorFactionData.earnedReputation
            or majorFactionData.currentStanding
            or currentValue
        minValue = majorFactionData.renownLevelReputationThreshold
            or majorFactionData.currentLevelThreshold
            or majorFactionData.currentReactionThreshold
            or 0
        maxValue = majorFactionData.nextLevelThreshold
            or majorFactionData.renownLevelThreshold
            or majorFactionData.nextReactionThreshold
            or maxValue

        if renownLevel then
            minValue = 0
            if not maxValue or maxValue < currentValue then
                maxValue = currentValue
            end
        end
    end

    return {
        index = index,
        name = data.name,
        description = data.description,
        standingID = data.reaction,
        barMin = minValue,
        barMax = maxValue,
        barValue = currentValue,
        atWarWith = data.atWarWith,
        canToggleAtWar = data.canToggleAtWar,
        isHeader = data.isHeader,
        isCollapsed = data.isCollapsed,
        hasRep = data.isHeaderWithRep or not data.isHeader,
        isWatched = data.isWatched,
        isChild = data.isChild,
        factionID = data.factionID,
        hasBonusRepGain = data.hasBonusRepGain,
        canSetInactive = data.canSetInactive,
        isAccountWide = data.isAccountWide,
        isMajorFaction = isMajorFaction and true or false,
        renownLevel = renownLevel,
        friendshipRepID = data.friendshipRepID,
        raw = data,
        majorFactionData = majorFactionData,
    }
end

function ns.Compat:GetFlavor()
    if self.cachedFlavor then
        return self.cachedFlavor
    end

    local project = _G.WOW_PROJECT_ID
    local flavor = FLAVOR_RETAIL

    if project == _G.WOW_PROJECT_MAINLINE then
        flavor = FLAVOR_RETAIL
    elseif project == _G.WOW_PROJECT_CLASSIC then
        flavor = FLAVOR_CLASSIC
    elseif project == _G.WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
        flavor = FLAVOR_TBC
    elseif project == _G.WOW_PROJECT_WRATH_CLASSIC then
        flavor = FLAVOR_WRATH
    elseif project == _G.WOW_PROJECT_CATACLYSM_CLASSIC then
        flavor = FLAVOR_CATA
    else
        local version = select(4, GetBuildInfo())
        if version and version >= 50000 and version < 60000 then
            flavor = FLAVOR_MOP
        elseif version and version >= 40000 and version < 50000 then
            flavor = FLAVOR_CATA
        elseif version and version >= 30000 and version < 40000 then
            flavor = FLAVOR_WRATH
        elseif version and version >= 20000 and version < 30000 then
            flavor = FLAVOR_TBC
        elseif version and version < 20000 then
            flavor = FLAVOR_CLASSIC
        end
    end

    self.cachedFlavor = flavor
    return flavor
end

function ns.Compat:IsRetail()
    return self:GetFlavor() == FLAVOR_RETAIL
end

function ns.Compat:HasRetailReputationAPI()
    return self:IsRetail()
        and _G.C_Reputation
        and type(C_Reputation.GetFactionDataByIndex) == "function"
end

function ns.Compat:GetCurrentInterfaceVersion()
    return select(4, GetBuildInfo())
end

function ns.Compat:GetPlayerFactionGroup()
    if type(UnitFactionGroup) ~= "function" then
        return nil
    end

    local factionGroup = select(1, UnitFactionGroup("player"))
    return factionGroup
end

function ns.Compat:HasLegacyReputationAPI()
    return type(GetNumFactions) == "function" and type(GetFactionInfo) == "function"
end

function ns.Compat:GetFactionCount()
    if self:HasRetailReputationAPI() and type(C_Reputation.GetNumFactions) == "function" then
        return C_Reputation.GetNumFactions()
    end

    if self:HasLegacyReputationAPI() then
        return GetNumFactions()
    end

    return 0
end

function ns.Compat:GetWatchedFactionID()
    if self:HasRetailReputationAPI() and C_Reputation.GetWatchedFactionData then
        local data = C_Reputation.GetWatchedFactionData()
        if data then
            return data.factionID
        end
    end

    if GetWatchedFactionInfo then
        local _, _, _, _, _, factionID = GetWatchedFactionInfo()
        if factionID then
            return factionID
        end
    end

    if self:HasLegacyReputationAPI() then
        for index = 1, GetNumFactions() do
            local _, _, _, _, _, _, _, _, isHeader, _, hasRep, isWatched, _, factionID = GetFactionInfo(index)
            if not isHeader and hasRep and isWatched and factionID then
                return factionID
            end
        end
    end
end

function ns.Compat:GetFactionDataByID(factionID)
    if not factionID then
        return nil
    end

    if self:HasRetailReputationAPI() and C_Reputation.GetFactionDataByID then
        local data = C_Reputation.GetFactionDataByID(factionID)
        return normalizeRetailFactionData(0, data)
    end

    for _, row in ipairs(self:CollectFactionRows()) do
        if row.factionID == factionID then
            return row
        end
    end
end

function ns.Compat:GetInstanceContext()
    local name, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceMapID, instanceGroupSize, lfgDungeonID = GetInstanceInfo()
    local isInInstance = instanceType and instanceType ~= "none"

    if not isInInstance then
        name = nil
        instanceMapID = nil
        difficultyID = nil
        difficultyName = nil
        maxPlayers = nil
        dynamicDifficulty = nil
        isDynamic = nil
        instanceGroupSize = nil
        lfgDungeonID = nil
    end

    return {
        name = name,
        nameKey = Utils:NormalizeKey(name),
        type = instanceType,
        difficultyID = difficultyID,
        difficultyName = difficultyName,
        maxPlayers = maxPlayers,
        dynamicDifficulty = dynamicDifficulty,
        isDynamic = isDynamic,
        instanceMapID = instanceMapID,
        instanceGroupSize = instanceGroupSize,
        lfgDungeonID = lfgDungeonID,
        isInInstance = isInInstance,
    }
end

function ns.Compat:GetMapContext()
    local mapID = _G.C_Map and C_Map.GetBestMapForUnit and C_Map.GetBestMapForUnit("player")
    local mapInfo = mapID and C_Map.GetMapInfo and C_Map.GetMapInfo(mapID) or nil
    local mapChain = {}

    if mapID and C_Map and C_Map.GetMapInfo then
        local currentMapID = mapID
        local guard = 0
        while currentMapID and guard < 12 do
            local currentInfo = C_Map.GetMapInfo(currentMapID)
            if not currentInfo then
                break
            end

            mapChain[#mapChain + 1] = {
                mapID = currentInfo.mapID,
                name = currentInfo.name,
                parentMapID = currentInfo.parentMapID,
                mapType = currentInfo.mapType,
            }

            if not currentInfo.parentMapID or currentInfo.parentMapID == 0 then
                break
            end

            currentMapID = currentInfo.parentMapID
            guard = guard + 1
        end
    end

    return {
        mapID = mapID,
        mapName = mapInfo and mapInfo.name or nil,
        mapNameKey = Utils:NormalizeKey(mapInfo and mapInfo.name or nil),
        mapChain = mapChain,
    }
end

function ns.Compat:GetScanRootMapIDs()
    local roots = {}
    local seen = {}

    local function addRoot(mapID)
        if mapID and not seen[mapID] then
            seen[mapID] = true
            roots[#roots + 1] = mapID
        end
    end

    addRoot(946) -- Cosmic
    addRoot(947) -- Azeroth

    local current = self:GetMapContext()
    for _, node in ipairs(current.mapChain or {}) do
        if not node.parentMapID or node.parentMapID == 0 then
            addRoot(node.mapID)
        end
    end

    return roots
end

function ns.Compat:ScanUiMaps()
    if not C_Map or type(C_Map.GetMapInfo) ~= "function" or type(C_Map.GetMapChildrenInfo) ~= "function" then
        return {
            roots = {},
            nodes = {},
            nodeCount = 0,
            scannedAt = date("!%Y-%m-%dT%H:%M:%SZ"),
            unsupported = true,
        }
    end

    local roots = self:GetScanRootMapIDs()
    local nodesByID = {}
    local orderedMapIDs = {}
    local visited = {}

    local function getChildren(mapID)
        local ok, result = pcall(C_Map.GetMapChildrenInfo, mapID)
        if ok and type(result) == "table" then
            return result
        end

        ok, result = pcall(C_Map.GetMapChildrenInfo, mapID, nil, false)
        if ok and type(result) == "table" then
            return result
        end

        return {}
    end

    local function visit(mapID, parentMapID)
        if not mapID or visited[mapID] then
            return
        end
        visited[mapID] = true

        local info = C_Map.GetMapInfo(mapID)
        if not info then
            return
        end

        local children = getChildren(mapID)
        local childIDs = {}
        for _, child in ipairs(children or {}) do
            if child and child.mapID then
                childIDs[#childIDs + 1] = child.mapID
            end
        end

        nodesByID[tostring(mapID)] = {
            mapID = info.mapID,
            name = info.name,
            mapType = info.mapType,
            parentMapID = info.parentMapID or parentMapID,
            childCount = #childIDs,
            childMapIDs = childIDs,
        }
        orderedMapIDs[#orderedMapIDs + 1] = mapID

        for _, childMapID in ipairs(childIDs) do
            visit(childMapID, mapID)
        end
    end

    for _, rootMapID in ipairs(roots) do
        visit(rootMapID, 0)
    end

    local nodeCount = 0
    for _ in pairs(nodesByID) do
        nodeCount = nodeCount + 1
    end

    return {
        roots = roots,
        nodesByID = nodesByID,
        orderedMapIDs = orderedMapIDs,
        nodeCount = nodeCount,
        scannedAt = date("!%Y-%m-%dT%H:%M:%SZ"),
    }
end

function ns.Compat:GetZoneText()
    local zone = GetRealZoneText()
    if not zone or zone == "" then
        zone = GetZoneText()
    end
    return zone
end

function ns.Compat:GetSubZoneText()
    local subZone = GetSubZoneText()
    if subZone == "" then
        return nil
    end
    return subZone
end

function ns.Compat:CollapseHeader(index)
    if _G.C_Reputation and C_Reputation.CollapseFactionHeader then
        C_Reputation.CollapseFactionHeader(index)
        return
    end

    if CollapseFactionHeader then
        CollapseFactionHeader(index)
    end
end

function ns.Compat:ExpandHeader(index)
    if _G.C_Reputation and C_Reputation.ExpandFactionHeader then
        C_Reputation.ExpandFactionHeader(index)
        return
    end

    if ExpandFactionHeader then
        ExpandFactionHeader(index)
    end
end

function ns.Compat:CollectFactionRows()
    if self:HasRetailReputationAPI() then
        local collapsedHeaders = {}
        local rows = {}
        local numFactions = self:GetFactionCount()

        for index = numFactions, 1, -1 do
            local data = C_Reputation.GetFactionDataByIndex(index)
            if data and data.isHeader and data.isCollapsed then
                local key = data.factionID or data.name or index
                collapsedHeaders[key] = true
                self:ExpandHeader(index)
            end
        end

        numFactions = self:GetFactionCount()

        for index = 1, numFactions do
            local data = C_Reputation.GetFactionDataByIndex(index)
            local row = normalizeRetailFactionData(index, data)
            if row then
                rows[#rows + 1] = row
            end
        end

        for index = self:GetFactionCount(), 1, -1 do
            local data = C_Reputation.GetFactionDataByIndex(index)
            if data and data.isHeader and not data.isCollapsed then
                local key = data.factionID or data.name or index
                if collapsedHeaders[key] then
                    self:CollapseHeader(index)
                end
            end
        end

        return rows
    end

    if not self:HasLegacyReputationAPI() then
        return {}
    end

    local collapsedHeaders = {}
    local numFactions = self:GetFactionCount()

    for index = numFactions, 1, -1 do
        local name, _, _, _, _, _, _, _, isHeader, isCollapsed, hasRep, _, _, factionID = GetFactionInfo(index)
        if isHeader and isCollapsed then
            collapsedHeaders[factionID or name or index] = true
            self:ExpandHeader(index)
        end
    end

    local rows = {}
    numFactions = self:GetFactionCount()
    for index = 1, numFactions do
        local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canSetInactive = GetFactionInfo(index)
        rows[#rows + 1] = {
            index = index,
            name = name,
            description = description,
            standingID = standingID,
            barMin = barMin,
            barMax = barMax,
            barValue = barValue,
            atWarWith = atWarWith,
            canToggleAtWar = canToggleAtWar,
            isHeader = isHeader,
            isCollapsed = isCollapsed,
            hasRep = hasRep,
            isWatched = isWatched,
            isChild = isChild,
            factionID = factionID,
            hasBonusRepGain = hasBonusRepGain,
            canSetInactive = canSetInactive,
        }
    end

    for index = self:GetFactionCount(), 1, -1 do
        local name, _, _, _, _, _, _, _, isHeader, isCollapsed, _, _, _, factionID = GetFactionInfo(index)
        local key = factionID or name or index
        if isHeader and not isCollapsed and collapsedHeaders[key] then
            self:CollapseHeader(index)
        end
    end

    return rows
end

function ns.Compat:GetStandingLabel(standingID)
    return _G["FACTION_STANDING_LABEL" .. tostring(standingID or 0)] or UNKNOWN
end

function ns.Compat:GetAPISummary()
    return {
        flavor = self:GetFlavor(),
        interfaceVersion = self:GetCurrentInterfaceVersion(),
        hasC_Reputation = _G.C_Reputation ~= nil,
        hasRetailReputationAPI = self:HasRetailReputationAPI(),
        hasLegacyReputationAPI = self:HasLegacyReputationAPI(),
        hasGetNumFactions = type(GetNumFactions) == "function",
        hasGetFactionInfo = type(GetFactionInfo) == "function",
        hasGetWatchedFactionInfo = type(GetWatchedFactionInfo) == "function",
        hasCReputationGetNumFactions = _G.C_Reputation and type(C_Reputation.GetNumFactions) == "function" or false,
        hasCReputationGetFactionDataByIndex = _G.C_Reputation and type(C_Reputation.GetFactionDataByIndex) == "function" or false,
        hasCReputationGetWatchedFactionData = _G.C_Reputation and type(C_Reputation.GetWatchedFactionData) == "function" or false,
        hasCMajorFactions = _G.C_MajorFactions ~= nil,
        hasCMajorFactionsGetMajorFactionData = _G.C_MajorFactions and type(C_MajorFactions.GetMajorFactionData) == "function" or false,
        hasCMajorFactionsGetCurrentRenownLevel = _G.C_MajorFactions and type(C_MajorFactions.GetCurrentRenownLevel) == "function" or false,
        hasCMap = _G.C_Map ~= nil,
        locale = GetLocale and GetLocale() or nil,
        wowProjectID = _G.WOW_PROJECT_ID,
    }
end
