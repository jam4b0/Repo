local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2570] = {
            activities = {
                {
                    kind = "Weekly/Event",
                    location = {
                        mapID = 2215,
                        title = "Mereldar",
                        x = 0.413,
                        y = 0.53,
                    },
                    title = "Spreading the Light",
                },
                {
                    kind = "World quests",
                    location = {
                        mapID = 2215,
                        title = "Hallowfall",
                    },
                    title = "World quests in Hallowfall",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2215,
                        title = "Mereldar",
                        x = 0.413,
                        y = 0.53,
                    },
                    name = "Auralia Steelstrike",
                },
            },
            source = "seed",
            summary = "Retail content for this faction is centered on Spreading the Light and World quests in Hallowfall.",
        },
        [2590] = {
            activities = {
                {
                    kind = "World quests",
                    location = {
                        mapID = 2248,
                        title = "Isle of Dorn",
                    },
                    title = "World quests on the Isle of Dorn",
                },
                {
                    kind = "One-time/Warband",
                    location = {
                        mapID = 2339,
                        title = "Foundation Hall",
                        x = 0.392,
                        y = 0.243,
                    },
                    title = "Story and side chapters in Dornogal",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2339,
                        title = "Foundation Hall",
                        x = 0.392,
                        y = 0.243,
                    },
                    name = "Auditor Balwurz",
                },
            },
            source = "seed",
            summary = "Retail content for this faction is centered on World quests on the Isle of Dorn and Story and side chapters in Dornogal.",
        },
        [2594] = {
            activities = {
                {
                    kind = "World quests",
                    location = {
                        mapID = 2214,
                        title = "The Ringing Deeps",
                    },
                    title = "World quests in The Ringing Deeps",
                },
                {
                    kind = "One-time/Warband",
                    location = {
                        mapID = 2214,
                        title = "Gundargaz",
                        x = 0.432,
                        y = 0.328,
                    },
                    title = "Story and side chapters in Gundargaz",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2214,
                        title = "Gundargaz",
                        x = 0.432,
                        y = 0.328,
                    },
                    name = "Waxmonger Squick",
                },
            },
            source = "seed",
            summary = "Retail content for this faction is centered on World quests in The Ringing Deeps and Story and side chapters in Gundargaz.",
        },
        [2600] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2255,
                        title = "The Weaver's Lair",
                        x = 0.553,
                        y = 0.412,
                    },
                    title = "Weekly pact",
                },
                {
                    kind = "World quests",
                    location = {
                        mapID = 2255,
                        title = "Azj-Kahet",
                    },
                    title = "World quests in Azj-Kahet",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2255,
                        title = "The Weaver's Lair",
                        x = 0.553,
                        y = 0.412,
                    },
                    name = "Y'tekhi",
                },
            },
            source = "seed",
            summary = "Retail content for this faction is centered on Weekly pact and World quests in Azj-Kahet.",
        },
        [2601] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2255,
                        title = "The Weaver's Lair",
                        x = 0.553,
                        y = 0.412,
                    },
                    title = "Pact of the Weaver",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Pact of the Weaver.",
        },
        [2605] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2255,
                        title = "The Weaver's Lair",
                        x = 0.553,
                        y = 0.412,
                    },
                    title = "Pact of the General",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Pact of the General.",
        },
        [2607] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2255,
                        title = "The Weaver's Lair",
                        x = 0.553,
                        y = 0.412,
                    },
                    title = "Pact of the Vizier",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Pact of the Vizier.",
        },
        [2653] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    title = "Weekly cartel contract",
                },
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    title = "C.H.E.T.T.-Liste",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    name = "Smaks Topskimmer",
                },
            },
            source = "seed",
            summary = "Retail content for this faction is centered on Weekly cartel contract and C.H.E.T.T.-Liste.",
        },
        [2658] = {
            activities = {
                {
                    kind = "Story",
                    location = {
                        mapID = 2371,
                        title = "K'aresh",
                    },
                    title = "K'aresh campaign",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2371,
                        title = "K'aresh",
                    },
                    title = "K'aresh world content",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on K'aresh campaign and K'aresh world content.",
        },
        [2671] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    title = "Kartellwahl: Venture Company",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Kartellwahl: Venture Company.",
        },
        [2673] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    title = "Kartellwahl: Bilgewasserkartell",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Kartellwahl: Bilgewasserkartell.",
        },
        [2675] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    title = "Kartellwahl: Schwarzmeer AG",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Kartellwahl: Schwarzmeer AG.",
        },
        [2677] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    title = "Kartellwahl: Dampfdruckkartell",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Kartellwahl: Dampfdruckkartell.",
        },
        [2685] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    title = "Kartellwahl: Garbagio Treueclub",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Kartellwahl: Garbagio Treueclub.",
        },
        [2688] = {
            activities = {
                {
                    kind = "Zone/Event",
                    location = {
                        mapID = 2215,
                        title = "Hallowfall",
                    },
                    title = "Hallowfall defense activities",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2215,
                        title = "Mereldar",
                        x = 0.413,
                        y = 0.53,
                    },
                    title = "Mereldar call to arms",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2215,
                        title = "Mereldar",
                        x = 0.413,
                        y = 0.53,
                    },
                    name = "Raen Dawncavalyr",
                },
            },
            source = "curated",
            summary = "Retail content for this faction is centered on Hallowfall defense activities and Mereldar call to arms.",
        },
        [2736] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2371,
                        title = "K'aresh",
                    },
                    title = "Manaforge sabotage operations",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Manaforge sabotage operations.",
        },
    },
})
