local _, ns = ...

-- Generated from client seed review. This file only upgrades conservative hub coverage;
-- it intentionally does not invent faction mappings.
ns.Data:RegisterRetailModule({
    locations = {
        zones = {},
        subZones = {
            ["933:Äonenschmiede"] = {
                name = "Äonenschmiede",
                source = "seed",
                confidence = "medium",
                notes = "Generated conservative hub coverage from client_seed priority matrix; faction mapping pending.",
                mapIDs = { 933 },
                tags = { "subzone", "coverage-only", "generated-review", "client-seed-reviewed", "Draenor" },
            },
            ["1501:Wappenfall"] = {
                name = "Wappenfall",
                source = "seed",
                confidence = "medium",
                notes = "Generated conservative hub coverage from client_seed priority matrix; faction mapping pending.",
                mapIDs = { 1501 },
                tags = { "subzone", "coverage-only", "generated-review", "client-seed-reviewed", "Kul Tiras" },
            },
            ["871:Der Verlorene Gletscher"] = {
                name = "Der Verlorene Gletscher",
                source = "seed",
                confidence = "medium",
                notes = "Generated conservative hub coverage from client_seed priority matrix; faction mapping pending.",
                mapIDs = { 871 },
                tags = { "subzone", "coverage-only", "generated-review", "client-seed-reviewed", "Nordend" },
            },
            ["1502:Schneeblütendorf"] = {
                name = "Schneeblütendorf",
                source = "seed",
                confidence = "medium",
                notes = "Generated conservative hub coverage from client_seed priority matrix; faction mapping pending.",
                mapIDs = { 1502 },
                tags = { "subzone", "coverage-only", "generated-review", "client-seed-reviewed", "Pandaria" },
            },
        },
        instances = {},
        raids = {},
    },
})
