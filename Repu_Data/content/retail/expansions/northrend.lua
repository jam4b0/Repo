local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1067] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 117,
                        title = "Howling Fjord",
                    },
                    title = "Howling Fjord",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1068] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 117,
                        title = "Howling Fjord",
                    },
                    title = "Questlines in Howling Fjord",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1073] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 114,
                        title = "Borean Tundra",
                    },
                    title = "Questlines in Borean Tundra",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1090] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 125,
                        title = "Dalaran",
                    },
                    title = "Dalaran city activities",
                },
                {
                    kind = "Dungeon",
                    location = {
                        mapID = 125,
                        title = "Dalaran",
                    },
                    title = "Northrend-Dungeons mit Dalaran-Bezug",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1091] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 115,
                        title = "Dragonblight",
                    },
                    title = "Questlines in Dragonblight",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1098] = {
            activities = {
                {
                    kind = "Dungeon",
                    location = {
                        title = "Halls of Lightning",
                    },
                    title = "Halls of Lightning",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Ulduar",
                    },
                    title = "Ulduar",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1104] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 119,
                        title = "Sholazar Basin",
                    },
                    title = "Questlines in Sholazar Basin",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1105] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 121,
                        title = "Zul'Drak",
                    },
                    title = "Questlines in Zul'Drak",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Gundrak",
                    },
                    title = "Gandrak",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1106] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 118,
                        title = "Argent Crusade",
                    },
                    title = "Argent Crusade",
                },
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 118,
                        title = "Eiskrone",
                    },
                    title = "Questlines in Icecrown",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1119] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 120,
                        title = "The Storm Peaks",
                    },
                    title = "K3 and Storm Peaks questlines",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1124] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Vault of Archavon",
                    },
                    title = "Vault of Archavon",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1126] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 120,
                        title = "The Storm Peaks",
                    },
                    title = "The Storm Peaks",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1156] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Icecrown Citadel",
                    },
                    title = "Icecrown Citadel",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
