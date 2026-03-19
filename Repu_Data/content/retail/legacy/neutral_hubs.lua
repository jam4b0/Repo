local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

local function worldQuest(mapID, title)
    return {
        title = title,
        kind = "Zone/Stadt",
        location = {
            mapID = mapID,
            title = title,
        },
    }
end

api.RegisterRetailContentModule({
    factions = {
        [909] = {
            summary = "Der Dunkelmond-Jahrmarkt ist der lokale Rufblock der Dunkelmond-Insel. Im Retail-Core ist er als neutraler Hubanker für die Insel selbst modelliert.",
            source = "curated",
            confidence = "medium",
            activities = {
                worldQuest(407, "Dunkelmond-Insel"),
            },
        },
    },
})
