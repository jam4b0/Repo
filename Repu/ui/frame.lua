local _, ns = ...

local Styles = ns.UI.Styles

local function setFrameBackdrop(frame)
    if not frame.SetBackdrop then
        return
    end

    frame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 8,
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    frame:SetBackdropColor(unpack(Styles.frameBackground))
    frame:SetBackdropBorderColor(unpack(Styles.border))
end

local function saveFramePosition(frame)
    local point, _, relativePoint, x, y = frame:GetPoint(1)
    local profile = ns.State:GetProfile()
    profile.point = point
    profile.relativePoint = relativePoint
    profile.x = x
    profile.y = y
end

local function getMinimapCenter()
    local x = Minimap:GetCenter()
    if not x then
        return 0, 0
    end
    local y = select(2, Minimap:GetCenter())
    return x, y
end

local function updateMinimapButtonPosition(button)
    local profile = ns.State:GetProfile()
    local angle = math.rad(profile.minimapAngle or 220)
    local radius = 80
    button:ClearAllPoints()
    button:SetPoint("CENTER", Minimap, "CENTER", math.cos(angle) * radius, math.sin(angle) * radius)
end

local function getCursorAngleDegrees(cx, cy, mx, my)
    if math.atan2 then
        return math.deg(math.atan2(my - cy, mx - cx))
    end
    local dx = mx - cx
    local dy = my - cy
    if dx == 0 then
        return dy >= 0 and 90 or -90
    end
    local angle = math.deg(math.atan(dy / dx))
    if dx < 0 then
        angle = angle + 180
    end
    return angle
end

local function createDetailButton(parent, index)
    local button = CreateFrame("Button", nil, parent, BackdropTemplateMixin and "BackdropTemplate")
    button:SetHeight(18)
    button:RegisterForClicks("LeftButtonUp")

    button.label = button:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    button.label:SetPoint("LEFT", button, "LEFT", 0, 0)
    button.label:SetJustifyH("LEFT")
    button.label:SetTextColor(unpack(Styles.text))

    button.meta = button:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    button.meta:SetPoint("RIGHT", button, "RIGHT", 0, 0)
    button.meta:SetJustifyH("RIGHT")
    button.meta:SetTextColor(unpack(Styles.accentText))

    button:SetScript("OnEnter", function(self)
        if self.isHeader or not self.location then
            return
        end
        self.label:SetTextColor(unpack(Styles.accentText))
    end)
    button:SetScript("OnLeave", function(self)
        if self.isHeader then
            self.label:SetTextColor(unpack(Styles.accentText))
            return
        end
        self.label:SetTextColor(unpack(Styles.text))
    end)
    button:Hide()
    return button
end

function ns.UI:Init()
    local profile = ns.State:GetProfile()
    local frame = CreateFrame("Frame", "RepuFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate")
    frame:SetSize(profile.width, 52)
    frame:SetScale(profile.scale)
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetPoint(profile.point, UIParent, profile.relativePoint, profile.x, profile.y)
    setFrameBackdrop(frame)

    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -8)
    frame.title:SetText("Repu")
    frame.title:SetTextColor(unpack(Styles.text))

    frame.dragText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.dragText:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -10, -10)
    frame.dragText:SetText("drag")
    frame.dragText:SetTextColor(unpack(Styles.subtleText))

    frame.detail = CreateFrame("Frame", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
    frame.detail:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -8)
    frame.detail:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -8, -8)
    setFrameBackdrop(frame.detail)
    frame.detail:Hide()

    frame.detail.title = frame.detail:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    frame.detail.title:SetPoint("TOPLEFT", frame.detail, "TOPLEFT", 12, -10)
    frame.detail.title:SetTextColor(unpack(Styles.text))

    frame.detail.meta = frame.detail:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.detail.meta:SetPoint("TOPLEFT", frame.detail, "TOPLEFT", 12, -34)
    frame.detail.meta:SetTextColor(unpack(Styles.accentText))

    frame.detail.source = frame.detail:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.detail.source:SetPoint("TOPLEFT", frame.detail, "TOPLEFT", 12, -52)
    frame.detail.source:SetPoint("RIGHT", frame.detail, "RIGHT", -12, 0)
    frame.detail.source:SetJustifyH("LEFT")
    frame.detail.source:SetTextColor(unpack(Styles.subtleText))
    frame.detail.source:SetSpacing(2)

    frame.detail.contentMeta = frame.detail:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.detail.contentMeta:SetPoint("TOPLEFT", frame.detail, "TOPLEFT", 12, -66)
    frame.detail.contentMeta:SetPoint("RIGHT", frame.detail, "RIGHT", -12, 0)
    frame.detail.contentMeta:SetJustifyH("LEFT")
    frame.detail.contentMeta:SetTextColor(unpack(Styles.subtleText))

    frame.detail.body = frame.detail:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.detail.body:SetPoint("TOPLEFT", frame.detail, "TOPLEFT", 12, -92)
    frame.detail.body:SetPoint("RIGHT", frame.detail, "RIGHT", -12, 0)
    frame.detail.body:SetJustifyH("LEFT")
    frame.detail.body:SetJustifyV("TOP")
    frame.detail.body:SetTextColor(unpack(Styles.subtleText))
    frame.detail.body:SetSpacing(1)

    frame.detail.buttons = {}
    for index = 1, 6 do
        frame.detail.buttons[index] = createDetailButton(frame.detail, index)
    end

    frame.rows = {}

    frame:SetScript("OnDragStart", function(self)
        if ns.State:GetProfile().locked then
            return
        end
        self:StartMoving()
    end)

    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        saveFramePosition(self)
    end)

    self.frame = frame
    self.selectedFactionID = nil
    self.expandedParents = self.expandedParents or {}
    self:EnsureMinimapButton()
    self:RegisterOptions()
    self:Refresh({}, nil)
end

function ns.UI:EnsureMinimapButton()
    if self.minimapButton then
        updateMinimapButtonPosition(self.minimapButton)
        self.minimapButton:SetShown(ns.State:GetProfile().showMinimapButton)
        return
    end

    local button = CreateFrame("Button", "RepuMinimapButton", Minimap)
    button:SetSize(31, 31)
    button:SetFrameStrata("MEDIUM")
    button:SetMovable(true)
    button:RegisterForDrag("LeftButton")
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    button.icon = button:CreateTexture(nil, "BACKGROUND")
    button.icon:SetTexture("Interface\\Icons\\Achievement_Reputation_01")
    button.icon:SetSize(20, 20)
    button.icon:SetPoint("CENTER")

    button.border = button:CreateTexture(nil, "OVERLAY")
    button.border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    button.border:SetSize(54, 54)
    button.border:SetPoint("TOPLEFT")

    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

    button:SetScript("OnClick", function(_, mouseButton)
        if mouseButton == "RightButton" then
            if Settings and Settings.OpenToCategory and ns.UI.optionsCategory then
                Settings.OpenToCategory(ns.UI.optionsCategory:GetID())
            elseif InterfaceOptionsFrame_OpenToCategory and ns.UI.optionsPanel then
                InterfaceOptionsFrame_OpenToCategory(ns.UI.optionsPanel)
                InterfaceOptionsFrame_OpenToCategory(ns.UI.optionsPanel)
            end
            return
        end

        local frame = ns.UI.frame
        if frame then
            frame:SetShown(not frame:IsShown())
        end
    end)

    button:SetScript("OnDragStart", function(self)
        self.dragging = true
        self:SetScript("OnUpdate", function(btn)
            local mx, my = GetCursorPosition()
            local scale = Minimap:GetEffectiveScale()
            mx = mx / scale
            my = my / scale
            local cx, cy = getMinimapCenter()
            local angle = getCursorAngleDegrees(cx, cy, mx, my)
            ns.State:GetProfile().minimapAngle = angle
            updateMinimapButtonPosition(btn)
        end)
    end)

    button:SetScript("OnDragStop", function(self)
        self.dragging = nil
        self:SetScript("OnUpdate", nil)
    end)

    self.minimapButton = button
    updateMinimapButtonPosition(button)
    button:SetShown(ns.State:GetProfile().showMinimapButton)
end

function ns.UI:EnsureRows(count)
    for index = #self.frame.rows + 1, count do
        self.frame.rows[index] = self:CreateRow(self.frame, index)
    end
end

function ns.UI:IsParentExpanded(factionID)
    if not factionID then
        return false
    end

    if self.expandedParents[factionID] == nil then
        return false
    end

    return self.expandedParents[factionID]
end

function ns.UI:BuildDisplayCandidates(candidates)
    local display = {}

    for _, candidate in ipairs(candidates or {}) do
        if candidate.parentFactionID then
            if self:IsParentExpanded(candidate.parentFactionID) then
                display[#display + 1] = candidate
            end
        else
            candidate.hasKnownChildren = ns.Factions:GetKnownChildFactionIDs(candidate.factionID) ~= nil
            candidate.isExpanded = candidate.hasKnownChildren and self:IsParentExpanded(candidate.factionID) or false
            display[#display + 1] = candidate
        end
    end

    return display
end

function ns.UI:Refresh(candidates, context)
    if not self.frame then
        return
    end

    local profile = ns.State:GetProfile()
    self:EnsureMinimapButton()
    local displayCandidates = self:BuildDisplayCandidates(candidates)
    local count = math.max(1, #displayCandidates)
    self:EnsureRows(count)

    local details = nil
    if self.selectedFactionID then
        for _, candidate in ipairs(displayCandidates) do
            if candidate and candidate.factionID == self.selectedFactionID then
                details = ns.Content:GetFactionDetails(candidate, context)
                break
            end
        end
    end

    local rowsHeight = 22 + (count * (profile.rowHeight + 3))
    local height = rowsHeight + 12
    self.frame:SetScale(profile.scale)
    self.frame:SetAlpha(profile.opacity or 1)
    self.frame:SetWidth(profile.width)
    self.frame:SetHeight(height)
    self.frame.dragText:SetShown(not profile.locked)

    local title = "Repu"
    if context and context.instanceName and context.instanceType and context.instanceType ~= "none" then
        title = string.format("Repu  %s", context.instanceName)
    elseif context and context.zoneName then
        title = string.format("Repu  %s", context.zoneName)
    end
    self.frame.title:SetText(title)

    for index, row in ipairs(self.frame.rows) do
        local candidate = displayCandidates[index]
        local isSelected = candidate and candidate.factionID == self.selectedFactionID
        self:UpdateRow(row, candidate, index == 1, isSelected)
    end

    if details then
        local detailHeight = self:UpdateDetails(details, count, profile) or 0
        self.frame:SetHeight(rowsHeight + detailHeight + 12)
    else
        self.frame.detail:Hide()
    end

    local shouldShow = (#candidates > 0 or not profile.locked)
    if profile.hideInCombat and InCombatLockdown and InCombatLockdown() then
        shouldShow = false
    end
    self.frame:SetShown(shouldShow)
end

function ns.UI:HandleRowClick(candidate, localX)
    if not candidate or not candidate.factionID then
        return
    end

    if candidate.hasKnownChildren and localX and localX <= 18 then
        self.expandedParents[candidate.factionID] = not self:IsParentExpanded(candidate.factionID)
        self:Refresh(ns.State.runtime.visible or {}, ns.State.runtime.context)
        return
    end

    self:ToggleDetails(candidate)
end

function ns.UI:ToggleDetails(candidate)
    if not candidate or not candidate.factionID then
        return
    end

    if self.selectedFactionID == candidate.factionID then
        self.selectedFactionID = nil
    else
        self.selectedFactionID = candidate.factionID
    end

    self:Refresh(ns.State.runtime.visible or {}, ns.State.runtime.context)
end

function ns.UI:UpdateDetails(details, count, profile)
    local detail = self.frame.detail
    local yOffset = -20 - (count * (profile.rowHeight + 3))
    detail:ClearAllPoints()
    detail:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 8, yOffset)
    detail:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", -8, yOffset)
    local progressText = string.format(
        "%s  %d/%d  %.1f%%",
        tostring(details.standingLabel or UNKNOWN),
        tonumber(details.progressValue or 0),
        tonumber(details.progressMax or 0),
        tonumber(details.progressPct or 0)
    )
    if details.isKnownMissing or details.hasRepEntry == false then
        progressText = "Kein Rufeintrag"
    end
    if details.renownLevel and details.renownLevel > 0 then
        if tonumber(details.progressMax or 0) > 0 then
            progressText = string.format(
                "Ruhmstufe %d  %d/%d  %.1f%%",
                tonumber(details.renownLevel),
                tonumber(details.progressValue or 0),
                tonumber(details.progressMax or 0),
                tonumber(details.progressPct or 0)
            )
        else
            progressText = string.format("Ruhmstufe %d", tonumber(details.renownLevel))
        end
    end

    local sourceText = nil
    if details.isInherited and details.context and details.context.subZoneName and details.context.zoneName then
        sourceText = string.format(
            "Herkunft: Zonentreffer aus %s für %s",
            tostring(details.context.zoneName),
            tostring(details.context.subZoneName)
        )
    elseif details.sourceType == "subZone" and details.context and details.context.subZoneName then
        sourceText = string.format("Herkunft: Unterzone %s", tostring(details.context.subZoneName))
    elseif details.sourceType == "zone" and details.context and details.context.zoneName then
        sourceText = string.format("Herkunft: Zone %s", tostring(details.context.zoneName))
    elseif details.sourceType == "instance" and details.sourceKey then
        sourceText = string.format("Herkunft: Instanz %s", tostring(details.sourceKey))
    elseif details.sourceType == "raid" and details.sourceKey then
        sourceText = string.format("Herkunft: Raid %s", tostring(details.sourceKey))
    end

    local contentMetaText = nil
    if details.contentSource or details.contentConfidence then
        contentMetaText = string.format(
            "Content-Daten: %s / %s",
            tostring(details.contentSource or "unbekannt"),
            tostring(details.contentConfidence or "unbekannt")
        )
    end

    detail.title:SetText(details.name or UNKNOWN)
    detail.meta:SetText(progressText)
    detail.source:SetText(sourceText or "")
    detail.contentMeta:SetText(contentMetaText or "")

    local showQuartermasters = profile.showQuartermasters ~= false
    local showActivities = profile.showActivities ~= false
    local quartermasters = showQuartermasters and (details.quartermasters or {}) or {}
    local activities = showActivities and (details.activities or {}) or {}

    local bodyLines = {
        details.summary or details.description or "Keine Beschreibung verfügbar.",
    }

    detail.body:SetText(table.concat(bodyLines, "\n"))
    detail.body:SetWidth((profile.width or self.frame:GetWidth() or 320) - 40)

    local entries = {}
    for _, quartermaster in ipairs(quartermasters) do
        entries[#entries + 1] = {
            label = quartermaster.name or "Rüstmeister",
            meta = quartermaster.label or "Rüstmeister",
            location = quartermaster.location,
        }
    end
    for _, activity in ipairs(activities) do
        entries[#entries + 1] = {
            label = activity.title or activity.name or "Aktivität",
            meta = activity.kind or "Aktivität",
            location = activity.location,
        }
    end

    local bodyHeight = math.ceil(math.max(52, detail.body:GetStringHeight() or 0))
    local contentTopOffset = -92 - bodyHeight - 18
    local currentTopOffset = contentTopOffset
    local entryIndex = 0

    local function addSectionHeader(text)
        entryIndex = entryIndex + 1
        local button = detail.buttons[entryIndex]
        if not button then
            return
        end

        button:ClearAllPoints()
        button:SetPoint("TOPLEFT", detail, "TOPLEFT", 12, currentTopOffset)
        button:SetPoint("TOPRIGHT", detail, "TOPRIGHT", -12, currentTopOffset)
        button.label:SetText(text)
        button.label:SetFontObject(GameFontNormal)
        button.label:SetTextColor(unpack(Styles.accentText))
        button.meta:SetText("")
        button.location = nil
        button.isHeader = true
        button:SetScript("OnClick", nil)
        button:Show()
        currentTopOffset = currentTopOffset - 24
    end

    local function addEntry(label, meta, location)
        entryIndex = entryIndex + 1
        local button = detail.buttons[entryIndex]
        if not button then
            return
        end

        button:ClearAllPoints()
        button:SetPoint("TOPLEFT", detail, "TOPLEFT", 12, currentTopOffset)
        button:SetPoint("TOPRIGHT", detail, "TOPRIGHT", -12, currentTopOffset)
        button.label:SetText(label)
        button.label:SetFontObject(GameFontHighlightSmall)
        button.label:SetTextColor(unpack(Styles.text))
        button.meta:SetText(meta or "")
        button.location = location
        button.isHeader = false
        if location then
            button:SetScript("OnClick", function(self)
                ns.Waypoints:SetLocationWaypoint(self.location)
            end)
        else
            button:SetScript("OnClick", nil)
        end
        button:Show()
        currentTopOffset = currentTopOffset - 20
    end

    for _, button in ipairs(detail.buttons) do
        button.location = nil
        button:Hide()
    end

    if showQuartermasters then
        addSectionHeader("Rüstmeister")
        if #quartermasters == 0 then
            addEntry("Noch kein Datensatz.", "", nil)
        else
            for _, quartermaster in ipairs(quartermasters) do
                addEntry(quartermaster.name or "Rüstmeister", quartermaster.label or "Rüstmeister", quartermaster.location)
            end
        end
        currentTopOffset = currentTopOffset - 6
    end

    if showActivities then
        addSectionHeader("Daily/Weekly")
        if #activities == 0 then
            addEntry("Noch kein Datensatz.", "", nil)
        else
            for _, activity in ipairs(activities) do
                addEntry(activity.title or activity.name or "Aktivität", activity.kind or "Aktivität", activity.location)
            end
        end
    end

    local detailHeight = math.abs(currentTopOffset) + 28
    detail:SetHeight(detailHeight)

    detail:Show()
    return detailHeight
end
