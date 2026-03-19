local _, ns = ...

ns.Data:RegisterRetailModule({
    locations = {
        zones = {
            [2213] = {
                name = "Dorninsel",
                source = "seed",
                confidence = "medium",
                mapIDs = { 2213 },
                tags = { "war-within", "zone", "local" },
                factionIDs = { 2590 },
                weight = 238,
            },
            [2214] = {
                name = "The Ringing Deeps",
                source = "seed",
                confidence = "high",
                mapIDs = { 2214 },
                tags = { "war-within", "zone", "primary", "local" },
                factionIDs = { 2594 },
                weight = 250,
            },
            [2215] = {
                name = "Hallowfall",
                source = "seed",
                confidence = "high",
                mapIDs = { 2215 },
                tags = { "war-within", "zone", "primary", "local" },
                factionIDs = { 2570 },
                weight = 250,
            },
            [2255] = {
                name = "Azj-Kahet",
                source = "seed",
                confidence = "high",
                mapIDs = { 2255 },
                aliases = { "azj kahet", "azj-kahet" },
                tags = { "war-within", "zone", "primary", "local" },
                factionIDs = { 2600 },
                weight = 250,
            },
            [2248] = {
                name = "Isle of Dorn",
                source = "seed",
                confidence = "high",
                mapIDs = { 2248 },
                tags = { "war-within", "zone", "primary", "local" },
                factionIDs = { 2590 },
                weight = 250,
            },
            [2339] = {
                name = "Dornogal",
                source = "seed",
                confidence = "high",
                mapIDs = { 2339 },
                tags = { "war-within", "city", "hub", "primary", "local" },
                factionIDs = { 2590 },
                weight = 255,
            },
            [2346] = {
                name = "Undermine",
                source = "seed",
                confidence = "high",
                mapIDs = { 2346 },
                tags = { "war-within", "zone", "primary", "local" },
                factionIDs = { 2653 },
                weight = 250,
            },
        },
        subZones = {
            ["2255:the severed threads"] = {
                name = "The Severed Threads",
                parentMapID = 2255,
                source = "seed",
                confidence = "high",
                tags = { "war-within", "primary", "local" },
                factions = {
                    { factionID = 2600, weight = 225 },
                },
            },
            ["2215:mereldar"] = {
                name = "Mereldar",
                parentMapID = 2215,
                source = "seed",
                confidence = "medium",
                tags = { "war-within", "local" },
                factions = {
                    { factionID = 2570, weight = 230 },
                },
            },
            ["2248:dornogal"] = {
                name = "Dornogal",
                parentMapID = 2248,
                source = "seed",
                confidence = "high",
                tags = { "war-within", "hub", "local" },
                factions = {
                    { factionID = 2590, weight = 230 },
                },
            },
            ["2339:dornogal"] = {
                name = "Dornogal",
                parentMapID = 2339,
                source = "seed",
                confidence = "high",
                tags = { "war-within", "primary", "hub", "local" },
                factions = {
                    { factionID = 2590, weight = 260 },
                },
            },
            ["2214:taelloch"] = {
                name = "Taelloch",
                parentMapID = 2214,
                source = "seed",
                confidence = "medium",
                tags = { "war-within", "hub", "local" },
                factions = {
                    { factionID = 2594, weight = 232 },
                },
            },
            ["2346:undermine city"] = {
                name = "Undermine City",
                parentMapID = 2346,
                source = "seed",
                confidence = "high",
                tags = { "war-within", "hub", "local" },
                factions = {
                    { factionID = 2653, weight = 235 },
                },
            },
        },
        instances = {
            ["priory of the sacred flame"] = {
                name = "Priory of the Sacred Flame",
                source = "seed",
                confidence = "high",
                tags = { "war-within", "dungeon", "primary" },
                factions = {
                    { factionID = 2570, weight = 350 },
                },
            },
            ["the rookery"] = {
                name = "The Rookery",
                source = "seed",
                confidence = "high",
                tags = { "war-within", "dungeon", "primary" },
                factions = {
                    { factionID = 2594, weight = 350 },
                },
            },
            ["city of threads"] = {
                name = "City of Threads",
                source = "seed",
                confidence = "high",
                tags = { "war-within", "dungeon", "primary" },
                factions = {
                    { factionID = 2600, weight = 350 },
                },
            },
            ["cinderbrew meadery"] = {
                name = "Cinderbrew Meadery",
                source = "seed",
                confidence = "medium",
                tags = { "war-within", "dungeon" },
                factions = {
                    { factionID = 2590, weight = 340 },
                },
            },
            ["darkflame cleft"] = {
                name = "Darkflame Cleft",
                source = "seed",
                confidence = "medium",
                tags = { "war-within", "dungeon" },
                factions = {
                    { factionID = 2594, weight = 340 },
                },
            },
            ["the stonevault"] = {
                name = "The Stonevault",
                source = "seed",
                confidence = "medium",
                tags = { "war-within", "dungeon" },
                factions = {
                    { factionID = 2594, weight = 345 },
                },
            },
            ["ara kara city of echoes"] = {
                name = "Ara-Kara, City of Echoes",
                source = "seed",
                confidence = "medium",
                aliases = { "ara-kara, city of echoes", "ara-kara city of echoes" },
                tags = { "war-within", "dungeon" },
                factions = {
                    { factionID = 2600, weight = 345 },
                },
            },
            ["operation floodgate"] = {
                name = "Operation: Floodgate",
                source = "seed",
                confidence = "medium",
                tags = { "war-within", "dungeon" },
                factions = {
                    { factionID = 2653, weight = 345 },
                },
            },
            ["the dawnbreaker"] = {
                name = "The Dawnbreaker",
                source = "seed",
                confidence = "high",
                tags = { "war-within", "dungeon", "primary" },
                factions = {
                    { factionID = 2570, weight = 350 },
                },
            },
        },
        raids = {
            ["nerubar palace"] = {
                name = "Nerub-ar Palace",
                source = "seed",
                confidence = "high",
                tags = { "war-within", "raid", "primary" },
                factions = {
                    { factionID = 2600, weight = 400 },
                },
            },
            ["liberation of undermine"] = {
                name = "Liberation of Undermine",
                source = "seed",
                confidence = "high",
                tags = { "war-within", "raid", "primary" },
                factions = {
                    { factionID = 2653, weight = 400 },
                },
            },
        },
    },
})
