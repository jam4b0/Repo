local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [933] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 104,
                        title = "Nethersturm",
                    },
                    title = "Nethersturm",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 104,
                        title = "Area 52",
                    },
                    title = "Area 52",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [941] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 107,
                        title = "Nagrand",
                    },
                    title = "Nagrand",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 107,
                        title = "Garadar",
                    },
                    title = "Garadar",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [942] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 102,
                        title = "Zangarmarschen",
                    },
                    title = "Zangarmarschen",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 102,
                        title = "Cenarionszuflucht",
                    },
                    title = "Cenarionszuflucht",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [946] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 100,
                        title = "Hellfire Peninsula",
                    },
                    title = "Hellfire Peninsula",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 100,
                        title = "Honor Hold",
                    },
                    title = "Honor Hold",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [947] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 100,
                        title = "Hellfire Peninsula",
                    },
                    title = "Hellfire Peninsula",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "The Shattered Halls",
                    },
                    title = "The Shattered Halls",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [970] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 102,
                        title = "Zangarmarschen",
                    },
                    title = "Zangarmarschen",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 102,
                        title = "Sporeggar",
                    },
                    title = "Sporeggar",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [978] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 107,
                        title = "Nagrand",
                    },
                    title = "Nagrand",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 107,
                        title = "Telaar",
                    },
                    title = "Telaar",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [989] = {
            activities = {
                {
                    kind = "Dungeon",
                    location = {
                        title = "Old Hillsbrad Foothills",
                    },
                    title = "Old Hillsbrad Foothills",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "The Black Morass",
                    },
                    title = "The Black Morass",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [990] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Hyjal Summit",
                    },
                    title = "Hyjal Summit",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1012] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 105,
                        title = "Schattenmondtal",
                    },
                    title = "Schattenmondtal",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Black Temple",
                    },
                    title = "Black Temple",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1015] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 105,
                        title = "Schattenmondtal",
                    },
                    title = "Schattenmondtal",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 105,
                        title = "Netherwing Ledge",
                    },
                    title = "Netherwing Ledge",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1031] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 109,
                        title = "Schergrat",
                    },
                    title = "Schergrat",
                },
                {
                    kind = "Daily/Repeatable",
                    location = {
                        mapID = 109,
                        title = "Schergrat",
                    },
                    title = "Skyguard-tasks",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1038] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 109,
                        title = "Schergrat",
                    },
                    title = "Schergrat",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 109,
                        title = "Ogri'la",
                    },
                    title = "Ogri'la",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1077] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 122,
                        title = "Isle of Quel'Danas",
                    },
                    title = "Isle of Quel'Danas",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 122,
                        title = "Isle of Quel'Danas",
                    },
                    title = "Quel'Danas dailies",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1416] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 105,
                        title = "Schattenmondtal",
                    },
                    title = "Schattenmondtal",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Black Temple",
                    },
                    title = "Black Temple",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
