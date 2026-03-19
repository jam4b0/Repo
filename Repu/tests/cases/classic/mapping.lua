return {
    {
        name = "durotar_prefers_orgrimmar_and_darkspear",
        context = {
            activeFlavor = "classic",
            zoneName = "Durotar",
            zoneKey = "durotar",
            subZoneName = "Sen'jin Village",
            subZoneKey = "sen jin village",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 76, name = "Orgrimmar", standingID = 5, progressValue = 1200, progressMax = 6000, progressPct = 20, hasRepEntry = true },
            { factionID = 530, name = "Darkspear Trolls", standingID = 5, progressValue = 2400, progressMax = 6000, progressPct = 40, hasRepEntry = true },
        },
        expectTopFactionID = 76,
        requireVisibleFactionIDs = { 530 },
    },
    {
        name = "molten_core_uses_hydraxian_waterlords",
        context = {
            activeFlavor = "classic",
            instanceName = "Molten Core",
            instanceType = "raid",
            isInInstance = true,
        },
        rawFactions = {
            { factionID = 749, name = "Hydraxian Waterlords", standingID = 4, progressValue = 300, progressMax = 3000, progressPct = 10, hasRepEntry = true },
            { factionID = 59, name = "Thorium Brotherhood", standingID = 5, progressValue = 1500, progressMax = 6000, progressPct = 25, hasRepEntry = true },
        },
        expectTopFactionID = 749,
    },
    {
        name = "stranglethorn_vale_prefers_booty_bay",
        context = {
            activeFlavor = "classic",
            zoneName = "Stranglethorn Vale",
            zoneKey = "stranglethorn vale",
            subZoneName = "Booty Bay",
            subZoneKey = "booty bay",
            instanceType = "none",
            isInInstance = false,
        },
        rawFactions = {
            { factionID = 21, name = "Booty Bay", standingID = 6, progressValue = 7000, progressMax = 12000, progressPct = 58.3, hasRepEntry = true },
            { factionID = 530, name = "Darkspear Trolls", standingID = 5, progressValue = 1000, progressMax = 6000, progressPct = 16.6, hasRepEntry = true },
        },
        expectTopFactionID = 21,
    },
    {
        name = "blackrock_depths_prefers_thorium_brotherhood",
        context = {
            activeFlavor = "classic",
            instanceName = "Blackrock Depths",
            instanceType = "party",
            isInInstance = true,
        },
        rawFactions = {
            { factionID = 59, name = "Thorium Brotherhood", standingID = 7, progressValue = 14000, progressMax = 21000, progressPct = 66.6, hasRepEntry = true },
            { factionID = 749, name = "Hydraxian Waterlords", standingID = 4, progressValue = 0, progressMax = 3000, progressPct = 0, hasRepEntry = true },
        },
        expectTopFactionID = 59,
    },
}
