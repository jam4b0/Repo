local _, ns = ...

local Styles = ns.UI.Styles
local Locale = ns.Locale

local function setBackdrop(frame, edgeColor, backgroundColor)
    if not frame.SetBackdrop then
        return
    end

    frame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 8,
        edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    frame:SetBackdropColor(unpack(backgroundColor or Styles.rowBackground))
    frame:SetBackdropBorderColor(unpack(edgeColor or Styles.border))
end

function ns.UI:CreateRow(parent, index)
    local profile = ns.State:GetProfile()
    local row = CreateFrame("Button", nil, parent, BackdropTemplateMixin and "BackdropTemplate")
    row:SetHeight(profile.rowHeight)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, -24 - ((index - 1) * (profile.rowHeight + 3)))
    row:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -8, -24 - ((index - 1) * (profile.rowHeight + 3)))

    setBackdrop(row, Styles.border)
    row:RegisterForClicks("LeftButtonUp")

    row.bar = CreateFrame("StatusBar", nil, row)
    row.bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    row.bar:SetMinMaxValues(0, 1)
    row.bar:SetValue(0)
    row.bar:SetPoint("TOPLEFT", row, "TOPLEFT", 4, -4)
    row.bar:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -4, 4)

    row.bar.bg = row.bar:CreateTexture(nil, "BACKGROUND")
    row.bar.bg:SetAllPoints()
    row.bar.bg:SetColorTexture(0.02, 0.02, 0.03, 0.75)

    row.overlay = CreateFrame("Frame", nil, row)
    row.overlay:SetAllPoints(row.bar)
    row.overlay:SetFrameLevel(row.bar:GetFrameLevel() + 5)
    row.overlay:EnableMouse(false)

    row.nameText = row.overlay:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    row.nameText:SetPoint("LEFT", row.overlay, "LEFT", 10, 0)
    row.nameText:SetJustifyH("LEFT")
    row.nameText:SetTextColor(unpack(Styles.text))
    row.nameText:SetShadowOffset(1, -1)
    row.nameText:SetShadowColor(0, 0, 0, 0.85)
    row.nameText:SetWordWrap(false)

    row.valueText = row.overlay:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    row.valueText:SetPoint("RIGHT", row.overlay, "RIGHT", -8, 0)
    row.valueText:SetJustifyH("RIGHT")
    row.valueText:SetTextColor(unpack(Styles.subtleText))
    row.valueText:SetShadowOffset(1, -1)
    row.valueText:SetShadowColor(0, 0, 0, 0.85)
    row.valueText:SetWordWrap(false)

    row.nameText:SetPoint("RIGHT", row.valueText, "LEFT", -10, 0)

    row:SetScript("OnEnter", function(self)
        if not self.isSelected then
            setBackdrop(self, Styles.border, Styles.rowHover)
        end
    end)

    row:SetScript("OnLeave", function(self)
        if self.isSelected then
            setBackdrop(self, Styles.activeBorder, Styles.rowHover)
        else
            setBackdrop(self, Styles.border, Styles.rowBackground)
        end
    end)

    row:SetScript("OnClick", function(self)
        if self.candidate then
            ns.UI:HandleRowClick(self.candidate)
        end
    end)

    row:Hide()
    return row
end

function ns.UI:UpdateRow(row, candidate, isActive, isSelected)
    if not candidate then
        row:Hide()
        return
    end

    local faction = candidate.faction
    local standingID = faction.standingID or 0
    local barColorR, barColorG, barColorB = ns.Data:GetRankColor(standingID)

    row.bar:SetStatusBarColor(barColorR, barColorG, barColorB)
    row.bar:SetMinMaxValues(0, math.max(1, faction.progressMax or 1))
    row.bar:SetValue(math.min(faction.progressMax or 1, faction.progressValue or 0))
    row.candidate = candidate
    row.isSelected = isSelected and true or false

    local hasChildren = candidate.hasKnownChildren and true or false
    local isChild = candidate.isChildOfVisibleParent and true or false
    row.nameText:SetText((isChild and "   " or "") .. tostring(faction.name or UNKNOWN))

    if hasChildren or not isChild then
        row.nameText:SetFontObject(GameFontNormal)
        row.nameText:SetTextColor(unpack(Styles.text))
    else
        row.nameText:SetFontObject(GameFontHighlightSmall)
        row.nameText:SetTextColor(unpack(Styles.subtleText))
    end

    row.nameText:ClearAllPoints()
    row.nameText:SetPoint("LEFT", row.overlay, "LEFT", isChild and 34 or 10, 0)
    row.nameText:SetPoint("RIGHT", row.valueText, "LEFT", -10, 0)

    local valueText = string.format(
        "%s  %d/%d  %.1f%%",
        faction.standingLabel or UNKNOWN,
        faction.progressValue or 0,
        faction.progressMax or 0,
        faction.progressPct or 0
    )
    if faction.isVirtualGroup then
        valueText = ""
    end
    if faction.isKnownMissing or faction.hasRepEntry == false then
        valueText = Locale:Get("UI_NO_REP_ENTRY")
    end
    if faction.isVirtualGroup then
        valueText = ""
    end
    if faction.renownLevel and faction.renownLevel > 0 then
        if (faction.progressMax or 0) > 0 then
            valueText = string.format(
                Locale:Get("UI_RENOWN_PROGRESS_FORMAT"),
                faction.renownLevel,
                faction.progressValue or 0,
                faction.progressMax or 0,
                faction.progressPct or 0
            )
        else
            valueText = Locale:Format("UI_RENOWN_LEVEL_FORMAT", faction.renownLevel)
        end
    end
    row.valueText:SetText(valueText)

    setBackdrop(row, isSelected and Styles.activeBorder or (isActive and Styles.activeBorder or Styles.border), isSelected and Styles.rowHover or Styles.rowBackground)
    row:Show()
end
