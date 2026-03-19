local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2407] = {
            summary = "Dieser Shadowlands-Rufblock ist an Bastion und den kyrianischen Zonenzweig gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Bastion", kind = "Zone", location = { title = "Bastion" } },
                { title = "Spires of Ascension", kind = "Dungeon", location = { title = "Spires of Ascension" } },
            },
        },
        [2410] = {
            summary = "Der Kernbezug dieses Shadowlands-Rufblocks liegt in Maldraxxus und den dortigen Story- und Dungeoninhalten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Maldraxxus", kind = "Zone", location = { title = "Maldraxxus" } },
                { title = "Theater of Pain", kind = "Dungeon", location = { title = "Theater of Pain" } },
            },
        },
        [2413] = {
            summary = "Dieser Shadowlands-Rufblock ist an Revendreth und den venthyrbezogenen Storypfad gekoppelt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Revendreth", kind = "Zone", location = { title = "Revendreth" } },
                { title = "Halls of Atonement", kind = "Dungeon", location = { title = "Halls of Atonement" } },
            },
        },
        [2439] = {
            summary = "The Avowed ist ein lokaler Nebenruf von Revendreth. Der Fortschritt sitzt an den rituellen und sammelorientierten Aktivitäten im Revendreth-Nebenpfad.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Revendreth side content", kind = "Zone", location = { title = "Revendreth" } },
            },
        },
        [2432] = {
            summary = "Der Kernbezug dieses Shadowlands-Rufblocks liegt im Schlund und den dortigen Endgame-Aktivitaeten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Der Schlund", kind = "Zone", location = { title = "Der Schlund" } },
                { title = "Schlund-Aktivitaeten", kind = "Endgame", location = { title = "Ve'naris Zuflucht" } },
            },
        },
        [2464] = {
            summary = "Dieser Shadowlands-Rufblock ist an Ardenwald und den dazugehoerigen Storyzweig gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Ardenwald", kind = "Zone", location = { title = "Ardenwald" } },
                { title = "Mists of Tirna Scithe", kind = "Dungeon", location = { title = "Mists of Tirna Scithe" } },
            },
        },
        [2465] = {
            summary = "The Wild Hunt ist der zentrale lokale Ardenweald-Ruf. Fortschritt kommt über die Zonenstory, wiederkehrende Aufgaben und die wichtigsten Aktivitäten des Waldpfads.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Ardenweald", kind = "Zone", location = { title = "Ardenwald" } },
            },
        },
        [2470] = {
            summary = "Dieser Shadowlands-Raidrufblock ist an Sanctum of Domination gekoppelt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Sanctum of Domination", kind = "Raid", location = { title = "Sanctum of Domination" } },
            },
        },
        [2472] = {
            summary = "The Archivists' Codex ist der lokale Nebenruf von Korthia. Der Fortschritt sitzt an Reliktforschung, Korthia-Aktivitäten und dem Hub rund um Keeper's Respite.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Korthia", kind = "Zone", location = { mapID = 1961, title = "Korthia" } },
                { title = "Keeper's Respite", kind = "Hub", location = { mapID = 1961, title = "Keeper's Respite" } },
                { title = "Relic research", kind = "Recurring", location = { mapID = 1961, title = "Korthia" } },
            },
        },
        [2478] = {
            summary = "Der spaete Shadowlands-Rufblock von Zereth Mortis. Relevanter Fortschritt kommt ueber die Zone, Haven und den Abschlusszyklus von Shadowlands.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Zereth Mortis", kind = "Zone", location = { title = "Zereth Mortis" } },
                { title = "Haven", kind = "Hub", location = { title = "Haven" } },
            },
        },
    },
})
