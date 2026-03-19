local _, ns = ...

ns.Data:RegisterFlavorData("classic", {
    map = {
        zone = {
            ["durotar"] = {
                { factionID = 76, weight = 245, tags = { "local" } },
                { factionID = 530, weight = 240, tags = { "local" } },
            },
            ["mulgore"] = {
                { factionID = 81, weight = 245, tags = { "local" } },
            },
            ["tirisfal glades"] = {
                { factionID = 68, weight = 245, tags = { "local" } },
            },
            ["dun morogh"] = {
                { factionID = 47, weight = 245, tags = { "local" } },
            },
            ["elwynn forest"] = {
                { factionID = 72, weight = 245, tags = { "local" } },
            },
            ["moonglade"] = {
                { factionID = 609, weight = 250, tags = { "primary", "local" } },
            },
            ["stranglethorn vale"] = {
                { factionID = 21, note = "Booty Bay", weight = 250, tags = { "local" } },
            },
            ["ashenvale"] = {
                { factionID = 470, note = "Ratchet supply overlap", weight = 240, tags = { "local" } },
            },
            ["felwood"] = {
                { factionID = 576, weight = 250, tags = { "primary", "local" } },
            },
            ["winterspring"] = {
                { factionID = 589, weight = 250, tags = { "primary", "local" } },
            },
            ["silithus"] = {
                { factionID = 609, weight = 250, tags = { "primary", "local" } },
            },
        },
        subZone = {},
        instance = {
            ["wailing caverns"] = {
                { factionID = 81, weight = 345, tags = { "dungeon" } },
            },
            ["blackfathom deeps"] = {
                { factionID = 69, weight = 340, tags = { "dungeon" } },
            },
            ["blackrock depths"] = {
                { factionID = 59, weight = 350, tags = { "primary", "dungeon" } },
            },
            ["stratholme"] = {
                { factionID = 87, weight = 350, tags = { "primary", "dungeon" } },
            },
            ["dire maul"] = {
                { factionID = 576, weight = 340, tags = { "dungeon" } },
            },
            ["scholomance"] = {
                { factionID = 21, weight = 330, note = "Goblin fallback trade tie", tags = { "dungeon" } },
            },
        },
        raid = {
            ["molten core"] = {
                { factionID = 749, weight = 400, tags = { "primary", "raid" } },
            },
            ["ruins of ahn qiraj"] = {
                { factionID = 809, weight = 400, tags = { "primary", "raid" } },
            },
            ["temple of ahn qiraj"] = {
                { factionID = 809, weight = 400, tags = { "primary", "raid" } },
            },
            ["blackwing lair"] = {
                { factionID = 59, weight = 385, tags = { "raid" } },
            },
            ["naxxramas"] = {
                { factionID = 529, weight = 380, tags = { "raid" } },
            },
        },
    },
})
