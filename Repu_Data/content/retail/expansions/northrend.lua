local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1068] = {
            summary = "Dieser Northrend-Rufblock ist vor allem im Heulenden Fjord verankert. Relevanter Fortschritt kommt ueber die Zonengeschichten und die dortigen Northrend-Aktivitaeten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Questlinien im Heulenden Fjord", kind = "Story/Zone", location = { mapID = 117, title = "Heulender Fjord" } },
            },
        },
        [1073] = {
            summary = "Der Kernbezug dieses Northrend-Rufblocks liegt in der Boreanischen Tundra. Fortschritt kommt vor allem aus den dortigen Story- und Hubaktivitaeten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Questlinien in der Boreanischen Tundra", kind = "Story/Zone", location = { mapID = 114, title = "Boreanische Tundra" } },
            },
        },
        [1090] = {
            summary = "Dalarans zentraler Northrend-Rufblock. Im heutigen Spiel ist der Bezug vor allem an Dalaran, die Violette Festung und klassische Northrend-Dungeon- bzw. Stadtaktivitaeten gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Dalaran-Stadtaktivitaeten", kind = "Hub", location = { mapID = 125, title = "Dalaran" } },
                { title = "Northrend-Dungeons mit Dalaran-Bezug", kind = "Dungeon", location = { mapID = 125, title = "Dalaran" } },
            },
        },
        [1091] = {
            summary = "Dieser Rufblock ist im Retail-Core an die Drachenoede gebunden. Im Vordergrund stehen die dortigen Storylinien und Northrend-Zonenaktivitaeten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Questlinien in der Drachenoede", kind = "Story/Zone", location = { mapID = 115, title = "Drachenoede" } },
            },
        },
        [1098] = {
            summary = "Dieser Rufblock ist im Retail-Core besonders eng mit den Titanen- und Ulduar-Inhalten in den Sturmgipfeln verbunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Halls of Lightning", kind = "Dungeon", location = { title = "Halls of Lightning" } },
                { title = "Ulduar", kind = "Raid", location = { title = "Ulduar" } },
            },
        },
        [1104] = {
            summary = "Dieser Rufblock gehoert in den Retail-Daten zum Sholazarbecken. Der Schwerpunkt liegt auf den lokalen Story- und Zonenaktivitaeten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Questlinien im Sholazarbecken", kind = "Story/Zone", location = { mapID = 119, title = "Sholazarbecken" } },
            },
        },
        [1105] = {
            summary = "Der Kernbezug dieses Rufblocks liegt bei Zul'Drak und den zugehoerigen Trollen-Instanzen.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Questlinien in Zul'Drak", kind = "Story/Zone", location = { mapID = 121, title = "Zul'Drak" } },
                { title = "Gundrak", kind = "Dungeon", location = { title = "Gundrak" } },
            },
        },
        [1106] = {
            summary = "Dieser Northrend-Rufblock ist eng mit Eiskrone und der Argentumvorhut verknuepft. Der Fortschritt dreht sich vor allem um die dortigen Story- und Dungeon/Raid-Inhalte.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Argentumvorhut", kind = "Hub", location = { mapID = 118, title = "Argentumvorhut" } },
                { title = "Questlinien in Eiskrone", kind = "Story/Zone", location = { mapID = 118, title = "Eiskrone" } },
            },
        },
        [1119] = {
            summary = "Der Kernbezug dieses Rufblocks liegt bei K3 und den Sturmgipfeln. Klassisch dreht sich der Fortschritt um die lokalen Storylinien und taeglichen Aufgaben in der Zone.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "K3 und Sturmgipfel-Questlinien", kind = "Story/Zone", location = { mapID = 120, title = "Die Sturmgipfel" } },
            },
        },
        [1124] = {
            summary = "Dieser Rufblock ist im Retail-Core an Vault of Archavon verankert. Im aktuellen Addon-Kontext ist der Raid der relevante Bezugspunkt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Vault of Archavon", kind = "Raid", location = { title = "Vault of Archavon" } },
            },
        },
        [1156] = {
            summary = "Dieser Rufblock ist direkt an Icecrown Citadel gebunden. Der heutige Kernbezug liegt entsprechend beim Raid selbst.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Icecrown Citadel", kind = "Raid", location = { title = "Icecrown Citadel" } },
            },
        },
    },
})
