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
                    kind = "Zone",
                    location = {
                        mapID = 2215,
                        title = "Hallowfall",
                    },
                    title = "Hallowfall world quests and side activities",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 2215,
                        title = "Mereldar",
                        x = 0.413,
                        y = 0.53,
                    },
                    title = "Mereldar service hub",
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
            source = "curated",
            summarySource = "curated",
            summary = "The Hallowfall Expedition is the Arathi military and civic force centered on Mereldar. Most reputation progress comes from Hallowfall world content, the Spreading the Light cycle, and activity around the Sacred Flame.",
        },
        [2590] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 2248,
                        title = "Isle of Dorn",
                    },
                    title = "Isle of Dorn world quests and side activities",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 2339,
                        title = "Foundation Hall",
                        x = 0.392,
                        y = 0.243,
                    },
                    title = "Dornogal council services",
                },
                {
                    kind = "Campaign",
                    location = {
                        mapID = 2339,
                        title = "Foundation Hall",
                        x = 0.392,
                        y = 0.243,
                    },
                    title = "Council of Dornogal campaign chapters",
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
            source = "curated",
            summarySource = "curated",
            summary = "The Council of Dornogal is the civic authority based in Foundation Hall. Reputation is tied to Isle of Dorn activity, city-side progression, and service work connected to Dornogal's earthen administration.",
        },
        [2594] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 2214,
                        title = "The Ringing Deeps",
                    },
                    title = "Ringing Deeps world quests and side activities",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 2214,
                        title = "Gundargaz",
                        x = 0.432,
                        y = 0.328,
                    },
                    title = "Gundargaz machine-speaker hub",
                },
                {
                    kind = "Campaign",
                    location = {
                        mapID = 2214,
                        title = "Gundargaz",
                        x = 0.432,
                        y = 0.328,
                    },
                    title = "Ringing Deeps story and side chapters",
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
            source = "curated",
            summarySource = "curated",
            summary = "The Machine Speakers coordinate reconstruction and maintenance throughout the Ringing Deeps. Their reputation is mainly built through regional world content, Gundargaz hub work, and campaign progress tied to restored machinery.",
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
                    title = "Weekly pact selection",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2255,
                        title = "Azj-Kahet",
                    },
                    title = "Azj-Kahet world quests and side activities",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 2255,
                        title = "The Weaver's Lair",
                        x = 0.553,
                        y = 0.412,
                    },
                    title = "Severed Threads planning hub",
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
            source = "curated",
            summarySource = "curated",
            summary = "The Severed Threads are the resistance network operating out of the Weaver's Lair in Azj-Kahet. Reputation centers on world content across the zone, weekly pact choices, and the wider insurgency against Ansurek's rule.",
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
            source = "curated",
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
            source = "curated",
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
            source = "curated",
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
                {
                    kind = "Hub",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    title = "Undermine cartel services",
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
            source = "curated",
            summarySource = "curated",
            summary = "Cartels of Undermine tracks your standing with the wider goblin power structure in Undermine. Most progress comes from weekly cartel contracts, the C.H.E.T.T. List, and city-side work centered on the Incontinental Hotel.",
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
            summarySource = "curated",
            summary = "The K'aresh Trust unites brokers, ethereals, and allied survivors trying to stabilize a shattered world under threat from the All-Devouring. Its reputation comes from K'aresh campaign progress and broader zone activity.",
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
                    title = "Cartel choice: Venture Company",
                },
            },
            confidence = "medium",
            source = "curated",
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
                    title = "Cartel choice: Bilgewater Cartel",
                },
            },
            confidence = "medium",
            source = "curated",
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
                    title = "Cartel choice: Blackwater Cartel",
                },
            },
            confidence = "medium",
            source = "curated",
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
                    title = "Cartel choice: Steamwheedle Cartel",
                },
            },
            confidence = "medium",
            source = "curated",
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
                {
                    kind = "Hub",
                    location = {
                        mapID = 2346,
                        title = "Incontinental Hotel",
                        x = 0.436,
                        y = 0.508,
                    },
                    title = "Gallagio support services",
                },
            },
            confidence = "medium",
            source = "curated",
            summarySource = "curated",
            summary = "The Gallagio Loyalty Rewards Club covers hospitality and service work tied to the Gallagio's future operations in Undermine. Progress is driven by its contract rotation and support tasks tied to the hotel hub.",
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
