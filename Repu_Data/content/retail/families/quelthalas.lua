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
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.426,
                        y = 0.472,
                    },
                    titleKey = "activity.saltherils_soiree.title",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    labelKey = "faction.2710.quartermaster.magisters.label",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.apprentice_diell.name",
                        x = 0.434,
                        y = 0.474,
                    },
                    nameKey = "npc.apprentice_diell.name",
                },
                {
                    labelKey = "faction.2710.quartermaster.blood_knights.label",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.armorsmith_goldcrest.name",
                        x = 0.434,
                        y = 0.474,
                    },
                    nameKey = "npc.armorsmith_goldcrest.name",
                },
                {
                    labelKey = "faction.2710.quartermaster.lane_warden.label",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.neriv.name",
                        x = 0.434,
                        y = 0.476,
                    },
                    nameKey = "npc.neriv.name",
                },
                {
                    labelKey = "faction.2710.quartermaster.wayfarer.label",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.ranger_allorn.name",
                        x = 0.434,
                        y = 0.476,
                    },
                    nameKey = "npc.ranger_allorn.name",
                },
            },
            source = "seed",
            summaryKey = "faction.2710.summary",
            summary = "Through elegance, intellect, and political precision, the Court ensures that Silvermoon City's light shines eternally radiant, and distinctly its own.",
        },
        [2711] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.426,
                        y = 0.472,
                    },
                    titleKey = "activity.saltherils_soiree.title",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    labelKey = "common.quartermaster",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.apprentice_diell.name",
                        x = 0.434,
                        y = 0.474,
                    },
                    nameKey = "npc.apprentice_diell.name",
                },
            },
            source = "seed",
            summaryKey = "faction.2711.summary",
            summary = "Scholars, arcanists, and politicians of Silvermoon City, with intellects sharpened by hundreds of years of study.",
        },
        [2712] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.426,
                        y = 0.472,
                    },
                    titleKey = "activity.saltherils_soiree.title",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    labelKey = "common.quartermaster",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.armorsmith_goldcrest.name",
                        x = 0.434,
                        y = 0.474,
                    },
                    nameKey = "npc.armorsmith_goldcrest.name",
                },
            },
            source = "seed",
            summaryKey = "faction.2712.summary",
            summary = "Silvermoon City's elves-at-arms. Stalwart heroes and chosen champions of the sun, they follow Lady Liadrin into battle to smite the foes of the Sin'dorei.",
        },
        [2713] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.426,
                        y = 0.472,
                    },
                    titleKey = "activity.saltherils_soiree.title",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    labelKey = "common.quartermaster",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.ranger_allorn.name",
                        x = 0.434,
                        y = 0.476,
                    },
                    nameKey = "npc.ranger_allorn.name",
                },
            },
            source = "seed",
            summaryKey = "faction.2713.summary",
            summary = "Elite rangers of the Sin'dorei, formally tasked with guarding the forests, borders, and wildlands of the Eversong Woods.",
        },
        [2714] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.426,
                        y = 0.472,
                    },
                    titleKey = "activity.saltherils_soiree.title",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    labelKey = "common.quartermaster",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.neriv.name",
                        x = 0.434,
                        y = 0.476,
                    },
                    nameKey = "npc.neriv.name",
                },
            },
            source = "seed",
            summaryKey = "faction.2714.summary",
            summary = "12.0 Z1 Eversong - Court Friendship Faction",
        },
    },
})
