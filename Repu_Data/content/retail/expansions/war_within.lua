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
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
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
                    title = "Story and side chapters in Gandargaz",
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
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
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
                    title = "Weeklyer Pakt",
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
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
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
                    title = "Pakt der Weberin",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
                    title = "Pakt des Generals",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
                    title = "Pakt des Wesirs",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
                    title = "Weeklye Kartellwahl",
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
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
