local _, ns = ...

ns.Data:RegisterRetailModule({
    locations = {
        zones = {
            [2405] = {
                name = "Leerensturm",
                source = "observed",
                confidence = "medium",
                notes = "Localized Midnight zone for the void campaign branch.",
                mapIDs = { 2405 },
                tags = { "midnight", "zone", "primary", "local", "observed" },
                factions = {
                    { factionID = 2699, name = "Die Singularität", weight = 245 },
                },
            },
            [2413] = {
                name = "Harandar",
                source = "seed",
                confidence = "medium",
                notes = "Localized Midnight zone for the Hara'ti branch.",
                mapIDs = { 2413 },
                tags = { "midnight", "zone", "primary", "local" },
                factions = {
                    { factionID = 2704, name = "Hara'ti", weight = 245 },
                },
            },
            [2437] = {
                name = "Zul'Aman",
                source = "seed",
                confidence = "medium",
                notes = "Localized Midnight zone for the Amani branch.",
                mapIDs = { 2437 },
                tags = { "midnight", "zone", "primary", "local" },
                factions = {
                    { factionID = 2696, name = "Amanistamm", weight = 248 },
                },
            },
            [2393] = {
                name = "Silbermond",
                source = "observed",
                confidence = "medium",
                mapIDs = { 2393 },
                tags = { "midnight", "city", "hub", "local", "observed" },
                factions = {
                    { factionID = 2710, name = "Hof in Silbermond", weight = 246 },
                    { name = "Magister", weight = 240 },
                    { name = "Blutritter", weight = 240 },
                    { name = "Schemen der Gasse", weight = 235 },
                    { name = "Weltenwanderer", weight = 235 },
                },
            },
        },
        subZones = {
            ["2393:der basar"] = {
                name = "Der Basar",
                parentMapID = 2393,
                source = "observed",
                confidence = "medium",
                tags = { "midnight", "primary", "local", "observed" },
                factions = {
                    { name = "Magister", weight = 245 },
                    { name = "Schemen der Gasse", weight = 240 },
                },
            },
            ["2405:obskurionzitadelle"] = {
                name = "Obskurionzitadelle",
                parentMapID = 2405,
                source = "observed",
                confidence = "medium",
                tags = { "midnight", "primary", "local", "observed" },
                factions = {
                    { factionID = 2699, name = "Die Singularität", weight = 250 },
                },
            },
            ["2413:harandar"] = {
                name = "Harandar",
                parentMapID = 2413,
                source = "seed",
                confidence = "medium",
                tags = { "midnight", "primary", "local" },
                factions = {
                    { factionID = 2704, name = "Hara'ti", weight = 250 },
                },
            },
            ["2437:zul'aman"] = {
                name = "Zul'Aman",
                parentMapID = 2437,
                source = "seed",
                confidence = "medium",
                tags = { "midnight", "primary", "local" },
                factions = {
                    { factionID = 2696, name = "Amanistamm", weight = 252 },
                },
            },
        },
        instances = {
            ["eco dome al'dani"] = {
                name = "Eco-Dome Al'dani",
                source = "seed",
                confidence = "medium",
                tags = { "midnight", "dungeon" },
                factions = {
                    { factionID = 2699, weight = 345 },
                },
            },
            ["halls of atonement reprise"] = {
                name = "Halls of Atonement Reprise",
                source = "seed",
                confidence = "low",
                tags = { "midnight", "dungeon", "legacy-pool" },
                factions = {
                    { factionID = 2413, weight = 320 },
                },
            },
        },
        raids = {
            ["voidspire"] = {
                name = "Voidspire",
                source = "seed",
                confidence = "medium",
                tags = { "midnight", "raid", "primary" },
                factions = {
                    { factionID = 2699, weight = 398 },
                },
            },
            ["march on quel'danas"] = {
                name = "March on Quel'Danas",
                source = "seed",
                confidence = "medium",
                tags = { "midnight", "raid", "primary" },
                factions = {
                    { factionID = 2696, weight = 396 },
                    { factionID = 2711, weight = 392 },
                },
            },
        },
    },
})
