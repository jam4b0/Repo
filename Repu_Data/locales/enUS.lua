local api = _G.RepuAPI

if not api or not api.RegisterRetailContentLocale then
    return
end

api.RegisterRetailContentLocale("enUS", {
    factions = {
        [21] = {
            summary = "Retail content for this faction is available in the retail core.",
        },
        [47] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Ironforge",
                },
            },
            summary = "Retail content for this faction is centered on Ironforge.",
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
            summary = "Retail content for this faction is centered on Searing Gorge and Burning Steppes.",
        },
        [68] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Undercity",
                },
            },
            summary = "Retail content for this faction is centered on Undercity.",
        },
        [69] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Darnassus",
                },
            },
            summary = "Retail content for this faction is centered on Darnassus.",
        },
        [72] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Stormwind",
                },
            },
            summary = "Retail content for this faction is centered on Stormwind.",
        },
        [76] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Orgrimmar",
                },
            },
            summary = "Retail content for this faction is centered on Orgrimmar.",
        },
        [81] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Thunder Bluff",
                },
            },
            summary = "Retail content for this faction is centered on Thunder Bluff.",
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
            summary = "Retail content for this faction is centered on Tanaris and Gadgetzan.",
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
            summary = "Retail content for this faction is centered on Northern Barrens and Ratchet.",
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
            summary = "Retail content for this faction is centered on Western Plaguelands and Eastern Plaguelands.",
        },
        [530] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Ashenvale",
                },
            },
            summary = "Retail content for this faction is centered on Ashenvale.",
        },
        [576] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Felwood",
                },
            },
            summary = "Retail content for this faction is centered on Felwood.",
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
            summary = "Retail content for this faction is centered on Winterspring and Everlook.",
        },
        [589] = {
            summary = "Retail content for this faction is available in the retail core.",
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
            summary = "Retail content for this faction is centered on Desolace, Feralas, and Moonglade.",
        },
        [749] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Molten Core",
                },
            },
            summary = "Retail content for this faction is centered on Molten Core.",
        },
        [909] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Darkmoon Island",
                },
            },
            summary = "Retail content for this faction is centered on Darkmoon Island.",
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
            summary = "Retail content for this faction is centered on Temple of Ahn'Qiraj and Ruins of Ahn'Qiraj.",
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
                    title = "The Blutmythosinsel",
                },
            },
            summary = "Retail content for this faction is centered on The Exodar, Azuremyst Isle, and The Blutmythosinsel.",
        },
        [932] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Aldor-tasks in Shattrath",
                },
            },
            summary = "Retail content for this faction is centered on Aldor-tasks in Shattrath.",
        },
        [933] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Nethersturm",
                },
                {
                    kind = "Hub",
                    title = "Area 52",
                },
            },
            summary = "Retail content for this faction is centered on Nethersturm and Area 52.",
        },
        [934] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Scryer tasks in Shattrath",
                },
            },
            summary = "Retail content for this faction is centered on Scryer tasks in Shattrath.",
        },
        [935] = {
            activities = {
                {
                    kind = "City/Instances",
                    title = "Shattrath and temple tasks",
                },
            },
            summary = "Retail content for this faction is centered on Shattrath and temple tasks.",
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
            summary = "Retail content for this faction is centered on Nagrand and Garadar.",
        },
        [942] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zangarmarschen",
                },
                {
                    kind = "Hub",
                    title = "Cenarionszuflucht",
                },
            },
            summary = "Retail content for this faction is centered on Zangarmarschen and Cenarionszuflucht.",
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
            summary = "Retail content for this faction is centered on Hellfire Peninsula and Honor Hold.",
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
            summary = "Retail content for this faction is centered on Hellfire Peninsula and The Shattered Halls.",
        },
        [967] = {
            summary = "Retail content for this faction is available in the retail core.",
        },
        [970] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zangarmarschen",
                },
                {
                    kind = "Hub",
                    title = "Sporeggar",
                },
            },
            summary = "Retail content for this faction is centered on Zangarmarschen and Sporeggar.",
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
            summary = "Retail content for this faction is centered on Nagrand and Telaar.",
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
            summary = "Retail content for this faction is centered on Old Hillsbrad Foothills and The Black Morass.",
        },
        [990] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Hyjal Summit",
                },
            },
            summary = "Retail content for this faction is centered on Hyjal Summit.",
        },
        [1011] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Lower City tasks",
                },
            },
            summary = "Retail content for this faction is centered on Lower City tasks.",
        },
        [1012] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenmondtal",
                },
                {
                    kind = "Raid",
                    title = "Black Temple",
                },
            },
            summary = "Retail content for this faction is centered on Schattenmondtal and Black Temple.",
        },
        [1015] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenmondtal",
                },
                {
                    kind = "Hub",
                    title = "Netherwing Ledge",
                },
            },
            summary = "Retail content for this faction is centered on Schattenmondtal and Netherwing Ledge.",
        },
        [1031] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schergrat",
                },
                {
                    kind = "Daily/Repeatable",
                    title = "Skyguard-tasks",
                },
            },
            summary = "Retail content for this faction is centered on Schergrat and Skyguard-tasks.",
        },
        [1038] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schergrat",
                },
                {
                    kind = "Hub",
                    title = "Ogri'la",
                },
            },
            summary = "Retail content for this faction is centered on Schergrat and Ogri'la.",
        },
        [1067] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Howling Fjord",
                },
            },
            summary = "Retail content for this faction is centered on Howling Fjord.",
        },
        [1068] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Howling Fjord",
                },
            },
            summary = "Retail content for this faction is centered on Questlines in Howling Fjord.",
        },
        [1073] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Borean Tundra",
                },
            },
            summary = "Retail content for this faction is centered on Questlines in Borean Tundra.",
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
            summary = "Retail content for this faction is centered on Isle of Quel'Danas and Quel'Danas dailies.",
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
            summary = "Retail content for this faction is centered on Dalaran city activities and Northrend-Dungeons mit Dalaran-Bezug.",
        },
        [1091] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Dragonblight",
                },
            },
            summary = "Retail content for this faction is centered on Questlines in Dragonblight.",
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
            summary = "Retail content for this faction is centered on Halls of Lightning and Ulduar.",
        },
        [1104] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Sholazar Basin",
                },
            },
            summary = "Retail content for this faction is centered on Questlines in Sholazar Basin.",
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
            summary = "Retail content for this faction is centered on Questlines in Zul'Drak and Gandrak.",
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
            summary = "Retail content for this faction is centered on Argent Crusade and Questlines in Icecrown.",
        },
        [1119] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "K3 and Storm Peaks questlines",
                },
            },
            summary = "Retail content for this faction is centered on K3 and Storm Peaks questlines.",
        },
        [1124] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Vault of Archavon",
                },
            },
            summary = "Retail content for this faction is centered on Vault of Archavon.",
        },
        [1126] = {
            activities = {
                {
                    kind = "Zone",
                    title = "The Storm Peaks",
                },
            },
            summary = "Retail content for this faction is centered on The Storm Peaks.",
        },
        [1133] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Azshara",
                },
            },
            summary = "Retail content for this faction is centered on Azshara.",
        },
        [1134] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Gilneas",
                },
            },
            summary = "Retail content for this faction is centered on Gilneas.",
        },
        [1156] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Icecrown Citadel",
                },
            },
            summary = "Retail content for this faction is centered on Icecrown Citadel.",
        },
        [1158] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Hyjal",
                },
            },
            summary = "Retail content for this faction is centered on Hyjal.",
        },
        [1171] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tiefenheim",
                },
            },
            summary = "Retail content for this faction is centered on Tiefenheim.",
        },
        [1172] = {
            summary = "Retail content for this faction is available in the retail core.",
        },
        [1173] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Uldum",
                },
            },
            summary = "Retail content for this faction is centered on Uldum.",
        },
        [1174] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenhochland",
                },
            },
            summary = "Retail content for this faction is centered on Schattenhochland.",
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
            summary = "Retail content for this faction is centered on Tol Barad and Halbinsel von Tol Barad.",
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
            summary = "Retail content for this faction is centered on Tol Barad and Halbinsel von Tol Barad.",
        },
        [1204] = {
            summary = "Retail content for this faction is available in the retail core.",
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
            summary = "Retail content for this faction is centered on Vale of Eternal Blossoms and Mogu'shan Palace.",
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
            summary = "Retail content for this faction is centered on Questlines in the Jade Forest and Shado-Pan Monastery.",
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
            summary = "Retail content for this faction is centered on Questlines in Dread Wastes and Heart of Fear.",
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
            summary = "Retail content for this faction is centered on Valley of the Four Winds and Halbhuegel.",
        },
        [1302] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Krasarang Wilds",
                },
            },
            summary = "Retail content for this faction is centered on Questlines in Krasarang Wilds.",
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
            summary = "Retail content for this faction is centered on Dread Wastes, Klaxxi'vess, and Heart of Fear.",
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
            summary = "Retail content for this faction is centered on Vale of Eternal Blossoms and Wrathion-Endgame.",
        },
        [1375] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Shrine of Two Moons",
                },
            },
            summary = "Retail content for this faction is centered on Shrine of Two Moons.",
        },
        [1376] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Shrine of Seven Stars",
                },
            },
            summary = "Retail content for this faction is centered on Shrine of Seven Stars.",
        },
        [1387] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of Thunder",
                },
            },
            summary = "Retail content for this faction is centered on Isle of Thunder.",
        },
        [1388] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of Thunder",
                },
            },
            summary = "Retail content for this faction is centered on Isle of Thunder.",
        },
        [1416] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenmondtal",
                },
                {
                    kind = "Raid",
                    title = "Black Temple",
                },
            },
            summary = "Retail content for this faction is centered on Schattenmondtal and Black Temple.",
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
            summary = "Retail content for this faction is centered on Isle of the Thunder King and Throne of Thander.",
        },
        [1445] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Frostfeuergrat",
                },
                {
                    kind = "Hub",
                    title = "War Mill",
                },
            },
            summary = "Retail content for this faction is centered on Frostfeuergrat and War Mill.",
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
            summary = "Retail content for this faction is centered on Zeitlose Insel and Siege of Orgrimmar.",
        },
        [1515] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Spires of Arak",
                },
            },
            summary = "Retail content for this faction is centered on Spires of Arak.",
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
            summary = "Retail content for this faction is centered on Moonfall and Outpost of the Awakened.",
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
            summary = "Retail content for this faction is centered on Gorgrond and Grimrail Depot.",
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
            summary = "Retail content for this faction is centered on Nagrand and Shadowmoon Burial Groands.",
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
            summary = "Retail content for this faction is centered on Highmountain and Neltharion's Lair.",
        },
        [1847] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Warspear",
                },
            },
            summary = "Retail content for this faction is centered on Warspear.",
        },
        [1848] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tanaan-Dschungel",
                },
                {
                    kind = "Raid",
                    title = "Hellfire Citadel",
                },
            },
            summary = "Retail content for this faction is centered on Tanaan-Dschungel and Hellfire Citadel.",
        },
        [1849] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Stormshield",
                },
            },
            summary = "Retail content for this faction is centered on Stormshield.",
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
            summary = "Retail content for this faction is centered on Spires of Arak and Auchindoun.",
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
            summary = "Retail content for this faction is centered on Suramar-Kampagne and Shal'Aran.",
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
            summary = "Retail content for this faction is centered on Legion-Dalaran and Krasus' Landing.",
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
            summary = "Retail content for this faction is centered on Broken Shore and Tomb of Sargeras.",
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
            summary = "Retail content for this faction is centered on Azsuna and Eye of Azshara.",
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
            summary = "Retail content for this faction is centered on Sturmheim and Haimont.",
        },
        [2045] = {
            activities = {
                {
                    kind = "Dungeon",
                    title = "Vault of the Wardens",
                },
            },
            summary = "Retail content for this faction is centered on Vault of the Wardens.",
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
            summary = "Retail content for this faction is centered on Time Rifts and Temporal side activities.",
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
            summary = "Retail content for this faction is centered on Zuldazar and Dazar'alor.",
        },
        [2158] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Vol'dun",
                },
            },
            summary = "Retail content for this faction is centered on Vol'dun.",
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
            summary = "Retail content for this faction is centered on Tiragardesand and Boralus.",
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
            summary = "Retail content for this faction is centered on Drustvar and Waycrest Manor.",
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
            summary = "Retail content for this faction is centered on Stormsong Valley and Shrine of the Storm.",
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
            summary = "Retail content for this faction is centered on Krokuun and Argus activities.",
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
            summary = "Retail content for this faction is centered on Argus activities and Antorus, the Burning Throne.",
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
            summary = "Retail content for this faction is centered on Mezzamere and Nazjatar.",
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
            summary = "Retail content for this faction is centered on Mechagon and Rostbolzen.",
        },
        [2395] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Sturmsangtal side content",
                },
            },
            summary = "Retail content for this faction is centered on Sturmsangtal side content.",
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
            summary = "Retail content for this faction is centered on Bastion and Spires of Ascension.",
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
            summary = "Retail content for this faction is centered on Maldraxxus and Theater of Pain.",
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
            summary = "Retail content for this faction is centered on Revendreth and Halls of Atonement.",
        },
        [2415] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Ny'alotha, the Waking City",
                },
            },
            summary = "Retail content for this faction is centered on Ny'alotha, the Waking City.",
        },
        [2417] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Uldum",
                },
            },
            summary = "Retail content for this faction is centered on Uldum.",
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
                {
                    kind = "Recurring",
                    title = "Maw activities",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Ve'nari",
                },
            },
            summary = "Retail content for this faction is centered on The Maw, Ve'naris Zuflucht, and Maw activities.",
        },
        [2439] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Absolution Crypt",
                },
                {
                    kind = "Recurring",
                    title = "Sinstone turn-ins",
                },
                {
                    kind = "Zone",
                    title = "Revendreth side content",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Archivist Janeera",
                },
            },
            summary = "Retail content for this faction is centered on Absolution Crypt, Sinstone turn-ins, and Revendreth side content.",
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
            summary = "Retail content for this faction is centered on Ardenweald and Mists of Tirna Scithe.",
        },
        [2465] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Ardenweald",
                },
                {
                    kind = "Recurring",
                    title = "Callings and side objectives",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Aithlyn",
                },
                {
                    label = "Quartermaster",
                    name = "Liawyn",
                },
            },
            summary = "Retail content for this faction is centered on Ardenweald and Callings and side objectives.",
        },
        [2470] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Sanctum of Domination",
                },
            },
            summary = "Retail content for this faction is centered on Sanctum of Domination.",
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
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Archivist Roh-Suir",
                },
            },
            summary = "Retail content for this faction is centered on Korthia, Keeper's Respite, and Relic research.",
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
            summary = "Retail content for this faction is centered on Zereth Mortis and Haven.",
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
                {
                    kind = "Hub",
                    title = "Maruukai",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Quartermaster Huseng",
                },
            },
            summary = "Retail content for this faction is centered on Grand Hunt, Ohn'ahran Plains, and Maruukai.",
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
                {
                    kind = "Zone",
                    title = "Forbidden Reach",
                },
                {
                    kind = "Hub",
                    title = "Dragonscale Basecamp",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Cataloger Jakes",
                },
            },
            summary = "Retail content for this faction is centered on Siege on Dragonbane Keep, The Waking Shores, and Forbidden Reach.",
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
                {
                    kind = "Recurring",
                    title = "Story and world quests",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Unatos",
                },
            },
            summary = "Retail content for this faction is centered on Valdrakken, Thaldraszus, and Story and world quests.",
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
                {
                    kind = "Hub",
                    title = "Iskaara",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Murik",
                },
            },
            summary = "Retail content for this faction is centered on Community Feast, The Azure Span, and Iskaara.",
        },
        [2517] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Waking Shores black dragonflight content",
                },
            },
            summary = "Retail content for this faction is centered on Waking Shores black dragonflight content.",
        },
        [2518] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Waking Shores black dragonflight content",
                },
            },
            summary = "Retail content for this faction is centered on Waking Shores black dragonflight content.",
        },
        [2523] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Obsidian side content",
                },
            },
            summary = "Retail content for this faction is centered on Obsidian side content.",
        },
        [2524] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Obsidian side content",
                },
            },
            summary = "Retail content for this faction is centered on Obsidian side content.",
        },
        [2526] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Azure Span side quests",
                },
            },
            summary = "Retail content for this faction is centered on Azure Span side quests.",
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
            summary = "Retail content for this faction is centered on Azure Span side content.",
        },
        [2553] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "When Time Needs Mending",
                },
                {
                    kind = "Recurring",
                    title = "Time Rifts",
                },
            },
            quartermasters = {
                {
                    label = "Rift Vendor",
                    name = "Soridormi",
                },
            },
            summary = "Retail content for this faction is centered on When Time Needs Mending and Time Rifts.",
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
            summary = "Retail content for this faction is centered on Loamm, Sniffenseeking, and Zaralek world content.",
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
            summary = "Retail content for this faction is centered on Spreading the Light and World quests in Hallowfall.",
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
            summary = "Retail content for this faction is centered on Central Encampment, Emerald Dream world content, and Story chapters in the Dream.",
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
            summary = "Retail content for this faction is centered on World quests on the Isle of Dorn and Story and side chapters in Dornogal.",
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
            summary = "Retail content for this faction is centered on World quests in The Ringing Deeps and Story and side chapters in Gundargaz.",
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
            summary = "Retail content for this faction is centered on Weekly pact and World quests in Azj-Kahet.",
        },
        [2601] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pact of the Weaver",
                },
            },
            summary = "Retail content for this faction is centered on Pact of the Weaver.",
        },
        [2605] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pact of the General",
                },
            },
            summary = "Retail content for this faction is centered on Pact of the General.",
        },
        [2607] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pact of the Vizier",
                },
            },
            summary = "Retail content for this faction is centered on Pact of the Vizier.",
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
            summary = "Retail content for this faction is centered on Azerothian Archives and Archive activities in Tyrhold.",
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
            summary = "Retail content for this faction is centered on Weekly cartel contract and C.H.E.T.T.-Liste.",
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
            summary = "Retail content for this faction is centered on K'aresh campaign and K'aresh world content.",
        },
        [2671] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Venture Company",
                },
            },
            summary = "Retail content for this faction is centered on Kartellwahl: Venture Company.",
        },
        [2673] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Bilgewasserkartell",
                },
            },
            summary = "Retail content for this faction is centered on Kartellwahl: Bilgewasserkartell.",
        },
        [2675] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Schwarzmeer AG",
                },
            },
            summary = "Retail content for this faction is centered on Kartellwahl: Schwarzmeer AG.",
        },
        [2677] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Dampfdruckkartell",
                },
            },
            summary = "Retail content for this faction is centered on Kartellwahl: Dampfdruckkartell.",
        },
        [2685] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Garbagio Treueclub",
                },
            },
            summary = "Retail content for this faction is centered on Kartellwahl: Garbagio Treueclub.",
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
            summary = "Retail content for this faction is centered on Hallowfall defense activities and Mereldar call to arms.",
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
            summary = "Retail content for this faction is centered on Zul'Aman-Kampagne and Local tasks in the Amani area.",
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
            summary = "Retail content for this faction is centered on Leerensturm-Kampagne and Local tasks in Voidstorm.",
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
            summary = "Retail content for this faction is centered on Harandar-Kampagne and Local tasks in Harandar.",
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
            summary = "Retail content for this faction is centered on Saltherils Soiree.",
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
            summary = "Retail content for this faction is centered on Saltherils Soiree.",
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
            summary = "Retail content for this faction is centered on Saltherils Soiree.",
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
            summary = "Retail content for this faction is centered on Saltherils Soiree.",
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
            summary = "Retail content for this faction is centered on Saltherils Soiree.",
        },
        [2736] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Manaforge sabotage operations",
                },
            },
            summary = "Retail content for this faction is centered on Manaforge sabotage operations.",
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
            summary = "Retail content for this faction is centered on Voidstorm and Obskurionzitadelle.",
        },
        [9000111] = {
            activities = {
                {
                    kind = "Cluster",
                    title = "Shattrath city factions",
                },
            },
            summary = "Retail content for this faction is centered on Shattrath city factions.",
        },
    },
})
