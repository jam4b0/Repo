local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2407] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Bastion",
                    },
                    title = "Bastion",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Spires of Ascension",
                    },
                    title = "Spires of Ascension",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2410] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Maldraxxus",
                    },
                    title = "Maldraxxus",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Theater of Pain",
                    },
                    title = "Theater of Pain",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2413] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Revendreth",
                    },
                    title = "Revendreth",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Halls of Atonement",
                    },
                    title = "Halls of Atonement",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2432] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 1543,
                        title = "The Maw",
                    },
                    title = "The Maw",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 1543,
                        title = "Ve'nari's Refuge",
                    },
                    title = "Ve'naris Zuflucht",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 1543,
                        title = "The Maw",
                    },
                    title = "Maw activities",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1543,
                        title = "The Maw",
                    },
                    name = "Ve'nari",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2439] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 1525,
                        title = "Absolution Crypt",
                    },
                    title = "Absolution Crypt",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 1525,
                        title = "Absolution Crypt",
                    },
                    title = "Sinstone turn-ins",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 1525,
                        title = "Revendreth",
                    },
                    title = "Revendreth side content",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1525,
                        title = "Absolution Crypt",
                    },
                    name = "Archivist Janeera",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2464] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Ardenweald",
                    },
                    title = "Ardenweald",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Mists of Tirna Scithe",
                    },
                    title = "Mists of Tirna Scithe",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2465] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 1565,
                        title = "Ardenweald",
                    },
                    title = "Ardenweald",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 1565,
                        title = "Ardenweald",
                    },
                    title = "Callings and side objectives",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1565,
                        title = "Ardenweald",
                    },
                    name = "Aithlyn",
                },
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1565,
                        title = "Ardenweald",
                    },
                    name = "Liawyn",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2470] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Sanctum of Domination",
                    },
                    title = "Sanctum of Domination",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2472] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 1961,
                        title = "Korthia",
                    },
                    title = "Korthia",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 1961,
                        title = "Keeper's Respite",
                    },
                    title = "Keeper's Respite",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 1961,
                        title = "Korthia",
                    },
                    title = "Relic research",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1961,
                        title = "Korthia",
                    },
                    name = "Archivist Roh-Suir",
                },
            },
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated quartermaster and activity notes for the mapped local content.",
        },
        [2478] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Zereth Mortis",
                    },
                    title = "Zereth Mortis",
                },
                {
                    kind = "Hub",
                    location = {
                        title = "Haven",
                    },
                    title = "Haven",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
