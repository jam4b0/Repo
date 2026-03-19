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
}
