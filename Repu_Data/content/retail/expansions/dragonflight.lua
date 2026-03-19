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
        [2564] = {
            summary = "Loamm Niffen ist die große Patch-Ruhmfraktion der Zaralekhöhle. Fortschritt kommt vor allem über Loamm, die Schnüffel-Suche, Weltinhalte in Zaralek und den dortigen Storyblock.",
            source = "curated",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Mimuup",
                    label = "Quartermaster",
                    location = { mapID = 2133, x = 0.560, y = 0.556, title = "Loamm" },
                },
            },
            activities = {
                { title = "Loamm", kind = "Hub", location = { mapID = 2133, title = "Loamm" } },
                { title = "Sniffenseeking", kind = "Weekly", location = { mapID = 2133, title = "Zaralek Cavern" } },
                { title = "Zaralek world content", kind = "Zone", location = { mapID = 2133, title = "Zaralek Cavern" } },
            },
        },
        [2574] = {
            summary = "Dream Wardens ist die große Patch-Ruhmfraktion des Smaragdgrünen Traums. Fortschritt kommt über den Storypfad, Weltinhalte im Traum und den zentralen Lagerbereich.",
            source = "curated",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Pipsee",
                    label = "Quartermaster",
                    location = { mapID = 2151, x = 0.500, y = 0.620, title = "Central Encampment" },
                },
            },
            activities = {
                { title = "Central Encampment", kind = "Hub", location = { mapID = 2151, title = "Central Encampment" } },
                { title = "Emerald Dream world content", kind = "Zone", location = { mapID = 2151, title = "Emerald Dream" } },
                { title = "Story chapters in the Dream", kind = "Story", location = { mapID = 2151, title = "Emerald Dream" } },
            },
        },
    },
})
