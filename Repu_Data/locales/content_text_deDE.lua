local api = _G.RepuAPI

if not api or not api.RegisterLocaleDomain then
    return
end

api.RegisterLocaleDomain("retail_content_text", "deDE", {
    ["activity.saltherils_soiree.title"] = "Saltherils Soiree",
    ["activity.shattrath.aldor_tasks.title"] = "Aldor-Aufgaben in Shattrath",
    ["activity.shattrath.city_factions.title"] = "Shattrath-Stadtfraktionen",
    ["activity.shattrath.lower_city_tasks.title"] = "Aufgaben im Unteren Viertel",
    ["activity.shattrath.scryer_tasks.title"] = "Seher-Aufgaben in Shattrath",
    ["activity.shattrath.temple_tasks.title"] = "Shattrath- und Tempelaufgaben",
    ["common.quartermaster"] = "Rüstmeister",
    ["faction.2710.quartermaster.blood_knights.label"] = "Blutritter",
    ["faction.2710.quartermaster.lane_warden.label"] = "Schemen der Gasse",
    ["faction.2710.quartermaster.magisters.label"] = "Magister",
    ["faction.2710.quartermaster.wayfarer.label"] = "Weltenwanderer",
    ["faction.9000111.summary"] = "Virtuelle Gruppenfraktion für Shattrath. Sie bündelt die großen Stadtfraktionen der Scherbenwelt, damit sie im UI als zusammengehöriger Cluster statt als ungeordnete Einzelfunde erscheinen.",
    ["npc.apprentice_diell.name"] = "Lehrling Diell",
    ["npc.armorsmith_goldcrest.name"] = "Rüstungsschmied Goldwappen",
    ["npc.neriv.name"] = "Neriv",
    ["npc.ranger_allorn.name"] = "Waldläufer Allorn",
})
