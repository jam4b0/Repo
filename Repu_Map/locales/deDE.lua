local api = _G.RepuMapAPI and _G.RepuMapAPI.I18n

if not api then
    return
end

api:Register("deDE", {
    MAP_ADDON_TITLE = "Repu-Karte",
    MAP_PROVIDER_READY = "Kartenanbieter bereit",
})
