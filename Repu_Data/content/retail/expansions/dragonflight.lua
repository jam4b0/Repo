local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2503] = {
            summary = "Dieser Dragonflight-Rufblock ist an die Ebenen von Ohn'ahra und Maruukai gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Ebenen von Ohn'ahra", kind = "Zone", location = { title = "Ebenen von Ohn'ahra" } },
                { title = "Maruukai", kind = "Hub", location = { title = "Maruukai" } },
            },
        },
        [2507] = {
            summary = "Dieser Dragonflight-Rufblock ist an die Kuesten- und Expeditionsinhalte der Dracheninseln gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Kueste des Erwachens", kind = "Zone", location = { title = "Kueste des Erwachens" } },
                { title = "Verbotene Insel", kind = "Zone", location = { title = "Verbotene Insel" } },
            },
        },
        [2510] = {
            summary = "Der zentrale Dragonflight-Hubruf von Valdrakken und Thaldraszus. Relevanter Fortschritt kommt vor allem aus Story, Weltquests und Hubaktivitaeten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Valdrakken", kind = "Hub", location = { title = "Valdrakken" } },
                { title = "Thaldraszus", kind = "Zone", location = { title = "Thaldraszus" } },
            },
        },
        [2511] = {
            summary = "Dieser Dragonflight-Rufblock ist an das Azurblaue Gebirge und die tuskarrnahen Hub- und Zoneninhalte gekoppelt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Azurblaue Gebirge", kind = "Zone", location = { title = "Azurblaue Gebirge" } },
                { title = "Iskaara", kind = "Hub", location = { title = "Iskaara" } },
            },
        },
    },
})
