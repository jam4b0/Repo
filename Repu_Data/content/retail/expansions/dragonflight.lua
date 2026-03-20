local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2135] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold Reservoir",
                    },
                    title = "Time Rifts",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold",
                    },
                    title = "Temporal side activities",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2503] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2023,
                        title = "Ohn'ahran Plains",
                    },
                    title = "Grand Hunt",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2023,
                        title = "Ohn'ahran Plains",
                    },
                    title = "Ohn'ahran Plains",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 2023,
                        title = "Maruukai",
                    },
                    title = "Maruukai",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2023,
                        title = "Maruukai",
                    },
                    name = "Quartermaster Huseng",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2507] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2022,
                        title = "The Waking Shores",
                    },
                    title = "Siege on Dragonbane Keep",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2022,
                        title = "The Waking Shores",
                    },
                    title = "The Waking Shores",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2151,
                        title = "The Forbidden Reach",
                    },
                    title = "Forbidden Reach",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 2022,
                        title = "Dragonscale Basecamp",
                    },
                    title = "Dragonscale Basecamp",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2022,
                        title = "Dragonscale Basecamp",
                    },
                    name = "Cataloger Jakes",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2510] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 2112,
                        title = "Valdrakken",
                    },
                    title = "Valdrakken",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2025,
                        title = "Thaldraszus",
                    },
                    title = "Thaldraszus",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2112,
                        title = "Seat of the Aspects",
                    },
                    title = "Story and world quests",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2112,
                        title = "Seat of the Aspects",
                    },
                    name = "Unatos",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2511] = {
            activities = {
                {
                    kind = "Weekly/Event",
                    location = {
                        mapID = 2024,
                        title = "Iskaara",
                    },
                    title = "Community Feast",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2024,
                        title = "The Azure Span",
                    },
                    title = "The Azure Span",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 2024,
                        title = "Iskaara",
                    },
                    title = "Iskaara",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2024,
                        title = "Iskaara",
                    },
                    name = "Murik",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2517] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "The Waking Shores",
                    },
                    title = "Waking Shores black dragonflight content",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2518] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "The Waking Shores",
                    },
                    title = "Waking Shores black dragonflight content",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2523] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        title = "The Waking Shores",
                    },
                    title = "Obsidian side content",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2524] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        title = "The Waking Shores",
                    },
                    title = "Obsidian side content",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2526] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "The Azure Span",
                    },
                    title = "Azure Span side quests",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2544] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        title = "Valdrakken",
                    },
                    title = "Valdrakken professions hub",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2550] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "The Azure Span",
                    },
                    title = "Azure Span side content",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2553] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold Reservoir",
                    },
                    title = "When Time Needs Mending",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold Reservoir",
                    },
                    title = "Time Rifts",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Rift Vendor",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold Reservoir",
                    },
                    name = "Soridormi",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2564] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 2133,
                        title = "Loamm",
                    },
                    title = "Loamm",
                },
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2133,
                        title = "Zaralek Cavern",
                    },
                    title = "Sniffenseeking",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2133,
                        title = "Zaralek Cavern",
                    },
                    title = "Zaralek world content",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2133,
                        title = "Loamm",
                        x = 0.56,
                        y = 0.556,
                    },
                    name = "Mimuup",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2574] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 2151,
                        title = "Central Encampment",
                    },
                    title = "Central Encampment",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2151,
                        title = "Emerald Dream",
                    },
                    title = "Emerald Dream world content",
                },
                {
                    kind = "Story",
                    location = {
                        mapID = 2151,
                        title = "Emerald Dream",
                    },
                    title = "Story chapters in the Dream",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2151,
                        title = "Central Encampment",
                        x = 0.5,
                        y = 0.62,
                    },
                    name = "Pipsee",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2615] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold Reservoir",
                    },
                    title = "Azerothian Archives",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold",
                    },
                    title = "Archivaktivitäten in Tyrhold",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
