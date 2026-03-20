local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2710] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        title = "Saltherils Soiree",
                        x = 0.426,
                        y = 0.472,
                    },
                    title = "Saltherils Soiree",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Magister",
                    location = {
                        mapID = 2395,
                        title = "Lehrling Diell",
                        x = 0.434,
                        y = 0.474,
                    },
                    name = "Lehrling Diell",
                },
                {
                    label = "Blood Knight",
                    location = {
                        mapID = 2395,
                        title = "Armorsmith Goldcrest",
                        x = 0.434,
                        y = 0.474,
                    },
                    name = "Armorsmith Goldcrest",
                },
                {
                    label = "Lane Warden",
                    location = {
                        mapID = 2395,
                        title = "Neriv",
                        x = 0.434,
                        y = 0.476,
                    },
                    name = "Neriv",
                },
                {
                    label = "Wayfarer",
                    location = {
                        mapID = 2395,
                        title = "Ranger Allorn",
                        x = 0.434,
                        y = 0.476,
                    },
                    name = "Ranger Allorn",
                },
            },
            source = "seed",
            summary = "Through elegance, intellect, and political precision, the Court ensures that Silvermoon City's light shines eternally radiant, and distinctly its own.",
        },
        [2711] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        title = "Saltherils Soiree",
                        x = 0.426,
                        y = 0.472,
                    },
                    title = "Saltherils Soiree",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2395,
                        title = "Lehrling Diell",
                        x = 0.434,
                        y = 0.474,
                    },
                    name = "Lehrling Diell",
                },
            },
            source = "seed",
            summary = "Scholars, arcanists, and politicians of Silvermoon City, with intellects sharpened by hundreds of years of study.",
        },
        [2712] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        title = "Saltherils Soiree",
                        x = 0.426,
                        y = 0.472,
                    },
                    title = "Saltherils Soiree",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2395,
                        title = "Armorsmith Goldcrest",
                        x = 0.434,
                        y = 0.474,
                    },
                    name = "Armorsmith Goldcrest",
                },
            },
            source = "seed",
            summary = "Silvermoon City's elves-at-arms. Stalwart heroes and chosen champions of the sun, they follow Lady Liadrin into battle to smite the foes of the Sin'dorei.",
        },
        [2713] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        title = "Saltherils Soiree",
                        x = 0.426,
                        y = 0.472,
                    },
                    title = "Saltherils Soiree",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2395,
                        title = "Ranger Allorn",
                        x = 0.434,
                        y = 0.476,
                    },
                    name = "Ranger Allorn",
                },
            },
            source = "seed",
            summary = "Elite rangers of the Sin'dorei, formally tasked with guarding the forests, borders, and wildlands of the Eversong Woods.",
        },
        [2714] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        title = "Saltherils Soiree",
                        x = 0.426,
                        y = 0.472,
                    },
                    title = "Saltherils Soiree",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2395,
                        title = "Neriv",
                        x = 0.434,
                        y = 0.476,
                    },
                    name = "Neriv",
                },
            },
            source = "seed",
            summary = "12.0 Z1 Eversong - Court Friendship Faction",
        },
    },
})
