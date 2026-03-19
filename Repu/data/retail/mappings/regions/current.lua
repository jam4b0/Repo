local _, ns = ...

ns.Data:RegisterRetailModule({
    locations = {
        zones = {
            [2213] = {
                name = "Dorninsel",
                source = "seed",
                confidence = "medium",
                mapIDs = { 2213 },
                tags = { "current", "zone", "local" },
                factionIDs = { 2590 },
                weight = 238,
            },
            [2214] = {
                name = "The Ringing Deeps",
                source = "seed",
                confidence = "high",
                mapIDs = { 2214 },
                tags = { "current", "zone", "primary", "local" },
                factionIDs = { 2594 },
                weight = 250,
            },
            [2215] = {
                name = "Hallowfall",
                source = "seed",
                confidence = "high",
                mapIDs = { 2215 },
                tags = { "current", "zone", "primary", "local" },
                factionIDs = { 2570 },
                weight = 250,
            },
            [2255] = {
                name = "Azj-Kahet",
                source = "seed",
                confidence = "high",
                mapIDs = { 2255 },
                aliases = { "azj kahet", "azj-kahet" },
                tags = { "current", "zone", "primary", "local" },
                factionIDs = { 2600 },
                weight = 250,
            },
            [2248] = {
                name = "Isle of Dorn",
                source = "seed",
                confidence = "high",
                mapIDs = { 2248 },
                tags = { "current", "zone", "primary", "local" },
                factionIDs = { 2590 },
                weight = 250,
            },
            [2339] = {
                name = "Dornogal",
                source = "seed",
                confidence = "high",
                mapIDs = { 2339 },
                tags = { "current", "city", "hub", "primary", "local" },
                factionIDs = { 2590 },
                weight = 255,
            },
            [2346] = {
                name = "Undermine",
                source = "seed",
                confidence = "high",
                mapIDs = { 2346 },
                tags = { "current", "zone", "primary", "local" },
                factionIDs = { 2653 },
                weight = 250,
            },
            [2405] = {
                name = "Leerensturm",
                source = "observed",
                confidence = "medium",
                notes = "Localized Midnight zone for the void campaign branch.",
                mapIDs = { 2405 },
                tags = { "current", "zone", "primary", "local", "observed" },
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
                tags = { "current", "zone", "primary", "local" },
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
                tags = { "current", "zone", "primary", "local" },
                factions = {
                    { factionID = 2696, name = "Amanistamm", weight = 248 },
                },
            },
            [2393] = {
                name = "Silbermond",
                source = "observed",
                confidence = "medium",
                mapIDs = { 2393 },
                tags = { "current", "city", "hub", "local", "observed" },
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
            ["2255:the severed threads"] = {
                name = "The Severed Threads",
                parentMapID = 2255,
                source = "seed",
                confidence = "high",
                tags = { "current", "primary", "local" },
                factions = {
                    { factionID = 2600, weight = 225 },
                },
            },
            ["2215:mereldar"] = {
                name = "Mereldar",
                parentMapID = 2215,
                source = "seed",
                confidence = "medium",
                tags = { "current", "local" },
                factions = {
                    { factionID = 2570, weight = 230 },
                },
            },
            ["2248:dornogal"] = {
                name = "Dornogal",
                parentMapID = 2248,
                source = "seed",
                confidence = "high",
                tags = { "current", "hub", "local" },
                factions = {
                    { factionID = 2590, weight = 230 },
                },
            },
            ["2339:dornogal"] = {
                name = "Dornogal",
                parentMapID = 2339,
                source = "seed",
                confidence = "high",
                tags = { "current", "primary", "hub", "local" },
                factions = {
                    { factionID = 2590, weight = 260 },
                },
            },
            ["2214:taelloch"] = {
                name = "Taelloch",
                parentMapID = 2214,
                source = "seed",
                confidence = "medium",
                tags = { "current", "hub", "local" },
                factions = {
                    { factionID = 2594, weight = 232 },
                },
            },
            ["2346:undermine city"] = {
                name = "Undermine City",
                parentMapID = 2346,
                source = "seed",
                confidence = "high",
                tags = { "current", "hub", "local" },
                factions = {
                    { factionID = 2653, weight = 235 },
                },
            },
            ["2393:der basar"] = {
                name = "Der Basar",
                parentMapID = 2393,
                source = "observed",
                confidence = "medium",
                tags = { "current", "primary", "local", "observed" },
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
                tags = { "current", "primary", "local", "observed" },
                factions = {
                    { factionID = 2699, name = "Die Singularität", weight = 250 },
                },
            },
            ["2413:harandar"] = {
                name = "Harandar",
                parentMapID = 2413,
                source = "seed",
                confidence = "medium",
                tags = { "current", "primary", "local" },
                factions = {
                    { factionID = 2704, name = "Hara'ti", weight = 250 },
                },
            },
            ["2437:zul'aman"] = {
                name = "Zul'Aman",
                parentMapID = 2437,
                source = "seed",
                confidence = "medium",
                tags = { "current", "primary", "local" },
                factions = {
                    { factionID = 2696, name = "Amanistamm", weight = 252 },
                },
            },
        },
        instances = {
            ["priory of the sacred flame"] = {
                name = "Priory of the Sacred Flame",
                source = "seed",
                confidence = "high",
                tags = { "current", "dungeon", "primary" },
                factions = {
                    { factionID = 2570, weight = 350 },
                },
            },
            ["the rookery"] = {
                name = "The Rookery",
                source = "seed",
                confidence = "high",
                tags = { "current", "dungeon", "primary" },
                factions = {
                    { factionID = 2594, weight = 350 },
                },
            },
            ["city of threads"] = {
                name = "City of Threads",
                source = "seed",
                confidence = "high",
                tags = { "current", "dungeon", "primary" },
                factions = {
                    { factionID = 2600, weight = 350 },
                },
            },
            ["cinderbrew meadery"] = {
                name = "Cinderbrew Meadery",
                source = "seed",
                confidence = "medium",
                tags = { "current", "dungeon" },
                factions = {
                    { factionID = 2590, weight = 340 },
                },
            },
            ["darkflame cleft"] = {
                name = "Darkflame Cleft",
                source = "seed",
                confidence = "medium",
                tags = { "current", "dungeon" },
                factions = {
                    { factionID = 2594, weight = 340 },
                },
            },
            ["the stonevault"] = {
                name = "The Stonevault",
                source = "seed",
                confidence = "medium",
                tags = { "current", "dungeon" },
                factions = {
                    { factionID = 2594, weight = 345 },
                },
            },
            ["ara kara city of echoes"] = {
                name = "Ara-Kara, City of Echoes",
                source = "seed",
                confidence = "medium",
                aliases = { "ara-kara, city of echoes", "ara-kara city of echoes" },
                tags = { "current", "dungeon" },
                factions = {
                    { factionID = 2600, weight = 345 },
                },
            },
            ["operation floodgate"] = {
                name = "Operation: Floodgate",
                source = "seed",
                confidence = "medium",
                tags = { "current", "dungeon" },
                factions = {
                    { factionID = 2653, weight = 345 },
                },
            },
            ["the dawnbreaker"] = {
                name = "The Dawnbreaker",
                source = "seed",
                confidence = "high",
                tags = { "current", "dungeon", "primary" },
                factions = {
                    { factionID = 2570, weight = 350 },
                },
            },
            ["eco dome al'dani"] = {
                name = "Eco-Dome Al'dani",
                source = "seed",
                confidence = "medium",
                tags = { "current", "dungeon" },
                factions = {
                    { factionID = 2699, weight = 345 },
                },
            },
            ["halls of atonement reprise"] = {
                name = "Halls of Atonement Reprise",
                source = "seed",
                confidence = "low",
                tags = { "current", "dungeon", "legacy-pool" },
                factions = {
                    { factionID = 2413, weight = 320 },
                },
            },
        },
        raids = {
            ["nerubar palace"] = {
                name = "Nerub-ar Palace",
                source = "seed",
                confidence = "high",
                tags = { "current", "raid", "primary" },
                factions = {
                    { factionID = 2600, weight = 400 },
                },
            },
            ["liberation of undermine"] = {
                name = "Liberation of Undermine",
                source = "seed",
                confidence = "high",
                tags = { "current", "raid", "primary" },
                factions = {
                    { factionID = 2653, weight = 400 },
                },
            },
            ["voidspire"] = {
                name = "Voidspire",
                source = "seed",
                confidence = "medium",
                tags = { "current", "raid", "primary" },
                factions = {
                    { factionID = 2699, weight = 398 },
                },
            },
            ["march on quel'danas"] = {
                name = "March on Quel'Danas",
                source = "seed",
                confidence = "medium",
                tags = { "current", "raid", "primary" },
                factions = {
                    { factionID = 2696, weight = 396 },
                    { factionID = 2711, weight = 392 },
                },
            },
        },
    },
})
