local api = _G.RepuAPI

if not api or not api.RegisterFlavorContent then
    return
end

api.RegisterFlavorContent("shared", {
    factions = {},
})
