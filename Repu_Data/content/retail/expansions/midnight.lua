local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2696] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 2437,
                        title = "Zul'Aman",
                    },
                    title = "Zul'Aman campaign",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2437,
                        title = "Zul'Aman",
                    },
                    title = "Amani warband and local tasks",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The Amani conquered and claimed the majority of Eastern Kingdoms for thousands of years, but were forced back into current-day Zul'Aman once the elves and humans colonized the land themselves.",
        },
        [2699] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 2405,
                        title = "Voidstorm",
                    },
                    title = "Voidstorm campaign",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2405,
                        title = "Voidstorm",
                    },
                    title = "Voidstorm local operations",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "In the vortex of terror and violence that is the Voidstorm, few have the mettle to survive. The Singularity, gathered by Magister Umbric and the ren'dorei, encompasses any who would brave this fearsome land to stand up to Xal'atath.",
        },
        [2704] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 2413,
                        title = "Harandar",
                    },
                    title = "Harandar campaign",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2413,
                        title = "Harandar",
                    },
                    title = "Harandar local operations",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Called to Harandar by the echo of their Goddess' song, the Hara'ti watch over her cradle in hopes that she may one day return.",
        },
        [2710] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.4346,
                        y = 0.4742,
                    },
                    questgiverLocation = {
                        mapID = 2393,
                        titleKey = "npc.magistrix_bluflamme.name",
                        x = 0.4346,
                        y = 0.4742,
                    },
                    questgiverNameKey = "npc.magistrix_bluflamme.name",
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
                        x = 0.4352,
                        y = 0.4752,
                    },
                    nameKey = "npc.apprentice_diell.name",
                },
                {
                    labelKey = "faction.2710.quartermaster.blood_knights.label",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.armorsmith_goldcrest.name",
                        x = 0.4354,
                        y = 0.4750,
                    },
                    nameKey = "npc.armorsmith_goldcrest.name",
                },
                {
                    labelKey = "faction.2710.quartermaster.lane_warden.label",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.neriv.name",
                        x = 0.4349,
                        y = 0.4765,
                    },
                    nameKey = "npc.neriv.name",
                },
                {
                    labelKey = "faction.2710.quartermaster.wayfarer.label",
                    location = {
                        mapID = 2395,
                        titleKey = "npc.ranger_allorn.name",
                        x = 0.4345,
                        y = 0.4756,
                    },
                    nameKey = "npc.ranger_allorn.name",
                },
            },
            source = "curated",
            summary = "Through elegance, intellect, and political precision, the Court ensures that Silvermoon City's light shines eternally radiant, and distinctly its own.",
            summaryKey = "faction.2710.summary",
        },
        [2711] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.4346,
                        y = 0.4742,
                    },
                    questgiverLocation = {
                        mapID = 2395,
                        titleKey = "npc.magistrix_bluflamme.name",
                        x = 0.4262,
                        y = 0.4617,
                    },
                    questgiverNameKey = "npc.magistrix_bluflamme.name",
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
                        x = 0.4352,
                        y = 0.4752,
                    },
                    nameKey = "npc.apprentice_diell.name",
                },
            },
            source = "curated",
            summary = "Scholars, arcanists, and politicians of Silvermoon City, with intellects sharpened by hundreds of years of study.",
            summaryKey = "faction.2711.summary",
        },
        [2712] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.4346,
                        y = 0.4742,
                    },
                    questgiverLocation = {
                        mapID = 2395,
                        titleKey = "npc.knight_lord_sunguard.name",
                        x = 0.4240,
                        y = 0.4668,
                    },
                    questgiverNameKey = "npc.knight_lord_sunguard.name",
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
                        x = 0.4354,
                        y = 0.4750,
                    },
                    nameKey = "npc.armorsmith_goldcrest.name",
                },
            },
            source = "curated",
            summary = "Silvermoon City's elves-at-arms. Stalwart heroes and chosen champions of the sun, they follow Lady Liadrin into battle to smite the foes of the Sin'dorei.",
            summaryKey = "faction.2712.summary",
        },
        [2713] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.4346,
                        y = 0.4742,
                    },
                    questgiverLocation = {
                        mapID = 2395,
                        titleKey = "npc.ranger_captain_morningarrow.name",
                        x = 0.4287,
                        y = 0.4641,
                    },
                    questgiverNameKey = "npc.ranger_captain_morningarrow.name",
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
                        x = 0.4345,
                        y = 0.4756,
                    },
                    nameKey = "npc.ranger_allorn.name",
                },
            },
            source = "curated",
            summary = "Elite rangers of the Sin'dorei, formally tasked with guarding the forests, borders, and wildlands of the Eversong Woods.",
            summaryKey = "faction.2713.summary",
        },
        [2714] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2395,
                        titleKey = "activity.saltherils_soiree.title",
                        x = 0.4346,
                        y = 0.4742,
                    },
                    questgiverLocation = {
                        mapID = 2395,
                        titleKey = "npc.neriv.name",
                        x = 0.4349,
                        y = 0.4765,
                    },
                    questgiverNameKey = "npc.neriv.name",
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
                        x = 0.4349,
                        y = 0.4765,
                    },
                    nameKey = "npc.neriv.name",
                },
            },
            source = "curated",
            summary = "The Shades of the Row handle Silvermoon's quiet favors, hidden exchanges, and the informal obligations that keep the city functioning beyond the public eye.",
            summaryKey = "faction.2714.summary",
        },
        [2770] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 2405,
                        title = "Voidstorm",
                    },
                    title = "Voidstorm",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 2405,
                        title = "Obscurus Citadel",
                    },
                    title = "Obscurus Citadel",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Deep within the Voidstorm, the war between Vidious and Ziadan rages on.",
        },
    },
})
