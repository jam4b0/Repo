local _, ns = ...

local function printMessage(message)
    if DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage("|cffd4af37Repu|r " .. tostring(message))
    end
end

local function roundCoordinate(value)
    if not value then
        return nil
    end
    return math.floor((value * 10000) + 0.5) / 100
end

function ns.Waypoints:SetLocationWaypoint(location)
    if not location or not location.mapID or not location.x or not location.y then
        printMessage("Für diesen Eintrag sind noch keine Wegpunkt-Daten hinterlegt.")
        return false
    end

    local title = location.title or location.name or "Repu"

    if TomTom and TomTom.AddWaypoint then
        TomTom:AddWaypoint(location.mapID, location.x, location.y, {
            title = title,
            persistent = false,
            minimap = true,
            world = true,
        })
        printMessage(string.format("Wegpunkt gesetzt: %s", title))
        return true
    end

    if C_Map and UiMapPoint and C_Map.SetUserWaypoint then
        local point = UiMapPoint.CreateFromCoordinates(location.mapID, location.x, location.y)
        if point then
            C_Map.SetUserWaypoint(point)
            if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
                C_SuperTrack.SetSuperTrackedUserWaypoint(true)
            end
            printMessage(string.format("Kartenmarkierung gesetzt: %s", title))
            return true
        end
    end

    printMessage(string.format(
        "Kein Wegpunkt-Addon erkannt. Ziel: %s (%s, %.2f / %.2f)",
        title,
        tostring(location.mapID),
        roundCoordinate(location.x),
        roundCoordinate(location.y)
    ))
    return false
end

