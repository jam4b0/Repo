local _, ns = ...

local Utils = ns.Utils

local function printLine(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cffd4af37Repu|r " .. tostring(message))
end

local function makeCaptureKey(context)
    return table.concat({
        tostring(context.mapID or 0),
        tostring(context.subZoneKey or ""),
        tostring(context.instanceMapID or 0),
        tostring(context.instanceType or "none"),
    }, "::")
end

local function trimCaptures(captures, maxCaptures)
    while #captures > maxCaptures do
        table.remove(captures, 1)
    end
end

local function createButton(parent, label, width, onClick)
    local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    button:SetSize(width, 22)
    button:SetText(label)
    button:SetScript("OnClick", onClick)
    return button
end

local function placeButton(button, parent, x, y)
    button:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
end

function ns.Debug:Init()
    SLASH_REPU1 = "/repu"
    SlashCmdList.REPU = function(message)
        self:HandleSlash(message)
    end
    self:CreateWindow()
end

function ns.Debug:IsEnabled()
    return ns.State:GetProfile().debug
end

function ns.Debug:IsCaptureEnabled()
    return ns.State:GetDebugDB().enabled
end

function ns.Debug:Log(message)
    if self:IsEnabled() then
        printLine(message)
    end
end

function ns.Debug:DumpState()
    local snapshot = ns.State:GetSnapshot()
    printLine("Context: " .. Utils:Stringify(snapshot.context))
    printLine("RawFactions: " .. tostring(snapshot.rawFactions and #snapshot.rawFactions.list or 0))
    printLine("Matches: " .. self:SummarizeCandidates(snapshot.matches))
    printLine("Prioritized: " .. self:SummarizeCandidates(snapshot.prioritized))
    printLine("Visible: " .. self:SummarizeCandidates(snapshot.visible))
end

function ns.Debug:SummarizeCandidates(candidates)
    local lines = {}
    for index, candidate in ipairs(candidates or {}) do
        lines[#lines + 1] = string.format(
            "#%d id=%s name=%s source=%s key=%s score=%s note=%s",
            index,
            tostring(candidate.factionID),
            tostring(candidate.name),
            tostring(candidate.sourceType),
            tostring(candidate.sourceKey),
            tostring(candidate.score or candidate.baseWeight),
            tostring(candidate.note)
        )
    end
    return "{ " .. table.concat(lines, " | ") .. " }"
end

function ns.Debug:BuildCaptureSnapshot()
    local snapshot = ns.State:GetSnapshot()
    local context = snapshot.context or {}
    local rawFactions = {}

    for _, faction in ipairs((snapshot.rawFactions and snapshot.rawFactions.list) or {}) do
        rawFactions[#rawFactions + 1] = {
            factionID = faction.factionID,
            name = faction.name,
            standingID = faction.standingID,
            standingLabel = faction.standingLabel,
            progressValue = faction.progressValue,
            progressMax = faction.progressMax,
            progressPct = faction.progressPct,
            isWatched = faction.isWatched,
            isExalted = faction.isExalted,
            isAccountWide = faction.isAccountWide,
            isMajorFaction = faction.isMajorFaction,
            renownLevel = faction.renownLevel,
        }
    end

    return {
        timestamp = date("!%Y-%m-%dT%H:%M:%SZ"),
        flavor = context.activeFlavor,
        context = {
            zoneName = context.zoneName,
            zoneKey = context.zoneKey,
            subZoneName = context.subZoneName,
            subZoneKey = context.subZoneKey,
            mapID = context.mapID,
            mapName = context.mapName,
            mapKey = context.mapKey,
            mapChain = context.mapChain,
            instanceName = context.instanceName,
            instanceType = context.instanceType,
            instanceMapID = context.instanceMapID,
            instanceDifficultyID = context.instanceDifficultyID,
            isInInstance = context.isInInstance,
        },
        api = ns.Compat:GetAPISummary(),
        factions = rawFactions,
        matches = snapshot.matches or {},
        prioritized = snapshot.prioritized or {},
        visible = snapshot.visible or {},
    }
end

function ns.Debug:CaptureSnapshot(reason, force)
    local debugDB = ns.State:GetDebugDB()
    if not debugDB.enabled and not force then
        return false
    end

    local snapshot = self:BuildCaptureSnapshot()
    local key = makeCaptureKey(snapshot.context)

    if not force and debugDB.autoCapture and debugDB.lastCaptureKey == key then
        return false
    end

    snapshot.reason = reason or "MANUAL"
    snapshot.key = key

    local captures = debugDB.captures
    captures[#captures + 1] = snapshot
    debugDB.lastCaptureKey = key
    trimCaptures(captures, debugDB.maxCaptures or 200)

    self:RefreshWindow()
    return true
end

function ns.Debug:SetSweepMode(enabled)
    local debugDB = ns.State:GetDebugDB()
    debugDB.sweepMode = enabled and true or false
    debugDB.enabled = true
    debugDB.autoCapture = true
    debugDB.maxCaptures = enabled and (debugDB.sweepMaxCaptures or 2000) or (debugDB.defaultMaxCaptures or 200)
    debugDB.forceWindowVisible = true
    self:CreateWindow()
    self:RefreshWindow()
    printLine(enabled and "Sweep mode enabled" or "Sweep mode disabled")
end

function ns.Debug:ClearCaptures()
    local debugDB = ns.State:GetDebugDB()
    debugDB.captures = {}
    debugDB.lastCaptureKey = nil
    self:RefreshWindow()
end

function ns.Debug:CreateWindow()
    if self.window then
        return
    end

    local frame = CreateFrame("Frame", "RepuDebugWindow", UIParent, BackdropTemplateMixin and "BackdropTemplate")
    frame:SetSize(640, 250)
    frame:SetPoint("TOP", UIParent, "TOP", 0, -120)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetClampedToScreen(true)
    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)
    if frame.SetBackdrop then
        frame:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 8,
            edgeSize = 10,
            insets = { left = 2, right = 2, top = 2, bottom = 2 },
        })
        frame:SetBackdropColor(0.04, 0.04, 0.05, 0.92)
        frame:SetBackdropBorderColor(0.25, 0.25, 0.28, 1)
    end

    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -8)
    frame.title:SetText("Repu Debug Capture")

    frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.text:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -28)
    frame.text:SetPoint("RIGHT", frame, "RIGHT", -10, 0)
    frame.text:SetHeight(96)
    frame.text:SetJustifyH("LEFT")
    frame.text:SetJustifyV("TOP")

    frame.buttonRow = CreateFrame("Frame", nil, frame)
    frame.buttonRow:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 12)
    frame.buttonRow:SetSize(620, 110)

    frame.enableButton = createButton(frame.buttonRow, "Capture On", 90, function()
        local debugDB = ns.State:GetDebugDB()
        debugDB.enabled = true
        ns.Debug:RefreshWindow()
        printLine("Capture enabled")
    end)
    placeButton(frame.enableButton, frame.buttonRow, 0, 0)

    frame.disableButton = createButton(frame.buttonRow, "Capture Off", 90, function()
        local debugDB = ns.State:GetDebugDB()
        debugDB.enabled = false
        ns.Debug:RefreshWindow()
        printLine("Capture disabled")
    end)
    placeButton(frame.disableButton, frame.buttonRow, 98, 0)

    frame.captureNowButton = createButton(frame.buttonRow, "Capture Now", 110, function()
        local didCapture = ns.Debug:CaptureSnapshot("BUTTON_CAPTURE", true)
        printLine(didCapture and "Snapshot captured" or "Snapshot skipped")
    end)
    placeButton(frame.captureNowButton, frame.buttonRow, 196, 0)

    frame.sweepOnButton = createButton(frame.buttonRow, "Sweep On", 84, function()
        ns.Debug:SetSweepMode(true)
    end)
    placeButton(frame.sweepOnButton, frame.buttonRow, 314, 0)

    frame.sweepOffButton = createButton(frame.buttonRow, "Sweep Off", 84, function()
        ns.Debug:SetSweepMode(false)
    end)
    placeButton(frame.sweepOffButton, frame.buttonRow, 406, 0)

    frame.clearButton = createButton(frame.buttonRow, "Clear", 80, function()
        ns.Debug:ClearCaptures()
        printLine("Captures cleared")
    end)
    placeButton(frame.clearButton, frame.buttonRow, 0, -32)

    frame.dumpButton = createButton(frame.buttonRow, "Dump", 80, function()
        ns.Debug:DumpState()
    end)
    placeButton(frame.dumpButton, frame.buttonRow, 88, -32)

    frame.statusButton = createButton(frame.buttonRow, "Status", 80, function()
        local debugDB = ns.State:GetDebugDB()
        printLine("Capture enabled=" .. tostring(debugDB.enabled) .. " stored=" .. tostring(#(debugDB.captures or {})))
    end)
    placeButton(frame.statusButton, frame.buttonRow, 176, -32)

    frame.reloadButton = createButton(frame.buttonRow, "Reload", 90, function()
        ReloadUI()
    end)
    placeButton(frame.reloadButton, frame.buttonRow, 264, -32)

    frame.mapScanRunButton = createButton(frame.buttonRow, "MapScan Run", 120, function()
        ns.Debug:RunMapScan()
        ns.Debug:RefreshWindow()
    end)
    placeButton(frame.mapScanRunButton, frame.buttonRow, 0, -64)

    frame.mapScanStatusButton = createButton(frame.buttonRow, "MapScan Status", 138, function()
        ns.Debug:DumpMapScanStatus()
    end)
    placeButton(frame.mapScanStatusButton, frame.buttonRow, 128, -64)

    frame.mapScanClearButton = createButton(frame.buttonRow, "MapScan Clear", 124, function()
        ns.Debug:ClearMapScan()
        ns.Debug:RefreshWindow()
    end)
    placeButton(frame.mapScanClearButton, frame.buttonRow, 274, -64)

    self.window = frame
    self:RefreshWindow()
end

function ns.Debug:RefreshWindow()
    if not self.window then
        return
    end

    local debugDB = ns.State:GetDebugDB()
    local count = #(debugDB.captures or {})
    local last = count > 0 and debugDB.captures[count] or nil
    local mapScan = debugDB.mapScan or {}
    local text = {
        "Capture: " .. tostring(debugDB.enabled),
        "Auto: " .. tostring(debugDB.autoCapture),
        "Sweep: " .. tostring(debugDB.sweepMode),
        "Stored: " .. tostring(count),
        "Max: " .. tostring(debugDB.maxCaptures or 200),
        "Last: " .. tostring(last and last.key or "none"),
        "MapScan: " .. tostring(mapScan.nodeCount or 0) .. " nodes",
        "MapScanAt: " .. tostring(mapScan.scannedAt or "none"),
        "UI: capture + mapscan buttons below",
    }
    self.window.text:SetText(table.concat(text, "\n"))
    self.window:SetShown(debugDB.enabled or count > 0 or debugDB.forceWindowVisible)
    self.window.enableButton:SetEnabled(not debugDB.enabled)
    self.window.disableButton:SetEnabled(debugDB.enabled)
    self.window.sweepOnButton:SetEnabled(not debugDB.sweepMode)
    self.window.sweepOffButton:SetEnabled(debugDB.sweepMode)
end

function ns.Debug:DumpFactions(limit)
    local snapshot = ns.State:GetSnapshot()
    local list = snapshot.rawFactions and snapshot.rawFactions.list or {}
    local maxCount = tonumber(limit) or 12

    printLine("Faction dump count=" .. tostring(#list))
    for index = 1, math.min(#list, maxCount) do
        local faction = list[index]
        printLine(string.format(
            "#%d id=%s name=%s standing=%s progress=%d/%d watched=%s exalted=%s",
            index,
            tostring(faction.factionID),
            tostring(faction.name),
            tostring(faction.standingLabel),
            faction.progressValue or 0,
            faction.progressMax or 0,
            tostring(faction.isWatched),
            tostring(faction.isExalted)
        ))
    end
end

function ns.Debug:DumpLocation()
    local context = ns.State.runtime.context or ns.Location:BuildContext()
    printLine("Flavor: " .. tostring(context.activeFlavor))
    printLine("Zone: " .. tostring(context.zoneName))
    printLine("SubZone: " .. tostring(context.subZoneName))
    printLine("MapID: " .. tostring(context.mapID))
    printLine("Instance: " .. tostring(context.instanceName))
    printLine("InstanceType: " .. tostring(context.instanceType))
    printLine("InstanceMapID: " .. tostring(context.instanceMapID))
    printLine("Difficulty: " .. tostring(context.instanceDifficultyID))
    printLine("WatchedFactionID: " .. tostring(context.watchedFactionID))
    printLine("MapChain: " .. Utils:Stringify(context.mapChain))
end

function ns.Debug:DumpUnmapped()
    local context = ns.State.runtime.context or ns.Location:BuildContext()
    local zoneMatches = ns.Data:FindMatchesByMapID("zone", context.mapID)
    local subZoneMatches = ns.Data:FindMatchesByMapID("subZone", context.mapID)
    printLine("Unmapped zone probe")
    printLine("ZoneKey=" .. tostring(context.zoneKey))
    printLine("SubZoneKey=" .. tostring(context.subZoneKey))
    printLine("MapID=" .. tostring(context.mapID))
    printLine("InstanceMapID=" .. tostring(context.instanceMapID))
    printLine("ZoneMapMatches=" .. tostring(#zoneMatches))
    printLine("SubZoneMapMatches=" .. tostring(#subZoneMatches))
    printLine("MapChain=" .. Utils:Stringify(context.mapChain))
end

function ns.Debug:DumpAPI()
    printLine("API: " .. Utils:Stringify(ns.Compat:GetAPISummary()))
end

function ns.Debug:RunMapScan()
    local result = ns.Compat:ScanUiMaps()
    local debugDB = ns.State:GetDebugDB()
    debugDB.mapScan = result

    printLine("Map scan finished")
    printLine("Roots=" .. Utils:Stringify(result.roots))
    printLine("Nodes=" .. tostring(result.nodeCount or 0))
    printLine("ScannedAt=" .. tostring(result.scannedAt))
    if result.unsupported then
        printLine("Map scan unsupported on this client/API")
    end
end

function ns.Debug:DumpMapScanStatus()
    local mapScan = ns.State:GetDebugDB().mapScan or {}
    printLine("MapScan Roots=" .. Utils:Stringify(mapScan.roots))
    printLine("MapScan Nodes=" .. tostring(mapScan.nodeCount or 0))
    printLine("MapScan ScannedAt=" .. tostring(mapScan.scannedAt))
end

function ns.Debug:ClearMapScan()
    local debugDB = ns.State:GetDebugDB()
    debugDB.mapScan = {
        scannedAt = nil,
        roots = {},
        nodeCount = 0,
        nodesByID = {},
        orderedMapIDs = {},
    }
    printLine("Map scan cleared")
end

function ns.Debug:DumpFactionByID(input)
    local factionID = tonumber(input or "")
    if not factionID then
        printLine("Usage: /repu faction <id>")
        return
    end

    local data = ns.Compat:GetFactionDataByID(factionID)
    printLine("FactionData[" .. tostring(factionID) .. "]: " .. Utils:Stringify(data))
end

function ns.Debug:HandleSlash(message)
    local command = Utils:NormalizeKey(message) or ""
    local verb, tail = command:match("^(%S+)%s*(.-)$")
    verb = verb or command

    if command == "" or command == "help" then
        printLine("/repu debug")
        printLine("/repu dump")
        printLine("/repu api")
        printLine("/repu capture on|off|now|clear|status|sweep on|off")
        printLine("/repu faction <id>")
        printLine("/repu factions [limit]")
        printLine("/repu location")
        printLine("/repu mapscan run|status|clear")
        printLine("/repu unmapped")
        printLine("/repu refresh")
        printLine("/repu test")
        printLine("/repu lock")
        printLine("/repu exalted")
        return
    end

    if verb == "debug" then
        local profile = ns.State:GetProfile()
        profile.debug = not profile.debug
        printLine("Debug " .. (profile.debug and "enabled" or "disabled"))
        return
    end

    if verb == "dump" then
        self:DumpState()
        return
    end

    if verb == "api" then
        self:DumpAPI()
        return
    end

    if verb == "capture" then
        local debugDB = ns.State:GetDebugDB()
        if tail == "on" then
            debugDB.enabled = true
            debugDB.sweepMode = false
            debugDB.maxCaptures = debugDB.defaultMaxCaptures or 200
            debugDB.forceWindowVisible = true
            self:CreateWindow()
            self:RefreshWindow()
            printLine("Capture enabled")
            return
        end
        if tail == "off" then
            debugDB.enabled = false
            debugDB.sweepMode = false
            self:RefreshWindow()
            printLine("Capture disabled")
            return
        end
        if tail == "sweep on" or tail == "sweep" then
            self:SetSweepMode(true)
            return
        end
        if tail == "sweep off" then
            self:SetSweepMode(false)
            return
        end
        if tail == "show" then
            debugDB.forceWindowVisible = true
            self:CreateWindow()
            self:RefreshWindow()
            printLine("Capture window shown")
            return
        end
        if tail == "hide" then
            debugDB.forceWindowVisible = false
            self:RefreshWindow()
            printLine("Capture window hidden")
            return
        end
        if tail == "now" then
            local didCapture = self:CaptureSnapshot("SLASH_CAPTURE", true)
            printLine(didCapture and "Snapshot captured" or "Snapshot skipped")
            return
        end
        if tail == "clear" then
            self:ClearCaptures()
            printLine("Captures cleared")
            return
        end
        if tail == "status" or tail == "" then
            self:CreateWindow()
            self:RefreshWindow()
            printLine("Capture enabled=" .. tostring(debugDB.enabled) .. " sweep=" .. tostring(debugDB.sweepMode) .. " stored=" .. tostring(#(debugDB.captures or {})) .. " max=" .. tostring(debugDB.maxCaptures or 200))
            return
        end
    end

    if verb == "faction" then
        self:DumpFactionByID(tail)
        return
    end

    if verb == "factions" then
        self:DumpFactions(tail)
        return
    end

    if verb == "location" then
        self:DumpLocation()
        return
    end

    if verb == "mapscan" then
        if tail == "run" or tail == "" then
            self:RunMapScan()
            return
        end
        if tail == "status" then
            self:DumpMapScanStatus()
            return
        end
        if tail == "clear" then
            self:ClearMapScan()
            return
        end
    end

    if verb == "unmapped" then
        self:DumpUnmapped()
        return
    end

    if verb == "refresh" then
        ns.State:Refresh("SLASH_REFRESH")
        printLine("Refresh triggered")
        return
    end

    if verb == "test" then
        ns.State:Refresh("SLASH_TEST", { forceTest = true })
        printLine("Test rendering triggered")
        return
    end

    if verb == "lock" then
        local profile = ns.State:GetProfile()
        profile.locked = not profile.locked
        ns.UI:Refresh(ns.State.runtime.visible, ns.State.runtime.context)
        printLine("Locked " .. tostring(profile.locked))
        return
    end

    if verb == "exalted" then
        local profile = ns.State:GetProfile()
        profile.hideExalted = not profile.hideExalted
        ns.State:Refresh("SLASH_EXALTED")
        printLine("hideExalted " .. tostring(profile.hideExalted))
        return
    end

    printLine("Unknown command: " .. command)
end

function ns.Debug:OnRefresh(reason)
    if not self:IsCaptureEnabled() then
        return
    end

    self:CreateWindow()
    self:CaptureSnapshot(reason, false)
end
