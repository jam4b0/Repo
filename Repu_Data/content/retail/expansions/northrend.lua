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
            summary = "Retail content for this faction is centered on Howling Fjord.",
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
            summary = "Retail content for this faction is centered on Questlines in Howling Fjord.",
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
            summary = "Retail content for this faction is centered on Questlines in Borean Tundra.",
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
            summary = "Retail content for this faction is centered on Dalaran city activities and Northrend-Dungeons mit Dalaran-Bezug.",
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
            summary = "Retail content for this faction is centered on Questlines in Dragonblight.",
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
            summary = "Retail content for this faction is centered on Halls of Lightning and Ulduar.",
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
            summary = "Retail content for this faction is centered on Questlines in Sholazar Basin.",
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
            summary = "Retail content for this faction is centered on Questlines in Zul'Drak and Gandrak.",
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
            summary = "Retail content for this faction is centered on Argent Crusade and Questlines in Icecrown.",
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
            summary = "Retail content for this faction is centered on K3 and Storm Peaks questlines.",
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
            summary = "Retail content for this faction is centered on Vault of Archavon.",
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
            summary = "Retail content for this faction is centered on The Storm Peaks.",
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
            summary = "Retail content for this faction is centered on Icecrown Citadel.",
        },
    },
})
