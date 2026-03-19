local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1269] = {
            summary = "Dieser Pandaria-Rufblock ist an das Tal der Ewigen Blueten gebunden. Relevanter Fortschritt haengt im heutigen Spiel an der Vale-Zone und den dortigen MoP-Inhalten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Tal der Ewigen Blueten", kind = "Zone", location = { mapID = 390, title = "Tal der Ewigen Blueten" } },
                { title = "Mogu'shan Palace", kind = "Dungeon", location = { title = "Mogu'shan Palace" } },
            },
        },
        [1270] = {
            summary = "Dieser Pandaria-Rufblock deckt vor allem Jadewald und Tonlongsteppe ab. Im Vordergrund stehen die Shado-Pan-nahen Story- und Dungeon-Inhalte.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Questlinien im Jadewald", kind = "Story/Zone", location = { mapID = 371, title = "Der Jadewald" } },
                { title = "Shado-Pan Monastery", kind = "Dungeon", location = { title = "Shado-Pan Monastery" } },
            },
        },
        [1271] = {
            summary = "Der Kernbezug dieses Rufblocks liegt in der Schreckensoede und den mantidenbezogenen Pandaria-Inhalten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Questlinien in der Schreckensoede", kind = "Story/Zone", location = { mapID = 418, title = "Schreckensoede" } },
                { title = "Heart of Fear", kind = "Raid", location = { title = "Heart of Fear" } },
            },
        },
        [1272] = {
            summary = "Dieser Rufblock ist an Tal der Vier Winde und Halbhuegel gebunden. Im Retail-Kontext liegen die wichtigsten Bezuege bei den Farm- und Hubaktivitaeten dieser Gegend.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Tal der Vier Winde", kind = "Zone", location = { mapID = 376, title = "Tal der Vier Winde" } },
                { title = "Halbhuegel", kind = "Hub", location = { mapID = 376, title = "Halbhuegel" } },
            },
        },
        [1302] = {
            summary = "Der Kernbezug dieses Pandaria-Rufblocks liegt in der Krasarangwildnis und ihren Storylinien.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Questlinien in der Krasarangwildnis", kind = "Story/Zone", location = { mapID = 388, title = "Krasarangwildnis" } },
            },
        },
        [1375] = {
            summary = "Horde-Hubruf des Schreins der Zwei Monde im Tal der Ewigen Blueten. Heute ist der Schrein selbst der zentrale Bezugspunkt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Schrein der Zwei Monde", kind = "Hub", location = { mapID = 390, title = "Schrein der Zwei Monde" } },
            },
        },
        [1376] = {
            summary = "Allianz-Hubruf des Schreins der Sieben Sterne im Tal der Ewigen Blueten. Heute ist der Schrein selbst der zentrale Bezugspunkt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Schrein der Sieben Sterne", kind = "Hub", location = { mapID = 390, title = "Schrein der Sieben Sterne" } },
            },
        },
        [1387] = {
            summary = "Dieser Rufblock ist an die Insel des Donners gebunden und folgt der jeweils seitenabhaengigen Offensive in der Zone.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Insel des Donners", kind = "Zone", location = { mapID = 507, title = "Insel des Donners" } },
            },
        },
        [1388] = {
            summary = "Die Sunreaver Onslaught ist der Horde-seitige Offensivruf der Insel des Donners und bildet dort das Gegenstück zur Kirin Tor Offensive.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Insel des Donners", kind = "Zone", location = { mapID = 507, title = "Insel des Donners" } },
            },
        },
        [1435] = {
            summary = "Der Kernbezug dieses Rufblocks liegt auf der Insel des Donnerkoenigs und im Raid Throne of Thunder.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Insel des Donnerkoenigs", kind = "Zone", location = { mapID = 507, title = "Insel des Donnerkoenigs" } },
                { title = "Throne of Thunder", kind = "Raid", location = { title = "Throne of Thunder" } },
            },
        },
        [1492] = {
            summary = "Dieser Pandaria-Endgame-Rufblock ist an die Zeitlose Insel und den spaeten MoP-Endgame-Zyklus gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Zeitlose Insel", kind = "Zone", location = { mapID = 554, title = "Zeitlose Insel" } },
                { title = "Siege of Orgrimmar", kind = "Raid", location = { title = "Siege of Orgrimmar" } },
            },
        },
    },
})
