local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1828] = {
            summary = "Dieser Legion-Rufblock ist an Hochberg und die dortigen lokalen Geschichten verankert.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Hochberg", kind = "Zone", location = { mapID = 650, title = "Hochberg" } },
                { title = "Neltharion's Lair", kind = "Dungeon", location = { title = "Neltharion's Lair" } },
            },
        },
        [1859] = {
            summary = "Der zentrale Suramar-Rufblock von Legion. Der Schwerpunkt liegt auf Shal'Aran, Suramar und den dortigen Kampagnen- sowie Dungeoninhalten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Suramar-Kampagne", kind = "Story/Zone", location = { mapID = 680, title = "Suramar" } },
                { title = "Shal'Aran", kind = "Hub", location = { mapID = 680, title = "Shal'Aran" } },
            },
        },
        [1883] = {
            summary = "Dalaran-Hubruf von Legion mit Bezug auf die Verheerten Inseln, Val'sharah und die zentrale Magierstadt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Legion-Dalaran", kind = "Hub", location = { mapID = 627, title = "Dalaran" } },
                { title = "Krasus' Landeplatz", kind = "Hub", location = { mapID = 627, title = "Krasus' Landeplatz" } },
            },
        },
        [1894] = {
            summary = "Dieser Legion-Rufblock ist an die Scherbenkueste und Tomb of Sargeras gebunden.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Scherbenkueste", kind = "Zone", location = { mapID = 646, title = "Scherbenkueste" } },
                { title = "Tomb of Sargeras", kind = "Raid", location = { title = "Tomb of Sargeras" } },
            },
        },
        [1900] = {
            summary = "Der Kernbezug dieses Legion-Rufblocks liegt in Azsuna und Eye of Azshara.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Azsuna", kind = "Zone", location = { mapID = 630, title = "Azsuna" } },
                { title = "Eye of Azshara", kind = "Dungeon", location = { title = "Eye of Azshara" } },
            },
        },
        [1948] = {
            summary = "Dieser Rufblock ist an Sturmheim, Haimont und die dortigen vrykulbezogenen Legion-Inhalte gekoppelt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Sturmheim", kind = "Zone", location = { mapID = 634, title = "Sturmheim" } },
                { title = "Haimont", kind = "Hub", location = { mapID = 634, title = "Haimont" } },
            },
        },
        [2045] = {
            summary = "Dieser Legion-Rufblock ist im Retail-Core direkt an Vault of the Wardens gekoppelt.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Vault of the Wardens", kind = "Dungeon", location = { title = "Vault of the Wardens" } },
            },
        },
        [2165] = {
            summary = "Argus-Rufblock mit Schwerpunkt auf Krokuun und dem Lichtarmeezweig der Endgame-Zone.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Krokuun", kind = "Zone", location = { mapID = 830, title = "Krokuun" } },
                { title = "Argus-Aktivitaeten", kind = "Zone", location = { mapID = 830, title = "Argus" } },
            },
        },
        [2170] = {
            summary = "Argus-Endgame-Rufblock mit Schwerpunkt auf den spaeten Antorus- und Argus-Inhalten.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Argus-Aktivitaeten", kind = "Zone", location = { mapID = 830, title = "Argus" } },
                { title = "Antorus, the Burning Throne", kind = "Raid", location = { title = "Antorus, the Burning Throne" } },
            },
        },
    },
})
