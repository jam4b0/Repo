local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2696] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 2437,
                        title = "Zul'Aman",
                    },
                    title = "Zul'Aman-Kampagne",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2437,
                        title = "Zul'Aman",
                    },
                    title = "Local tasks in the Amani area",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2699] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 2405,
                        title = "Voidstorm",
                    },
                    title = "Leerensturm-Kampagne",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2405,
                        title = "Voidstorm",
                    },
                    title = "Local tasks in Voidstorm",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2704] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 2413,
                        title = "Harandar",
                    },
                    title = "Harandar-Kampagne",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 2413,
                        title = "Harandar",
                    },
                    title = "Local tasks in Harandar",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [2770] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 2405,
                        title = "Voidstorm",
                    },
                    title = "Voidstorm",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 2405,
                        title = "Obskurionzitadelle",
                    },
                    title = "Obskurionzitadelle",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
