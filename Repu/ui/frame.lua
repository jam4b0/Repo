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

local function createDetailButton(parent, index)
    local button = CreateFrame("Button", nil, parent, BackdropTemplateMixin and "BackdropTemplate")
    button:SetHeight(18)
    button:SetPoint("TOPLEFT", parent.body, "TOPLEFT", 0, -92 - ((index - 1) * 20))
    button:SetPoint("TOPRIGHT", parent.body, "TOPRIGHT", 0, -92 - ((index - 1) * 20))
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
        self.label:SetTextColor(unpack(Styles.accentText))
    end)
    button:SetScript("OnLeave", function(self)
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
    self:RegisterOptions()
    self:Refresh({}, nil)
end

function ns.UI:EnsureRows(count)
    for index = #self.frame.rows + 1, count do
        self.frame.rows[index] = self:CreateRow(self.frame, index)
    end
end

function ns.UI:Refresh(candidates, context)
    if not self.frame then
        return
    end

    local profile = ns.State:GetProfile()
    local count = math.max(1, #candidates)
    self:EnsureRows(count)

    local details = nil
    if self.selectedFactionID then
        for _, candidate in ipairs(candidates) do
            if candidate and candidate.factionID == self.selectedFactionID then
                details = ns.Content:GetFactionDetails(candidate, context)
                break
            end
        end
    end

    local detailHeight = details and 212 or 0
    local height = 22 + (count * (profile.rowHeight + 3)) + detailHeight + 12
    self.frame:SetScale(profile.scale)
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
        local candidate = candidates[index]
        local isSelected = candidate and candidate.factionID == self.selectedFactionID
        self:UpdateRow(row, candidate, index == 1, isSelected)
    end

    if details then
        self:UpdateDetails(details, count, profile)
    else
        self.frame.detail:Hide()
    end

    self.frame:SetShown(#candidates > 0 or not profile.locked)
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

    ns.State:Refresh("UI_TOGGLE_DETAILS")
end

function ns.UI:UpdateDetails(details, count, profile)
    local detail = self.frame.detail
    local yOffset = -20 - (count * (profile.rowHeight + 3))
    detail:ClearAllPoints()
    detail:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 8, yOffset)
    detail:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", -8, yOffset)
    detail:SetHeight(204)

    local progressText = string.format(
        "%s  %d/%d  %.1f%%",
        tostring(details.standingLabel or UNKNOWN),
        tonumber(details.progressValue or 0),
        tonumber(details.progressMax or 0),
        tonumber(details.progressPct or 0)
    )
    if details.renownLevel and details.renownLevel > 0 then
        progressText = string.format(
            "Renown %d  %d/%d  %.1f%%",
            tonumber(details.renownLevel),
            tonumber(details.progressValue or 0),
            tonumber(details.progressMax or 0),
            tonumber(details.progressPct or 0)
        )
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

    local bodyLines = {
        details.summary or details.description or "Keine Beschreibung verfügbar.",
        " ",
        "Rüstmeister",
    }

    if #(details.quartermasters or {}) == 0 then
        bodyLines[#bodyLines + 1] = "Noch kein Datensatz."
    end

    bodyLines[#bodyLines + 1] = " "
    bodyLines[#bodyLines + 1] = "Daily/Weekly"
    if #(details.activities or {}) == 0 then
        bodyLines[#bodyLines + 1] = "Noch kein Datensatz."
    end

    detail.body:SetText(table.concat(bodyLines, "\n"))

    local entries = {}
    for _, quartermaster in ipairs(details.quartermasters or {}) do
        entries[#entries + 1] = {
            label = quartermaster.name or "Rüstmeister",
            meta = quartermaster.label or "Rüstmeister",
            location = quartermaster.location,
        }
    end
    for _, activity in ipairs(details.activities or {}) do
        entries[#entries + 1] = {
            label = activity.title or activity.name or "Aktivität",
            meta = activity.kind or "Aktivität",
            location = activity.location,
        }
    end

    for index, button in ipairs(detail.buttons) do
        local entry = entries[index]
        if entry then
            button.label:SetText(entry.label)
            button.meta:SetText(entry.meta)
            button.location = entry.location
            button:SetScript("OnClick", function(self)
                ns.Waypoints:SetLocationWaypoint(self.location)
            end)
            button:Show()
        else
            button.location = nil
            button:Hide()
        end
    end

    detail:Show()
end
