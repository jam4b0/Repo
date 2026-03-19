local _, ns = ...

ns.Data:RegisterFlavorData("mop", {
    map = {
        zone = {
            ["vale of eternal blossoms"] = {
                { factionID = 1269, weight = 250, tags = { "primary", "local" } },
            },
            ["timeless isle"] = {
                { factionID = 1492, weight = 250, tags = { "primary", "local" } },
            },
            ["townlong steppes"] = {
                { factionID = 1270, weight = 250, tags = { "local" } },
            },
            ["krasarang wilds"] = {
                { factionID = 1302, weight = 250, tags = { "local" } },
            },
        },
        subZone = {},
        instance = {
            ["shado-pan monastery"] = {
                { factionID = 1270, weight = 350, tags = { "primary", "dungeon" } },
            },
            ["siege of niuzao temple"] = {
                { factionID = 1271, weight = 340, tags = { "dungeon" } },
            },
            ["temple of the jade serpent"] = {
                { factionID = 1270, weight = 340, tags = { "dungeon" } },
            },
        },
        raid = {
            ["siege of orgrimmar"] = {
                { factionID = 1492, weight = 400, tags = { "primary", "raid" } },
            },
            ["throne of thunder"] = {
                { factionID = 1435, weight = 390, tags = { "raid" } },
            },
        },
    },
})
