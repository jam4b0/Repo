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
                    { factionID = 2699, weight = 245 },
                    { factionID = 2770, weight = 230 },
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
                    { factionID = 2704, weight = 245 },
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
                    { factionID = 2696, weight = 248 },
                },
            },
            [2393] = {
                name = "Silbermond",
                source = "observed",
                confidence = "medium",
                mapIDs = { 2393 },
                tags = { "midnight", "city", "hub", "local", "observed" },
                factions = {
                    { factionID = 2710, weight = 246 },
                    { factionID = 2711, weight = 240 },
                    { factionID = 2712, weight = 240 },
                    { factionID = 2714, weight = 235 },
                    { factionID = 2713, weight = 235 },
                },
            },
        },
        subZones = {
            ["2393:bazaar"] = {
                name = "Der Basar",
                parentMapID = 2393,
                source = "observed",
                confidence = "medium",
                subZoneKeys = { "Der Basar", "Bazaar" },
                tags = { "midnight", "primary", "local", "observed" },
                factions = {
                    { factionID = 2711, weight = 245 },
                    { factionID = 2714, weight = 240 },
                },
            },
            ["2405:obscurus-citadel"] = {
                name = "Obskurionzitadelle",
                parentMapID = 2405,
                source = "observed",
                confidence = "medium",
                subZoneKeys = { "Obskurionzitadelle", "Obscurus Citadel" },
                tags = { "midnight", "primary", "local", "observed" },
                factions = {
                    { factionID = 2699, weight = 250 },
                    { factionID = 2770, weight = 236 },
                },
            },
            ["2413:harandar"] = {
                name = "Harandar",
                parentMapID = 2413,
                source = "seed",
                confidence = "medium",
                tags = { "midnight", "primary", "local" },
                factions = {
                    { factionID = 2704, weight = 250 },
                },
            },
            ["2437:zul'aman"] = {
                name = "Zul'Aman",
                parentMapID = 2437,
                source = "seed",
                confidence = "medium",
                tags = { "midnight", "primary", "local" },
                factions = {
                    { factionID = 2696, weight = 252 },
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
