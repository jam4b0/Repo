return {
    {
        name = "vale_prefers_golden_lotus",
        context = {
            activeFlavor = "mop",
            zoneName = "Vale of Eternal Blossoms",
            zoneKey = "vale of eternal blossoms",
            subZoneName = "Shrine of Seven Stars",
            subZoneKey = "shrine of seven stars",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 1269, name = "Golden Lotus", standingID = 6, progressValue = 3000, progressMax = 12000, progressPct = 25, hasRepEntry = true },
            { factionID = 1376, name = "Operation: Shieldwall", standingID = 5, progressValue = 1000, progressMax = 6000, progressPct = 16.6, hasRepEntry = true },
        },
        expectTopFactionID = 1269,
    },
    {
        name = "timeless_isle_prefers_emperor_shaohao",
        context = {
            activeFlavor = "mop",
            zoneName = "Timeless Isle",
            zoneKey = "timeless isle",
            subZoneName = "Celestial Court",
            subZoneKey = "celestial court",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 1492, name = "Emperor Shaohao", standingID = 5, progressValue = 2200, progressMax = 6000, progressPct = 36.6, hasRepEntry = true },
            { factionID = 1435, name = "Shado-Pan Assault", standingID = 5, progressValue = 100, progressMax = 6000, progressPct = 1.6, hasRepEntry = true },
        },
        expectTopFactionID = 1492,
    },
    {
        name = "krasarang_prefers_operation_shieldwall",
        context = {
            activeFlavor = "mop",
            zoneName = "Krasarang Wilds",
            zoneKey = "krasarang wilds",
            subZoneName = "Lion's Landing",
            subZoneKey = "lion s landing",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 1302, name = "The Anglers", standingID = 5, progressValue = 500, progressMax = 6000, progressPct = 8.3, hasRepEntry = true },
            { factionID = 1376, name = "Operation: Shieldwall", standingID = 6, progressValue = 7000, progressMax = 12000, progressPct = 58.3, hasRepEntry = true },
        },
        expectTopFactionID = 1302,
    },
    {
        name = "siege_of_orgrimmar_prefers_emperor_shaohao",
        context = {
            activeFlavor = "mop",
            instanceName = "Siege of Orgrimmar",
            instanceType = "raid",
            isInInstance = true,
        },
        rawFactions = {
            { factionID = 1492, name = "Emperor Shaohao", standingID = 6, progressValue = 5000, progressMax = 12000, progressPct = 41.6, hasRepEntry = true },
            { factionID = 1435, name = "Shado-Pan Assault", standingID = 7, progressValue = 12000, progressMax = 21000, progressPct = 57.1, hasRepEntry = true },
        },
        expectTopFactionID = 1492,
    },
}
