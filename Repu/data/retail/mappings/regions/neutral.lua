local _, ns = ...

ns.Data:RegisterRetailModule({
    locations = {
        zones = {
            [407] = {
                name = "Dunkelmond-Insel",
                source = "curated",
                confidence = "medium",
                notes = "Neutral event island for the Darkmoon Faire reputation.",
                mapIDs = { 407 },
                tags = { "zone", "local", "neutral" },
                factionIDs = { 909 },
                weight = 245,
            },
        },
        subZones = {
            ["407:dunkelmond-insel"] = {
                name = "Dunkelmond-Insel",
                parentMapID = 407,
                source = "curated",
                confidence = "medium",
                notes = "Neutral event island hub for the Darkmoon Faire reputation.",
                mapIDs = { 407 },
                tags = { "primary", "hub", "local", "neutral" },
                factions = {
                    { factionID = 909, weight = 260 },
                },
            },
        },
    },
})
