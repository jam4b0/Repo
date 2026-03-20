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
            summary = "Retail content for this faction is centered on Zuldazar and Dazar'alor.",
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
            summary = "Retail content for this faction is centered on Vol'dun.",
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
            summary = "Retail content for this faction is centered on Tiragardesand and Boralus.",
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
            summary = "Retail content for this faction is centered on Drustvar and Waycrest Manor.",
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
            summary = "Retail content for this faction is centered on Stormsong Valley and Shrine of the Storm.",
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
            summary = "Retail content for this faction is centered on Mezzamere and Nazjatar.",
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
            summary = "Retail content for this faction is centered on Mechagon and Rostbolzen.",
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
            summary = "Retail content for this faction is centered on Sturmsangtal side content.",
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
            summary = "Retail content for this faction is centered on Ny'alotha, the Waking City.",
        },
    },
})
