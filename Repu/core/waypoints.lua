local _, ns = ...

local Locale = ns.Locale

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
        printMessage(Locale:Get("WAYPOINT_NO_DATA"))
        return false
    end

    local title = location.title or location.name or Locale:Get("WAYPOINT_DEFAULT_TITLE")

    if TomTom and TomTom.AddWaypoint then
        TomTom:AddWaypoint(location.mapID, location.x, location.y, {
            title = title,
            persistent = false,
            minimap = true,
            world = true,
        })
        printMessage(Locale:Format("WAYPOINT_SET", title))
        return true
    end

    printMessage(Locale:Format(
        "WAYPOINT_ADDON_MISSING",
        title,
        tostring(location.mapID),
        roundCoordinate(location.x),
        roundCoordinate(location.y)
    ))
    return false
end
