local api = _G.RepuMapAPI and _G.RepuMapAPI.I18n

if not api then
    return
end

api:Register("enUS", {
    MAP_ADDON_TITLE = "Repu Map",
    MAP_PROVIDER_READY = "Map providers ready",
})
