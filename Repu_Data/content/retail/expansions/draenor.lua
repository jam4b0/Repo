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
                        title = "Frostfire Ridge",
                    },
                    title = "Frostfire Ridge",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 525,
                        title = "War Mill",
                    },
                    title = "War Mill",
                },
                {
                    kind = "Weekly",
                    location = {
                        mapID = 525,
                        title = "Frostfire Ridge",
                    },
                    title = "Frostfire hub quests and bonus objectives",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 525,
                        title = "Frostfire Ridge",
                    },
                    name = "Beska Redtusk",
                },
            },
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
                {
                    kind = "Recurring",
                    location = {
                        mapID = 534,
                        title = "Veil Terokk / Southport",
                    },
                    title = "Outcast support and apexis work",
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
                {
                    kind = "Recurring",
                    location = {
                        mapID = 582,
                        title = "Shattrath City",
                    },
                    title = "Apexis assault support and city defense work",
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
                {
                    kind = "Recurring",
                    location = {
                        mapID = 550,
                        title = "Nagrand",
                    },
                    title = "Relic turn-ins and repeatable scavenging",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 550,
                        title = "Ruins of Na'gwa",
                        x = 0.504,
                        y = 0.414,
                    },
                    name = "Kwilax Fuseshiv",
                },
            },
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
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 535,
                        title = "Stormshield",
                        x = 0.427,
                        y = 0.764,
                    },
                    name = "Vindicator Nuurem",
                },
            },
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
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 543,
                        title = "Lion's Watch",
                        x = 0.584,
                        y = 0.604,
                    },
                    name = "Vindicator Krethos",
                },
            },
            source = "curated",
            summary = "Yrel has assembled the remaining Exarchs and is calling for a crusade in Velen's name. Together they are working to establish a foothold in Tanaan Jungle and to overthrow Gul'dan.",
        },
        [1848] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 543,
                        title = "Tanaan Jungle",
                    },
                    title = "Tanaan Jungle",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Hellfire Citadel",
                    },
                    title = "Hellfire Citadel",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 534,
                        title = "Vol'mar",
                    },
                    title = "Tanaan daily quests and war campaign support",
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
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 543,
                        title = "Lion's Watch / Vol'mar",
                    },
                    name = "Dawn-Seeker Krisek",
                },
            },
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
                {
                    kind = "Daily",
                    location = {
                        mapID = 543,
                        title = "Fang'rila",
                    },
                    title = "Fang'rila hunting loop",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 543,
                        title = "Fang'rila",
                    },
                    name = "Z'tenga the Walker",
                },
            },
            source = "curated",
            summary = "The treacherous wilds of Tanaan Jungle have attracted the craftiest hunters from both Azeroth and Draenor. To defeat the beasts of Tanaan, one must become a beast.",
        },
    },
})
