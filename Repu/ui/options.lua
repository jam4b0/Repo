local _, ns = ...

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
        ns.UI:Refresh(ns.State.runtime.visible or {}, ns.State.runtime.context)
    end)

    panel.hideExalted = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate")
    panel.hideExalted:SetPoint("TOPLEFT", panel.locked, "BOTTOMLEFT", 0, -10)
    panel.hideExalted.Text:SetText("Ehrfürchtig ausblenden")
    panel.hideExalted:SetScript("OnClick", function(self)
        ns.State:GetProfile().hideExalted = self:GetChecked() and true or false
        ns.State:Refresh("OPTIONS_HIDE_EXALTED")
    end)

    panel.scaleLabel = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    panel.scaleLabel:SetPoint("TOPLEFT", panel.hideExalted, "BOTTOMLEFT", 4, -22)
    panel.scaleLabel:SetText("UI-Skalierung")

    panel.scaleSlider = CreateFrame("Slider", "RepuOptionsScaleSlider", panel, "OptionsSliderTemplate")
    panel.scaleSlider:SetPoint("TOPLEFT", panel.scaleLabel, "BOTTOMLEFT", 0, -14)
    panel.scaleSlider:SetMinMaxValues(0.8, 1.4)
    panel.scaleSlider:SetValueStep(0.05)
    panel.scaleSlider:SetObeyStepOnDrag(true)
    panel.scaleSlider:SetWidth(220)
    panel.scaleSlider.Low:SetText("0.8")
    panel.scaleSlider.High:SetText("1.4")
    panel.scaleSlider.Text:SetText("")
    panel.scaleSlider:SetScript("OnValueChanged", function(self, value)
        ns.State:GetProfile().scale = value
        ns.UI:Refresh(ns.State.runtime.visible or {}, ns.State.runtime.context)
    end)

    panel:SetScript("OnShow", function(self)
        local profile = ns.State:GetProfile()
        self.locked:SetChecked(profile.locked)
        self.hideExalted:SetChecked(profile.hideExalted)
        self.scaleSlider:SetValue(profile.scale or 1)
    end)

    if Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    end

    self.optionsPanel = panel
    self.optionsRegistered = true
end
