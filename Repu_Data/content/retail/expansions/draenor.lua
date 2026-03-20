local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1445] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 525,
                        title = "Frostfeuergrat",
                    },
                    title = "Frostfeuergrat",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 525,
                        title = "War Mill",
                    },
                    title = "War Mill",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1515] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 534,
                        title = "Spires of Arak",
                    },
                    title = "Spires of Arak",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1710] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 582,
                        title = "Moonfall",
                    },
                    title = "Moonfall",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 582,
                        title = "Outpost of the Awakened",
                    },
                    title = "Outpost of the Awakened",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1711] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 542,
                        title = "Gorgrond",
                    },
                    title = "Gorgrond",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Grimrail Depot",
                    },
                    title = "Grimrail Depot",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1731] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 550,
                        title = "Nagrand",
                    },
                    title = "Nagrand",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Shadowmoon Burial Grounds",
                    },
                    title = "Shadowmoon Burial Groands",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1847] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 550,
                        title = "Warspear",
                    },
                    title = "Warspear",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1848] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 543,
                        title = "Tanaan-Dschungel",
                    },
                    title = "Tanaan-Dschungel",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Hellfire Citadel",
                    },
                    title = "Hellfire Citadel",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1849] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 582,
                        title = "Stormshield",
                    },
                    title = "Stormshield",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1850] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 534,
                        title = "Spires of Arak",
                    },
                    title = "Spires of Arak",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Auchindoun",
                    },
                    title = "Auchindoun",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
