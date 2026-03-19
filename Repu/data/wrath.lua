local _, ns = ...

ns.Data:RegisterFlavorData("wrath", {
    map = {
        zone = {
            ["borean tundra"] = {
                { factionID = 1073, weight = 245, tags = { "local" } },
            },
            ["icecrown"] = {
                { factionID = 1119, weight = 250, tags = { "primary", "local" } },
            },
            ["the storm peaks"] = {
                { factionID = 1119, weight = 240, tags = { "local" } },
            },
            ["scholazar basin"] = {
                { factionID = 1104, weight = 250, tags = { "local" } },
            },
            ["dragonblight"] = {
                { factionID = 1091, weight = 250, tags = { "local" } },
            },
            ["dalaran"] = {
                { factionID = 1090, weight = 250, tags = { "primary", "local" } },
            },
            ["howling fjord"] = {
                { factionID = 1068, weight = 240, tags = { "local" } },
            },
        },
        subZone = {
            ["the violet citadel"] = {
                { factionID = 1090, weight = 255, tags = { "primary", "local" } },
            },
            ["argent vanguard"] = {
                { factionID = 1106, weight = 255, tags = { "primary", "local" } },
            },
            ["k3"] = {
                { factionID = 1119, weight = 252, tags = { "local" } },
            },
        },
        instance = {
            ["utgarde pinnacle"] = {
                { factionID = 1090, weight = 350, tags = { "primary", "dungeon" } },
            },
            ["the nexus"] = {
                { factionID = 1098, weight = 340, tags = { "dungeon" } },
            },
            ["ahn kahet the old kingdom"] = {
                { factionID = 1106, weight = 342, tags = { "dungeon" } },
            },
            ["trial of the champion"] = {
                { factionID = 1090, weight = 340, tags = { "dungeon" } },
            },
            ["gundrak"] = {
                { factionID = 1105, weight = 340, tags = { "dungeon" } },
            },
        },
        raid = {
            ["icecrown citadel"] = {
                { factionID = 1156, weight = 400, tags = { "primary", "raid" } },
            },
            ["ulduar"] = {
                { factionID = 1098, weight = 380, tags = { "raid" } },
            },
            ["trial of the crusader"] = {
                { factionID = 1106, weight = 382, tags = { "raid" } },
            },
        },
    },
})
