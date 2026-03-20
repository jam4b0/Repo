local _, ns = ...

-- Generated from explicit second-wave hub review.
-- This file keeps only outdoor or hub-like subzones that are safe enough for coverage.
-- excluded hub: Die Andre Seite (Ardenwald, mapID=1917)
-- excluded hub: Reich der Kälte (Argus, mapID=1717)
-- excluded hub: Vestibül der Ewigkeit (Argus, mapID=1715)
-- excluded hub: Zerschmetterter Hain (Argus, mapID=1691)
-- excluded hub: Kolosseum des Aufstiegs (Bastion, mapID=1711)
-- excluded hub: Pechschwingenhort (Brennende Steppe, mapID=1560)
-- excluded hub: Malornes Alptraum (Der Hyjal, mapID=760)
-- excluded hub: Ein Sturm braut sich zusammen (Der Jadewald, mapID=447)
-- excluded hub: Minimap_RingingDeeps_Coreway (Die Schallenden Tiefen, mapID=2431)
-- excluded hub: Bucht von Nashal (Die Verheerten Inseln, mapID=671)
-- excluded hub: Himmelsfeste (Die Verheerten Inseln, mapID=1971)
-- excluded hub: Höllenschlundmorast (Die Verheerten Inseln, mapID=694)
-- excluded hub: Wirbelnder Nether (Die Verheerten Inseln, mapID=645)
-- excluded hub: Ein Dolch im Dunkel (Die Verhüllte Treppe, mapID=488)
-- excluded hub: Das Verlies (Die Östlichen Königreiche, mapID=1013)
-- excluded hub: Ruinen von Lordaeron (Die Östlichen Königreiche, mapID=908)
-- excluded hub: Strand der Uralten (Drachenöde, mapID=128)
-- excluded hub: Eiskronenzitadelle (Eiskrone, mapID=1558)
-- excluded hub: Insel der Eroberung (Eiskrone, mapID=169)
-- excluded hub: Sitz des Triumvirats (Eredath, mapID=903)
-- excluded hub: Düsterbruch (Feralas, mapID=234)
-- excluded hub: Ursocs Unterschlupf (Grizzlyhügel, mapID=757)
-- excluded hub: Priorat der Heiligen Flamme (Heilsturz, mapID=2330)
-- excluded hub: Der Drachenrücken (Hochberg, mapID=1472)
-- excluded hub: Neltharions Hort (Hochberg, mapID=731)
-- excluded hub: Der Schwarze Morast (Höhlen der Zeit, mapID=273)
-- excluded hub: Vorgebirge des Alten Hügellands (Höhlen der Zeit, mapID=274)
-- excluded hub: Ahn'Qiraj: Das Gefallene Königreich (Kalimdor, mapID=327)
-- excluded hub: Ein wenig Geduld (Krasarangwildnis, mapID=487)
-- excluded hub: Unga Ingu (Krasarangwildnis, mapID=450)
-- excluded hub: Shado-Pan-Kraftprobe (Kun-Lai-Gipfel, mapID=843)
-- excluded hub: Azmerloth (Nordend, mapID=2092)
-- excluded hub: Gluthof (Revendreth, mapID=1644)
-- excluded hub: Schloss Nathria (Revendreth, mapID=1755)
-- excluded hub: Zwillingsgipfel (Schattenhochland, mapID=206)
-- excluded hub: Baines Rettung (Schlacht um Orgrimmar, mapID=1479)
-- excluded hub: Ruinen von Ahn'Qiraj (Silithus, mapID=247)
-- excluded hub: Silithusrauferei (Silithus, mapID=904)
-- excluded hub: Felder der Ewigen Jagd (Sturmheim, mapID=877)
-- excluded hub: Helheim (Sturmheim, mapID=649)
-- excluded hub: Zukunft der Primalisten (Thaldraszus, mapID=2085)
-- excluded hub: Verlorene Stadt der Tol'vir (Uldum, mapID=277)
-- excluded hub: Dämmerndes Riff (Val'sharah, mapID=758)
-- excluded hub: Finsterherzdickicht (Val'sharah, mapID=733)
-- excluded hub: Vorgebirge des Hügellands (Süderstade vs. Tarrens Mühle) (Vorgebirge des Hügellands, mapID=623)
-- excluded hub: Turnier der Erhabenen (Zeitlose Insel, mapID=571)
-- excluded hub: Pestländer: Die Scharlachrote Enklave (Östliche Pestländer, mapID=124)
ns.Data:RegisterRetailModule({
    locations = {
        zones = {},
        subZones = {
            ["1662:konservatorium-der-koenigin"] = {
                name = "Konservatorium der Königin",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 1662 },
                subZoneKeys = { "Konservatorium der Königin" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Ardenwald" },
            },
            ["622:sturmschild"] = {
                name = "Sturmschild",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 622 },
                subZoneKeys = { "Sturmschild" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Ashran" },
            },
            ["338:geschmolzene-front"] = {
                name = "Geschmolzene Front",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 338 },
                subZoneKeys = { "Geschmolzene Front" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Der Hyjal" },
            },
            ["2345:tiefbeuteschlucht"] = {
                name = "Tiefbeuteschlucht",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 2345 },
                subZoneKeys = { "Tiefbeuteschlucht" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Die Schallenden Tiefen" },
            },
            ["1648:der-schlund"] = {
                name = "Der Schlund",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 1648 },
                subZoneKeys = { "Der Schlund" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Die Schattenlande" },
            },
            ["750:donnertotem"] = {
                name = "Donnertotem",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 750 },
                subZoneKeys = { "Donnertotem" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Hochberg" },
            },
            ["218:ruinen-von-gilneas-stadt"] = {
                name = "Ruinen von Gilneas (Stadt)",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 218 },
                subZoneKeys = { "Ruinen von Gilneas (Stadt)" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Ruinen von Gilneas" },
            },
            ["2146:oestliche-lichtungen"] = {
                name = "Östliche Lichtungen",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 2146 },
                subZoneKeys = { "Östliche Lichtungen" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Tirisfal" },
            },
            ["1468:der-hain-der-traeume"] = {
                name = "Der Hain der Träume",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 1468 },
                subZoneKeys = { "Der Hain der Träume" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Val'sharah" },
            },
            ["793:rabenwehr"] = {
                name = "Rabenwehr",
                source = "seed",
                confidence = "medium",
                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",
                mapIDs = { 793 },
                subZoneKeys = { "Rabenwehr" },
                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "Val'sharah" },
            },
        },
        instances = {},
        raids = {},
    },
})
