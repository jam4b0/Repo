local api = _G.RepuAPI

if not api or not api.RegisterLocaleDomain then
    return
end

api.RegisterLocaleDomain("retail_content_text", "enUS", {
    faction.9000111.summary = "Shattrath is modeled as a legacy family cluster in the retail core. It groups Sha'tar, Aldor, Scryers, and Lower City so the city appears as a coherent reputation block instead of unrelated one-off entries.",
})
