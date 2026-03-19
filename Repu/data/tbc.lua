local _, ns = ...

ns.Data:RegisterFlavorData("tbc", {
    map = {
        zone = {
            ["hellfire peninsula"] = {
                { factionID = 946, weight = 250, tags = { "primary", "local" } },
            },
            ["zangarmarsh"] = {
                { factionID = 942, weight = 250, tags = { "primary", "local" } },
            },
            ["shadowmoon valley"] = {
                { factionID = 1012, weight = 250, tags = { "primary", "local" } },
            },
            ["netherstorm"] = {
                { factionID = 933, weight = 250, tags = { "local" } },
            },
            ["nagrand"] = {
                { factionID = 941, weight = 250, tags = { "local" } },
            },
            ["terokkar forest"] = {
                { factionID = 1011, weight = 245, tags = { "local" } },
                { factionID = 935, weight = 240, tags = { "local" } },
            },
            ["shattrath city"] = {
                { factionID = 935, weight = 245, tags = { "local" } },
                { factionID = 932, weight = 240, tags = { "local" } },
                { factionID = 934, weight = 240, tags = { "local" } },
                { factionID = 1011, weight = 245, tags = { "local" } },
            },
        },
        subZone = {
            ["terrace of light"] = {
                { factionID = 935, weight = 255, tags = { "primary", "local" } },
                { factionID = 932, weight = 248, tags = { "local" } },
                { factionID = 934, weight = 248, tags = { "local" } },
            },
            ["lower city"] = {
                { factionID = 1011, weight = 260, tags = { "primary", "local" } },
            },
            ["area 52"] = {
                { factionID = 933, weight = 255, tags = { "primary", "local" } },
            },
        },
        instance = {
            ["hellfire ramparts"] = {
                { factionID = 946, weight = 350, tags = { "dungeon" } },
            },
            ["the blood furnace"] = {
                { factionID = 946, weight = 352, tags = { "dungeon" } },
            },
            ["the steamvault"] = {
                { factionID = 942, weight = 350, tags = { "primary", "dungeon" } },
            },
            ["the shattered halls"] = {
                { factionID = 946, weight = 350, tags = { "dungeon" } },
            },
            ["shadow labyrinth"] = {
                { factionID = 1011, weight = 350, tags = { "dungeon" } },
            },
            ["the mechanar"] = {
                { factionID = 935, weight = 350, tags = { "dungeon" } },
            },
        },
        raid = {
            ["karazhan"] = {
                { factionID = 967, weight = 390, tags = { "raid" } },
            },
            ["the black temple"] = {
                { factionID = 1012, weight = 400, tags = { "primary", "raid" } },
            },
            ["hyjal summit"] = {
                { factionID = 990, weight = 390, tags = { "raid" } },
            },
            ["sunwell plateau"] = {
                { factionID = 1077, weight = 395, tags = { "raid" } },
            },
        },
    },
})
