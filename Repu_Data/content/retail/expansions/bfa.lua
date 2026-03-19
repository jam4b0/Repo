local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2157] = {
            summary = "Dieser BfA-Rufblock ist an Zandalar, Zuldazar und Dazar'alor gebunden. Im Vordergrund stehen die dortigen Story- und Hubaktivitaeten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Zuldazar", kind = "Zone", location = { title = "Zuldazar" } },
                { title = "Dazar'alor", kind = "Hub", location = { title = "Dazar'alor" } },
            },
        },
        [2158] = {
            summary = "Der Kernbezug dieses BfA-Rufblocks liegt in Vol'dun und den dortigen Storylinien.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Vol'dun", kind = "Zone", location = { title = "Vol'dun" } },
            },
        },
        [2160] = {
            summary = "Dieser BfA-Rufblock ist an Kul Tiras, Tiragardesund und Boralus gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Tiragardesund", kind = "Zone", location = { title = "Tiragardesund" } },
                { title = "Boralus", kind = "Hub", location = { title = "Boralus" } },
            },
        },
        [2161] = {
            summary = "Der Kernbezug dieses BfA-Rufblocks liegt in Drustvar und Waycrest Manor.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Drustvar", kind = "Zone", location = { title = "Drustvar" } },
                { title = "Waycrest Manor", kind = "Dungeon", location = { title = "Waycrest Manor" } },
            },
        },
        [2162] = {
            summary = "Dieser BfA-Rufblock ist an Sturmsangtal und die dortigen Kul-Tiras-Inhalte gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Sturmsangtal", kind = "Zone", location = { title = "Sturmsangtal" } },
                { title = "Shrine of the Storm", kind = "Dungeon", location = { title = "Shrine of the Storm" } },
            },
        },
        [2370] = {
            summary = "Der Horde-Zweig von Nazjatar. Der Kernbezug liegt bei Neueheim und den lokalen Nazjatar-Aktivitaeten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Neueheim", kind = "Hub", location = { title = "Neueheim" } },
                { title = "Nazjatar", kind = "Zone", location = { title = "Nazjatar" } },
            },
        },
        [2373] = {
            summary = "Der Allianz-Zweig von Nazjatar. Der Kernbezug liegt bei Mezzamere und den lokalen Nazjatar-Aktivitaeten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Mezzamere", kind = "Hub", location = { title = "Mezzamere" } },
                { title = "Nazjatar", kind = "Zone", location = { title = "Nazjatar" } },
            },
        },
        [2391] = {
            summary = "Dieser BfA-Endgame-Rufblock ist an Mechagon, Rostbolzen und die Inselaktivitaeten gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Mechagon", kind = "Zone", location = { title = "Mechagon" } },
                { title = "Rostbolzen", kind = "Hub", location = { title = "Rostbolzen" } },
            },
        },
        [2395] = {
            summary = "Honeyback Hive ist ein lokaler Nebenruf von Kul Tiras, vor allem im Sturmsangtal. Der Fortschritt hängt an den bienenbezogenen Nebeninhalten dieses Gebiets.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Sturmsangtal side content", kind = "Zone", location = { title = "Sturmsangtal" } },
            },
        },
        [2415] = {
            summary = "Dieser spaete BfA-Rufblock ist an Ny'alotha und die letzten Schwarzimperium-Inhalte gekoppelt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Ny'alotha, the Waking City", kind = "Raid", location = { title = "Ny'alotha, the Waking City" } },
            },
        },
    },
})
