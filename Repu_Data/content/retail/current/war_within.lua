local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

local FOUNDATION_HALL = {
    mapID = 2339,
    x = 0.392,
    y = 0.243,
    title = "Foundation Hall",
}

local GUNDARGAZ_VENDOR = {
    mapID = 2214,
    x = 0.432,
    y = 0.328,
    title = "Gundargaz",
}

local MERELDAR_VENDOR = {
    mapID = 2215,
    x = 0.413,
    y = 0.530,
    title = "Mereldar",
}

local WEAVERS_LAIR = {
    mapID = 2255,
    x = 0.553,
    y = 0.412,
    title = "The Weaver's Lair",
}

local INCONTINENTAL_HOTEL = {
    mapID = 2346,
    x = 0.436,
    y = 0.508,
    title = "Incontinental Hotel",
}

api.RegisterRetailContentModule({
    factions = {
        [2570] = {
            summary = "Große Ruhmfraktion von Heilsturz. Fortschritt kommt vor allem über Weltquests, seltene Gegner, Schätze und die wiederkehrende Aktivität 'Spreading the Light' in und um Mereldar.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Auralia Steelstrike",
                    label = "Rüstmeister",
                    location = MERELDAR_VENDOR,
                },
            },
            activities = {
                {
                    title = "Spreading the Light",
                    kind = "Wöchentlich/Event",
                    location = MERELDAR_VENDOR,
                },
                {
                    title = "Weltquests in Heilsturz",
                    kind = "Weltquests",
                    location = { mapID = 2215, title = "Hallowfall" },
                },
            },
        },
        [2590] = {
            summary = "Große Ruhmfraktion der Dorninsel und Dornogals. Fortschritt kommt vor allem über Weltquests, Story- und Nebenkapitel auf der Dorninsel sowie die üblichen Khaz-Algar-Aktivitäten.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Auditor Balwurz",
                    label = "Rüstmeister",
                    location = FOUNDATION_HALL,
                },
            },
            activities = {
                {
                    title = "Weltquests auf der Dorninsel",
                    kind = "Weltquests",
                    location = { mapID = 2248, title = "Isle of Dorn" },
                },
                {
                    title = "Story- und Nebenkapitel in Dornogal",
                    kind = "Einmalig/Warband",
                    location = FOUNDATION_HALL,
                },
            },
        },
        [2594] = {
            summary = "Große Ruhmfraktion der Ringing Deeps. Fortschritt kommt über Weltquests, Story- und Nebenkapitel rund um Gundargaz sowie wiederkehrende Aktivitäten in der Zone.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Waxmonger Squick",
                    label = "Rüstmeister",
                    location = GUNDARGAZ_VENDOR,
                },
            },
            activities = {
                {
                    title = "Weltquests in The Ringing Deeps",
                    kind = "Weltquests",
                    location = { mapID = 2214, title = "The Ringing Deeps" },
                },
                {
                    title = "Story- und Nebenkapitel in Gundargaz",
                    kind = "Einmalig/Warband",
                    location = GUNDARGAZ_VENDOR,
                },
            },
        },
        [2600] = {
            summary = "Große Ruhmfraktion von Azj-Kahet. Der Fortschritt dreht sich um den wöchentlichen Pakt mit einer der drei Unterfraktionen, Weltquests in Azj-Kahet und die Hauptaktivitäten rund um The Weaver's Lair.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Y'tekhi",
                    label = "Rüstmeister",
                    location = WEAVERS_LAIR,
                },
            },
            activities = {
                {
                    title = "Wöchentlicher Pakt",
                    kind = "Wöchentlich",
                    location = WEAVERS_LAIR,
                },
                {
                    title = "Weltquests in Azj-Kahet",
                    kind = "Weltquests",
                    location = { mapID = 2255, title = "Azj-Kahet" },
                },
            },
        },
        [2601] = {
            summary = "Die Weberin ist einer der drei wöchentlichen Paktpfade der Durchtrennten Fäden. Wenn ihr Pakt aktiv ist, bündelst du deinen Fortschritt über ihre Aufgaben und die Azj-Kahet-Aktivitäten auf diesen Zweig.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Pakt der Weberin",
                    kind = "Wöchentlich",
                    location = WEAVERS_LAIR,
                },
            },
        },
        [2605] = {
            summary = "Der General ist einer der drei wöchentlichen Paktpfade der Durchtrennten Fäden. Sein Zweig bündelt die auf Kampf und Sicherheit ausgerichteten Aufgaben in Azj-Kahet.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Pakt des Generals",
                    kind = "Wöchentlich",
                    location = WEAVERS_LAIR,
                },
            },
        },
        [2607] = {
            summary = "Der Wesir ist einer der drei wöchentlichen Paktpfade der Durchtrennten Fäden. Sein Zweig bündelt die eher auf Intrigen und Versorgung ausgerichteten Aufgaben in Azj-Kahet.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Pakt des Wesirs",
                    kind = "Wöchentlich",
                    location = WEAVERS_LAIR,
                },
            },
        },
        [2653] = {
            summary = "Große Ruhmfraktion von Lorenhall und Undermine. Der Fortschritt kommt über die wöchentliche Kartellwahl, Aktivitäten in Undermine und die wiederkehrende C.H.E.T.T.-Liste.",
            source = "seed",
            confidence = "medium",
            quartermasters = {
                {
                    name = "Smaks Topskimmer",
                    label = "Rüstmeister",
                    location = INCONTINENTAL_HOTEL,
                },
            },
            activities = {
                {
                    title = "Wöchentliche Kartellwahl",
                    kind = "Wöchentlich",
                    location = INCONTINENTAL_HOTEL,
                },
                {
                    title = "C.H.E.T.T.-Liste",
                    kind = "Wöchentlich",
                    location = INCONTINENTAL_HOTEL,
                },
            },
        },
        [2671] = {
            summary = "Die Venture Company ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Kartellwahl: Venture Company",
                    kind = "Wöchentlich",
                    location = INCONTINENTAL_HOTEL,
                },
            },
        },
        [2673] = {
            summary = "Das Bilgewasserkartell ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Kartellwahl: Bilgewasserkartell",
                    kind = "Wöchentlich",
                    location = INCONTINENTAL_HOTEL,
                },
            },
        },
        [2675] = {
            summary = "Schwarzmeer AG ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Kartellwahl: Schwarzmeer AG",
                    kind = "Wöchentlich",
                    location = INCONTINENTAL_HOTEL,
                },
            },
        },
        [2677] = {
            summary = "Das Dampfdruckkartell ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Kartellwahl: Dampfdruckkartell",
                    kind = "Wöchentlich",
                    location = INCONTINENTAL_HOTEL,
                },
            },
        },
        [2685] = {
            summary = "Der Garbagio Treueclub ist einer der wöchentlich wählbaren Lorenhall-Kartelle. Wenn dieses Kartell aktiv ist, bündelst du deine Undermine-Aktivitäten auf diesen Zweig.",
            source = "seed",
            confidence = "medium",
            activities = {
                {
                    title = "Kartellwahl: Garbagio Treueclub",
                    kind = "Wöchentlich",
                    location = INCONTINENTAL_HOTEL,
                },
            },
        },
    },
})
