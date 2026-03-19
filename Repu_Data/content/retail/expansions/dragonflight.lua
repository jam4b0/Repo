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
        [2517] = {
            summary = "Wrathion ist ein lokaler Nebenruf der Waking Shores rund um die schwarze Drachenflug-Geschichte. Der Fortschritt sitzt an den obsidianbezogenen Aufgaben dieses Gebiets.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Waking Shores black dragonflight content", kind = "Zone", location = { title = "Küste des Erwachens" } },
            },
        },
        [2518] = {
            summary = "Sabellian ist der zweite lokale schwarze Drachenflug-Nebenruf der Waking Shores. Der Fortschritt bündelt seine obsidianbezogenen Story- und Hilfsaufgaben.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Waking Shores black dragonflight content", kind = "Zone", location = { title = "Küste des Erwachens" } },
            },
        },
        [2523] = {
            summary = "Dark Talons ist ein lokaler Dracthyr-Nebenruf im Obsidian-Umfeld der Waking Shores. Er ergänzt die schwarze Drachenflug-Linie um einen einsatzorientierten Zweig.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Obsidian side content", kind = "Recurring", location = { title = "Küste des Erwachens" } },
            },
        },
        [2524] = {
            summary = "Obsidian Warders ist ein lokaler Dracthyr-Nebenruf im Obsidian-Umfeld der Waking Shores. Er ergänzt die dortigen Verteidigungs- und Schutzaktivitäten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Obsidian side content", kind = "Recurring", location = { title = "Küste des Erwachens" } },
            },
        },
        [2526] = {
            summary = "Winterpelt Furbolg ist ein lokaler Nebenruf im Azurblauen Gebirge. Der Fortschritt sitzt an der Winterpelt-Hilfe und den zugehörigen Aufgaben rund um die Furbolg.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Azure Span side quests", kind = "Zone", location = { title = "Azurblaue Gebirge" } },
            },
        },
        [2544] = {
            summary = "Artisan's Consortium - Dragon Isles Branch ist die professionsnahe Stadtfraktion von Valdrakken. Der Fortschritt ist an Handwerk, Aufträge und die Hauptprofessionen des Hubs gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Valdrakken professions hub", kind = "Hub", location = { title = "Valdrakken" } },
            },
        },
        [2550] = {
            summary = "Cobalt Assembly ist ein lokaler Nebenruf des Azurblauen Gebirges. Der Fortschritt sitzt an den Cobalt-Aktivitäten und den zugehörigen Sammel- und Kampfschleifen der Zone.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Azure Span side content", kind = "Zone", location = { title = "Azurblaue Gebirge" } },
            },
        },
        [2553] = {
            summary = "Soridormi ist der Nebenruf der Zeitriss-Inhalte von Thaldraszus. Der Fortschritt bündelt die wiederkehrenden Aktivitäten rund um die zeitgestörten Ereignisse.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Time Rifts", kind = "Recurring", location = { title = "Thaldraszus" } },
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
