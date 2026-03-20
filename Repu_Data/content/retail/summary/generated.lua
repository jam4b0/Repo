local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [21] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is available in the retail core.",
        },
        [589] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is available in the retail core.",
        },
        [933] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Nethersturm and Area 52.",
        },
        [941] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Nagrand and Garadar.",
        },
        [942] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Zangarmarschen and Cenarionszuflucht.",
        },
        [947] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Hellfire Peninsula and The Shattered Halls.",
        },
        [967] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is available in the retail core.",
        },
        [978] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Nagrand and Telaar.",
        },
        [989] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Old Hillsbrad Foothills and The Black Morass.",
        },
        [1012] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Schattenmondtal and Black Temple.",
        },
        [1038] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Schergrat and Ogri'la.",
        },
        [1068] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Questlines in Howling Fjord.",
        },
        [1073] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Questlines in Borean Tundra.",
        },
        [1090] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Dalaran city activities and Northrend-Dungeons mit Dalaran-Bezug.",
        },
        [1091] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Questlines in Dragonblight.",
        },
        [1098] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Halls of Lightning and Ulduar.",
        },
        [1104] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Questlines in Sholazar Basin.",
        },
        [1105] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Questlines in Zul'Drak and Gandrak.",
        },
        [1106] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Argent Crusade and Questlines in Icecrown.",
        },
        [1119] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on K3 and Storm Peaks questlines.",
        },
        [1124] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Vault of Archavon.",
        },
        [1156] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Icecrown Citadel.",
        },
        [1172] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is available in the retail core.",
        },
        [1177] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Tol Barad and Halbinsel von Tol Barad.",
        },
        [1204] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is available in the retail core.",
        },
        [1269] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Vale of Eternal Blossoms and Mogu'shan Palace.",
        },
        [1270] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Questlines in the Jade Forest and Shado-Pan Monastery.",
        },
        [1271] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Questlines in Dread Wastes and Heart of Fear.",
        },
        [1272] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Valley of the Four Winds and Halbhuegel.",
        },
        [1302] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Questlines in Krasarang Wilds.",
        },
        [1375] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Shrine of Two Moons.",
        },
        [1376] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Shrine of Seven Stars.",
        },
        [1387] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Isle of Thunder.",
        },
        [1435] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Isle of the Thunder King and Throne of Thander.",
        },
        [1445] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Frostfeuergrat and War Mill.",
        },
        [1492] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Zeitlose Insel and Siege of Orgrimmar.",
        },
        [1710] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Moonfall and Outpost of the Awakened.",
        },
        [1711] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Gorgrond and Grimrail Depot.",
        },
        [1731] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Nagrand and Shadowmoon Burial Groands.",
        },
        [1828] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Highmountain and Neltharion's Lair.",
        },
        [1847] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Warspear.",
        },
        [1848] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Tanaan-Dschungel and Hellfire Citadel.",
        },
        [1849] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Stormshield.",
        },
        [1850] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Spires of Arak and Auchindoun.",
        },
        [1859] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Suramar-Kampagne and Shal'Aran.",
        },
        [1883] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Legion-Dalaran and Krasus' Landing.",
        },
        [1894] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Broken Shore and Tomb of Sargeras.",
        },
        [1900] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Azsuna and Eye of Azshara.",
        },
        [1948] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Sturmheim and Haimont.",
        },
        [2045] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Vault of the Wardens.",
        },
        [2157] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Zuldazar and Dazar'alor.",
        },
        [2158] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Vol'dun.",
        },
        [2160] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Tiragardesand and Boralus.",
        },
        [2161] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Drustvar and Waycrest Manor.",
        },
        [2162] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Stormsong Valley and Shrine of the Storm.",
        },
        [2165] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Krokuun and Argus activities.",
        },
        [2170] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Argus activities and Antorus, the Burning Throne.",
        },
        [2370] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Neueheim and Nazjatar.",
        },
        [2373] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Mezzamere and Nazjatar.",
        },
        [2391] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Mechagon and Rostbolzen.",
        },
        [2407] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Bastion and Spires of Ascension.",
        },
        [2410] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Maldraxxus and Theater of Pain.",
        },
        [2413] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Revendreth and Halls of Atonement.",
        },
        [2415] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Ny'alotha, the Waking City.",
        },
        [2432] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on The Maw, Ve'naris Zuflucht, and Maw activities.",
        },
        [2464] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Ardenweald and Mists of Tirna Scithe.",
        },
        [2470] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Sanctum of Domination.",
        },
        [2478] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Zereth Mortis and Haven.",
        },
        [2503] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Grand Hunt, Ohn'ahran Plains, and Maruukai.",
        },
        [2507] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Siege on Dragonbane Keep, The Waking Shores, and Forbidden Reach.",
        },
        [2510] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Valdrakken, Thaldraszus, and Story and world quests.",
        },
        [2511] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Community Feast, The Azure Span, and Iskaara.",
        },
        [2696] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Zul'Aman-Kampagne and Local tasks in the Amani area.",
        },
        [2699] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Leerensturm-Kampagne and Local tasks in Voidstorm.",
        },
    },
})
