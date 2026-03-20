local ADDON_NAME = ...

_G.RepuMapAPI = _G.RepuMapAPI or {}

local addon = CreateFrame("Frame")
addon.name = ADDON_NAME

local state = {
    isLoaded = false,
    providers = {},
}

function _G.RepuMapAPI.RegisterProvider(name, payload)
    if not name or state.providers[name] then
        return
    end
    state.providers[name] = payload or {}
end

function _G.RepuMapAPI.GetProviders()
    return state.providers
end

local function onAddonLoaded(_, event, addonName)
    if event ~= "ADDON_LOADED" or addonName ~= ADDON_NAME then
        return
    end

    if state.isLoaded then
        return
    end

    state.isLoaded = true
    if _G.RepuMapAPI.I18n then
        _G.RepuMapAPI.I18n:Apply()
    end
end

addon:RegisterEvent("ADDON_LOADED")
addon:SetScript("OnEvent", onAddonLoaded)
