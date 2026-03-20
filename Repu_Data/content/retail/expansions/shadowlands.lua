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
            summary = "Retail content for this faction is centered on Bastion and Spires of Ascension.",
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
            summary = "Retail content for this faction is centered on Maldraxxus and Theater of Pain.",
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
            summary = "Retail content for this faction is centered on Revendreth and Halls of Atonement.",
        },
        [2432] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "The Maw",
                    },
                    title = "The Maw",
                },
                {
                    kind = "Hub",
                    location = {
                        title = "Ve'naris Zuflucht",
                    },
                    title = "Ve'naris Zuflucht",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on The Maw, Ve'naris Zuflucht, and Maw activities.",
        },
        [2439] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        title = "Revendreth",
                    },
                    title = "Absolution Crypt",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Absolution Crypt, Sinstone turn-ins, and Revendreth side content.",
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
            summary = "Retail content for this faction is centered on Ardenweald and Mists of Tirna Scithe.",
        },
        [2465] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Ardenweald",
                    },
                    title = "Ardenweald",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Ardenweald and Callings and side objectives.",
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
            summary = "Retail content for this faction is centered on Sanctum of Domination.",
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
            source = "curated",
            summary = "Retail content for this faction is centered on Korthia, Keeper's Respite, and Relic research.",
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
            summary = "Retail content for this faction is centered on Zereth Mortis and Haven.",
        },
    },
})
