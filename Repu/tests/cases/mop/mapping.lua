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
}
