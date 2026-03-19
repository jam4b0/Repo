local _, ns = ...

local function refreshUI(reason)
    ns.UI:EnsureMinimapButton()
    ns.State:Refresh(reason or "OPTIONS_UPDATE")
end

local function createCheckbox(panel, anchor, label, onClick)
    local check = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate")
    check:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -10)
    check.Text:SetText(label)
    check:SetScript("OnClick", function(self)
        onClick(self:GetChecked() and true or false)
    end)
    return check
end

local function createSlider(panel, name, label, minValue, maxValue, step, width)
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    title:SetText(label)

    local slider = CreateFrame("Slider", name, panel, "OptionsSliderTemplate")
    slider:SetMinMaxValues(minValue, maxValue)
    slider:SetValueStep(step)
    slider:SetObeyStepOnDrag(true)
    slider:SetWidth(width or 220)
    slider.Text:SetText("")

    return title, slider
end

function ns.UI:RegisterOptions()
    if self.optionsRegistered then
        return
    end

    local panel = CreateFrame("Frame")
    panel.name = "Repu"

    panel.title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    panel.title:SetPoint("TOPLEFT", 16, -16)
    panel.title:SetText("Repu")

    panel.subtitle = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    panel.subtitle:SetPoint("TOPLEFT", panel.title, "BOTTOMLEFT", 0, -8)
    panel.subtitle:SetText("Location-aware reputation tracker")

    panel.locked = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate")
    panel.locked:SetPoint("TOPLEFT", panel.subtitle, "BOTTOMLEFT", 0, -18)
    panel.locked.Text:SetText("Fenster sperren")
    panel.locked:SetScript("OnClick", function(self)
        ns.State:GetProfile().locked = self:GetChecked() and true or false
        refreshUI("OPTIONS_LOCKED")
    end)

    panel.hideExalted = createCheckbox(panel, panel.locked, "Ehrfürchtig ausblenden", function(value)
        ns.State:GetProfile().hideExalted = value
        refreshUI("OPTIONS_HIDE_EXALTED")
    end)

    panel.hideInCombat = createCheckbox(panel, panel.hideExalted, "Im Kampf ausblenden", function(value)
        ns.State:GetProfile().hideInCombat = value
        refreshUI("OPTIONS_HIDE_IN_COMBAT")
    end)

    panel.showMinimapButton = createCheckbox(panel, panel.hideInCombat, "Minimap-Button anzeigen", function(value)
        ns.State:GetProfile().showMinimapButton = value
        ns.UI:EnsureMinimapButton()
    end)

    panel.showQuartermasters = createCheckbox(panel, panel.showMinimapButton, "Rüstmeister anzeigen", function(value)
        ns.State:GetProfile().showQuartermasters = value
        refreshUI("OPTIONS_SHOW_QUARTERMASTERS")
    end)

    panel.showActivities = createCheckbox(panel, panel.showQuartermasters, "Daily/Weekly anzeigen", function(value)
        ns.State:GetProfile().showActivities = value
        refreshUI("OPTIONS_SHOW_ACTIVITIES")
    end)

    panel.showRetailCompanions = createCheckbox(panel, panel.showActivities, "Tiefenbegleiter-Reputation anzeigen", function(value)
        ns.State:GetProfile().showRetailCompanions = value
        refreshUI("OPTIONS_SHOW_COMPANIONS")
    end)

    panel.maxBarsLabel, panel.maxBarsSlider = createSlider(panel, "RepuOptionsMaxBarsSlider", "Angezeigte Fraktionen", 1, 10, 1, 220)
    panel.maxBarsLabel:SetPoint("TOPLEFT", panel.showRetailCompanions, "BOTTOMLEFT", 4, -22)
    panel.maxBarsSlider:SetPoint("TOPLEFT", panel.maxBarsLabel, "BOTTOMLEFT", 0, -14)
    panel.maxBarsSlider.Low:SetText("1")
    panel.maxBarsSlider.High:SetText("10")
    panel.maxBarsSlider:SetScript("OnValueChanged", function(self, value)
        ns.State:GetProfile().maxBars = math.floor((value or 1) + 0.5)
        refreshUI("OPTIONS_MAX_BARS")
    end)

    panel.opacityLabel, panel.opacitySlider = createSlider(panel, "RepuOptionsOpacitySlider", "Fenster-Transparenz", 0.3, 1.0, 0.05, 220)
    panel.opacityLabel:SetPoint("TOPLEFT", panel.maxBarsSlider, "BOTTOMLEFT", 0, -24)
    panel.opacitySlider:SetPoint("TOPLEFT", panel.opacityLabel, "BOTTOMLEFT", 0, -14)
    panel.opacitySlider.Low:SetText("0.3")
    panel.opacitySlider.High:SetText("1.0")
    panel.opacitySlider:SetScript("OnValueChanged", function(self, value)
        ns.State:GetProfile().opacity = value
        refreshUI("OPTIONS_OPACITY")
    end)

    panel.scaleLabel, panel.scaleSlider = createSlider(panel, "RepuOptionsScaleSlider", "UI-Skalierung", 0.8, 1.4, 0.05, 220)
    panel.scaleLabel:SetPoint("TOPLEFT", panel.opacitySlider, "BOTTOMLEFT", 0, -24)
    panel.scaleSlider:SetPoint("TOPLEFT", panel.scaleLabel, "BOTTOMLEFT", 0, -14)
    panel.scaleSlider.Low:SetText("0.8")
    panel.scaleSlider.High:SetText("1.4")
    panel.scaleSlider:SetScript("OnValueChanged", function(self, value)
        ns.State:GetProfile().scale = value
        refreshUI("OPTIONS_SCALE")
    end)

    panel:SetScript("OnShow", function(self)
        local profile = ns.State:GetProfile()
        local isRetail = ns.Data:GetActiveFlavor() == "retail"

        self.locked:SetChecked(profile.locked)
        self.hideExalted:SetChecked(profile.hideExalted)
        self.hideInCombat:SetChecked(profile.hideInCombat)
        self.showMinimapButton:SetChecked(profile.showMinimapButton)
        self.showQuartermasters:SetChecked(profile.showQuartermasters)
        self.showActivities:SetChecked(profile.showActivities)
        self.showRetailCompanions:SetChecked(profile.showRetailCompanions)
        self.showRetailCompanions:SetShown(isRetail)

        self.maxBarsSlider:SetValue(profile.maxBars or 5)
        self.opacitySlider:SetValue(profile.opacity or 1)
        self.scaleSlider:SetValue(profile.scale or 1)
    end)

    if Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
        self.optionsCategory = category
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    end

    self.optionsPanel = panel
    self.optionsRegistered = true
end
