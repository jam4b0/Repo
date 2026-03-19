local ADDON_NAME, ns = ...

ns.name = ADDON_NAME
_G.RepuAPI = _G.RepuAPI or {}
ns.Locale = ns.Locale or {}
ns.Core = ns.Core or {}
ns.Utils = ns.Utils or {}
ns.Config = ns.Config or {}
ns.Compat = ns.Compat or {}
ns.State = ns.State or {}
ns.Data = ns.Data or {}
ns.Location = ns.Location or {}
ns.Factions = ns.Factions or {}
ns.Inference = ns.Inference or {}
ns.Scoring = ns.Scoring or {}
ns.Content = ns.Content or {}
ns.Waypoints = ns.Waypoints or {}
ns.UI = ns.UI or {}
ns.Debug = ns.Debug or {}
ns.Events = ns.Events or {}

local bootstrap = CreateFrame("Frame")

function ns.Core:OnAddonLoaded()
    if self.isLoaded then
        return
    end

    self.isLoaded = true

    ns.Locale:Init()
    ns.Config:Init()
    ns.State:Init()
    ns.Data:Init()
    ns.Debug:Init()
    ns.UI:Init()
    ns.Events:Init()
end

function ns.Core:OnPlayerLogin()
    if not self.isLoaded or self.isLoggedIn then
        return
    end

    self.isLoggedIn = true
    ns.Events:RegisterRuntimeEvents()
    ns.State:Refresh("PLAYER_LOGIN")
end

bootstrap:RegisterEvent("ADDON_LOADED")
bootstrap:RegisterEvent("PLAYER_LOGIN")
bootstrap:SetScript("OnEvent", function(_, event, arg1)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        ns.Core:OnAddonLoaded()
        return
    end

    if event == "PLAYER_LOGIN" then
        ns.Core:OnPlayerLogin()
    end
end)
