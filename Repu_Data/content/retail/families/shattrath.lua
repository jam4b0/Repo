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
            summary = "Retail content for this faction is centered on Aldor-tasks in Shattrath.",
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
            summary = "Retail content for this faction is centered on Scryer tasks in Shattrath.",
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
            summary = "Retail content for this faction is centered on Shattrath and temple tasks.",
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
            summary = "Retail content for this faction is centered on Lower City tasks.",
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
            summary = "Retail content for this faction is centered on Shattrath city factions.",
        },
    },
})
