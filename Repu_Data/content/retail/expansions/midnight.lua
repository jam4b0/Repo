local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2696] = {
            summary = "Der Amanistamm ist der lokale Midnight-Rufblock rund um Zul'Aman. Fortschritt sammelt sich vor allem ueber die Zonenkampagne, Aufgaben im Amani-Gebiet und die lokalen Aktivitaeten dieses Zweigs.",
            source = "curated",
            confidence = "medium",
            activities = {
                {
                    title = "Zul'Aman-Kampagne",
                    kind = "Story/Zone",
                    location = { mapID = 2437, title = "Zul'Aman" },
                },
                {
                    title = "Lokale Aufgaben im Amani-Gebiet",
                    kind = "Zone",
                    location = { mapID = 2437, title = "Zul'Aman" },
                },
            },
        },
        [2699] = {
            summary = "Die Singularitaet ist der Midnight-Rufblock des Leerensturms. Der Schwerpunkt liegt auf der Zonenkampagne, lokalen Storyknoten und Aufgaben rund um die Leerenelfen- und Singularitaetslinie.",
            source = "curated",
            confidence = "medium",
            activities = {
                {
                    title = "Leerensturm-Kampagne",
                    kind = "Story/Zone",
                    location = { mapID = 2405, title = "Leerensturm" },
                },
                {
                    title = "Lokale Aufgaben im Leerensturm",
                    kind = "Zone",
                    location = { mapID = 2405, title = "Leerensturm" },
                },
            },
        },
        [2770] = {
            summary = "Slayer's Duellum ist ein lokaler Midnight-Nebenruf aus dem Leerensturm-/Voidstorm-Zweig. Im Retail-Core bleibt er bewusst ein Seitenpfad unterhalb der Singularitaet und kein allgemeiner Ortsanker fuer andere Gebiete.",
            source = "curated",
            confidence = "medium",
            activities = {
                {
                    title = "Leerensturm",
                    kind = "Story/Zone",
                    location = { mapID = 2405, title = "Leerensturm" },
                },
                {
                    title = "Obskurionzitadelle",
                    kind = "Hub",
                    location = { mapID = 2405, title = "Obskurionzitadelle" },
                },
            },
        },
        [2704] = {
            summary = "Die Hara'ti sind der Midnight-Rufblock von Harandar. Der Fortschritt dreht sich um die Harandar-Story, lokale Aufgaben und den regionalen Endgame-Zweig dieser Zone.",
            source = "curated",
            confidence = "medium",
            activities = {
                {
                    title = "Harandar-Kampagne",
                    kind = "Story/Zone",
                    location = { mapID = 2413, title = "Harandar" },
                },
                {
                    title = "Lokale Aufgaben in Harandar",
                    kind = "Zone",
                    location = { mapID = 2413, title = "Harandar" },
                },
            },
        },
    },
})
