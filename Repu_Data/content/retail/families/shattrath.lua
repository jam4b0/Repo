local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [932] = {
            activities = {
                {
                    kind = "City faction",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    title = "Aldor-tasks in Shattrath",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [934] = {
            activities = {
                {
                    kind = "City faction",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    title = "Scryer tasks in Shattrath",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [935] = {
            activities = {
                {
                    kind = "City/Instances",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    title = "Shattrath and temple tasks",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [1011] = {
            activities = {
                {
                    kind = "City faction",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    title = "Lower City tasks",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
        [9000111] = {
            activities = {
                {
                    kind = "Cluster",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    title = "Shattrath city factions",
                },
            },
            confidence = "medium",
            source = "seed",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
