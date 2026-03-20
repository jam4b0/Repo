local api = _G.RepuAPI

if not api or not api.RegisterLocaleDomain then
    return
end

api.RegisterLocaleDomain("retail_content", "deDE", {
    factions = {
        [21] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Schlingendorntal, Nördliches Schlingendorntal, Das Schlingendornkap. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
        },
        [47] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Eisenschmiede",
                },
            },
            summary = "Klassische Zwergenfraktion von Eisenschmiede. In Retail taucht sie vor allem in Eisenschmiede, Dun Morogh, Loch Modan und angrenzenden Allianz-Gebieten als lokale Heimatfraktion auf.",
        },
        [59] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Sengende Schlucht",
                },
                {
                    kind = "Zone/City",
                    title = "Brennende Steppe",
                },
            },
            summary = "Die Thoriumbruderschaft deckt im Retail-Core vor allem die Blackrock-Gebiete rund um Sengende Schlucht und Brennende Steppe ab.",
        },
        [68] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Unterstadt",
                },
            },
            summary = "Klassische Untotenfraktion von Unterstadt. In Retail taucht sie vor allem in Tirisfal, Silberwald, Unterstadt und angrenzenden Gebieten als lokale Heimatfraktion auf.",
        },
        [69] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Darnassus",
                },
            },
            summary = "Legacy-Hauptstadtfraktion von Darnassus. Im Retail-Core bleibt sie als klassische Allianz-Stadtfraktion erhalten, auch wenn die Stadt selbst heute nur noch in Legacy-Zusammenhängen relevant ist.",
        },
        [72] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Sturmwind",
                },
            },
            summary = "Klassische Menschenfraktion von Sturmwind. In Retail taucht sie in Sturmwind, Elwynn, Westfall, Rotkamm und angrenzenden Allianz-Gebieten als lokale Heimatfraktion auf.",
        },
        [76] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Orgrimmar",
                },
            },
            summary = "Klassische Orc-Hauptstadtfraktion von Orgrimmar. In Retail taucht sie in Orgrimmar, Durotar und Teilen des nördlichen Brachlands als lokale Heimatfraktion auf.",
        },
        [81] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Donnerfels",
                },
            },
            summary = "Klassische Tauren-Hauptstadtfraktion von Donnerfels. In Retail taucht sie in Donnerfels, Mulgore und den zugehörigen Tauren-Gebieten als lokale Heimatfraktion auf.",
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
            summary = "Gadgetzan ist die neutrale Goblin-Stadtfraktion von Tanaris. Im Retail-Core ist sie als lokaler Hubanker für die Stadt selbst modelliert, nicht als ganze Zonenfraktion für Tanaris.",
        },
        [470] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Nördliches Brachland",
                },
                {
                    kind = "Zone/City",
                    title = "Ratchet",
                },
            },
            summary = "Ratchet ist die neutrale Goblin-Hafenfraktion im Nördlichen Brachland. Im Retail-Core ist sie als lokaler Stadtanker für den Hafen modelliert.",
        },
        [529] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Westliche Pestländer",
                },
                {
                    kind = "Zone/City",
                    title = "Östliche Pestländer",
                },
            },
            summary = "Die Argentumdämmerung ist im Retail-Core die lokale Pestländer-Fraktion. Sie deckt vor allem Westliche und Östliche Pestländer sowie deren klassische Scharlach-/Geißel-Kontexte ab.",
        },
        [530] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Eschental",
                },
            },
            summary = "Die Dunkelspeertrolle werden im Retail-Core als lokale Horde-Fraktion in Teilen von Durotar, Eschental und den nördlichen Brachlanden genutzt.",
        },
        [576] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Teufelswald",
                },
            },
            summary = "Holzschlundfeste deckt im Retail-Core die klassischen Grenzgebiete rund um Teufelswald und Winterquell ab.",
        },
        [577] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Winterquell",
                },
                {
                    kind = "Zone/City",
                    title = "Everlook",
                },
            },
            summary = "Everlook ist die neutrale Goblin-Stadtfraktion in Winterquell. Im Retail-Core ist sie als lokaler Hubanker für die Stadt selbst modelliert.",
        },
        [589] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Winterquell. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
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
                    title = "Mondlichtung",
                },
                {
                    kind = "Zone/City",
                    title = "Silithus",
                },
            },
            summary = "Der Cenarionzirkel ist im Retail-Core die lokale Fraktion für mehrere klassische Natur- und Wüstengebiete wie Desolace, Feralas, Mondlichtung und Silithus.",
        },
        [749] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Molten Core",
                },
            },
            summary = "Hydraxian Waterlords ist im Retail-Core ein klassischer Raid-Nebenruf von Molten Core. Er bleibt bewusst raidlokal und wird nicht mehr als normale Zonenfraktion von Azshara verwendet.",
        },
        [909] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Dunkelmond-Insel",
                },
            },
            summary = "Der Dunkelmond-Jahrmarkt ist der lokale Rufblock der Dunkelmond-Insel. Im Retail-Core ist er als neutraler Hubanker für die Insel selbst modelliert.",
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
            summary = "Brood of Nozdormu ist im Retail-Core ein klassischer Ahn'Qiraj-Nebenruf. Er bleibt an die beiden Ahn'Qiraj-Raids gebunden und ersetzt dort nicht den generellen Silithus-Bezug.",
        },
        [930] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Die Exodar",
                },
                {
                    kind = "Zone/City",
                    title = "Azurmythosinsel",
                },
                {
                    kind = "Zone/City",
                    title = "Die Blutmythosinsel",
                },
            },
            summary = "Die Exodar ist die Draenei-Hauptstadtfraktion. Im Retail-Core deckt sie die Stadt selbst sowie Azurmythos- und Blutmythosinsel als Heimatcluster ab.",
        },
        [932] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Aldor-Aufgaben in Shattrath",
                },
            },
            summary = "Die Aldor sind eine der beiden großen politischen Fraktionen Shattraths. Ihr Fortschritt ist vor allem an die Stadt und an die entsprechende Scryer/Aldor-Entscheidung gebunden.",
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
            summary = "Das Konsortium ist der Nethersturm- und Area-52-Rufblock der Scherbenwelt. Der Fortschritt sitzt an den arkanen, etherealen und ökonomischen Nebenpfaden dieser Region.",
        },
        [934] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Seher-Aufgaben in Shattrath",
                },
            },
            summary = "Die Seher sind die Gegenfraktion zu den Aldor in Shattrath. Ihr Fortschritt ist vor allem an die Stadt und an die entsprechende Aldor/Seher-Entscheidung gebunden.",
        },
        [935] = {
            activities = {
                {
                    kind = "City/Instances",
                    title = "Shattrath- und Tempelaufgaben",
                },
            },
            summary = "Die Sha'tar bilden die zentrale Stadt- und Astralfraktion Shattraths. Sie begleiten einen großen Teil des Scherbenwelt-Fortschritts rund um die Stadt und ihre Instanzen.",
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
            summary = "Die Mag'har sind der Horde-bezogene Nagrand-Rufblock der Scherbenwelt. Der Fortschritt konzentriert sich auf Garadar und die Nagrand-Story.",
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
            summary = "Die Expedition des Cenarius ist der lokale Rufblock von Zangarmarschen. Der Fortschritt sitzt an Cenarionszuflucht, den Dungeons des Gebiets und den dortigen Storypfaden.",
        },
        [946] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Höllenfeuerhalbinsel",
                },
                {
                    kind = "Hub",
                    title = "Honor Hold",
                },
            },
            summary = "Honor Hold ist der Allianz-Rufblock der Höllenfeuerhalbinsel. Im Retail-Core ist er der lokale Allianz-Anker für die Zone und ihre allianzgeprägten Instanzpfade.",
        },
        [947] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Höllenfeuerhalbinsel",
                },
                {
                    kind = "Dungeon",
                    title = "The Shattered Halls",
                },
            },
            summary = "Thrallmar ist der Horde-Rufblock der Höllenfeuerhalbinsel. Im Retail-Core ist er der lokale Anker für die Zone und ihre hordegeprägten Instanzpfade.",
        },
        [967] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Karazhan. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
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
            summary = "Sporeggar ist der lokale Siedlungsruf der Sporenlinge in Zangarmarschen. Im Retail-Core ist er als klarer Hubanker für die Stadt selbst modelliert.",
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
            summary = "Die Kurenai sind der Allianz-bezogene Nagrand-Rufblock der Scherbenwelt. Der Fortschritt konzentriert sich auf Telaar und die Nagrand-Story.",
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
            summary = "Die Hüter der Zeit sind der Caverns-of-Time-Rufblock und im Retail-Core über die Scherbenwelt-Zeitreiseinstanzen verankert.",
        },
        [990] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Hyjal Summit",
                },
            },
            summary = "The Scale of the Sands ist der lokale Raidruf von Hyjal Summit und ergänzt dort den groberen Hüter-der-Zeit-Bezug um den eigentlichen Bronze-Drachenblock des Raids.",
        },
        [1011] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Aufgaben im Unteren Viertel",
                },
            },
            summary = "Unteres Viertel ist die Fraktion des unteren Stadtviertels von Shattrath und vieler umliegender Scherbenwelt-Aufgaben.",
        },
        [1012] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenmondtal",
                },
                {
                    kind = "Raid",
                    title = "Der Schwarze Tempel",
                },
            },
            summary = "Die Aschenzungen-Todesschwur ist der Schattenmondtal-/Schwarzer-Tempel-Rufblock der Scherbenwelt.",
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
            summary = "Netherwing ist der lokale Rufblock des Netherwing-Ledge-Komplexes im Schattenmondtal. Im Retail-Core ist er als Hubanker für diese Teilregion modelliert.",
        },
        [1031] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schergrat",
                },
                {
                    kind = "Daily/Repeatable",
                    title = "Skyguard-Aufgaben",
                },
            },
            summary = "Die Himmelswache der Sha'tari ist eine spätere Scherbenwelt-Fraktion mit Schwerpunkt auf Schergrat, Luftpfaden und wiederholbaren Himmelswache-Aktivitäten.",
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
            summary = "Ogri'la ist der Hub-Rufblock der Ogerhochburg im Schergrat und bündelt die dortigen wiederholbaren Aufgaben.",
        },
        [1067] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Heulender Fjord",
                },
            },
            summary = "The Hand of Vengeance ist der Horde-seitige Nebenruf des Heulenden Fjords. Im Retail-Core bleibt er als lokaler Horde-Zweig der dortigen Forsaken-Kriegslinie modelliert.",
        },
        [1068] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlinien im Heulenden Fjord",
                },
            },
            summary = "Dieser Northrend-Rufblock ist vor allem im Heulenden Fjord verankert. Relevanter Fortschritt kommt ueber die Zonengeschichten und die dortigen Northrend-Aktivitaeten.",
        },
        [1073] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlinien in der Boreanischen Tundra",
                },
            },
            summary = "Der Kernbezug dieses Northrend-Rufblocks liegt in der Boreanischen Tundra. Fortschritt kommt vor allem aus den dortigen Story- und Hubaktivitaeten.",
        },
        [1077] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of Quel'Danas",
                },
                {
                    kind = "Daily",
                    title = "Quel'Danas-Dailys",
                },
            },
            summary = "Die Offensive der Zerschmetterten Sonne ist der spaete Scherbenwelt-Endgame-Rufblock von Quel'Danas und dessen Daily-Zyklus.",
        },
        [1090] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Dalaran-Stadtaktivitaeten",
                },
                {
                    kind = "Dungeon",
                    title = "Northrend-Dungeons mit Dalaran-Bezug",
                },
            },
            summary = "Dalarans zentraler Northrend-Rufblock. Im heutigen Spiel ist der Bezug vor allem an Dalaran, die Violette Festung und klassische Northrend-Dungeon- bzw. Stadtaktivitaeten gebunden.",
        },
        [1091] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlinien in der Drachenoede",
                },
            },
            summary = "Dieser Rufblock ist im Retail-Core an die Drachenoede gebunden. Im Vordergrund stehen die dortigen Storylinien und Northrend-Zonenaktivitaeten.",
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
            summary = "Dieser Rufblock ist im Retail-Core besonders eng mit den Titanen- und Ulduar-Inhalten in den Sturmgipfeln verbunden.",
        },
        [1104] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlinien im Sholazarbecken",
                },
            },
            summary = "Dieser Rufblock gehoert in den Retail-Daten zum Sholazarbecken. Der Schwerpunkt liegt auf den lokalen Story- und Zonenaktivitaeten.",
        },
        [1105] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlinien in Zul'Drak",
                },
                {
                    kind = "Dungeon",
                    title = "Gundrak",
                },
            },
            summary = "Der Kernbezug dieses Rufblocks liegt bei Zul'Drak und den zugehoerigen Trollen-Instanzen.",
        },
        [1106] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Argentumvorhut",
                },
                {
                    kind = "Story/Zone",
                    title = "Questlinien in Eiskrone",
                },
            },
            summary = "Dieser Northrend-Rufblock ist eng mit Eiskrone und der Argentumvorhut verknuepft. Der Fortschritt dreht sich vor allem um die dortigen Story- und Dungeon/Raid-Inhalte.",
        },
        [1119] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "K3 und Sturmgipfel-Questlinien",
                },
            },
            summary = "Der Kernbezug dieses Rufblocks liegt bei K3 und den Sturmgipfeln. Klassisch dreht sich der Fortschritt um die lokalen Storylinien und taeglichen Aufgaben in der Zone.",
        },
        [1124] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Vault of Archavon",
                },
            },
            summary = "Dieser Rufblock ist im Retail-Core an Vault of Archavon verankert. Im aktuellen Addon-Kontext ist der Raid der relevante Bezugspunkt.",
        },
        [1126] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Die Sturmgipfel",
                },
            },
            summary = "The Frostborn ist der Allianz-seitige Nebenruf der Sturmgipfel. Im Retail-Core bleibt er als lokaler Alliance-Zweig der Zone erhalten, ohne den Hauptblock der Sons of Hodir zu verdrängen.",
        },
        [1133] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Azshara",
                },
            },
            summary = "Das Bilgewasserkartell ist im Retail-Core die lokale Goblinfraktion für Azshara und verwandte Goblin-Kontexte.",
        },
        [1134] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Gilneas",
                },
            },
            summary = "Gilneas ist im Retail-Core die lokale Fraktion für die gilneische Heimatstadt und ihr Umland.",
        },
        [1156] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Icecrown Citadel",
                },
            },
            summary = "Dieser Rufblock ist direkt an Icecrown Citadel gebunden. Der heutige Kernbezug liegt entsprechend beim Raid selbst.",
        },
        [1158] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Hyjal",
                },
            },
            summary = "Die Wächter des Hyjal sind der lokale Cataclysm-Rufblock für Hyjal und die dortigen Elementar- und Druidenkonflikte.",
        },
        [1171] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tiefenheim",
                },
            },
            summary = "Therazane ist die lokale Fraktion von Tiefenheim und dem Tempel der Erde. Der Kernfortschritt kommt aus der Zone selbst.",
        },
        [1172] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Schattenhochland, Grim Batol, The Bastion of Twilight. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
        },
        [1173] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Uldum",
                },
            },
            summary = "Ramkahen ist die klassische lokale Fraktion von Uldum. Sie bleibt der stabile Heimatanker der Zone über mehrere Weltzustände hinweg.",
        },
        [1174] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenhochland",
                },
            },
            summary = "Wildhammer Clan ist der Allianz-seitige Nebenruf der Schattenhochlande. Im Retail-Core bleibt er als klarer lokaler Alliance-Zweig der Zone modelliert.",
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
            summary = "Baradin's Wardens ist die Allianz-Fraktion von Tol Barad und der Halbinsel von Tol Barad.",
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
            summary = "Hellscream's Reach ist die Horde-Fraktion von Tol Barad und der Halbinsel von Tol Barad.",
        },
        [1204] = {
            summary = "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. Der Kernbezug liegt aktuell vor allem bei Hyjal, The Vortex Pinnacle, Firelands. Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden.",
        },
        [1269] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tal der Ewigen Blueten",
                },
                {
                    kind = "Dungeon",
                    title = "Mogu'shan Palace",
                },
            },
            summary = "Dieser Pandaria-Rufblock ist an das Tal der Ewigen Blueten gebunden. Relevanter Fortschritt haengt im heutigen Spiel an der Vale-Zone und den dortigen MoP-Inhalten.",
        },
        [1270] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlinien im Jadewald",
                },
                {
                    kind = "Dungeon",
                    title = "Shado-Pan Monastery",
                },
            },
            summary = "Dieser Pandaria-Rufblock deckt vor allem Jadewald und Tonlongsteppe ab. Im Vordergrund stehen die Shado-Pan-nahen Story- und Dungeon-Inhalte.",
        },
        [1271] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlinien in der Schreckensoede",
                },
                {
                    kind = "Raid",
                    title = "Heart of Fear",
                },
            },
            summary = "Der Kernbezug dieses Rufblocks liegt in der Schreckensoede und den mantidenbezogenen Pandaria-Inhalten.",
        },
        [1272] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tal der Vier Winde",
                },
                {
                    kind = "Hub",
                    title = "Halbhuegel",
                },
            },
            summary = "Dieser Rufblock ist an Tal der Vier Winde und Halbhuegel gebunden. Im Retail-Kontext liegen die wichtigsten Bezuege bei den Farm- und Hubaktivitaeten dieser Gegend.",
        },
        [1302] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlinien in der Krasarangwildnis",
                },
            },
            summary = "Der Kernbezug dieses Pandaria-Rufblocks liegt in der Krasarangwildnis und ihren Storylinien.",
        },
        [1337] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schreckensoede",
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
            summary = "Die Klaxxi sind der eigentliche Mantiden-Rufblock der Schreckensoede. Im Retail-Core laufen sie als lokale Nebenfraktion der Zone und ihres Hubbereichs Klaxxi'vess.",
        },
        [1359] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tal der Ewigen Blueten",
                },
                {
                    kind = "Story",
                    title = "Wrathion-Endgame",
                },
            },
            summary = "Der Schwarze Prinz ist ein spaeter MoP-Rufblock mit starkem Bezug zum Tal der Ewigen Blueten und dem Wrathion-Endgamepfad.",
        },
        [1375] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Schrein der Zwei Monde",
                },
            },
            summary = "Horde-Hubruf des Schreins der Zwei Monde im Tal der Ewigen Blueten. Heute ist der Schrein selbst der zentrale Bezugspunkt.",
        },
        [1376] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Schrein der Sieben Sterne",
                },
            },
            summary = "Allianz-Hubruf des Schreins der Sieben Sterne im Tal der Ewigen Blueten. Heute ist der Schrein selbst der zentrale Bezugspunkt.",
        },
        [1387] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Insel des Donners",
                },
            },
            summary = "Dieser Rufblock ist an die Insel des Donners gebunden und folgt der jeweils seitenabhaengigen Offensive in der Zone.",
        },
        [1388] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Insel des Donners",
                },
            },
            summary = "Die Sunreaver Onslaught ist der Horde-seitige Offensivruf der Insel des Donners und bildet dort das Gegenstück zur Kirin Tor Offensive.",
        },
        [1416] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenmondtal",
                },
                {
                    kind = "Raid",
                    title = "Der Schwarze Tempel",
                },
            },
            summary = "Akama's Trust ist der lokale Nebenruf rund um Schattenmondtal und den Schwarzen Tempel. Im Retail-Core wird er als klarer Outland-Seitenpfad neben dem Aschenzungen-Block behandelt.",
        },
        [1435] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Insel des Donnerkoenigs",
                },
                {
                    kind = "Raid",
                    title = "Throne of Thunder",
                },
            },
            summary = "Der Kernbezug dieses Rufblocks liegt auf der Insel des Donnerkoenigs und im Raid Throne of Thunder.",
        },
        [1445] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Frostfeuergrat",
                },
                {
                    kind = "Hub",
                    title = "Kriegsmuehle",
                },
            },
            summary = "Dieser Draenor-Rufblock ist an Frostfeuergrat und die dortige Garnisons- bzw. Hubstruktur gebunden.",
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
            summary = "Dieser Pandaria-Endgame-Rufblock ist an die Zeitlose Insel und den spaeten MoP-Endgame-Zyklus gebunden.",
        },
        [1515] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Spires of Arak",
                },
            },
            summary = "Arakkoa Outcasts ist der lokale Seitenruf von Spires of Arak. Im Retail-Core ergänzt er den Zonenblock um den expliziten Ausgestoßenen-Pfad der Arakkoa.",
        },
        [1710] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Mondsturz",
                },
                {
                    kind = "Hub",
                    title = "Aussenposten der Erwachten",
                },
            },
            summary = "Dieser Rufblock ist an Mondsturz und den Allianz-Zweig der Draenor-Hubs gebunden.",
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
            summary = "Dieser Draenor-Rufblock ist im Retail-Core vor allem mit Gorgrond und Grimrail Depot verknuepft.",
        },
        [1731] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Nagrand",
                },
                {
                    kind = "Dungeon",
                    title = "Shadowmoon Burial Grounds",
                },
            },
            summary = "Der Kernbezug dieses Draenor-Rufblocks liegt bei Nagrand und Schattenmondtal sowie den dortigen Story- und Dungeoninhalten.",
        },
        [1828] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Hochberg",
                },
                {
                    kind = "Dungeon",
                    title = "Neltharion's Lair",
                },
            },
            summary = "Dieser Legion-Rufblock ist an Hochberg und die dortigen lokalen Geschichten verankert.",
        },
        [1847] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Kriegsspeer",
                },
            },
            summary = "Horde-Hubruf von Kriegsspeer. Der heutige Bezugspunkt ist die Stadt als Draenor-Hub.",
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
            summary = "Dieser Rufblock ist vor allem an Tanaan-Dschungel und Hellfire Citadel gebunden.",
        },
        [1849] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Sturmschild",
                },
            },
            summary = "Allianz-Hubruf von Sturmschild. Im heutigen Spiel ist die Stadt der zentrale Bezugspunkt.",
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
            summary = "Dieser Rufblock ist im Retail-Core an Spires of Arak und Auchindoun verankert.",
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
            summary = "Der zentrale Suramar-Rufblock von Legion. Der Schwerpunkt liegt auf Shal'Aran, Suramar und den dortigen Kampagnen- sowie Dungeoninhalten.",
        },
        [1883] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Legion-Dalaran",
                },
                {
                    kind = "Hub",
                    title = "Krasus' Landeplatz",
                },
            },
            summary = "Dalaran-Hubruf von Legion mit Bezug auf die Verheerten Inseln, Val'sharah und die zentrale Magierstadt.",
        },
        [1894] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Scherbenkueste",
                },
                {
                    kind = "Raid",
                    title = "Tomb of Sargeras",
                },
            },
            summary = "Dieser Legion-Rufblock ist an die Scherbenkueste und Tomb of Sargeras gebunden.",
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
            summary = "Der Kernbezug dieses Legion-Rufblocks liegt in Azsuna und Eye of Azshara.",
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
            summary = "Dieser Rufblock ist an Sturmheim, Haimont und die dortigen vrykulbezogenen Legion-Inhalte gekoppelt.",
        },
        [2045] = {
            activities = {
                {
                    kind = "Dungeon",
                    title = "Vault of the Wardens",
                },
            },
            summary = "Dieser Legion-Rufblock ist im Retail-Core direkt an Vault of the Wardens gekoppelt.",
        },
        [2135] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Time Rifts",
                },
                {
                    kind = "Zone",
                    title = "Temporale Nebenaktivitäten",
                },
            },
            summary = "Chromie bündelt die zeitbezogenen Nebenaktivitäten in Thaldraszus. Der Fortschritt hängt vor allem an Zeitrissen und den dazugehörigen wiederkehrenden Aufgaben.",
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
            summary = "Dieser BfA-Rufblock ist an Zandalar, Zuldazar und Dazar'alor gebunden. Im Vordergrund stehen die dortigen Story- und Hubaktivitaeten.",
        },
        [2158] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Vol'dun",
                },
            },
            summary = "Der Kernbezug dieses BfA-Rufblocks liegt in Vol'dun und den dortigen Storylinien.",
        },
        [2160] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tiragardesund",
                },
                {
                    kind = "Hub",
                    title = "Boralus",
                },
            },
            summary = "Dieser BfA-Rufblock ist an Kul Tiras, Tiragardesund und Boralus gebunden.",
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
            summary = "Der Kernbezug dieses BfA-Rufblocks liegt in Drustvar und Waycrest Manor.",
        },
        [2162] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Sturmsangtal",
                },
                {
                    kind = "Dungeon",
                    title = "Shrine of the Storm",
                },
            },
            summary = "Dieser BfA-Rufblock ist an Sturmsangtal und die dortigen Kul-Tiras-Inhalte gebunden.",
        },
        [2165] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Krokuun",
                },
                {
                    kind = "Zone",
                    title = "Argus-Aktivitaeten",
                },
            },
            summary = "Argus-Rufblock mit Schwerpunkt auf Krokuun und dem Lichtarmeezweig der Endgame-Zone.",
        },
        [2170] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Argus-Aktivitaeten",
                },
                {
                    kind = "Raid",
                    title = "Antorus, the Burning Throne",
                },
            },
            summary = "Argus-Endgame-Rufblock mit Schwerpunkt auf den spaeten Antorus- und Argus-Inhalten.",
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
            summary = "Der Horde-Zweig von Nazjatar. Der Kernbezug liegt bei Neueheim und den lokalen Nazjatar-Aktivitaeten.",
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
            summary = "Der Allianz-Zweig von Nazjatar. Der Kernbezug liegt bei Mezzamere und den lokalen Nazjatar-Aktivitaeten.",
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
            summary = "Dieser BfA-Endgame-Rufblock ist an Mechagon, Rostbolzen und die Inselaktivitaeten gebunden.",
        },
        [2395] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Sturmsangtal side content",
                },
            },
            summary = "Honeyback Hive ist ein lokaler Nebenruf von Kul Tiras, vor allem im Sturmsangtal. Der Fortschritt hängt an den bienenbezogenen Nebeninhalten dieses Gebiets.",
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
            summary = "Dieser Shadowlands-Rufblock ist an Bastion und den kyrianischen Zonenzweig gebunden.",
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
            summary = "Der Kernbezug dieses Shadowlands-Rufblocks liegt in Maldraxxus und den dortigen Story- und Dungeoninhalten.",
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
            summary = "Dieser Shadowlands-Rufblock ist an Revendreth und den venthyrbezogenen Storypfad gekoppelt.",
        },
        [2415] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Ny'alotha, the Waking City",
                },
            },
            summary = "Dieser spaete BfA-Rufblock ist an Ny'alotha und die letzten Schwarzimperium-Inhalte gekoppelt.",
        },
        [2417] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Uldum",
                },
            },
            summary = "Uldum Accord ergänzt den klassischen Uldum-Block um die spaeteren Angriffs- und Weltaktivitaeten der modernen Uldum-Zustände.",
        },
        [2432] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Der Schlund",
                },
                {
                    kind = "Hub",
                    title = "Ve'naris Zuflucht",
                },
                {
                    kind = "Recurring",
                    title = "Schlund-Aktivitäten",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Ve'nari",
                },
            },
            summary = "Der Kernbezug dieses Shadowlands-Rufblocks liegt im Schlund und den dortigen Endgame-Aktivitaeten.",
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
            summary = "The Avowed ist ein lokaler Nebenruf von Revendreth. Der Fortschritt sitzt an den rituellen und sammelorientierten Aktivitäten im Revendreth-Nebenpfad.",
        },
        [2464] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Ardenwald",
                },
                {
                    kind = "Dungeon",
                    title = "Mists of Tirna Scithe",
                },
            },
            summary = "Dieser Shadowlands-Rufblock ist an Ardenwald und den dazugehoerigen Storyzweig gebunden.",
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
            summary = "The Wild Hunt ist der zentrale lokale Ardenweald-Ruf. Fortschritt kommt über die Zonenstory, wiederkehrende Aufgaben und die wichtigsten Aktivitäten des Waldpfads.",
        },
        [2470] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Sanctum of Domination",
                },
            },
            summary = "Dieser Shadowlands-Raidrufblock ist an Sanctum of Domination gekoppelt.",
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
            summary = "The Archivists' Codex ist der lokale Nebenruf von Korthia. Der Fortschritt sitzt an Reliktforschung, Korthia-Aktivitäten und dem Hub rund um Keeper's Respite.",
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
            summary = "Der spaete Shadowlands-Rufblock von Zereth Mortis. Relevanter Fortschritt kommt ueber die Zone, Haven und den Abschlusszyklus von Shadowlands.",
        },
        [2503] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Grand Hunt",
                },
                {
                    kind = "Zone",
                    title = "Ebenen von Ohn'ahra",
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
            summary = "Dieser Dragonflight-Rufblock ist an die Ebenen von Ohn'ahra und Maruukai gebunden.",
        },
        [2507] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Siege on Dragonbane Keep",
                },
                {
                    kind = "Zone",
                    title = "Küste des Erwachens",
                },
                {
                    kind = "Zone",
                    title = "Verbotene Insel",
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
            summary = "Dieser Dragonflight-Rufblock ist an die Kuesten- und Expeditionsinhalte der Dracheninseln gebunden.",
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
                    title = "Story- und Weltquests",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Unatos",
                },
            },
            summary = "Der zentrale Dragonflight-Hubruf von Valdrakken und Thaldraszus. Relevanter Fortschritt kommt vor allem aus Story, Weltquests und Hubaktivitaeten.",
        },
        [2511] = {
            activities = {
                {
                    kind = "Weekly/Event",
                    title = "Community Feast",
                },
                {
                    kind = "Zone",
                    title = "Azurblaue Gebirge",
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
            summary = "Dieser Dragonflight-Rufblock ist an das Azurblaue Gebirge und die tuskarrnahen Hub- und Zoneninhalte gekoppelt.",
        },
        [2517] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Waking Shores black dragonflight content",
                },
            },
            summary = "Wrathion ist ein lokaler Nebenruf der Waking Shores rund um die schwarze Drachenflug-Geschichte. Der Fortschritt sitzt an den obsidianbezogenen Aufgaben dieses Gebiets.",
        },
        [2518] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Waking Shores black dragonflight content",
                },
            },
            summary = "Sabellian ist der zweite lokale schwarze Drachenflug-Nebenruf der Waking Shores. Der Fortschritt bündelt seine obsidianbezogenen Story- und Hilfsaufgaben.",
        },
        [2523] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Obsidian side content",
                },
            },
            summary = "Dark Talons ist ein lokaler Dracthyr-Nebenruf im Obsidian-Umfeld der Waking Shores. Er ergänzt die schwarze Drachenflug-Linie um einen einsatzorientierten Zweig.",
        },
        [2524] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Obsidian side content",
                },
            },
            summary = "Obsidian Warders ist ein lokaler Dracthyr-Nebenruf im Obsidian-Umfeld der Waking Shores. Er ergänzt die dortigen Verteidigungs- und Schutzaktivitäten.",
        },
        [2526] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Azure Span side quests",
                },
            },
            summary = "Winterpelt Furbolg ist ein lokaler Nebenruf im Azurblauen Gebirge. Der Fortschritt sitzt an der Winterpelt-Hilfe und den zugehörigen Aufgaben rund um die Furbolg.",
        },
        [2544] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Valdrakken professions hub",
                },
            },
            summary = "Artisan's Consortium - Dragon Isles Branch ist die professionsnahe Stadtfraktion von Valdrakken. Der Fortschritt ist an Handwerk, Aufträge und die Hauptprofessionen des Hubs gebunden.",
        },
        [2550] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Azure Span side content",
                },
            },
            summary = "Cobalt Assembly ist ein lokaler Nebenruf des Azurblauen Gebirges. Der Fortschritt sitzt an den Cobalt-Aktivitäten und den zugehörigen Sammel- und Kampfschleifen der Zone.",
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
            summary = "Soridormi ist der Nebenruf der Zeitriss-Inhalte von Thaldraszus. Der Fortschritt bündelt die wiederkehrenden Aktivitäten rund um die zeitgestörten Ereignisse.",
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
            summary = "Loamm Niffen ist die große Patch-Ruhmfraktion der Zaralekhöhle. Fortschritt kommt vor allem über Loamm, die Schnüffel-Suche, Weltinhalte in Zaralek und den dortigen Storyblock.",
        },
        [2570] = {
            activities = {
                {
                    kind = "Weekly/Event",
                    title = "Spreading the Light",
                },
                {
                    kind = "World quests",
                    title = "Weltquests in Heilsturz",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Auralia Steelstrike",
                },
            },
            summary = "Große Ruhmfraktion von Heilsturz. Fortschritt kommt vor allem über Weltquests, seltene Gegner, Schätze und die wiederkehrende Aktivität 'Spreading the Light' in und um Mereldar.",
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
            summary = "Dream Wardens ist die große Patch-Ruhmfraktion des Smaragdgrünen Traums. Fortschritt kommt über den Storypfad, Weltinhalte im Traum und den zentralen Lagerbereich.",
        },
        [2590] = {
            activities = {
                {
                    kind = "World quests",
                    title = "Weltquests auf der Dorninsel",
                },
                {
                    kind = "One-time/Warband",
                    title = "Story- und Nebenkapitel in Dornogal",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Auditor Balwurz",
                },
            },
            summary = "Große Ruhmfraktion der Dorninsel und Dornogals. Fortschritt kommt vor allem über Weltquests, Story- und Nebenkapitel auf der Dorninsel sowie die üblichen Khaz-Algar-Aktivitäten.",
        },
        [2594] = {
            activities = {
                {
                    kind = "World quests",
                    title = "Weltquests in The Ringing Deeps",
                },
                {
                    kind = "One-time/Warband",
                    title = "Story- und Nebenkapitel in Gundargaz",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Waxmonger Squick",
                },
            },
            summary = "Große Ruhmfraktion der Ringing Deeps. Fortschritt kommt über Weltquests, Story- und Nebenkapitel rund um Gundargaz sowie wiederkehrende Aktivitäten in der Zone.",
        },
        [2600] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Wöchentlicher Pakt",
                },
                {
                    kind = "World quests",
                    title = "Weltquests in Azj-Kahet",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Y'tekhi",
                },
            },
            summary = "Große Ruhmfraktion von Azj-Kahet. Der Fortschritt dreht sich um den wöchentlichen Pakt mit einer der drei Unterfraktionen, Weltquests in Azj-Kahet und die Hauptaktivitäten rund um The Weaver's Lair.",
        },
        [2601] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pakt der Weberin",
                },
            },
            summary = "Die Weberin ist einer der drei wöchentlichen Paktpfade der Durchtrennten Fäden. Wenn ihr Pakt aktiv ist, bündelst du deinen Fortschritt über ihre Aufgaben und die Azj-Kahet-Aktivitäten auf diesen Zweig.",
        },
        [2605] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pakt des Generals",
                },
            },
            summary = "Der General ist einer der drei wöchentlichen Paktpfade der Durchtrennten Fäden. Sein Zweig bündelt die auf Kampf und Sicherheit ausgerichteten Aufgaben in Azj-Kahet.",
        },
        [2607] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pakt des Wesirs",
                },
            },
            summary = "Der Wesir ist einer der drei wöchentlichen Paktpfade der Durchtrennten Fäden. Sein Zweig bündelt die eher auf Intrigen und Versorgung ausgerichteten Aufgaben in Azj-Kahet.",
        },
        [2615] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Azerothian Archives",
                },
                {
                    kind = "Zone",
                    title = "Archivaktivitäten in Tyrhold",
                },
            },
            summary = "Azerothian Archives ist der archivbezogene Nebenruf in Thaldraszus. Der Fortschritt sitzt an den wiederkehrenden Archiv- und Forschungsaktivitäten rund um Tyrhold.",
        },
        [2653] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Wöchentliche Kartellwahl",
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
            summary = "Große Ruhmfraktion von Lorenhall und Undermine. Der Fortschritt kommt über die wöchentliche Kartellwahl, Aktivitäten in Undermine und die wiederkehrende C.H.E.T.T.-Liste.",
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
            summary = "The K'aresh Trust ist die große Ruhmfraktion von K'aresh. Der Fortschritt bündelt die Hauptaktivitäten rund um die Rettung und Stabilisierung des zerstörten Sterns.",
        },
        [2671] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Venture Company",
                },
            },
            summary = "Die Venture Company ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
        },
        [2673] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Bilgewasserkartell",
                },
            },
            summary = "Das Bilgewasserkartell ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
        },
        [2675] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Schwarzmeer AG",
                },
            },
            summary = "Schwarzmeer AG ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
        },
        [2677] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Dampfdruckkartell",
                },
            },
            summary = "Das Dampfdruckkartell ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
        },
        [2685] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Garbagio Treueclub",
                },
            },
            summary = "Der Garbagio Treueclub ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
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
            summary = "Flame's Radiance ist die einsatzbezogene Ruhmfraktion für die Verteidigung Heilsturzs. Sie ergänzt den normalen Zonenruf und bündelt die militärisch geprägten Hallowfall-Aktivitäten.",
        },
        [2696] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Zul'Aman-Kampagne",
                },
                {
                    kind = "Zone",
                    title = "Lokale Aufgaben im Amani-Gebiet",
                },
            },
            summary = "Der Amanistamm ist der lokale Midnight-Rufblock rund um Zul'Aman. Fortschritt sammelt sich vor allem ueber die Zonenkampagne, Aufgaben im Amani-Gebiet und die lokalen Aktivitaeten dieses Zweigs.",
        },
        [2699] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Leerensturm-Kampagne",
                },
                {
                    kind = "Zone",
                    title = "Lokale Aufgaben im Leerensturm",
                },
            },
            summary = "Die Singularitaet ist der Midnight-Rufblock des Leerensturms. Der Schwerpunkt liegt auf der Zonenkampagne, lokalen Storyknoten und Aufgaben rund um die Leerenelfen- und Singularitaetslinie.",
        },
        [2704] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Harandar-Kampagne",
                },
                {
                    kind = "Zone",
                    title = "Lokale Aufgaben in Harandar",
                },
            },
            summary = "Die Hara'ti sind der Midnight-Rufblock von Harandar. Der Fortschritt dreht sich um die Harandar-Story, lokale Aufgaben und den regionalen Endgame-Zweig dieser Zone.",
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
                    name = "Rüstungsschmied Goldwappen",
                },
                {
                    label = "Lane Warden",
                    name = "Neriv",
                },
                {
                    label = "Wayfarer",
                    name = "Waldläufer Allorn",
                },
            },
            summary = "Die große Ruhmfraktion von Quel'Thalas. Fortschritt entsteht parallel zu den vier lokalen Unterfraktionen des Hofs in Silbermond. Je nach aktueller Auswahl sind unterschiedliche Rüstmeister relevant.",
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
            summary = "Städtische Fraktion rund um arkane Ordnung, Verwaltung und Magister-Infrastruktur. Ruf erhältst du über passende Questlinien und Silbermond-Aktivitäten.",
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
                    name = "Rüstungsschmied Goldwappen",
                },
            },
            summary = "Militärisch geprägte Stadtfraktion mit Fokus auf Blutritter und Sicherheitsstruktur. Ruf entsteht über den Immersangwald und das Silbermond-Eventsystem.",
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
                    name = "Waldläufer Allorn",
                },
            },
            summary = "Gebietsfraktion des Immersangwalds mit Fokus auf Wald, Grenzen und Wildnis. Ruf erhältst du vor allem über Quests und Fraktionsaktivitäten im Immersangwald.",
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
            summary = "Lokale Stadtfraktion für Gassen- und Untergrundbereiche in Silbermond. Ruf erhältst du über passende Quests und das wöchentliche Stadt-Event.",
        },
        [2736] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Manaforge sabotage operations",
                },
            },
            summary = "Manaforge Vandals ist der verdeckte Operationszweig innerhalb des K'aresh-Blocks. Wenn dieser Ruf aktiv ist, bündelt er die offensiveren, sabotageorientierten Aufgaben gegen Salhadaar.",
        },
        [2770] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Leerensturm",
                },
                {
                    kind = "Hub",
                    title = "Obskurionzitadelle",
                },
            },
            summary = "Slayer's Duellum ist ein lokaler Midnight-Nebenruf aus dem Leerensturm-/Voidstorm-Zweig. Im Retail-Core bleibt er bewusst ein Seitenpfad unterhalb der Singularitaet und kein allgemeiner Ortsanker fuer andere Gebiete.",
        },
        [9000111] = {
            activities = {
                {
                    kind = "Cluster",
                    title = "Shattrath-Stadtfraktionen",
                },
            },
            summary = "Virtuelle Gruppenfraktion für Shattrath. Sie bündelt die großen Stadtfraktionen der Scherbenwelt, damit sie im UI als zusammengehöriger Cluster statt als ungeordnete Einzelfunde erscheinen.",
        },
    },
})
