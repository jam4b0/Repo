local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1445] = {
            summary = "Dieser Draenor-Rufblock ist an Frostfeuergrat und die dortige Garnisons- bzw. Hubstruktur gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Frostfeuergrat", kind = "Zone", location = { mapID = 525, title = "Frostfeuergrat" } },
                { title = "Kriegsmuehle", kind = "Hub", location = { mapID = 525, title = "Kriegsmuehle" } },
            },
        },
        [1710] = {
            summary = "Dieser Rufblock ist an Mondsturz und den Allianz-Zweig der Draenor-Hubs gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Mondsturz", kind = "Zone", location = { mapID = 582, title = "Mondsturz" } },
                { title = "Aussenposten der Erwachten", kind = "Hub", location = { mapID = 582, title = "Aussenposten der Erwachten" } },
            },
        },
        [1711] = {
            summary = "Dieser Draenor-Rufblock ist im Retail-Core vor allem mit Gorgrond und Grimrail Depot verknuepft.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Gorgrond", kind = "Zone", location = { mapID = 542, title = "Gorgrond" } },
                { title = "Grimrail Depot", kind = "Dungeon", location = { title = "Grimrail Depot" } },
            },
        },
        [1731] = {
            summary = "Der Kernbezug dieses Draenor-Rufblocks liegt bei Nagrand und Schattenmondtal sowie den dortigen Story- und Dungeoninhalten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Nagrand", kind = "Zone", location = { mapID = 550, title = "Nagrand" } },
                { title = "Shadowmoon Burial Grounds", kind = "Dungeon", location = { title = "Shadowmoon Burial Grounds" } },
            },
        },
        [1847] = {
            summary = "Horde-Hubruf von Kriegsspeer. Der heutige Bezugspunkt ist die Stadt als Draenor-Hub.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Kriegsspeer", kind = "Hub", location = { mapID = 550, title = "Kriegsspeer" } },
            },
        },
        [1848] = {
            summary = "Dieser Rufblock ist vor allem an Tanaan-Dschungel und Hellfire Citadel gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Tanaan-Dschungel", kind = "Zone", location = { mapID = 543, title = "Tanaan-Dschungel" } },
                { title = "Hellfire Citadel", kind = "Raid", location = { title = "Hellfire Citadel" } },
            },
        },
        [1849] = {
            summary = "Allianz-Hubruf von Sturmschild. Im heutigen Spiel ist die Stadt der zentrale Bezugspunkt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Sturmschild", kind = "Hub", location = { mapID = 582, title = "Sturmschild" } },
            },
        },
        [1850] = {
            summary = "Dieser Rufblock ist im Retail-Core an Spires of Arak und Auchindoun verankert.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Spires of Arak", kind = "Zone", location = { mapID = 534, title = "Spires of Arak" } },
                { title = "Auchindoun", kind = "Dungeon", location = { title = "Auchindoun" } },
            },
        },
    },
})
