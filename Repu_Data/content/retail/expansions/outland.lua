local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [933] = {
            summary = "Das Konsortium ist der Nethersturm- und Area-52-Rufblock der Scherbenwelt. Der Fortschritt sitzt an den arkanen, etherealen und ökonomischen Nebenpfaden dieser Region.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Nethersturm", kind = "Zone", location = { mapID = 104, title = "Nethersturm" } },
                { title = "Area 52", kind = "Hub", location = { mapID = 104, title = "Area 52" } },
            },
        },
        [941] = {
            summary = "Die Mag'har sind der Horde-bezogene Nagrand-Rufblock der Scherbenwelt. Der Fortschritt konzentriert sich auf Garadar und die Nagrand-Story.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Nagrand", kind = "Zone", location = { mapID = 107, title = "Nagrand" } },
                { title = "Garadar", kind = "Hub", location = { mapID = 107, title = "Garadar" } },
            },
        },
        [942] = {
            summary = "Die Expedition des Cenarius ist der lokale Rufblock von Zangarmarschen. Der Fortschritt sitzt an Cenarionszuflucht, den Dungeons des Gebiets und den dortigen Storypfaden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Zangarmarschen", kind = "Zone", location = { mapID = 102, title = "Zangarmarschen" } },
                { title = "Cenarionszuflucht", kind = "Hub", location = { mapID = 102, title = "Cenarionszuflucht" } },
            },
        },
        [947] = {
            summary = "Thrallmar ist der Horde-Rufblock der Höllenfeuerhalbinsel. Im Retail-Core ist er der lokale Anker für die Zone und ihre hordegeprägten Instanzpfade.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Höllenfeuerhalbinsel", kind = "Zone", location = { mapID = 100, title = "Höllenfeuerhalbinsel" } },
                { title = "The Shattered Halls", kind = "Dungeon", location = { title = "The Shattered Halls" } },
            },
        },
        [978] = {
            summary = "Die Kurenai sind der Allianz-bezogene Nagrand-Rufblock der Scherbenwelt. Der Fortschritt konzentriert sich auf Telaar und die Nagrand-Story.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Nagrand", kind = "Zone", location = { mapID = 107, title = "Nagrand" } },
                { title = "Telaar", kind = "Hub", location = { mapID = 107, title = "Telaar" } },
            },
        },
        [989] = {
            summary = "Die Hüter der Zeit sind der Caverns-of-Time-Rufblock und im Retail-Core über die Scherbenwelt-Zeitreiseinstanzen verankert.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Old Hillsbrad Foothills", kind = "Dungeon", location = { title = "Old Hillsbrad Foothills" } },
                { title = "The Black Morass", kind = "Dungeon", location = { title = "The Black Morass" } },
            },
        },
        [1012] = {
            summary = "Die Aschenzungen-Todesschwur ist der Schattenmondtal-/Schwarzer-Tempel-Rufblock der Scherbenwelt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Schattenmondtal", kind = "Zone", location = { mapID = 105, title = "Schattenmondtal" } },
                { title = "Der Schwarze Tempel", kind = "Raid", location = { title = "Der Schwarze Tempel" } },
            },
        },
        [1031] = {
            summary = "Die Himmelswache der Sha'tari ist eine spätere Scherbenwelt-Fraktion mit Schwerpunkt auf Schergrat, Luftpfaden und wiederholbaren Himmelswache-Aktivitäten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Schergrat", kind = "Zone", location = { mapID = 109, title = "Schergrat" } },
                { title = "Skyguard-Aufgaben", kind = "Täglich/Wiederholbar", location = { mapID = 109, title = "Schergrat" } },
            },
        },
        [1038] = {
            summary = "Ogri'la ist der Hub-Rufblock der Ogerhochburg im Schergrat und bündelt die dortigen wiederholbaren Aufgaben.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Schergrat", kind = "Zone", location = { mapID = 109, title = "Schergrat" } },
                { title = "Ogri'la", kind = "Hub", location = { mapID = 109, title = "Ogri'la" } },
            },
        },
        [1077] = {
            summary = "Die Offensive der Zerschmetterten Sonne ist der spaete Scherbenwelt-Endgame-Rufblock von Quel'Danas und dessen Daily-Zyklus.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Isle of Quel'Danas", kind = "Zone", location = { mapID = 122, title = "Isle of Quel'Danas" } },
                { title = "Quel'Danas-Dailys", kind = "Täglich", location = { mapID = 122, title = "Isle of Quel'Danas" } },
            },
        },
    },
})
