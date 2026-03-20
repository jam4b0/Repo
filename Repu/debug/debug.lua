local _, ns = ...

local Utils = ns.Utils
local Locale = ns.Locale

local function printLine(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cffd4af37Repu|r " .. tostring(message))
end

local function timestampUTC()
    return date("!%Y-%m-%dT%H:%M:%SZ")
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

local function setOutputText(editBox, text)
    editBox._updating = true
    editBox.currentText = text or ""
    editBox:SetText(editBox.currentText)
    editBox:HighlightText(0, 0)
    editBox._updating = false
end

local function getAddonInfo(index)
    if C_AddOns and C_AddOns.GetAddOnInfo then
        local info = C_AddOns.GetAddOnInfo(index)
        if type(info) == "table" then
            return info.name, info.title
        end
    end

    if GetAddOnInfo then
        local name, title = GetAddOnInfo(index)
        return name, title
    end

    return nil, nil
end

local function updateAddonMemoryUsage()
    if C_AddOns and C_AddOns.UpdateAddOnMemoryUsage then
        C_AddOns.UpdateAddOnMemoryUsage()
        return
    end

    if UpdateAddOnMemoryUsage then
        UpdateAddOnMemoryUsage()
    end
end

local function updateAddonCPUUsage()
    if C_AddOns and C_AddOns.UpdateAddOnCPUUsage then
        C_AddOns.UpdateAddOnCPUUsage()
        return
    end

    if UpdateAddOnCPUUsage then
        UpdateAddOnCPUUsage()
    end
end

local function getAddonMemoryUsage(index, addonName)
    if C_AddOns and C_AddOns.GetAddOnMemoryUsage then
        local value = nil
        if index then
            value = C_AddOns.GetAddOnMemoryUsage(index)
        end
        if value == nil and addonName then
            value = C_AddOns.GetAddOnMemoryUsage(addonName)
        end
        if value ~= nil then
            return tonumber(value or 0) or 0
        end
    end

    if GetAddOnMemoryUsage then
        local value = nil
        if index then
            value = GetAddOnMemoryUsage(index)
        end
        if value == nil and addonName then
            value = GetAddOnMemoryUsage(addonName)
        end
        if value ~= nil then
            return tonumber(value or 0) or 0
        end
    end

    return 0
end

local function getAddonCPUUsage(index, addonName)
    if C_AddOns and C_AddOns.GetAddOnCPUUsage then
        local value = nil
        if index then
            value = C_AddOns.GetAddOnCPUUsage(index)
        end
        if value == nil and addonName then
            value = C_AddOns.GetAddOnCPUUsage(addonName)
        end
        if value ~= nil then
            return tonumber(value or 0) or 0
        end
    end

    if GetAddOnCPUUsage then
        local value = nil
        if index then
            value = GetAddOnCPUUsage(index)
        end
        if value == nil and addonName then
            value = GetAddOnCPUUsage(addonName)
        end
        if value ~= nil then
            return tonumber(value or 0) or 0
        end
    end

    return nil
end

local function isAddonLoaded(addonName)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        return C_AddOns.IsAddOnLoaded(addonName)
    end

    if IsAddOnLoaded then
        return IsAddOnLoaded(addonName)
    end

    return nil
end

local function formatMemoryKB(memoryKB)
    local value = tonumber(memoryKB or 0) or 0
    if value >= 102.4 then
        return string.format("%.1f MB", value / 1024)
    end

    return string.format("%.1f KB", value)
end

local function findAddonIndex(addonName)
    if not GetNumAddOns then
        return nil
    end

    for index = 1, GetNumAddOns() do
        local name, title = getAddonInfo(index)
        if name == addonName or title == addonName then
            return index
        end
    end

    return nil
end

local function collectAddonResourceUsage()
    local addonNames = { "Repu", "Repu_Data", "Repu_Map" }
    local rows = {}
    local totalMemory = 0
    local totalCPU = 0
    local cpuAvailable = false

    updateAddonMemoryUsage()
    updateAddonCPUUsage()

    for _, addonName in ipairs(addonNames) do
        local index = findAddonIndex(addonName)
        local memoryKB = 0
        local cpuMS = nil

        memoryKB = getAddonMemoryUsage(index, addonName)
        totalMemory = totalMemory + memoryKB

        cpuMS = getAddonCPUUsage(index, addonName)
        if cpuMS ~= nil then
            totalCPU = totalCPU + cpuMS
            cpuAvailable = true
        end

        rows[#rows + 1] = {
            name = addonName,
            memoryKB = memoryKB,
            cpuMS = cpuMS,
            loaded = isAddonLoaded(addonName),
        }
    end

    return {
        rows = rows,
        totalMemory = totalMemory,
        totalCPU = totalCPU,
        cpuAvailable = cpuAvailable,
    }
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
    local profile = ns.State:GetProfile()
    return profile.debug and ns.State:GetDebugDB().enabled
end

function ns.Debug:Log(message)
    if self:IsEnabled() then
        printLine(message)
    end
end

function ns.Debug:DumpState()
    local snapshot = ns.State:GetSnapshot()
    self:SetLastDiagnostic("dump", {
        context = snapshot.context,
        coverage = snapshot.coverage,
        rawFactionCount = snapshot.rawFactions and #snapshot.rawFactions.list or 0,
        matches = snapshot.matches or {},
        prioritized = snapshot.prioritized or {},
        visible = snapshot.visible or {},
    })
    printLine("Context: " .. Utils:Stringify(snapshot.context))
    printLine("Coverage: " .. Utils:Stringify(snapshot.coverage))
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
        timestamp = timestampUTC(),
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
        coverage = snapshot.coverage,
        api = ns.Compat:GetAPISummary(),
        factions = rawFactions,
        matches = snapshot.matches or {},
        prioritized = snapshot.prioritized or {},
        visible = snapshot.visible or {},
    }
end

function ns.Debug:SetLastDiagnostic(kind, payload)
    local debugDB = ns.State:GetDebugDB()
    debugDB.lastDiagnostics = debugDB.lastDiagnostics or {}
    debugDB.lastDiagnostics[kind] = {
        timestamp = timestampUTC(),
        payload = payload,
    }
    self:RefreshWindow()
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
    local profile = ns.State:GetProfile()
    local debugDB = ns.State:GetDebugDB()
    profile.debug = true
    profile.showDebugWindow = true
    debugDB.sweepMode = enabled and true or false
    debugDB.enabled = true
    debugDB.autoCapture = true
    debugDB.maxCaptures = enabled and (debugDB.sweepMaxCaptures or 2000) or (debugDB.defaultMaxCaptures or 200)
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
    frame:SetSize(700, 430)
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
    frame.title:SetText(Locale:Get("DEBUG_WINDOW_TITLE"))

    frame.subtitle = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.subtitle:SetPoint("TOPLEFT", frame.title, "BOTTOMLEFT", 0, -6)
    frame.subtitle:SetPoint("RIGHT", frame, "RIGHT", -10, 0)
    frame.subtitle:SetJustifyH("LEFT")
    frame.subtitle:SetText(Locale:Get("DEBUG_WINDOW_SUBTITLE"))

    frame.status = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.status:SetPoint("TOPLEFT", frame.subtitle, "BOTTOMLEFT", 0, -10)
    frame.status:SetPoint("RIGHT", frame, "RIGHT", -10, 0)
    frame.status:SetJustifyH("LEFT")

    frame.resources = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.resources:SetPoint("TOPLEFT", frame.status, "BOTTOMLEFT", 0, -8)
    frame.resources:SetPoint("RIGHT", frame, "RIGHT", -10, 0)
    frame.resources:SetJustifyH("LEFT")

    frame.outputScroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    frame.outputScroll:SetPoint("TOPLEFT", frame.resources, "BOTTOMLEFT", 0, -12)
    frame.outputScroll:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -28, -74)
    frame.outputScroll:SetPoint("BOTTOM", frame, "BOTTOM", 0, 72)

    frame.output = CreateFrame("EditBox", nil, frame.outputScroll)
    frame.output:SetMultiLine(true)
    frame.output:SetAutoFocus(false)
    frame.output:SetFontObject(ChatFontNormal)
    frame.output:SetWidth(640)
    frame.output:SetTextInsets(0, 0, 0, 0)
    frame.output:SetJustifyH("LEFT")
    frame.output:SetCursorPosition(0)
    frame.output:SetScript("OnTextChanged", function(self)
        if not self._updating and self.currentText then
            setOutputText(self, self.currentText)
            self:ClearFocus()
            return
        end
        local textHeight = 0
        if self.GetTextHeight then
            textHeight = self:GetTextHeight() or 0
        end
        self:SetHeight(math.max(1, textHeight + 16))
    end)
    frame.output:SetScript("OnChar", function(self)
        if self.currentText then
            setOutputText(self, self.currentText)
        end
        self:ClearFocus()
    end)
    frame.output:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    frame.outputScroll:SetScrollChild(frame.output)

    frame.actionsLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.actionsLabel:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 54)
    frame.actionsLabel:SetText(Locale:Get("DEBUG_ACTIONS"))

    frame.buttonRow = CreateFrame("Frame", nil, frame)
    frame.buttonRow:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 14)
    frame.buttonRow:SetSize(680, 56)

    frame.enableButton = createButton(frame.buttonRow, Locale:Get("DEBUG_CAPTURE_ON"), 90, function()
        local debugDB = ns.State:GetDebugDB()
        debugDB.enabled = true
        ns.Debug:RefreshWindow()
        printLine(Locale:Get("DEBUG_CAPTURE_ENABLED"))
    end)
    placeButton(frame.enableButton, frame.buttonRow, 0, 0)

    frame.disableButton = createButton(frame.buttonRow, Locale:Get("DEBUG_CAPTURE_OFF"), 90, function()
        local debugDB = ns.State:GetDebugDB()
        debugDB.enabled = false
        ns.Debug:RefreshWindow()
        printLine(Locale:Get("DEBUG_CAPTURE_DISABLED"))
    end)
    placeButton(frame.disableButton, frame.buttonRow, 98, 0)

    frame.captureNowButton = createButton(frame.buttonRow, Locale:Get("DEBUG_CAPTURE_NOW"), 110, function()
        local didCapture = ns.Debug:CaptureSnapshot("BUTTON_CAPTURE", true)
        printLine(didCapture and Locale:Get("DEBUG_SNAPSHOT_CAPTURED") or Locale:Get("DEBUG_SNAPSHOT_SKIPPED"))
    end)
    placeButton(frame.captureNowButton, frame.buttonRow, 196, 0)

    frame.refreshButton = createButton(frame.buttonRow, Locale:Get("DEBUG_REFRESH"), 90, function()
        ns.State:Refresh("BUTTON_REFRESH")
        ns.Debug:SetLastDiagnostic("refresh", {
            reason = "BUTTON_REFRESH",
            context = ns.State.runtime.context,
            coverage = ns.State.runtime.coverage,
        })
        printLine(Locale:Get("DEBUG_REFRESH_TRIGGERED"))
    end)
    placeButton(frame.refreshButton, frame.buttonRow, 314, 0)

    frame.clearButton = createButton(frame.buttonRow, Locale:Get("DEBUG_CLEAR"), 80, function()
        ns.Debug:ClearCaptures()
        printLine(Locale:Get("DEBUG_CAPTURES_CLEARED"))
    end)
    placeButton(frame.clearButton, frame.buttonRow, 412, 0)

    frame.copyButton = createButton(frame.buttonRow, Locale:Get("DEBUG_COPY"), 80, function()
        frame.output:SetFocus()
        frame.output:HighlightText()
        printLine(Locale:Get("DEBUG_COPY_READY"))
    end)
    placeButton(frame.copyButton, frame.buttonRow, 500, 0)

    frame.dumpButton = createButton(frame.buttonRow, Locale:Get("DEBUG_DUMP"), 80, function()
        ns.Debug:DumpState()
    end)
    placeButton(frame.dumpButton, frame.buttonRow, 588, 0)

    frame.reloadButton = createButton(frame.buttonRow, Locale:Get("DEBUG_RELOAD"), 90, function()
        ReloadUI()
    end)
    placeButton(frame.reloadButton, frame.buttonRow, 0, -28)

    frame.locationButton = createButton(frame.buttonRow, Locale:Get("DEBUG_LOCATION"), 90, function()
        ns.Debug:DumpLocation()
    end)
    placeButton(frame.locationButton, frame.buttonRow, 98, -28)

    frame.unmappedButton = createButton(frame.buttonRow, Locale:Get("DEBUG_UNMAPPED"), 90, function()
        ns.Debug:DumpUnmapped()
    end)
    placeButton(frame.unmappedButton, frame.buttonRow, 196, -28)

    frame.apiButton = createButton(frame.buttonRow, Locale:Get("DEBUG_API"), 72, function()
        ns.Debug:DumpAPI()
    end)
    placeButton(frame.apiButton, frame.buttonRow, 294, -28)

    frame.coverageButton = createButton(frame.buttonRow, Locale:Get("DEBUG_COVERAGE"), 90, function()
        ns.Debug:DumpCoverage()
    end)
    placeButton(frame.coverageButton, frame.buttonRow, 374, -28)

    frame.candidatesButton = createButton(frame.buttonRow, Locale:Get("DEBUG_CANDIDATES"), 90, function()
        ns.Debug:DumpCandidates(8)
    end)
    placeButton(frame.candidatesButton, frame.buttonRow, 472, -28)

    frame.factionsButton = createButton(frame.buttonRow, Locale:Get("DEBUG_FACTIONS"), 90, function()
        ns.Debug:DumpFactions(12)
    end)
    placeButton(frame.factionsButton, frame.buttonRow, 570, -28)

    self.window = frame
    self:RefreshWindow()
end

function ns.Debug:BuildWindowReport()
    local debugDB = ns.State:GetDebugDB()
    local snapshot = ns.State:GetSnapshot()
    local lastCapture = debugDB.captures and debugDB.captures[#debugDB.captures] or nil
    local resources = collectAddonResourceUsage()
    local sections = {}

    sections[#sections + 1] = string.format(
        "Context\n  Flavor: %s\n  Zone: %s\n  SubZone: %s\n  MapID: %s\n  Instance: %s\n  Coverage: zone=%s subzone=%s",
        tostring(snapshot.context and snapshot.context.activeFlavor or "none"),
        tostring(snapshot.context and snapshot.context.zoneName or "none"),
        tostring(snapshot.context and snapshot.context.subZoneName or "none"),
        tostring(snapshot.context and snapshot.context.mapID or "none"),
        tostring(snapshot.context and snapshot.context.instanceName or "none"),
        tostring(snapshot.coverage and snapshot.coverage.zoneHasMapping or false),
        tostring(snapshot.coverage and snapshot.coverage.subZoneHasMapping or false)
    )

    sections[#sections + 1] = string.format(
        "Runtime\n  Raw factions: %s\n  Matches: %s\n  Prioritized: %s\n  Visible: %s",
        tostring(snapshot.rawFactions and #(snapshot.rawFactions.list or {}) or 0),
        tostring(#(snapshot.matches or {})),
        tostring(#(snapshot.prioritized or {})),
        tostring(#(snapshot.visible or {}))
    )

    sections[#sections + 1] = string.format(
        "Captures\n  Stored: %s\n  Auto: %s\n  Sweep: %s\n  Last: %s",
        tostring(#(debugDB.captures or {})),
        tostring(debugDB.autoCapture),
        tostring(debugDB.sweepMode),
        tostring(lastCapture and lastCapture.key or Locale:Get("DEBUG_LAST_NONE"))
    )

    do
        local resourceLines = {
            string.format(
                "Resources\n  Total memory: %.1f MB\n  Total CPU: %s",
                (resources.totalMemory or 0) / 1024,
                resources.cpuAvailable and string.format("%.1f ms", resources.totalCPU or 0) or Locale:Get("DEBUG_CPU_UNAVAILABLE")
            )
        }

        for _, row in ipairs(resources.rows or {}) do
            resourceLines[#resourceLines + 1] = string.format(
                "  %s: %s  CPU %s  loaded=%s",
                tostring(row.name),
                tostring(formatMemoryKB(row.memoryKB)),
                row.cpuMS ~= nil and string.format("%.1f ms", row.cpuMS) or Locale:Get("DEBUG_CPU_UNAVAILABLE")
                ,
                tostring(row.loaded)
            )
        end

        sections[#sections + 1] = table.concat(resourceLines, "\n")
    end

    for _, key in ipairs({ "location", "coverage", "candidates", "dump", "factions", "api", "refresh", "status", "test", "unmapped", "mapscan" }) do
        local diagnostic = debugDB.lastDiagnostics and debugDB.lastDiagnostics[key] or nil
        sections[#sections + 1] = string.format(
            "Diag %-10s %s",
            key .. ":",
            tostring(diagnostic and diagnostic.timestamp or Locale:Get("DEBUG_LAST_NONE"))
        )
    end

    return table.concat(sections, "\n\n")
end

function ns.Debug:RefreshWindow()
    if not self.window then
        return
    end

    local profile = ns.State:GetProfile()
    local debugDB = ns.State:GetDebugDB()
    local count = #(debugDB.captures or {})
    local last = count > 0 and debugDB.captures[count] or nil
    local resources = collectAddonResourceUsage()
    self.window.status:SetText(Locale:Format(
        "DEBUG_WINDOW_STATUS",
        tostring(profile.debug),
        tostring(debugDB.enabled),
        tostring(count),
        tostring(last and last.key or Locale:Get("DEBUG_LAST_NONE"))
    ))
    self.window.resources:SetText(string.format(
        "RAM %.1f MB  CPU %s  Repu %s  Data %s  Map %s",
        (resources.totalMemory or 0) / 1024,
        resources.cpuAvailable and string.format("%.1f ms", resources.totalCPU or 0) or Locale:Get("DEBUG_CPU_UNAVAILABLE"),
        formatMemoryKB((resources.rows and resources.rows[1] and resources.rows[1].memoryKB) or 0),
        formatMemoryKB((resources.rows and resources.rows[2] and resources.rows[2].memoryKB) or 0),
        formatMemoryKB((resources.rows and resources.rows[3] and resources.rows[3].memoryKB) or 0)
    ))
    setOutputText(self.window.output, self:BuildWindowReport())
    self.window:SetShown(profile.debug and profile.showDebugWindow)
    self.window.enableButton:SetEnabled(profile.debug and not debugDB.enabled)
    self.window.disableButton:SetEnabled(profile.debug and debugDB.enabled)
    self.window.captureNowButton:SetEnabled(profile.debug)
    self.window.refreshButton:SetEnabled(profile.debug)
    self.window.clearButton:SetEnabled(profile.debug)
    self.window.copyButton:SetEnabled(profile.debug)
    self.window.dumpButton:SetEnabled(profile.debug)
    self.window.reloadButton:SetEnabled(profile.debug)
    self.window.locationButton:SetEnabled(profile.debug)
    self.window.unmappedButton:SetEnabled(profile.debug)
    self.window.apiButton:SetEnabled(profile.debug)
    self.window.coverageButton:SetEnabled(profile.debug)
    self.window.candidatesButton:SetEnabled(profile.debug)
    self.window.factionsButton:SetEnabled(profile.debug)
end

function ns.Debug:DumpFactions(limit)
    local snapshot = ns.State:GetSnapshot()
    local list = snapshot.rawFactions and snapshot.rawFactions.list or {}
    local maxCount = tonumber(limit) or 12
    local rows = {}

    for index = 1, math.min(#list, maxCount) do
        local faction = list[index]
        rows[#rows + 1] = {
            index = index,
            factionID = faction.factionID,
            name = faction.name,
            standingLabel = faction.standingLabel,
            progressValue = faction.progressValue or 0,
            progressMax = faction.progressMax or 0,
            watched = faction.isWatched,
            exalted = faction.isExalted,
            isMajorFaction = faction.isMajorFaction,
            renownLevel = faction.renownLevel,
            majorFactionData = faction.majorFactionData,
            raw = faction.raw,
        }
    end

    self:SetLastDiagnostic("factions", {
        count = #list,
        limit = maxCount,
        rows = rows,
    })

    printLine(Locale:Format("DEBUG_FACTION_DUMP_COUNT", tostring(#list)))
    for index = 1, math.min(#list, maxCount) do
        local faction = list[index]
        printLine(string.format(
            "#%d id=%s name=%s standing=%s progress=%d/%d watched=%s exalted=%s major=%s renown=%s",
            index,
            tostring(faction.factionID),
            tostring(faction.name),
            tostring(faction.standingLabel),
            faction.progressValue or 0,
            faction.progressMax or 0,
            tostring(faction.isWatched),
            tostring(faction.isExalted),
            tostring(faction.isMajorFaction),
            tostring(faction.renownLevel)
        ))
    end
end

function ns.Debug:DumpLocation()
    local context = ns.State.runtime.context or ns.Location:BuildContext()
    local coverage = ns.State.runtime.coverage or ns.Data:GetCoverage(context)
    self:SetLastDiagnostic("location", {
        context = context,
        coverage = coverage,
    })
    printLine(Locale:Format("DEBUG_FLAVOR", tostring(context.activeFlavor)))
    printLine(Locale:Format("DEBUG_ZONE", tostring(context.zoneName)))
    printLine(Locale:Format("DEBUG_SUBZONE", tostring(context.subZoneName)))
    printLine(Locale:Format("DEBUG_MAP_ID", tostring(context.mapID)))
    printLine(Locale:Format("DEBUG_INSTANCE", tostring(context.instanceName)))
    printLine(Locale:Format("DEBUG_INSTANCE_TYPE", tostring(context.instanceType)))
    printLine(Locale:Format("DEBUG_INSTANCE_MAP_ID", tostring(context.instanceMapID)))
    printLine(Locale:Format("DEBUG_DIFFICULTY", tostring(context.instanceDifficultyID)))
    printLine(Locale:Format("DEBUG_WATCHED_FACTION_ID", tostring(context.watchedFactionID)))
    printLine(Locale:Format("DEBUG_COVERAGE_DATA", Utils:Stringify(coverage)))
    printLine(Locale:Format("DEBUG_MAP_CHAIN", Utils:Stringify(context.mapChain)))
end

function ns.Debug:DumpCoverage()
    local context = ns.State.runtime.context or ns.Location:BuildContext()
    local coverage = ns.State.runtime.coverage or ns.Data:GetCoverage(context)
    self:SetLastDiagnostic("coverage", {
        context = context,
        coverage = coverage,
    })

    local zoneSource = coverage.zoneHasRecord and (coverage.zoneFromClientSeed and "client_seed" or "curated") or "missing"
    local subZoneSource = coverage.subZoneHasRecord and (coverage.subZoneFromClientSeed and "client_seed" or "curated") or "missing"

    printLine(Locale:Get("DEBUG_COVERAGE_SUMMARY"))
    printLine(Locale:Format("DEBUG_ZONE_SOURCE", tostring(zoneSource), tostring(coverage.zoneHasMapping), tostring(coverage.zoneNoLocalReputation)))
    printLine(Locale:Format("DEBUG_SUBZONE_SOURCE", tostring(subZoneSource), tostring(coverage.subZoneHasMapping), tostring(coverage.subZoneNoLocalReputation)))
    printLine(Locale:Format("DEBUG_ZONE_RECORD", Utils:Stringify(coverage.zoneRecord)))
    printLine(Locale:Format("DEBUG_SUBZONE_RECORD", Utils:Stringify(coverage.subZoneRecord)))
end

function ns.Debug:DumpCandidates(limit)
    local snapshot = ns.State:GetSnapshot()
    local context = snapshot.context or ns.Location:BuildContext()
    local coverage = snapshot.coverage or ns.Data:GetCoverage(context)
    local rawList = snapshot.rawFactions and snapshot.rawFactions.list or {}
    local maxCount = tonumber(limit) or 8
    local rows = {}
    local seenFactionIDs = {}

    local function addRow(kind, faction, extra)
        if not faction or #rows >= maxCount then
            return
        end

        if faction.factionID and seenFactionIDs[faction.factionID] then
            return
        end

        rows[#rows + 1] = {
            kind = kind,
            factionID = faction.factionID,
            name = faction.name,
            standingLabel = faction.standingLabel,
            progressValue = faction.progressValue or 0,
            progressMax = faction.progressMax or 0,
            watched = faction.isWatched,
            exalted = faction.isExalted,
            sourceType = extra and extra.sourceType or nil,
            sourceKey = extra and extra.sourceKey or nil,
            note = extra and extra.note or nil,
        }

        if faction.factionID then
            seenFactionIDs[faction.factionID] = true
        end
    end

    for _, candidate in ipairs(snapshot.visible or {}) do
        if not candidate.isFallback and candidate.sourceType ~= "inferred" then
            addRow("mapped", candidate.faction, candidate)
        end
    end

    for _, faction in ipairs(rawList) do
        if faction.isWatched then
            addRow("watched", faction)
        end
    end

    for _, faction in ipairs(rawList) do
        if #rows >= maxCount then
            break
        end
        addRow("raw", faction)
    end

    self:SetLastDiagnostic("candidates", {
        context = context,
        coverage = coverage,
        rows = rows,
    })

    printLine(Locale:Get("DEBUG_CANDIDATE_SUMMARY"))
    printLine(Locale:Format("DEBUG_CANDIDATE_ZONE", tostring(context.zoneName), tostring(context.subZoneName)))
    printLine(Locale:Format("DEBUG_CANDIDATE_MAPPING", tostring(coverage.zoneHasMapping), tostring(coverage.subZoneHasMapping)))
    for index, row in ipairs(rows) do
        printLine(string.format(
            "#%d kind=%s id=%s name=%s standing=%s progress=%d/%d watched=%s source=%s key=%s note=%s",
            index,
            tostring(row.kind),
            tostring(row.factionID),
            tostring(row.name),
            tostring(row.standingLabel),
            tonumber(row.progressValue or 0),
            tonumber(row.progressMax or 0),
            tostring(row.watched),
            tostring(row.sourceType),
            tostring(row.sourceKey),
            tostring(row.note)
        ))
    end
end

function ns.Debug:DumpUnmapped()
    local context = ns.State.runtime.context or ns.Location:BuildContext()
    local coverage = ns.State.runtime.coverage or ns.Data:GetCoverage(context)
    self:SetLastDiagnostic("unmapped", {
        context = context,
        coverage = coverage,
    })
    printLine(Locale:Get("DEBUG_UNMAPPED_PROBE"))
    printLine("ZoneKey=" .. tostring(context.zoneKey))
    printLine("SubZoneKey=" .. tostring(context.subZoneKey))
    printLine("MapID=" .. tostring(context.mapID))
    printLine("InstanceMapID=" .. tostring(context.instanceMapID))
    printLine("ZoneHasRecord=" .. tostring(coverage.zoneHasRecord))
    printLine("ZoneHasMapping=" .. tostring(coverage.zoneHasMapping))
    printLine("ZoneFromClientSeed=" .. tostring(coverage.zoneFromClientSeed))
    printLine("SubZoneHasRecord=" .. tostring(coverage.subZoneHasRecord))
    printLine("SubZoneHasMapping=" .. tostring(coverage.subZoneHasMapping))
    printLine("SubZoneFromClientSeed=" .. tostring(coverage.subZoneFromClientSeed))
    printLine("MapChain=" .. Utils:Stringify(context.mapChain))
end

function ns.Debug:DumpAPI()
    local api = ns.Compat:GetAPISummary()
    self:SetLastDiagnostic("api", api)
    printLine("API: " .. Utils:Stringify(api))
end

function ns.Debug:RunMapScan()
    local result = ns.Compat:ScanUiMaps()
    local debugDB = ns.State:GetDebugDB()
    debugDB.mapScan = result
    self:SetLastDiagnostic("mapscan", {
        action = "run",
        result = result,
    })

    printLine(Locale:Get("DEBUG_MAPSCAN_FINISHED"))
    printLine(Locale:Format("DEBUG_MAPSCAN_ROOTS", Utils:Stringify(result.roots)))
    printLine(Locale:Format("DEBUG_MAPSCAN_NODES", tostring(result.nodeCount or 0)))
    printLine(Locale:Format("DEBUG_MAPSCAN_SCANNED_AT", tostring(result.scannedAt)))
    if result.unsupported then
        printLine(Locale:Get("DEBUG_MAPSCAN_UNSUPPORTED"))
    end
end

function ns.Debug:DumpMapScanStatus()
    local mapScan = ns.State:GetDebugDB().mapScan or {}
    self:SetLastDiagnostic("mapscan", {
        action = "status",
        result = mapScan,
    })
    printLine(Locale:Format("DEBUG_MAPSCAN_STATUS_ROOTS", Utils:Stringify(mapScan.roots)))
    printLine(Locale:Format("DEBUG_MAPSCAN_STATUS_NODES", tostring(mapScan.nodeCount or 0)))
    printLine(Locale:Format("DEBUG_MAPSCAN_STATUS_SCANNED_AT", tostring(mapScan.scannedAt)))
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
    self:SetLastDiagnostic("mapscan", {
        action = "clear",
        result = debugDB.mapScan,
    })
    printLine(Locale:Get("DEBUG_MAPSCAN_CLEARED"))
end

function ns.Debug:DumpFactionByID(input)
    local factionID = tonumber(input or "")
    if not factionID then
        printLine(Locale:Get("DEBUG_USAGE_FACTION"))
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
        printLine(Locale:Get("DEBUG_HELP_DEBUG"))
        printLine(Locale:Get("DEBUG_HELP_DUMP"))
        printLine(Locale:Get("DEBUG_HELP_API"))
        printLine(Locale:Get("DEBUG_HELP_CAPTURE"))
        printLine(Locale:Get("DEBUG_HELP_FACTION"))
        printLine(Locale:Get("DEBUG_HELP_FACTIONS"))
        printLine(Locale:Get("DEBUG_HELP_LOCATION"))
        printLine(Locale:Get("DEBUG_HELP_COVERAGE"))
        printLine(Locale:Get("DEBUG_HELP_CANDIDATES"))
        printLine(Locale:Get("DEBUG_HELP_MAPSCAN"))
        printLine(Locale:Get("DEBUG_HELP_UNMAPPED"))
        printLine(Locale:Get("DEBUG_HELP_REFRESH"))
        printLine(Locale:Get("DEBUG_HELP_TEST"))
        printLine(Locale:Get("DEBUG_HELP_LOCK"))
        printLine(Locale:Get("DEBUG_HELP_EXALTED"))
        return
    end

    if verb == "debug" then
        local profile = ns.State:GetProfile()
        profile.debug = not profile.debug
        if profile.debug and profile.showDebugWindow == false then
            profile.showDebugWindow = true
        end
        self:RefreshWindow()
        printLine(profile.debug and Locale:Get("DEBUG_ENABLED") or Locale:Get("DEBUG_DISABLED"))
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

    if verb == "coverage" then
        self:DumpCoverage()
        return
    end

    if verb == "candidates" then
        self:DumpCandidates(tail)
        return
    end

    if verb == "capture" then
        local debugDB = ns.State:GetDebugDB()
        local profile = ns.State:GetProfile()
        if tail == "on" then
            profile.debug = true
            profile.showDebugWindow = true
            debugDB.enabled = true
            debugDB.sweepMode = false
            debugDB.maxCaptures = debugDB.defaultMaxCaptures or 200
            self:CreateWindow()
            self:RefreshWindow()
            printLine(Locale:Get("DEBUG_CAPTURE_ENABLED"))
            return
        end
        if tail == "off" then
            debugDB.enabled = false
            debugDB.sweepMode = false
            self:RefreshWindow()
            printLine(Locale:Get("DEBUG_CAPTURE_DISABLED"))
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
            profile.debug = true
            profile.showDebugWindow = true
            self:CreateWindow()
            self:RefreshWindow()
            printLine(Locale:Get("DEBUG_WINDOW_ENABLED"))
            return
        end
        if tail == "hide" then
            profile.showDebugWindow = false
            self:RefreshWindow()
            printLine(Locale:Get("DEBUG_WINDOW_DISABLED"))
            return
        end
        if tail == "now" then
            local didCapture = self:CaptureSnapshot("SLASH_CAPTURE", true)
            printLine(didCapture and Locale:Get("DEBUG_SNAPSHOT_CAPTURED") or Locale:Get("DEBUG_SNAPSHOT_SKIPPED"))
            return
        end
        if tail == "clear" then
            self:ClearCaptures()
            printLine(Locale:Get("DEBUG_CAPTURES_CLEARED"))
            return
        end
        if tail == "status" or tail == "" then
            self:CreateWindow()
            self:RefreshWindow()
            printLine(Locale:Format("DEBUG_CAPTURE_STATUS", tostring(debugDB.enabled), tostring(debugDB.sweepMode), tostring(#(debugDB.captures or {})), tostring(debugDB.maxCaptures or 200)))
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
        self:SetLastDiagnostic("refresh", {
            reason = "SLASH_REFRESH",
            context = ns.State.runtime.context,
            coverage = ns.State.runtime.coverage,
        })
        printLine(Locale:Get("DEBUG_REFRESH_TRIGGERED"))
        return
    end

    if verb == "test" then
        ns.State:Refresh("SLASH_TEST", { forceTest = true })
        self:SetLastDiagnostic("test", {
            reason = "SLASH_TEST",
            context = ns.State.runtime.context,
            coverage = ns.State.runtime.coverage,
        })
        printLine(Locale:Get("DEBUG_TEST_TRIGGERED"))
        return
    end

    if verb == "lock" then
        local profile = ns.State:GetProfile()
        profile.locked = not profile.locked
        ns.UI:Refresh(ns.State.runtime.visible, ns.State.runtime.context)
        printLine(Locale:Format("DEBUG_LOCKED", tostring(profile.locked)))
        return
    end

    if verb == "exalted" then
        local profile = ns.State:GetProfile()
        profile.hideExalted = not profile.hideExalted
        ns.State:Refresh("SLASH_EXALTED")
        printLine(Locale:Format("DEBUG_HIDE_EXALTED", tostring(profile.hideExalted)))
        return
    end

    printLine(Locale:Format("DEBUG_UNKNOWN_COMMAND", command))
end

function ns.Debug:OnRefresh(reason)
    if not self:IsCaptureEnabled() then
        return
    end

    self:CreateWindow()
    self:CaptureSnapshot(reason, false)
end
