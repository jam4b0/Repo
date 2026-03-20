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
                        title = "Dunkelmond-Insel",
                    },
                    title = "Dunkelmond-Insel",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Localized retail content for this faction. Includes curated activity notes for the mapped local content.",
        },
    },
})
