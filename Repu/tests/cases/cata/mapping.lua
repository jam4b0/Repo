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
    {
        name = "mount_hyjal_prefers_guardians_of_hyjal",
        context = {
            activeFlavor = "cata",
            zoneName = "Mount Hyjal",
            zoneKey = "mount hyjal",
            subZoneName = "Nordrassil",
            subZoneKey = "nordrassil",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 1158, name = "Guardians of Hyjal", standingID = 6, progressValue = 6000, progressMax = 12000, progressPct = 50, hasRepEntry = true },
            { factionID = 1171, name = "Therazane", standingID = 5, progressValue = 2000, progressMax = 6000, progressPct = 33.3, hasRepEntry = true },
        },
        expectTopFactionID = 1158,
    },
    {
        name = "firelands_prefers_avengers_of_hyjal",
        context = {
            activeFlavor = "cata",
            instanceName = "Firelands",
            instanceType = "raid",
            isInInstance = true,
        },
        rawFactions = {
            { factionID = 1158, name = "Guardians of Hyjal", standingID = 7, progressValue = 13000, progressMax = 21000, progressPct = 61.9, hasRepEntry = true },
            { factionID = 1204, name = "Avengers of Hyjal", standingID = 6, progressValue = 9000, progressMax = 12000, progressPct = 75, hasRepEntry = true },
            { factionID = 1172, name = "Dragonmaw Clan", standingID = 5, progressValue = 2000, progressMax = 6000, progressPct = 33.3, hasRepEntry = true },
        },
        expectTopFactionID = 1204,
    },
}
