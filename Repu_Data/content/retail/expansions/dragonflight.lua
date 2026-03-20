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
                        title = "Thaldraszus",
                    },
                    title = "Time Rifts",
                },
                {
                    kind = "Zone",
                    location = {
                        title = "Tyrhold",
                    },
                    title = "Temporal side activities",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Time Rifts and Temporal side activities.",
        },
        [2503] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        title = "Ohn'ahran Plains",
                    },
                    title = "Grand Hunt",
                },
                {
                    kind = "Zone",
                    location = {
                        title = "Maruukai",
                    },
                    title = "Ohn'ahran Plains",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Grand Hunt, Ohn'ahran Plains, and Maruukai.",
        },
        [2507] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        title = "Kueste des Erwachens",
                    },
                    title = "Siege on Dragonbane Keep",
                },
                {
                    kind = "Zone",
                    location = {
                        title = "Forbidden Reach",
                    },
                    title = "The Waking Shores",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Siege on Dragonbane Keep, The Waking Shores, and Forbidden Reach.",
        },
        [2510] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        title = "Valdrakken",
                    },
                    title = "Valdrakken",
                },
                {
                    kind = "Zone",
                    location = {
                        title = "Thaldraszus",
                    },
                    title = "Thaldraszus",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Valdrakken, Thaldraszus, and Story and world quests.",
        },
        [2511] = {
            activities = {
                {
                    kind = "Weekly/Event",
                    location = {
                        title = "The Azure Span",
                    },
                    title = "Community Feast",
                },
                {
                    kind = "Zone",
                    location = {
                        title = "Iskaara",
                    },
                    title = "The Azure Span",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Community Feast, The Azure Span, and Iskaara.",
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
            summary = "Retail content for this faction is centered on Waking Shores black dragonflight content.",
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
            summary = "Retail content for this faction is centered on Waking Shores black dragonflight content.",
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
            summary = "Retail content for this faction is centered on Obsidian side content.",
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
            summary = "Retail content for this faction is centered on Obsidian side content.",
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
            summary = "Retail content for this faction is centered on Azure Span side quests.",
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
            summary = "Retail content for this faction is centered on Valdrakken professions hub.",
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
            summary = "Retail content for this faction is centered on Azure Span side content.",
        },
        [2553] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        title = "Thaldraszus",
                    },
                    title = "When Time Needs Mending",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on When Time Needs Mending and Time Rifts.",
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
            summary = "Retail content for this faction is centered on Loamm, Sniffenseeking, and Zaralek world content.",
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
            summary = "Retail content for this faction is centered on Central Encampment, Emerald Dream world content, and Story chapters in the Dream.",
        },
        [2615] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        title = "Thaldraszus",
                    },
                    title = "Azerothian Archives",
                },
                {
                    kind = "Zone",
                    location = {
                        title = "Tyrhold",
                    },
                    title = "Archive activities in Tyrhold",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Azerothian Archives and Archive activities in Tyrhold.",
        },
    },
})
