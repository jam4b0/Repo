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
            },
            confidence = "medium",
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
            },
            confidence = "medium",
            source = "curated",
            summary = "Comprised of exiles and scavengers, the Voldunai use their knowledge of the sands to thrive where others would wither and die.",
        },
        [2160] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Tiragardesund",
                    },
                    title = "Tiragardesand",
                },
                {
                    kind = "Hub",
                    location = {
                        title = "Boralus",
                    },
                    title = "Boralus",
                },
            },
            confidence = "medium",
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
            },
            confidence = "medium",
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
            source = "curated",
            summary = "Home to farmers, craftsmen, soldiers, and the mysterious tidesages, the Storm's Wake seeks to reclaim Stormsong Valley and affirm their place in Kul Tiras.",
        },
        [2370] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        title = "Neueheim",
                    },
                    title = "Neueheim",
                },
                {
                    kind = "Zone",
                    location = {
                        title = "Nazjatar",
                    },
                    title = "Nazjatar",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Neueheim and Nazjatar.",
        },
        [2373] = {
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
            },
            confidence = "medium",
            source = "curated",
            summary = "Oppressed by the Naga, these refugees have banded together to rise up and seize their freedom.",
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
                        title = "Rostbolzen",
                    },
                    title = "Rostbolzen",
                },
            },
            confidence = "medium",
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
                    title = "Sturmsangtal side content",
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
            source = "curated",
            summary = "A group of mogu loyal to the titan keeper Ra, they are charged with defending the Engine of Nalak'sha from N'Zoth's minions.",
        },
    },
})
