local _, ns = ...

ns.Data:RegisterRetailModule({
    locations = {
        zones = {
            [198] = {
                name = "Der Hyjal",
                source = "seed",
                confidence = "high",
                notes = "Cataclysm zone cluster",
                mapIDs = { 198 },
                tags = { "zone", "local", "cataclysm" },
                factionIDs = { 1158 },
                weight = 248,
            },
            [203] = {
                name = "Vashj'ir",
                source = "seed",
                confidence = "medium",
                notes = "Cataclysm zone cluster",
                mapIDs = { 203, 204, 205 },
                tags = { "zone", "local", "cataclysm" },
                factionIDs = { 1171 },
                weight = 244,
            },
            [207] = {
                name = "Tiefenheim",
                source = "seed",
                confidence = "high",
                notes = "Cataclysm zone cluster",
                mapIDs = { 207 },
                tags = { "zone", "local", "cataclysm" },
                factionIDs = { 1171 },
                weight = 250,
            },
            [241] = {
                name = "Schattenhochland",
                source = "seed",
                confidence = "high",
                notes = "Cataclysm zone cluster",
                mapIDs = { 241 },
                tags = { "zone", "local", "cataclysm" },
                factionIDs = { 1172 },
                weight = 248,
            },
            [245] = {
                name = "Halbinsel von Tol Barad",
                source = "seed",
                confidence = "high",
                notes = "Cataclysm zone cluster",
                mapIDs = { 245 },
                tags = { "zone", "local", "cataclysm" },
                factions = {
                    { factionID = 1177, factionGroups = { "Alliance" }, weight = 248 },
                    { factionID = 1178, factionGroups = { "Horde" }, weight = 248 },
                },
                weight = 248,
            },
            [249] = {
                name = "Uldum",
                source = "seed",
                confidence = "high",
                notes = "Cataclysm zone cluster",
                mapIDs = { 249, 1527 },
                tags = { "zone", "local", "cataclysm" },
                factionIDs = { 1173 },
                weight = 248,
            },
        },
        subZones = {
            ["198:nordrassil"] = {
                name = "Nordrassil",
                parentMapID = 198,
                source = "seed",
                confidence = "high",
                notes = "Cataclysm primary hub cluster",
                mapIDs = { 198 },
                tags = { "primary", "hub", "local", "cataclysm" },
                factions = {
                    { factionID = 1158, weight = 255 },
                },
            },
            ["207:tempel der erde"] = {
                name = "Tempel der Erde",
                parentMapID = 207,
                source = "seed",
                confidence = "high",
                notes = "Deepholm primary hub cluster",
                mapIDs = { 207 },
                tags = { "primary", "hub", "local", "cataclysm" },
                factions = {
                    { factionID = 1171, weight = 258 },
                },
            },
            ["249:ramkahen"] = {
                name = "Ramkahen",
                parentMapID = 249,
                source = "seed",
                confidence = "high",
                notes = "Uldum primary hub cluster",
                mapIDs = { 249, 1527 },
                tags = { "primary", "hub", "local", "cataclysm" },
                factions = {
                    { factionID = 1173, weight = 258 },
                },
            },
        },
        instances = {
            ["throne of the tides"] = {
                name = "Throne of the Tides",
                source = "seed",
                confidence = "medium",
                tags = { "dungeon", "cataclysm", "local" },
                factions = {
                    { factionID = 1171, weight = 345 },
                },
            },
            ["lost city of the tol'vir"] = {
                name = "Lost City of the Tol'vir",
                source = "seed",
                confidence = "medium",
                tags = { "dungeon", "cataclysm", "local" },
                factions = {
                    { factionID = 1173, weight = 345 },
                },
            },
            ["grim batol"] = {
                name = "Grim Batol",
                source = "seed",
                confidence = "medium",
                tags = { "dungeon", "cataclysm", "local" },
                factions = {
                    { factionID = 1172, weight = 345 },
                },
            },
        },
        raids = {
            ["firelands"] = {
                name = "Firelands",
                source = "seed",
                confidence = "medium",
                tags = { "raid", "cataclysm", "local" },
                factions = {
                    { factionID = 1158, weight = 382 },
                },
            },
            ["the bastion of twilight"] = {
                name = "The Bastion of Twilight",
                source = "seed",
                confidence = "medium",
                tags = { "raid", "cataclysm", "local" },
                factions = {
                    { factionID = 1172, weight = 380 },
                },
            },
        },
    },
})
