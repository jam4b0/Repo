local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [21] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Schlingendorntal, Nördliches Schlingendorntal, Das Schlingendornkap. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [589] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Winterquell. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [933] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Nethersturm, Area 52, Mana-Tombs. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [941] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Nagrand und Garadar. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [942] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Zangarmarschen, Cenarionszuflucht, The Steamvault. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [947] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Höllenfeuerhalbinsel, The Shattered Halls, Hellfire Ramparts. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [967] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Karazhan. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [978] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Nagrand und Telaar. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [989] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Old Hillsbrad Foothills, The Black Morass, Hyjal Summit. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1012] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Schattenmondtal und The Black Temple. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1038] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Schergrat und Ogri'la. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1068] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Heulender Fjord. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1073] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Boreanische Tundra. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1090] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Dalaran, Die Violette Festung, Die Tonroste. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1091] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Drachenöde. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1098] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Halls of Lightning und Ulduar. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1104] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Sholazarbecken. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1105] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Zul'Drak und Gundrak. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1106] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Eiskrone, Argentumvorhut, Ahn'kahet: The Old Kingdom. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1119] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Eiskrone, Die Sturmgipfel, K3. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1124] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Vault of Archavon. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1156] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Icecrown Citadel. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1172] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Schattenhochland, Grim Batol, The Bastion of Twilight. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1177] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Tol Barad und Halbinsel von Tol Barad. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1204] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Hyjal, The Vortex Pinnacle, Firelands. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1269] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Tal der Ewigen Blüten und Mogu'shan Palace. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1270] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Der Jadewald, Tonlongsteppe, Shado-Pan Monastery. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1271] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Schreckensöde, Siege of Niuzao Temple, Heart of Fear. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1272] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Tal der Vier Winde und Halbhügel. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1302] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Krasarangwildnis. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1375] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Schrein der Zwei Monde. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1376] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Schrein der Sieben Sterne. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1387] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Insel des Donners. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1435] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Insel des Donnerkönigs und Throne of Thunder. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1445] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Frostfeuergrat, Kriegsmühle, Bloodmaul Slag Mines. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1492] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Zeitlose Insel und Siege of Orgrimmar. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1710] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Mondsturz und Außenposten der Erwachten. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1711] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Gorgrond und Grimrail Depot. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1731] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Nagrand, Schattenmondtal, Shadowmoon Burial Grounds. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1828] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Hochberg und Neltharion's Lair. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1847] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Kriegsspeer. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1848] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Tanaan-Dschungel und Hellfire Citadel. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1849] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Sturmschild. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1850] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Spires of Arak und Auchindoun. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1859] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Suramar, Shal'Aran, Court of Stars. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1883] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Dalaran, Val'sharah, Krasus' Landeplatz. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1894] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Scherbenküste und Tomb of Sargeras. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1900] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Azsuna und Eye of Azshara. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [1948] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Sturmheim, Haimont, Maw of Souls. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2045] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Vault of the Wardens. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2157] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Zandalar, Zuldazar, Dazar'alor. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2158] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Vol'dun. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2160] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Kul Tiras, Tiragardesund, Boralus. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2161] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Drustvar und Waycrest Manor. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2162] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Sturmsangtal und Shrine of the Storm. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2165] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Krokuun. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2170] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Argus und Antorus, the Burning Throne. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2370] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Neueheim. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2373] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Nazjatar, Neuheim, Mezzamere. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2391] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Mechagon, Mechagon Insel, Rostbolzen. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2407] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Bastion und Spires of Ascension. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2410] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Maldraxxus, Theater of Pain, Plaguefall. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2413] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Halls of Atonement Reprise, Oribos, Revendreth. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2415] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Ny'alotha, the Waking City. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2432] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Der Schlund und Ve'naris Zuflucht. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2464] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Ardenwald und Mists of Tirna Scithe. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2470] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Sanctum of Domination. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2478] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Zereth Mortis, Haven, Sepulcher of the First Ones. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2503] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Valdrakken, Ebenen von Ohn'ahra, Maruukai. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2507] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Valdrakken, Küste des Erwachens, Verbotene Insel. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2510] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Valdrakken, Thaldraszus, Zaralekhöhle. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2511] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Valdrakken, Azurblaues Gebirge, Ismara. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2696] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei March on Quel'Danas. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
        [2699] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Eco-Dome Al'dani und Voidspire. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
            source = "seed",
            confidence = "low",
        },
    },
})
