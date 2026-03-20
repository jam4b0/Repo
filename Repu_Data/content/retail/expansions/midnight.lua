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
            summary = "The Amani conquered and claimed the majority of Eastern Kingdoms for thousands of years, but were forced back into current-day Zul'Aman once the elves and humans colonized the land themselves.",
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
            summary = "In the vortex of terror and violence that is the Voidstorm, few have the mettle to survive. The Singularity, gathered by Magister Umbric and the ren'dorei, encompasses any who would brave this fearsome land to stand up to Xal'atath.",
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
            summary = "Called to Harandar by the echo of their Goddess' song, the Hara'ti watch over her cradle in hopes that she may one day return.",
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
            summary = "Deep within the Voidstorm, the war between Vidious and Ziadan rages on.",
        },
    },
})
