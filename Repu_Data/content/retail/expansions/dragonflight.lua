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
            summary = "Chronormu (Chromie for short) has always been one of the more active, approachable bronze dragons. Strengthening your bond with her will increase her power in the Deaths of Chromie scenario.",
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
            summary = "Centaur clans roam the Ohn'ahran Plains, where they follow the call of the wind and seek the thrill of the hunt.",
        },
        [2507] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        title = "The Waking Shores",
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
            summary = "A joint expedition of the Explorers' League and Reliquary, this fearless group of adventurers, scholars, and crafters seek to uncover the many mysteries of the Dragon Isles.",
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
            summary = "Centered in their most ancient city, the Valdrakken Accord is the unified might of all dragonkind, seeking to protect not only their island home but all of Azeroth.",
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
            summary = "The Iskaara Tuskarr have been on the Dragon Isles for generations, living in harmony and telling tales of the world around them.",
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
            summary = "Long focused on protecting Azeroth, Wrathion's gaze has now turned to the future of the black dragonflight... and his destiny.",
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
            summary = "Sabellian has established a new generation of uncorrupt black dragons, and works to protect it at all costs.",
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
            summary = "Led by the brave Scalecommander Cindrethresh, the Dark Talons were trained to be the secret weapon of the black dragonflight. Today, these dracthyr use their skills to turn the tide of any battle regardless of how outnumbered they are.",
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
            summary = "Led by the stalwart Scalecommander Azurathel, the Obsidian Warders were trained to be the shield of the black dragonflight. Today these dracthyr use those skills to defend those most in need against overwhelming odds.",
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
            summary = "The Winterpelt Furbolg speak a language no one seems to understand. Perhaps more will be revealed in the future.",
        },
        [2544] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 2112,
                        title = "Valdrakken",
                        x = 0.360,
                        y = 0.632,
                    },
                    title = "Artisan's Market",
                },
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2112,
                        title = "Valdrakken",
                        x = 0.360,
                        y = 0.632,
                    },
                    title = "Profession weeklies in Valdrakken",
                },
                {
                    kind = "Crafting",
                    location = {
                        mapID = 2112,
                        title = "Valdrakken",
                        x = 0.360,
                        y = 0.632,
                    },
                    title = "Crafting Orders and profession progression",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2112,
                        title = "Artisan's Market",
                        x = 0.360,
                        y = 0.632,
                    },
                    name = "Rabul",
                },
            },
            source = "curated",
            summarySource = "curated",
            summary = "The Dragon Isles branch of the Artisan's Consortium brings crafters, gatherers, and traders together in Valdrakken's Artisan's Market. Most of its reputation comes from profession work, weekly tasks, and the broader crafting order ecosystem.",
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
            summary = "The Cobalt Assembly was once a place where blue dragons would conjure marvelous creations with arcane magic. Now it has fallen into the hands of the Sundered Flame who intend to use its magic for war.",
        },
        [2553] = {
            activities = {
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold Reservoir",
                        x = 0.612,
                        y = 0.320,
                    },
                    title = "When Time Needs Mending",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2025,
                        title = "Thaldraszus",
                    },
                    title = "Time Rifts and temporal anomalies",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold Reservoir",
                        x = 0.612,
                        y = 0.320,
                    },
                    name = "Soridormi",
                },
            },
            source = "curated",
            summary = "Soridormi's timewalkers travel the timeways and defend our world against limitless alternatives. When our timeline is under temporal assault or falling apart, Soridormi is the commander who holds everything together.",
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
            summary = "Underneath the Dragon Isles, deep in Zaralek Cavern, lies the niffen town of Loamm. The friendly traders there are renowned for their hospitality, sense of smell, and peculiar bartering trade system.",
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
            summary = "A coalition of various races ready to defend the Emerald Dream against any and all threats.",
        },
        [2615] = {
            activities = {
                {
                    kind = "Recurring",
                    location = {
                        mapID = 2025,
                        title = "Azerothian Archives",
                        x = 0.571,
                        y = 0.664,
                    },
                    title = "Azerothian Archives",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2025,
                        title = "Tyrhold",
                        x = 0.571,
                        y = 0.664,
                    },
                    title = "Archive activities in Tyrhold",
                },
                {
                    kind = "Weekly",
                    location = {
                        mapID = 2025,
                        title = "Azerothian Archives",
                        x = 0.571,
                        y = 0.664,
                    },
                    title = "Cataloging and archive weeklies",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 2025,
                        title = "Azerothian Archives",
                        x = 0.571,
                        y = 0.664,
                    },
                    name = "Provisioner Aristta",
                },
            },
            source = "curated",
            summary = "A charter group of scholars from the Dragonscale Expedition dedicated to the preservation of the antiquities for future generations.",
        },
    },
})
