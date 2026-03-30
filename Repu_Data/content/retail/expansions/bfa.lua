local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2157] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Zuldazar",
                    },
                    title = "Zuldazar",
                },
                {
                    kind = "Hub",
                    location = {
                        title = "Dazar'alor",
                    },
                    title = "Dazar'alor",
                },
                {
                    kind = "Campaign",
                    location = {
                        title = "Kul Tiras",
                    },
                    title = "War campaign chapters and foothold work",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 862,
                        title = "Dazar'alor",
                        x = 0.580,
                        y = 0.626,
                    },
                    name = "Arcanist Peroleth",
                },
            },
            source = "curated",
            summary = "A special delegation of the Horde army, focused on disrupting Alliance operations in Kul Tiras.",
        },
        [2158] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Vol'dun",
                    },
                    title = "Vol'dun",
                },
                {
                    kind = "Weekly",
                    location = {
                        title = "Vol'dun",
                    },
                    title = "World quests and emissary rotations",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "Vulpera Hideaway",
                        x = 0.566,
                        y = 0.498,
                    },
                    name = "Hoarder Jena",
                },
            },
            source = "curated",
            summary = "Comprised of exiles and scavengers, the Voldunai use their knowledge of the sands to thrive where others would wither and die.",
        },
        [2160] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Tiragarde Sound",
                    },
                    title = "Tiragarde Sound",
                },
                {
                    kind = "Hub",
                    location = {
                        title = "Boralus",
                    },
                    title = "Boralus",
                },
                {
                    kind = "Weekly",
                    location = {
                        title = "Kul Tiras",
                    },
                    title = "World quests and emissary rotations",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1161,
                        title = "Boralus",
                        x = 0.676,
                        y = 0.218,
                    },
                    name = "Provisioner Fray",
                },
            },
            source = "curated",
            summary = "Masters of the sea and commanders of Azeroth's finest navy, the distinguished Proudmoore family has led Kul Tiras for decades from their seat of power in Boralus.",
        },
        [2161] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Drustvar",
                    },
                    title = "Drustvar",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Waycrest Manor",
                    },
                    title = "Waycrest Manor",
                },
                {
                    kind = "Weekly",
                    location = {
                        title = "Drustvar",
                    },
                    title = "World quests and emissary rotations",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "Arom's Stand",
                        x = 0.378,
                        y = 0.490,
                    },
                    name = "Quartermaster Alcorn",
                },
            },
            source = "curated",
            summary = "An ancient Kul Tiran order resurrected to battle the threat of witchcraft, the Order of Embers fights with knowledge guiding their blades.",
        },
        [2162] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Stormsong Valley",
                    },
                    title = "Stormsong Valley",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Shrine of the Storm",
                    },
                    title = "Shrine of the Storm",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 942,
                        title = "Brennadam",
                        x = 0.594,
                        y = 0.696,
                    },
                    name = "Caspian",
                },
            },
            source = "curated",
            summary = "Home to farmers, craftsmen, soldiers, and the mysterious tidesages, the Storm's Wake seeks to reclaim Stormsong Valley and affirm their place in Kul Tiras.",
        },
        [2400] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        title = "Mezzamere",
                    },
                    title = "Mezzamere",
                },
                {
                    kind = "Zone",
                    location = {
                        title = "Nazjatar",
                    },
                    title = "Nazjatar",
                },
                {
                    kind = "Recurring",
                    location = {
                        title = "Mezzamere",
                    },
                    title = "Nazjatar ally and bodyguard activities",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1355,
                        title = "Mezzamere",
                        x = 0.492,
                        y = 0.620,
                    },
                    name = "Finder Palta",
                },
            },
            source = "curated",
            summary = "Waveblade Ankoan are the Alliance-aligned rebels of Nazjatar, operating from Mezzamere against Queen Azshara and her naga. Their reputation is mainly earned through Nazjatar world content, ally support, and the zone's recurring progression systems.",
            summarySource = "curated",
        },
        [2373] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        title = "Newhome",
                    },
                    title = "Newhome",
                },
                {
                    kind = "Zone",
                    location = {
                        title = "Nazjatar",
                    },
                    title = "Nazjatar",
                },
                {
                    kind = "Daily",
                    location = {
                        title = "Newhome",
                    },
                    title = "Nazjatar dailies and bodyguard tasks",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1355,
                        title = "Newhome",
                        x = 0.508,
                        y = 0.652,
                    },
                    name = "Atolia Seapearl",
                },
            },
            source = "curated",
            summary = "The Unshackled are the Horde-aligned rebels of Nazjatar, operating from Newhome against Queen Azshara and her naga. Their reputation is mainly earned through Nazjatar world content, ally support, and the zone's recurring progression systems.",
        },
        [2391] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Mechagon",
                    },
                    title = "Mechagon",
                },
                {
                    kind = "Hub",
                    location = {
                        title = "Rustbolt",
                    },
                    title = "Rustbolt",
                },
                {
                    kind = "Daily",
                    location = {
                        title = "Rustbolt",
                    },
                    title = "Mechagon repeatables and daily projects",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1462,
                        title = "Rustbolt",
                        x = 0.736,
                        y = 0.366,
                    },
                    name = "Stolen Royal Vendorbot",
                },
            },
            source = "curated",
            summary = "The Rustbolt Resistance holds the line against King Mechagon and his evil plans.",
        },
        [2395] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Stormsong Valley",
                    },
                    title = "Stormsong Valley side content",
                },
                {
                    kind = "Recurring",
                    location = {
                        title = "Stormsong Valley",
                    },
                    title = "Bee jelly turn-ins and ranch support",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "A species of bee known for their unusual size. While newcomers to Stormsong Valley, they quickly made their presence known to adventurers and insect enthusiasts alike.",
        },
        [2415] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Ny'alotha, the Waking City",
                    },
                    title = "Ny'alotha, the Waking City",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "The Silent Sanctuary",
                    },
                    name = "Zhang Ku",
                },
            },
            source = "curated",
            summary = "A group of mogu loyal to the titan keeper Ra, they are charged with defending the Engine of Nalak'sha from N'Zoth's minions.",
        },
    },
})
