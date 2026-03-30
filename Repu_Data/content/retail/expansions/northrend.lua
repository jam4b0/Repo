local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1067] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 117,
                        title = "Howling Fjord",
                    },
                    title = "Howling Fjord",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 117,
                        title = "Vengeance Landing",
                    },
                    title = "Forsaken war effort and plague support",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The Forsaken tasked by Sylvanas Windrunner with enacting Undercity's vengeance against Arthas by delivering the latest strain of their deadly Plague.",
        },
        [1068] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 117,
                        title = "Howling Fjord",
                    },
                    title = "Questlines in Howling Fjord",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 117,
                        title = "Explorers' League Outpost",
                    },
                    title = "Artifact recovery and field research",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "This organization seeks to find the origin of the dwarven race by collecting Titan artifacts.  Their most recent research has led them to various archeological sites in Northrend.",
        },
        [1073] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 114,
                        title = "Borean Tundra",
                    },
                    title = "Questlines in Borean Tundra",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 114,
                        title = "Borean Tundra",
                    },
                    title = "Tuskarr dailies and village support",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 117,
                        title = "Kamagua",
                        x = 0.259,
                        y = 0.579,
                    },
                    name = "Tanaika",
                },
            },
            source = "curated",
            summary = "The tuskarr are a tough but peaceful people who derive their livelihood from fishing and whaling.  Their settlements have recently come under fierce attack and welcome any allies who would come to their aid.",
        },
        [1090] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 125,
                        title = "Dalaran",
                    },
                    title = "Dalaran city activities",
                },
                {
                    kind = "Dungeon",
                    location = {
                        mapID = 125,
                        title = "Dalaran",
                    },
                    title = "Northrend dungeons tied to Dalaran",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 125,
                        title = "Dalaran",
                    },
                    title = "Dalaran daily quests and dungeon tasks",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 125,
                        title = "Dalaran",
                        x = 0.256,
                        y = 0.478,
                    },
                    name = "Archmage Alvareaux",
                },
            },
            source = "curated",
            summary = "The mages and archmages running the city of Dalaran.  Faced with the rising threats of the Blue Dragonflight and the Scourge, they've transported their city to the heart of Northrend.",
        },
        [1091] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 115,
                        title = "Dragonblight",
                    },
                    title = "Questlines in Dragonblight",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 115,
                        title = "Wyrmrest Temple",
                        x = 0.599,
                        y = 0.531,
                    },
                    name = "Cielstrasza",
                },
            },
            source = "curated",
            summary = "With the Blue Dragonflight's violent upheaval against all mortal users of magic, the remaining dragonflights have banded under the leadership of the Red Dragonflight to combat their wayward kin.",
        },
        [1098] = {
            activities = {
                {
                    kind = "Dungeon",
                    location = {
                        title = "Halls of Lightning",
                    },
                    title = "Halls of Lightning",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Ulduar",
                    },
                    title = "Ulduar",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 118,
                        title = "The Shadow Vault",
                    },
                    title = "Shadow Vault dailies",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 118,
                        title = "The Shadow Vault",
                        x = 0.430,
                        y = 0.200,
                    },
                    name = "Duchess Mynx",
                },
            },
            source = "curated",
            summary = "Freed from the grasp of the Lich King, his former Death Knights have regrouped against him under the banner of Highlord Darion Mograine.",
        },
        [1104] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 119,
                        title = "Sholazar Basin",
                    },
                    title = "Questlines in Sholazar Basin",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 119,
                        title = "Frenzyheart Hill",
                    },
                    title = "Tribal tasks and basin support",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Driven from their lands by the Scourge, this fierce tribe of wolvar stumbled upon Sholazar Basin, where they intend to make their new home.  Their aggressive nature has put them at odds with the various gorloc tribes known collectively as the Oracles.",
        },
        [1105] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 119,
                        title = "Sholazar Basin",
                    },
                    title = "Questlines in Sholazar Basin",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 119,
                        title = "Rainspeaker Canopy",
                    },
                    title = "Oracle tasks and basin support",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The gorlocs of Sholazar Basin are a race of reptilian creatures who see themselves as guardians of the titan technology that remains in the zone (though they understand little of it).  They find themselves in an escalating territorial war with the wolvar.",
        },
        [1106] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 118,
                        title = "Argent Crusade",
                    },
                    title = "Argent Crusade",
                },
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 118,
                        title = "Eiskrone",
                    },
                    title = "Questlines in Icecrown",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 118,
                        title = "Icecrown",
                    },
                    title = "Icecrown crusade dailies",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 118,
                        title = "Argent Vanguard",
                        x = 0.875,
                        y = 0.756,
                    },
                    name = "Veteran Crusader Aliocha Segard",
                },
            },
            source = "curated",
            summary = "Led by Tirion Fordring, the Argent Crusade combines the reformed Order of the Silver Hand with the Argent Dawn in one final push against the forces of the Lich King.",
        },
        [1119] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 120,
                        title = "The Storm Peaks",
                    },
                    title = "K3 and Storm Peaks questlines",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 120,
                        title = "Dun Niffelem",
                    },
                    title = "Sons of Hodir dailies and relic turn-ins",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 120,
                        title = "Dun Niffelem",
                        x = 0.662,
                        y = 0.614,
                    },
                    name = "Lillehoff",
                },
            },
            source = "curated",
            summary = "The frost giants of the Storm Peaks are a war-like race that makes their home in Dun Niffelem.",
        },
        [1124] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Vault of Archavon",
                    },
                    title = "Vault of Archavon",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 125,
                        title = "Sunreaver's Sanctuary",
                    },
                    title = "Dalaran city support and Sunreaver errands",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Traditionally barred from Dalaran, the Horde has been accepted into the city through the efforts of Archmage Aethas Sunreaver.  His followers have taken up his name and watch over the ward known as Sunreaver's Sanctuary.",
        },
        [1126] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 120,
                        title = "The Storm Peaks",
                    },
                    title = "The Storm Peaks",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 120,
                        title = "Frosthold",
                    },
                    title = "Alliance support and Frostborn field tasks",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "This mysterious race of frost dwarves makes their home in the Storm Peaks.  They've recently befriended members of the Explorers' League and welcome Alliance members within their settlements.",
        },
        [1156] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Icecrown Citadel",
                    },
                    title = "Icecrown Citadel",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 118,
                        title = "Icecrown Citadel",
                    },
                    name = "Alchemist Finklestein",
                },
            },
            source = "curated",
            summary = "Under a pact by Tirion Fordring and Darion Mograine, the Argent Crusade and the Knights of the Ebon Blade have set aside their differences during the attack on Icecrown Citadel until the Lich King is slain.",
        },
    },
})
