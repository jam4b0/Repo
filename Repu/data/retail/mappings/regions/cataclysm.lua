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
                factions = {
                    { factionID = 1172, weight = 248 },
                    { factionID = 1174, factionGroups = { "Alliance" }, weight = 236 },
                },
                weight = 248,
            },
            [244] = {
                name = "Tol Barad",
                source = "seed",
                confidence = "high",
                notes = "Faction-specific Cataclysm pvp zone cluster",
                mapIDs = { 244 },
                tags = { "zone", "local", "cataclysm", "pvp" },
                factions = {
                    { factionID = 1177, factionGroups = { "Alliance" }, weight = 248 },
                    { factionID = 1178, factionGroups = { "Horde" }, weight = 248 },
                },
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
                notes = "Cataclysm zone cluster; retail also uses the Black Empire assault world-state on mapID 1527.",
                mapIDs = { 249, 1527 },
                tags = { "zone", "local", "cataclysm", "assault-sensitive" },
                factions = {
                    { factionID = 1173, weight = 248 },
                    { factionID = 2417, weight = 214 },
                },
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
                notes = "Uldum primary hub cluster, shared by the base zone and the later Black Empire assault world-state.",
                mapIDs = { 249, 1527 },
                tags = { "primary", "hub", "local", "cataclysm", "assault-sensitive" },
                factions = {
                    { factionID = 1173, weight = 258 },
                    { factionID = 2417, weight = 220 },
                },
            },
            ["773:tol barad"] = {
                name = "Tol Barad",
                parentMapID = 244,
                source = "seed",
                confidence = "high",
                notes = "Faction-specific Cataclysm pvp zone hub",
                mapIDs = { 773 },
                tags = { "hub", "local", "cataclysm", "pvp" },
                factions = {
                    { factionID = 1177, factionGroups = { "Alliance" }, weight = 255 },
                    { factionID = 1178, factionGroups = { "Horde" }, weight = 255 },
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
