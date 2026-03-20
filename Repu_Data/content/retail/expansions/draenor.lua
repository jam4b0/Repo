local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1445] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 525,
                        title = "Frostfeuergrat",
                    },
                    title = "Frostfeuergrat",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 525,
                        title = "War Mill",
                    },
                    title = "War Mill",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The Frostwolf orcs of Frostfire Ridge are a tight-knit family of brutal warriors, well equipped to deal with the savage realities of Draenor.",
        },
        [1515] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 534,
                        title = "Spires of Arak",
                    },
                    title = "Spires of Arak",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Working from the shadows, the Arakkoa Outcasts seek to bring a brighter tomorrow.",
        },
        [1710] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 582,
                        title = "Moonfall",
                    },
                    title = "Moonfall",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 582,
                        title = "Outpost of the Awakened",
                    },
                    title = "Outpost of the Awakened",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The defenders of Shattrath struggle to regain control of their capital city, having been betrayed from within.",
        },
        [1711] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 542,
                        title = "Gorgrond",
                    },
                    title = "Gorgrond",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Grimrail Depot",
                    },
                    title = "Grimrail Depot",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The goblins of the Steamwheedle Preservation Society seek to liberate relics from the ogres of Nagrand with the noble intention of selling them to the highest bidder.",
        },
        [1731] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 550,
                        title = "Nagrand",
                    },
                    title = "Nagrand",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Shadowmoon Burial Grounds",
                    },
                    title = "Shadowmoon Burial Groands",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Under the leadership of five powerful exarchs, the draenei of Draenor have prospered in a savage world.",
        },
        [1847] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 550,
                        title = "Warspear",
                    },
                    title = "Warspear",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Yrel has assembled the remaining Exarchs and is calling for a crusade in Velen's name. Together they are working to establish a foothold in Tanaan Jungle and to overthrow Gul'dan.",
        },
        [1848] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 543,
                        title = "Tanaan-Dschungel",
                    },
                    title = "Tanaan-Dschungel",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Hellfire Citadel",
                    },
                    title = "Hellfire Citadel",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Seeking to protect Azeroth with a decisive victory on Draenor, Warchief Vol'jin is assembling an elite team of champions to establish a foothold in Tanaan Jungle and to overthrow Gul'dan.",
        },
        [1849] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 582,
                        title = "Stormshield",
                    },
                    title = "Stormshield",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Survivors of a grisly civil war, these beleaguered arakkoans hope the reclamation of apexis artifacts will hold the key to peacefully rebuilding their civilization.",
        },
        [1850] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 534,
                        title = "Spires of Arak",
                    },
                    title = "Spires of Arak",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Auchindoun",
                    },
                    title = "Auchindoun",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The treacherous wilds of Tanaan Jungle have attracted the craftiest hunters from both Azeroth and Draenor. To defeat the beasts of Tanaan, one must become a beast.",
        },
    },
})
