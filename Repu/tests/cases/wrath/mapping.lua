return {
    {
        name = "dalaran_prefers_kirin_tor",
        context = {
            activeFlavor = "wrath",
            zoneName = "Dalaran",
            zoneKey = "dalaran",
            subZoneName = "The Violet Citadel",
            subZoneKey = "the violet citadel",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 1090, name = "Kirin Tor", standingID = 7, progressValue = 4000, progressMax = 21000, progressPct = 19, hasRepEntry = true },
            { factionID = 1106, name = "Argent Crusade", standingID = 6, progressValue = 8000, progressMax = 12000, progressPct = 66.6, hasRepEntry = true },
        },
        expectTopFactionID = 1090,
    },
    {
        name = "icecrown_prefers_sons_of_hodir_or_argent_mix",
        context = {
            activeFlavor = "wrath",
            zoneName = "Icecrown",
            zoneKey = "icecrown",
            subZoneName = "Argent Vanguard",
            subZoneKey = "argent vanguard",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 1106, name = "Argent Crusade", standingID = 7, progressValue = 12000, progressMax = 21000, progressPct = 57.1, hasRepEntry = true },
            { factionID = 1119, name = "The Sons of Hodir", standingID = 6, progressValue = 5000, progressMax = 12000, progressPct = 41.6, hasRepEntry = true },
        },
        expectTopFactionID = 1106,
        requireVisibleFactionIDs = { 1119 },
    },
}
