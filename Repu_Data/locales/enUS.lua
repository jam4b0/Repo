local api = _G.RepuAPI

if not api or not api.RegisterLocaleDomain then
    return
end

api.RegisterLocaleDomain("retail_content", "enUS", {
    factions = {
        [21] = {
        },
        [47] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Ironforge",
                },
            },
        },
        [59] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Searing Gorge",
                },
                {
                    kind = "Zone/City",
                    title = "Burning Steppes",
                },
            },
        },
        [68] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Undercity",
                },
            },
        },
        [69] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Darnassus",
                },
            },
        },
        [72] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Stormwind",
                },
            },
        },
        [76] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Orgrimmar",
                },
            },
        },
        [81] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Thunder Bluff",
                },
            },
        },
        [369] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Tanaris",
                },
                {
                    kind = "Zone/City",
                    title = "Gadgetzan",
                },
            },
        },
        [470] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Northern Barrens",
                },
                {
                    kind = "Zone/City",
                    title = "Ratchet",
                },
            },
        },
        [529] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Western Plaguelands",
                },
                {
                    kind = "Zone/City",
                    title = "Eastern Plaguelands",
                },
            },
        },
        [530] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Ashenvale",
                },
            },
        },
        [576] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Felwood",
                },
            },
        },
        [577] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Winterspring",
                },
                {
                    kind = "Zone/City",
                    title = "Everlook",
                },
            },
        },
        [589] = {
        },
        [609] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Desolace",
                },
                {
                    kind = "Zone/City",
                    title = "Feralas",
                },
                {
                    kind = "Zone/City",
                    title = "Moonglade",
                },
                {
                    kind = "Zone/City",
                    title = "Silithus",
                },
            },
        },
        [749] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Molten Core",
                },
            },
        },
        [909] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Darkmoon Island",
                },
            },
        },
        [910] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Temple of Ahn'Qiraj",
                },
                {
                    kind = "Raid",
                    title = "Ruins of Ahn'Qiraj",
                },
            },
        },
        [930] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "The Exodar",
                },
                {
                    kind = "Zone/City",
                    title = "Azuremyst Isle",
                },
                {
                    kind = "Zone/City",
                    title = "Bloodmyst Isle",
                },
            },
        },
        [932] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Aldor-tasks in Shattrath",
                },
            },
        },
        [933] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Netherstorm",
                },
                {
                    kind = "Hub",
                    title = "Area 52",
                },
            },
        },
        [934] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Scryer tasks in Shattrath",
                },
            },
        },
        [935] = {
            activities = {
                {
                    kind = "City/Instances",
                    title = "Shattrath and temple tasks",
                },
            },
        },
        [941] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Nagrand",
                },
                {
                    kind = "Hub",
                    title = "Garadar",
                },
            },
        },
        [942] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zangarmarsh",
                },
                {
                    kind = "Hub",
                    title = "Cenarion Refuge",
                },
            },
        },
        [946] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Hellfire Peninsula",
                },
                {
                    kind = "Hub",
                    title = "Honor Hold",
                },
            },
        },
        [947] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Hellfire Peninsula",
                },
                {
                    kind = "Dungeon",
                    title = "The Shattered Halls",
                },
            },
        },
        [967] = {
        },
        [970] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zangarmarsh",
                },
                {
                    kind = "Hub",
                    title = "Sporeggar",
                },
            },
        },
        [978] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Nagrand",
                },
                {
                    kind = "Hub",
                    title = "Telaar",
                },
            },
        },
        [989] = {
            activities = {
                {
                    kind = "Dungeon",
                    title = "Old Hillsbrad Foothills",
                },
                {
                    kind = "Dungeon",
                    title = "The Black Morass",
                },
            },
        },
        [990] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Hyjal Summit",
                },
            },
        },
        [1011] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Lower City tasks",
                },
            },
        },
        [1012] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Shadowmoon Valley",
                },
                {
                    kind = "Raid",
                    title = "Black Temple",
                },
            },
        },
        [1015] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Shadowmoon Valley",
                },
                {
                    kind = "Hub",
                    title = "Netherwing Ledge",
                },
            },
        },
        [1031] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Blade's Edge Mountains",
                },
                {
                    kind = "Daily/Repeatable",
                    title = "Skyguard-tasks",
                },
            },
        },
        [1038] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Blade's Edge Mountains",
                },
                {
                    kind = "Hub",
                    title = "Ogri'la",
                },
            },
        },
        [1067] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Howling Fjord",
                },
            },
        },
        [1068] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Howling Fjord",
                },
            },
        },
        [1073] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Borean Tundra",
                },
            },
        },
        [1077] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of Quel'Danas",
                },
                {
                    kind = "Daily",
                    title = "Quel'Danas dailies",
                },
            },
        },
        [1090] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Dalaran city activities",
                },
                {
                    kind = "Dungeon",
                    title = "Northrend-Dungeons mit Dalaran-Bezug",
                },
            },
        },
        [1091] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Dragonblight",
                },
            },
        },
        [1098] = {
            activities = {
                {
                    kind = "Dungeon",
                    title = "Halls of Lightning",
                },
                {
                    kind = "Raid",
                    title = "Ulduar",
                },
            },
        },
        [1104] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Sholazar Basin",
                },
            },
        },
        [1105] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Zul'Drak",
                },
                {
                    kind = "Dungeon",
                    title = "Gandrak",
                },
            },
        },
        [1106] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Argent Crusade",
                },
                {
                    kind = "Story/Zone",
                    title = "Questlines in Icecrown",
                },
            },
        },
        [1119] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "K3 and Storm Peaks questlines",
                },
            },
        },
        [1124] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Vault of Archavon",
                },
            },
        },
        [1126] = {
            activities = {
                {
                    kind = "Zone",
                    title = "The Storm Peaks",
                },
            },
        },
        [1133] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Azshara",
                },
            },
        },
        [1134] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Gilneas",
                },
            },
        },
        [1156] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Icecrown Citadel",
                },
            },
        },
        [1158] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Hyjal",
                },
            },
        },
        [1171] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tiefenheim",
                },
            },
        },
        [1172] = {
        },
        [1173] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Uldum",
                },
            },
        },
        [1174] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenhochland",
                },
            },
        },
        [1177] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tol Barad",
                },
                {
                    kind = "Zone",
                    title = "Halbinsel von Tol Barad",
                },
            },
        },
        [1178] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tol Barad",
                },
                {
                    kind = "Zone",
                    title = "Halbinsel von Tol Barad",
                },
            },
        },
        [1204] = {
        },
        [1269] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Vale of Eternal Blossoms",
                },
                {
                    kind = "Dungeon",
                    title = "Mogu'shan Palace",
                },
            },
        },
        [1270] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in the Jade Forest",
                },
                {
                    kind = "Dungeon",
                    title = "Shado-Pan Monastery",
                },
            },
        },
        [1271] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Dread Wastes",
                },
                {
                    kind = "Raid",
                    title = "Heart of Fear",
                },
            },
        },
        [1272] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Valley of the Four Winds",
                },
                {
                    kind = "Hub",
                    title = "Halbhuegel",
                },
            },
        },
        [1302] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Krasarang Wilds",
                },
            },
        },
        [1337] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Dread Wastes",
                },
                {
                    kind = "Hub",
                    title = "Klaxxi'vess",
                },
                {
                    kind = "Raid",
                    title = "Heart of Fear",
                },
            },
        },
        [1359] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Vale of Eternal Blossoms",
                },
                {
                    kind = "Story",
                    title = "Wrathion-Endgame",
                },
            },
        },
        [1375] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Shrine of Two Moons",
                },
            },
        },
        [1376] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Shrine of Seven Stars",
                },
            },
        },
        [1387] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of Thunder",
                },
            },
        },
        [1388] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of Thunder",
                },
            },
        },
        [1416] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Shadowmoon Valley",
                },
                {
                    kind = "Raid",
                    title = "Black Temple",
                },
            },
        },
        [1435] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of the Thunder King",
                },
                {
                    kind = "Raid",
                    title = "Throne of Thander",
                },
            },
        },
        [1445] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Frostfire Ridge",
                },
                {
                    kind = "Hub",
                    title = "War Mill",
                },
            },
        },
        [1492] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zeitlose Insel",
                },
                {
                    kind = "Raid",
                    title = "Siege of Orgrimmar",
                },
            },
        },
        [1515] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Spires of Arak",
                },
            },
        },
        [1710] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Moonfall",
                },
                {
                    kind = "Hub",
                    title = "Outpost of the Awakened",
                },
            },
        },
        [1711] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Gorgrond",
                },
                {
                    kind = "Dungeon",
                    title = "Grimrail Depot",
                },
            },
        },
        [1731] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Nagrand",
                },
                {
                    kind = "Dungeon",
                    title = "Shadowmoon Burial Groands",
                },
            },
        },
        [1828] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Highmountain",
                },
                {
                    kind = "Dungeon",
                    title = "Neltharion's Lair",
                },
            },
        },
        [1847] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Warspear",
                },
            },
        },
        [1848] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tanaan Jungle",
                },
                {
                    kind = "Raid",
                    title = "Hellfire Citadel",
                },
            },
        },
        [1849] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Stormshield",
                },
            },
        },
        [1850] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Spires of Arak",
                },
                {
                    kind = "Dungeon",
                    title = "Auchindoun",
                },
            },
        },
        [1859] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Suramar-Kampagne",
                },
                {
                    kind = "Hub",
                    title = "Shal'Aran",
                },
            },
        },
        [1883] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Legion-Dalaran",
                },
                {
                    kind = "Hub",
                    title = "Krasus' Landing",
                },
            },
        },
        [1894] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Broken Shore",
                },
                {
                    kind = "Raid",
                    title = "Tomb of Sargeras",
                },
            },
        },
        [1900] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Azsuna",
                },
                {
                    kind = "Dungeon",
                    title = "Eye of Azshara",
                },
            },
        },
        [1948] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Sturmheim",
                },
                {
                    kind = "Hub",
                    title = "Haimont",
                },
            },
        },
        [2045] = {
            activities = {
                {
                    kind = "Dungeon",
                    title = "Vault of the Wardens",
                },
            },
        },
        [2135] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Time Rifts",
                },
                {
                    kind = "Zone",
                    title = "Temporal side activities",
                },
            },
        },
        [2157] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zuldazar",
                },
                {
                    kind = "Hub",
                    title = "Dazar'alor",
                },
            },
        },
        [2158] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Vol'dun",
                },
            },
        },
        [2160] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tiragardesand",
                },
                {
                    kind = "Hub",
                    title = "Boralus",
                },
            },
        },
        [2161] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Drustvar",
                },
                {
                    kind = "Dungeon",
                    title = "Waycrest Manor",
                },
            },
        },
        [2162] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Stormsong Valley",
                },
                {
                    kind = "Dungeon",
                    title = "Shrine of the Storm",
                },
            },
        },
        [2165] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Krokuun",
                },
                {
                    kind = "Zone",
                    title = "Argus activities",
                },
            },
        },
        [2170] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Argus activities",
                },
                {
                    kind = "Raid",
                    title = "Antorus, the Burning Throne",
                },
            },
        },
        [2370] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Neueheim",
                },
                {
                    kind = "Zone",
                    title = "Nazjatar",
                },
            },
            summary = "Retail content for this faction is centered on Neueheim and Nazjatar.",
        },
        [2373] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Mezzamere",
                },
                {
                    kind = "Zone",
                    title = "Nazjatar",
                },
            },
        },
        [2391] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Mechagon",
                },
                {
                    kind = "Hub",
                    title = "Rostbolzen",
                },
            },
        },
        [2395] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Sturmsangtal side content",
                },
            },
        },
        [2407] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Bastion",
                },
                {
                    kind = "Dungeon",
                    title = "Spires of Ascension",
                },
            },
        },
        [2410] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Maldraxxus",
                },
                {
                    kind = "Dungeon",
                    title = "Theater of Pain",
                },
            },
        },
        [2413] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Revendreth",
                },
                {
                    kind = "Dungeon",
                    title = "Halls of Atonement",
                },
            },
        },
        [2415] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Ny'alotha, the Waking City",
                },
            },
        },
        [2417] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Uldum",
                },
            },
        },
        [2432] = {
            activities = {
                {
                    kind = "Zone",
                    title = "The Maw",
                },
                {
                    kind = "Hub",
                    title = "Ve'naris Zuflucht",
                },
            },
        },
        [2439] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Absolution Crypt",
                },
            },
        },
        [2464] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Ardenweald",
                },
                {
                    kind = "Dungeon",
                    title = "Mists of Tirna Scithe",
                },
            },
        },
        [2465] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Ardenweald",
                },
            },
        },
        [2470] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Sanctum of Domination",
                },
            },
        },
        [2472] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Korthia",
                },
                {
                    kind = "Hub",
                    title = "Keeper's Respite",
                },
                {
                    kind = "Recurring",
                    title = "Relic research",
                },
            },
        },
        [2478] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zereth Mortis",
                },
                {
                    kind = "Hub",
                    title = "Haven",
                },
            },
        },
        [2503] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Grand Hunt",
                },
                {
                    kind = "Zone",
                    title = "Ohn'ahran Plains",
                },
            },
        },
        [2507] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Siege on Dragonbane Keep",
                },
                {
                    kind = "Zone",
                    title = "The Waking Shores",
                },
            },
        },
        [2510] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Valdrakken",
                },
                {
                    kind = "Zone",
                    title = "Thaldraszus",
                },
            },
        },
        [2511] = {
            activities = {
                {
                    kind = "Weekly/Event",
                    title = "Community Feast",
                },
                {
                    kind = "Zone",
                    title = "The Azure Span",
                },
            },
        },
        [2517] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Waking Shores black dragonflight content",
                },
            },
        },
        [2518] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Waking Shores black dragonflight content",
                },
            },
        },
        [2523] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Obsidian side content",
                },
            },
        },
        [2524] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Obsidian side content",
                },
            },
        },
        [2526] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Azure Span side quests",
                },
            },
        },
        [2544] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Valdrakken professions hub",
                },
            },
            summary = "Retail content for this faction is centered on Valdrakken professions hub.",
        },
        [2550] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Azure Span side content",
                },
            },
        },
        [2553] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "When Time Needs Mending",
                },
            },
        },
        [2564] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Loamm",
                },
                {
                    kind = "Weekly",
                    title = "Sniffenseeking",
                },
                {
                    kind = "Zone",
                    title = "Zaralek world content",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Mimuup",
                },
            },
        },
        [2570] = {
            activities = {
                {
                    kind = "Weekly/Event",
                    title = "Spreading the Light",
                },
                {
                    kind = "World quests",
                    title = "World quests in Hallowfall",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Auralia Steelstrike",
                },
            },
        },
        [2574] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Central Encampment",
                },
                {
                    kind = "Zone",
                    title = "Emerald Dream world content",
                },
                {
                    kind = "Story",
                    title = "Story chapters in the Dream",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Pipsee",
                },
            },
        },
        [2590] = {
            activities = {
                {
                    kind = "World quests",
                    title = "World quests on the Isle of Dorn",
                },
                {
                    kind = "One-time/Warband",
                    title = "Story and side chapters in Dornogal",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Auditor Balwurz",
                },
            },
        },
        [2594] = {
            activities = {
                {
                    kind = "World quests",
                    title = "World quests in The Ringing Deeps",
                },
                {
                    kind = "One-time/Warband",
                    title = "Story and side chapters in Gundargaz",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Waxmonger Squick",
                },
            },
        },
        [2600] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Weekly pact",
                },
                {
                    kind = "World quests",
                    title = "World quests in Azj-Kahet",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Y'tekhi",
                },
            },
        },
        [2601] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pact of the Weaver",
                },
            },
        },
        [2605] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pact of the General",
                },
            },
        },
        [2607] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pact of the Vizier",
                },
            },
        },
        [2615] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Azerothian Archives",
                },
                {
                    kind = "Zone",
                    title = "Archive activities in Tyrhold",
                },
            },
        },
        [2653] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Weekly cartel contract",
                },
                {
                    kind = "Weekly",
                    title = "C.H.E.T.T.-Liste",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Smaks Topskimmer",
                },
            },
        },
        [2658] = {
            activities = {
                {
                    kind = "Story",
                    title = "K'aresh campaign",
                },
                {
                    kind = "Zone",
                    title = "K'aresh world content",
                },
            },
        },
        [2671] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Venture Company",
                },
            },
        },
        [2673] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Bilgewasserkartell",
                },
            },
        },
        [2675] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Schwarzmeer AG",
                },
            },
        },
        [2677] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Dampfdruckkartell",
                },
            },
        },
        [2685] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Garbagio Treueclub",
                },
            },
        },
        [2688] = {
            activities = {
                {
                    kind = "Zone/Event",
                    title = "Hallowfall defense activities",
                },
                {
                    kind = "Recurring",
                    title = "Mereldar call to arms",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Raen Dawncavalyr",
                },
            },
        },
        [2696] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Zul'Aman-Kampagne",
                },
                {
                    kind = "Zone",
                    title = "Local tasks in the Amani area",
                },
            },
        },
        [2699] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Leerensturm-Kampagne",
                },
                {
                    kind = "Zone",
                    title = "Local tasks in Voidstorm",
                },
            },
        },
        [2704] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Harandar-Kampagne",
                },
                {
                    kind = "Zone",
                    title = "Local tasks in Harandar",
                },
            },
        },
        [2710] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Magister",
                    name = "Lehrling Diell",
                },
                {
                    label = "Blood Knight",
                    name = "Armorsmith Goldcrest",
                },
                {
                    label = "Lane Warden",
                    name = "Neriv",
                },
                {
                    label = "Wayfarer",
                    name = "Ranger Allorn",
                },
            },
        },
        [2711] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Lehrling Diell",
                },
            },
        },
        [2712] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Armorsmith Goldcrest",
                },
            },
        },
        [2713] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Ranger Allorn",
                },
            },
        },
        [2714] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Neriv",
                },
            },
        },
        [2736] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Manaforge sabotage operations",
                },
            },
        },
        [2770] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Voidstorm",
                },
                {
                    kind = "Hub",
                    title = "Obskurionzitadelle",
                },
            },
        },
        [9000111] = {
            activities = {
                {
                    kind = "Cluster",
                    title = "Shattrath city factions",
                },
            },
        },
    },
})
