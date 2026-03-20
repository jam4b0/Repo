local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1828] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 650,
                        title = "Highmountain",
                    },
                    title = "Highmountain",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Neltharion's Lair",
                    },
                    title = "Neltharion's Lair",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1859] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 680,
                        title = "Suramar",
                    },
                    title = "Suramar-Kampagne",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 680,
                        title = "Shal'Aran",
                    },
                    title = "Shal'Aran",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1883] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 627,
                        title = "Dalaran",
                    },
                    title = "Legion-Dalaran",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 627,
                        title = "Krasus' Landing",
                    },
                    title = "Krasus' Landing",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1894] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 646,
                        title = "Broken Shore",
                    },
                    title = "Broken Shore",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Tomb of Sargeras",
                    },
                    title = "Tomb of Sargeras",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1900] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 630,
                        title = "Azsuna",
                    },
                    title = "Azsuna",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Eye of Azshara",
                    },
                    title = "Eye of Azshara",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1948] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 634,
                        title = "Sturmheim",
                    },
                    title = "Sturmheim",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 634,
                        title = "Haimont",
                    },
                    title = "Haimont",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2045] = {
            activities = {
                {
                    kind = "Dungeon",
                    location = {
                        title = "Vault of the Wardens",
                    },
                    title = "Vault of the Wardens",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2165] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 830,
                        title = "Krokuun",
                    },
                    title = "Krokuun",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 830,
                        title = "Argus",
                    },
                    title = "Argus activities",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2170] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 830,
                        title = "Argus",
                    },
                    title = "Argus activities",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Antorus, the Burning Throne",
                    },
                    title = "Antorus, the Burning Throne",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
