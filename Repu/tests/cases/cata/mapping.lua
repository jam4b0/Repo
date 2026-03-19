return {
    {
        name = "deepholm_prefers_therazane",
        context = {
            activeFlavor = "cata",
            zoneName = "Deepholm",
            zoneKey = "deepholm",
            subZoneName = "Temple of Earth",
            subZoneKey = "temple of earth",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 1171, name = "Therazane", standingID = 6, progressValue = 6000, progressMax = 12000, progressPct = 50, hasRepEntry = true },
            { factionID = 1158, name = "Guardians of Hyjal", standingID = 5, progressValue = 1000, progressMax = 6000, progressPct = 16.6, hasRepEntry = true },
        },
        expectTopFactionID = 1171,
    },
    {
        name = "uldum_prefers_ramkahen",
        context = {
            activeFlavor = "cata",
            zoneName = "Uldum",
            zoneKey = "uldum",
            subZoneName = "Ramkahen",
            subZoneKey = "ramkahen",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 1173, name = "Ramkahen", standingID = 5, progressValue = 1500, progressMax = 6000, progressPct = 25, hasRepEntry = true },
            { factionID = 1172, name = "Dragonmaw Clan", standingID = 4, progressValue = 0, progressMax = 3000, progressPct = 0, hasRepEntry = true },
        },
        expectTopFactionID = 1173,
    },
}
