local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1269] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 390,
                        title = "Vale of Eternal Blossoms",
                    },
                    title = "Vale of Eternal Blossoms",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Mogu'shan Palace",
                    },
                    title = "Mogu'shan Palace",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1270] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 371,
                        title = "The Jade Forest",
                    },
                    title = "Questlines in the Jade Forest",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Shado-Pan Monastery",
                    },
                    title = "Shado-Pan Monastery",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1271] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 418,
                        title = "Dread Wastes",
                    },
                    title = "Questlines in Dread Wastes",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Heart of Fear",
                    },
                    title = "Heart of Fear",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1272] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 376,
                        title = "Valley of the Four Winds",
                    },
                    title = "Valley of the Four Winds",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 376,
                        title = "Halbhuegel",
                    },
                    title = "Halbhuegel",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1302] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 388,
                        title = "Krasarang Wilds",
                    },
                    title = "Questlines in Krasarang Wilds",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1337] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 418,
                        title = "Dread Wastes",
                    },
                    title = "Dread Wastes",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 418,
                        title = "Klaxxi'vess",
                    },
                    title = "Klaxxi'vess",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Heart of Fear",
                    },
                    title = "Heart of Fear",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1359] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 390,
                        title = "Vale of Eternal Blossoms",
                    },
                    title = "Vale of Eternal Blossoms",
                },
                {
                    kind = "Story",
                    location = {
                        mapID = 390,
                        title = "Vale of Eternal Blossoms",
                    },
                    title = "Wrathion-Endgame",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1375] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 390,
                        title = "Shrine of Two Moons",
                    },
                    title = "Shrine of Two Moons",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1376] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 390,
                        title = "Shrine of Seven Stars",
                    },
                    title = "Shrine of Seven Stars",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1387] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 507,
                        title = "Isle of Thunder",
                    },
                    title = "Isle of Thander",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1388] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 507,
                        title = "Isle of Thunder",
                    },
                    title = "Isle of Thander",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1435] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 507,
                        title = "Isle of the Thunder King",
                    },
                    title = "Isle of the Thander King",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Throne of Thunder",
                    },
                    title = "Throne of Thander",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1492] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 554,
                        title = "Zeitlose Insel",
                    },
                    title = "Zeitlose Insel",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Siege of Orgrimmar",
                    },
                    title = "Siege of Orgrimmar",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
