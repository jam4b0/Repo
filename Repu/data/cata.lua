local _, ns = ...

ns.Data:RegisterFlavorData("cata", {
    map = {
        zone = {
            ["mount hyjal"] = {
                { factionID = 1158, weight = 250, tags = { "primary", "local" } },
            },
            ["tol barad peninsula"] = {
                { factionID = 1177, weight = 250, tags = { "primary", "local" } },
            },
            ["deepholm"] = {
                { factionID = 1171, weight = 250, tags = { "local" } },
            },
            ["uldum"] = {
                { factionID = 1173, weight = 250, tags = { "local" } },
            },
            ["twilight highlands"] = {
                { factionID = 1172, weight = 248, tags = { "local" } },
            },
            ["vashjir"] = {
                { factionID = 1171, weight = 245, tags = { "local" } },
            },
        },
        subZone = {
            ["nordrassil"] = {
                { factionID = 1158, weight = 255, tags = { "primary", "local" } },
            },
            ["ramkahen"] = {
                { factionID = 1173, weight = 255, tags = { "primary", "local" } },
            },
            ["temple of earth"] = {
                { factionID = 1171, weight = 255, tags = { "primary", "local" } },
            },
        },
        instance = {
            ["throne of the tides"] = {
                { factionID = 1171, weight = 350, tags = { "primary", "dungeon" } },
            },
            ["lost city of the tol vir"] = {
                { factionID = 1173, weight = 350, tags = { "dungeon" } },
            },
            ["grim batol"] = {
                { factionID = 1172, weight = 350, tags = { "dungeon" } },
            },
            ["the vortex pinnacle"] = {
                { factionID = 1204, weight = 348, tags = { "dungeon" } },
            },
        },
        raid = {
            ["firelands"] = {
                { factionID = 1204, weight = 400, tags = { "primary", "raid" } },
            },
            ["the bastion of twilight"] = {
                { factionID = 1172, weight = 380, tags = { "raid" } },
            },
            ["throne of the four winds"] = {
                { factionID = 1204, weight = 382, tags = { "raid" } },
            },
        },
    },
})
