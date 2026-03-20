local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [909] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 407,
                        title = "Darkmoon Island",
                    },
                    title = "Darkmoon Island",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 407,
                        title = "Darkmoon Island",
                    },
                    title = "Monthly faire quests and turn-ins",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "A carnival that showcases the weird and the extraordinary, located on a mysterious island only accessible for the first week of every month.",
        },
    },
})
