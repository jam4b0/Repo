local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [47] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 87,
                        title = "Ironforge",
                    },
                    title = "Ironforge",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Ironforge.",
        },
        [59] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 32,
                        title = "Searing Gorge",
                    },
                    title = "Searing Gorge",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 36,
                        title = "Burning Steppes",
                    },
                    title = "Burning Steppes",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Searing Gorge and Burning Steppes.",
        },
        [68] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 90,
                        title = "Undercity",
                    },
                    title = "Undercity",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Undercity.",
        },
        [69] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 89,
                        title = "Darnassus",
                    },
                    title = "Darnassus",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Darnassus.",
        },
        [72] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 84,
                        title = "Stormwind",
                    },
                    title = "Stormwind",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Stormwind.",
        },
        [76] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 85,
                        title = "Orgrimmar",
                    },
                    title = "Orgrimmar",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Orgrimmar.",
        },
        [81] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 86,
                        title = "Thunder Bluff",
                    },
                    title = "Thunder Bluff",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Thunder Bluff.",
        },
        [369] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 71,
                        title = "Tanaris",
                    },
                    title = "Tanaris",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 71,
                        title = "Gadgetzan",
                    },
                    title = "Gadgetzan",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Tanaris and Gadgetzan.",
        },
        [470] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 10,
                        title = "Northern Barrens",
                    },
                    title = "Northern Barrens",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 10,
                        title = "Ratchet",
                    },
                    title = "Ratchet",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Northern Barrens and Ratchet.",
        },
        [529] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 22,
                        title = "Western Plaguelands",
                    },
                    title = "Western Plaguelands",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 23,
                        title = "Eastern Plaguelands",
                    },
                    title = "Eastern Plaguelands",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Western Plaguelands and Eastern Plaguelands.",
        },
        [530] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 63,
                        title = "Ashenvale",
                    },
                    title = "Ashenvale",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Ashenvale.",
        },
        [576] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 77,
                        title = "Felwood",
                    },
                    title = "Felwood",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Felwood.",
        },
        [577] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 83,
                        title = "Winterspring",
                    },
                    title = "Winterspring",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 83,
                        title = "Everlook",
                    },
                    title = "Everlook",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Winterspring and Everlook.",
        },
        [609] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 66,
                        title = "Desolace",
                    },
                    title = "Desolace",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 69,
                        title = "Feralas",
                    },
                    title = "Feralas",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 80,
                        title = "Moonglade",
                    },
                    title = "Moonglade",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 81,
                        title = "Silithus",
                    },
                    title = "Silithus",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Desolace, Feralas, and Moonglade.",
        },
        [749] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Molten Core",
                    },
                    title = "Molten Core",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Molten Core.",
        },
        [910] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Temple of Ahn'Qiraj",
                    },
                    title = "Temple of Ahn'Qiraj",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Ruins of Ahn'Qiraj",
                    },
                    title = "Ruins of Ahn'Qiraj",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Temple of Ahn'Qiraj and Ruins of Ahn'Qiraj.",
        },
        [930] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 103,
                        title = "The Exodar",
                    },
                    title = "The Exodar",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 97,
                        title = "Azuremyst Isle",
                    },
                    title = "Azuremyst Isle",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 106,
                        title = "The Blutmythosinsel",
                    },
                    title = "The Blutmythosinsel",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on The Exodar, Azuremyst Isle, and The Blutmythosinsel.",
        },
        [1133] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 76,
                        title = "Azshara",
                    },
                    title = "Azshara",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Azshara.",
        },
        [1134] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 1577,
                        title = "Gilneas",
                    },
                    title = "Gilneas",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Retail content for this faction is centered on Gilneas.",
        },
    },
})
