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
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Darkmoon Island.",
        },
    },
})
