return {
    {
        name = "shattrath_city_surfaces_legacy_family",
        context = {
            activeFlavor = "tbc",
            zoneName = "Shattrath City",
            zoneKey = "shattrath city",
            subZoneName = "Terrace of Light",
            subZoneKey = "terrace of light",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 935, name = "The Sha'tar", standingID = 6, progressValue = 2500, progressMax = 12000, progressPct = 20.8, hasRepEntry = true },
            { factionID = 932, name = "The Aldor", standingID = 5, progressValue = 500, progressMax = 6000, progressPct = 8.3, hasRepEntry = true },
            { factionID = 934, name = "The Scryers", standingID = 5, progressValue = 1000, progressMax = 6000, progressPct = 16.6, hasRepEntry = true },
            { factionID = 1011, name = "Lower City", standingID = 5, progressValue = 2200, progressMax = 6000, progressPct = 36.6, hasRepEntry = true },
        },
        expectTopFactionID = 935,
        requireVisibleFactionIDs = { 932, 934, 1011 },
    },
    {
        name = "hellfire_peninsula_uses_honor_hold_thrallmar_cluster",
        context = {
            activeFlavor = "tbc",
            zoneName = "Hellfire Peninsula",
            zoneKey = "hellfire peninsula",
            subZoneName = "Honor Hold",
            subZoneKey = "honor hold",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 946, name = "Honor Hold", standingID = 5, progressValue = 800, progressMax = 6000, progressPct = 13.3, hasRepEntry = true },
            { factionID = 947, name = "Thrallmar", standingID = 5, progressValue = 1200, progressMax = 6000, progressPct = 20, hasRepEntry = true },
        },
        expectTopFactionID = 946,
    },
}
