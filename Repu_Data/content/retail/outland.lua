local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

local SHATTRATH_CITY = {
    mapID = 111,
    title = "Shattrath",
}

api.RegisterRetailContentModule({
    factions = {
        [9000111] = {
            summary = "Virtuelle Gruppenfraktion für Shattrath. Sie bündelt die großen Stadtfraktionen der Scherbenwelt, damit sie im UI als zusammengehöriger Cluster statt als ungeordnete Einzelfunde erscheinen.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Shattrath-Stadtfraktionen",
                    kind = "Cluster",
                    location = SHATTRATH_CITY,
                },
            },
        },
        [932] = {
            summary = "Die Aldor sind eine der beiden großen politischen Fraktionen Shattraths. Ihr Fortschritt ist vor allem an die Stadt und an die entsprechende Scryer/Aldor-Entscheidung gebunden.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Aldor-Aufgaben in Shattrath",
                    kind = "Stadtfraktion",
                    location = SHATTRATH_CITY,
                },
            },
        },
        [934] = {
            summary = "Die Seher sind die Gegenfraktion zu den Aldor in Shattrath. Ihr Fortschritt ist vor allem an die Stadt und an die entsprechende Aldor/Seher-Entscheidung gebunden.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Seher-Aufgaben in Shattrath",
                    kind = "Stadtfraktion",
                    location = SHATTRATH_CITY,
                },
            },
        },
        [935] = {
            summary = "Die Sha'tar bilden die zentrale Stadt- und Astralfraktion Shattraths. Sie begleiten einen großen Teil des Scherbenwelt-Fortschritts rund um die Stadt und ihre Instanzen.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Shattrath- und Tempelaufgaben",
                    kind = "Stadt/Instanzen",
                    location = SHATTRATH_CITY,
                },
            },
        },
        [1011] = {
            summary = "Unteres Viertel ist die Fraktion des unteren Stadtviertels von Shattrath und vieler umliegender Scherbenwelt-Aufgaben.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Aufgaben im Unteren Viertel",
                    kind = "Stadtfraktion",
                    location = SHATTRATH_CITY,
                },
            },
        },
        [1031] = {
            summary = "Die Himmelswache der Sha'tari ist eine spätere Scherbenwelt-Fraktion mit enger Bindung an Shattrath und den Schergrat.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Skyguard-Aufgaben",
                    kind = "Täglich/Wiederholbar",
                    location = SHATTRATH_CITY,
                },
            },
        },
        [1077] = {
            summary = "Die Offensive der Zerschmetterten Sonne ist die Insel-von-Quel'Danas-Fraktion, wird im Shattrath-Cluster aber sinnvoll als spätere Scherbenwelt-Erweiterung mitgeführt.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Quel'Danas-Dailys",
                    kind = "Täglich",
                    location = { mapID = 122, title = "Isle of Quel'Danas" },
                },
            },
        },
    },
})
