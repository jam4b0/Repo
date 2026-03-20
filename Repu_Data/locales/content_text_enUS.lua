local api = _G.RepuAPI

if not api or not api.RegisterLocaleDomain then
    return
end

api.RegisterLocaleDomain("retail_content_text", "enUS", {
    ["activity.saltherils_soiree.title"] = "Saltheril's Soiree",
    ["activity.shattrath.aldor_tasks.title"] = "Aldor tasks in Shattrath",
    ["activity.shattrath.city_factions.title"] = "Shattrath city factions",
    ["activity.shattrath.lower_city_tasks.title"] = "Lower City tasks",
    ["activity.shattrath.scryer_tasks.title"] = "Scryer tasks in Shattrath",
    ["activity.shattrath.temple_tasks.title"] = "Shattrath and temple tasks",
    ["common.quartermaster"] = "Quartermaster",
    ["faction.2710.quartermaster.blood_knights.label"] = "Blood Knight",
    ["faction.2710.quartermaster.lane_warden.label"] = "Lane Warden",
    ["faction.2710.quartermaster.magisters.label"] = "Magister",
    ["faction.2710.quartermaster.wayfarer.label"] = "Wayfarer",
    ["faction.9000111.summary"] = "Shattrath is modeled as a legacy family cluster in the retail core. It groups Sha'tar, Aldor, Scryers, and Lower City so the city appears as a coherent reputation block instead of unrelated one-off entries.",
    ["npc.apprentice_diell.name"] = "Apprentice Diell",
    ["npc.armorsmith_goldcrest.name"] = "Armorsmith Goldcrest",
    ["npc.neriv.name"] = "Neriv",
    ["npc.ranger_allorn.name"] = "Ranger Allorn",
})
