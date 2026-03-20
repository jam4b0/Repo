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
                        title = "Eisenschmiede",
                    },
                    title = "Eisenschmiede",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [59] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 32,
                        title = "Sengende Schlucht",
                    },
                    title = "Sengende Schlucht",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 36,
                        title = "Brennende Steppe",
                    },
                    title = "Brennende Steppe",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [68] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 90,
                        title = "Unterstadt",
                    },
                    title = "Unterstadt",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [72] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 84,
                        title = "Sturmwind",
                    },
                    title = "Sturmwind",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [81] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 86,
                        title = "Donnerfels",
                    },
                    title = "Donnerfels",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [470] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 10,
                        title = "Nördliches Brachland",
                    },
                    title = "Nördliches Brachland",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [529] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 22,
                        title = "Westliche Pestländer",
                    },
                    title = "Westliche Pestländer",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 23,
                        title = "Östliche Pestländer",
                    },
                    title = "Östliche Pestländer",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [530] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 63,
                        title = "Eschental",
                    },
                    title = "Eschental",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [576] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 77,
                        title = "Teufelswald",
                    },
                    title = "Teufelswald",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [577] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 83,
                        title = "Winterquell",
                    },
                    title = "Winterquell",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
                        title = "Mondlichtung",
                    },
                    title = "Mondlichtung",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
                        title = "Azurmythosinsel",
                    },
                    title = "Azurmythosinsel",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
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
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
