local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

local SALTHERILS_HAVEN = {
    mapID = 2395,
    x = 0.434,
    y = 0.474,
}

local SALTHERILS_HAVEN_WEST = {
    mapID = 2395,
    x = 0.434,
    y = 0.476,
}

local SALTHERILS_SOIREE = {
    mapID = 2395,
    x = 0.426,
    y = 0.472,
}

api.RegisterRetailContentModule({
    factions = {
        [911] = {
            summary = "Die große Ruhmfraktion von Quel'Thalas. Fortschritt entsteht parallel zu den vier lokalen Unterfraktionen des Hofs in Silbermond. Je nach aktueller Auswahl sind unterschiedliche Rüstmeister relevant.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Lehrling Diell",
                    label = "Magister",
                    location = {
                        mapID = SALTHERILS_HAVEN.mapID,
                        x = SALTHERILS_HAVEN.x,
                        y = SALTHERILS_HAVEN.y,
                        title = "Lehrling Diell",
                    },
                },
                {
                    name = "Rüstungsschmied Goldwappen",
                    label = "Blutritter",
                    location = {
                        mapID = SALTHERILS_HAVEN.mapID,
                        x = SALTHERILS_HAVEN.x,
                        y = SALTHERILS_HAVEN.y,
                        title = "Rüstungsschmied Goldwappen",
                    },
                },
                {
                    name = "Neriv",
                    label = "Schemen der Gasse",
                    location = {
                        mapID = SALTHERILS_HAVEN_WEST.mapID,
                        x = SALTHERILS_HAVEN_WEST.x,
                        y = SALTHERILS_HAVEN_WEST.y,
                        title = "Neriv",
                    },
                },
                {
                    name = "Waldläufer Allorn",
                    label = "Weltenwanderer",
                    location = {
                        mapID = SALTHERILS_HAVEN_WEST.mapID,
                        x = SALTHERILS_HAVEN_WEST.x,
                        y = SALTHERILS_HAVEN_WEST.y,
                        title = "Waldläufer Allorn",
                    },
                },
            },
            activities = {
                {
                    title = "Saltherils Soiree",
                    kind = "Wöchentlich",
                    location = {
                        mapID = SALTHERILS_SOIREE.mapID,
                        x = SALTHERILS_SOIREE.x,
                        y = SALTHERILS_SOIREE.y,
                        title = "Saltherils Soiree",
                    },
                },
            },
        },
        [2713] = {
            summary = "Gebietsfraktion des Immersangwalds mit Fokus auf Wald, Grenzen und Wildnis. Ruf erhältst du vor allem über Quests und Fraktionsaktivitäten im Immersangwald.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Waldläufer Allorn",
                    label = "Rüstmeister",
                    location = {
                        mapID = SALTHERILS_HAVEN_WEST.mapID,
                        x = SALTHERILS_HAVEN_WEST.x,
                        y = SALTHERILS_HAVEN_WEST.y,
                        title = "Waldläufer Allorn",
                    },
                },
            },
            activities = {
                {
                    title = "Saltherils Soiree",
                    kind = "Wöchentlich",
                    location = {
                        mapID = SALTHERILS_SOIREE.mapID,
                        x = SALTHERILS_SOIREE.x,
                        y = SALTHERILS_SOIREE.y,
                        title = "Saltherils Soiree",
                    },
                },
            },
        },
        [2711] = {
            summary = "Städtische Fraktion rund um arkane Ordnung, Verwaltung und Magister-Infrastruktur. Ruf erhältst du über passende Questlinien und Silbermond-Aktivitäten.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Lehrling Diell",
                    label = "Rüstmeister",
                    location = {
                        mapID = SALTHERILS_HAVEN.mapID,
                        x = SALTHERILS_HAVEN.x,
                        y = SALTHERILS_HAVEN.y,
                        title = "Lehrling Diell",
                    },
                },
            },
            activities = {
                {
                    title = "Saltherils Soiree",
                    kind = "Wöchentlich",
                    location = {
                        mapID = SALTHERILS_SOIREE.mapID,
                        x = SALTHERILS_SOIREE.x,
                        y = SALTHERILS_SOIREE.y,
                        title = "Saltherils Soiree",
                    },
                },
            },
        },
        [2712] = {
            summary = "Militärisch geprägte Stadtfraktion mit Fokus auf Blutritter und Sicherheitsstruktur. Ruf entsteht über den Immersangwald und das Silbermond-Eventsystem.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Rüstungsschmied Goldwappen",
                    label = "Rüstmeister",
                    location = {
                        mapID = SALTHERILS_HAVEN.mapID,
                        x = SALTHERILS_HAVEN.x,
                        y = SALTHERILS_HAVEN.y,
                        title = "Rüstungsschmied Goldwappen",
                    },
                },
            },
            activities = {
                {
                    title = "Saltherils Soiree",
                    kind = "Wöchentlich",
                    location = {
                        mapID = SALTHERILS_SOIREE.mapID,
                        x = SALTHERILS_SOIREE.x,
                        y = SALTHERILS_SOIREE.y,
                        title = "Saltherils Soiree",
                    },
                },
            },
        },
        [2714] = {
            summary = "Lokale Stadtfraktion für Gassen- und Untergrundbereiche in Silbermond. Ruf erhältst du über passende Quests und das wöchentliche Stadt-Event.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Neriv",
                    label = "Rüstmeister",
                    location = {
                        mapID = SALTHERILS_HAVEN_WEST.mapID,
                        x = SALTHERILS_HAVEN_WEST.x,
                        y = SALTHERILS_HAVEN_WEST.y,
                        title = "Neriv",
                    },
                },
            },
            activities = {
                {
                    title = "Saltherils Soiree",
                    kind = "Wöchentlich",
                    location = {
                        mapID = SALTHERILS_SOIREE.mapID,
                        x = SALTHERILS_SOIREE.x,
                        y = SALTHERILS_SOIREE.y,
                        title = "Saltherils Soiree",
                    },
                },
            },
        },
    },
})
