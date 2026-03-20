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
            summary = "The Arathi of the Hallowfall Expedition safeguard the star Beledar from the many threats found under Khaz Algar. Cut off from their overseas empire, they have built a new home with the strength of their faith in the Sacred Flame.",
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
            summary = "Ruling from the Foundation Hall under the leadership of Councilward Merrix, the Council of Dornogal makes decisions affecting all earthen in the Isle of Dorn.",
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
            summary = "Throughout the Ringing Deeps, neglected machinery awaits repair. While Machine Speakers lend their technological acumen, kobolds scavenge parts left behind. Anyone wanting to explore and rebuild is welcome to help.",
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
            summary = "Queen Ansurek's tumultuous reign has not been without its detractors. The Severed Threads work cleverly and quietly behind the scenes to unravel the tapestry of Ansurek's iron rule from within.",
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
            summary = "Once the Royal Weaver, the Widow Arak'nai now carefully watches her former home with a critical eye. With a network of weave-rats and spies at her disposal, there is little that escapes her notice.",
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
            summary = "Once the most renowned military leader in Azj-Kahet, Anub'azal has been passed over in favor of one of Ansurek's beloved Ascended. This simply will not stand.",
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
            summary = "Perched in the most dangerous position of all, Executor Nizrek spends his days as Queen Ansurek's most loyal advisor. Fortunately, Ansurek has yet to discover that the rest of his time is spent trying to end her reign.",
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
                    title = "C.H.E.T.T. List",
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
            summary = "Undermine isn't like other towns. There are no kings or chiefs, just cartels. Everyone wants to be part of the cartels. It's even better than being a king, because you can only have one king. But Undermine's got a lot of cartels, and they all need a pal.",
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
            summary = "A coalition of cartels from brokers and ethereals formed with an impossible goal. To save a facet of their destroyed world from the All-Devouring.",
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
            summary = "Venture Company doesn't have the best rep in town, but no one harvests, mines, or drills faster. You want nice? Find a book club. You want raw material? Venture's got you covered.",
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
            summary = "The Bilgewater Cartel has had more ups and downs than most, but no one can build and invent like they can. From cities to pool toys to [CLASSIFIED], Bilgewater builds it best.",
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
            summary = "Blackwater Cartel is new to the cart, formerly plying the seas as pirates. But they are already making waves with shipping and luxury vacations. They can move any cargo, anywhere, any time, and now it's all nice and legal.",
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
            summary = "Steamwheedle may be the oldest and largest cartel in Undermine. They have had their hands in almost every industry and their reach spans Azeroth and beyond. These days, with the rise of Noggenfogger, it's the alchemy that they are known for.",
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
                    title = "Cartel contract: Gallagio Loyalty Rewards Club",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "The Gallagio is under new management, well it will be. And when it is, you want to be on their good side right? So, make the Gallagio a better place and make some new friends.",
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
            summary = "When Hallowfall comes under threat and the army stretched thin, a call to arms is issued to those with the strength to wield a weapon and Flame's Radiance is formed. All allies are welcome to join in Hallowfall's defense.",
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
            summary = "While the K'aresh Trust works to unite the people of their dying star, some members prefer a more direct approach. Using all method of covert and under-handed tactics, the Manaforge Vandals seek to dismantle Salhadaar's forces by any means necessary.",
        },
    },
})
