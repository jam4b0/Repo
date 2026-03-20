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
            summary = "An ancient order of draenei priests once run by Velen, the Aldor are currently led by High Priestess Ishanah.  They are servants of the naaru in Shattrath City known as the Sha'tar.  Rivals of the Scryers.",
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
            summary = "Voren'thal the Seer leads the dissident blood elves who've rejected Kael'thas' path to power.  They've joined forces with the naaru of Shattrath City, much to the dismay of the Aldor.",
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
            summary = "The Sha'tar are a group of powerful naaru who rule over a rebuilt Shattrath City.  With the help of the Aldor and the Scryers, they lead the battle against Illidan and the Burning Legion.",
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
            summary = "The refugees of Shattrath come from diverse backgrounds and races.  Word of helpful deeds spreads quickly among the Denizens of Lower City.",
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
            summaryKey = "faction.9000111.summary",
        },
    },
})
