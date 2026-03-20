local function deepMerge(target, source)
    for key, value in pairs(source or {}) do
        if type(value) == "table" and #value == 0 then
            target[key] = target[key] or {}
            deepMerge(target[key], value)
        else
            target[key] = value
        end
    end
end

local function countKeys(tableValue)
    local count = 0
    for _ in pairs(tableValue or {}) do
        count = count + 1
    end
    return count
end

local function shallowCopy(value)
    if type(value) ~= "table" then
        return value
    end

    local copy = {}
    for key, entry in pairs(value) do
        copy[key] = shallowCopy(entry)
    end
    return copy
end

local collected = {
    factions = {},
}

_G.RepuAPI = {
    RegisterRetailContentModule = function(payload)
        deepMerge(collected, payload or {})
    end,
}

local root = "/root/Repo/Repu_Data/"
local descriptionCachePath = root .. "tools/retail_faction_descriptions_enUS.lua"

local files = {
    "content/retail/summary/generated.lua",
    "content/retail/families/quelthalas.lua",
    "content/retail/families/shattrath.lua",
    "content/retail/expansions/midnight.lua",
    "content/retail/expansions/outland.lua",
    "content/retail/expansions/war_within.lua",
    "content/retail/expansions/cataclysm.lua",
    "content/retail/legacy/homelands.lua",
    "content/retail/legacy/neutral_hubs.lua",
    "content/retail/expansions/northrend.lua",
    "content/retail/expansions/pandaria.lua",
    "content/retail/expansions/draenor.lua",
    "content/retail/expansions/legion.lua",
    "content/retail/expansions/bfa.lua",
    "content/retail/expansions/shadowlands.lua",
    "content/retail/expansions/dragonflight.lua",
}

local function loadEnglishDescriptionCache()
    local chunk = loadfile(descriptionCachePath)
    if not chunk then
        return {}
    end

    local ok, payload = pcall(chunk)
    if not ok or type(payload) ~= "table" then
        return {}
    end

    return payload.factions or {}
end

for _, relativePath in ipairs(files) do
    local chunk = assert(loadfile(root .. relativePath))
    chunk()
end

local TITLE_MAP = {
    ["Ardenwald"] = "Ardenweald",
    ["Azurmythosinsel"] = "Azuremyst Isle",
    ["Blutmythosinsel"] = "Bloodmyst Isle",
    ["The Blutmythosinsel"] = "Bloodmyst Isle",
    ["Brennende Steppe"] = "Burning Steppes",
    ["Donnerfels"] = "Thunder Bluff",
    ["Dunkelmond-Insel"] = "Darkmoon Island",
    ["Dun Morogh"] = "Dun Morogh",
    ["Durotar"] = "Durotar",
    ["Eisenschmiede"] = "Ironforge",
    ["Eschental"] = "Ashenvale",
    ["Immersangwald"] = "Eversong Woods",
    ["Nördliches Brachland"] = "Northern Barrens",
    ["Östliche Pestländer"] = "Eastern Plaguelands",
    ["Schlingendorntal"] = "Stranglethorn Vale",
    ["Silbermond"] = "Silvermoon City",
    ["Sengende Schlucht"] = "Searing Gorge",
    ["Sturmwind"] = "Stormwind",
    ["Teufelswald"] = "Felwood",
    ["Unterstadt"] = "Undercity",
    ["Westliche Pestländer"] = "Western Plaguelands",
    ["Winterquell"] = "Winterspring",
    ["Ardenwald"] = "Ardenweald",
    ["Argentumvorhut"] = "Argent Crusade",
    ["Argus-Aktivitaeten"] = "Argus activities",
    ["Archivaktivitäten in Tyrhold"] = "Archive activities in Tyrhold",
    ["Aufgaben im Unteren Viertel"] = "Lower City tasks",
    ["Aussenposten der Erwachten"] = "Outpost of the Awakened",
    ["Azurblaue Gebirge"] = "The Azure Span",
    ["Boreanische Tundra"] = "Borean Tundra",
    ["Dalaran-Stadtaktivitaeten"] = "Dalaran city activities",
    ["Der Jadewald"] = "The Jade Forest",
    ["Der Schlund"] = "The Maw",
    ["Der Schwarze Tempel"] = "Black Temple",
    ["Die Sturmgipfel"] = "The Storm Peaks",
    ["Drachenoede"] = "Dragonblight",
    ["Ebenen von Ohn'ahra"] = "Ohn'ahran Plains",
    ["Heulender Fjord"] = "Howling Fjord",
    ["Hochberg"] = "Highmountain",
    ["Höllenfeuerhalbinsel"] = "Hellfire Peninsula",
    ["Insel des Donnerkoenigs"] = "Isle of the Thunder King",
    ["Insel des Donners"] = "Isle of Thunder",
    ["Krasarangwildnis"] = "Krasarang Wilds",
    ["Krasus' Landeplatz"] = "Krasus' Landing",
    ["Kriegsmuehle"] = "War Mill",
    ["Kriegsspeer"] = "Warspear",
    ["Küste des Erwachens"] = "The Waking Shores",
    ["K3 und Sturmgipfel-Questlinien"] = "K3 and Storm Peaks questlines",
    ["Leerensturm"] = "Voidstorm",
    ["Lokale Aufgaben im Amani-Gebiet"] = "Local tasks in the Amani area",
    ["Lokale Aufgaben im Leerensturm"] = "Local tasks in Voidstorm",
    ["Lokale Aufgaben in Harandar"] = "Local tasks in Harandar",
    ["Mereldar call to arms"] = "Mereldar call to arms",
    ["Mondsturz"] = "Moonfall",
    ["Mondlichtung"] = "Moonglade",
    ["Nordliches Brachland"] = "Northern Barrens",
    ["Pakt der Weberin"] = "Pact of the Weaver",
    ["Pakt des Generals"] = "Pact of the General",
    ["Pakt des Wesirs"] = "Pact of the Vizier",
    ["Questlinien im Heulenden Fjord"] = "Questlines in Howling Fjord",
    ["Questlinien im Jadewald"] = "Questlines in the Jade Forest",
    ["Questlinien im Sholazarbecken"] = "Questlines in Sholazar Basin",
    ["Questlinien in Eiskrone"] = "Questlines in Icecrown",
    ["Questlinien in Zul'Drak"] = "Questlines in Zul'Drak",
    ["Questlinien in der Boreanischen Tundra"] = "Questlines in Borean Tundra",
    ["Questlinien in der Drachenoede"] = "Questlines in Dragonblight",
    ["Questlinien in der Krasarangwildnis"] = "Questlines in Krasarang Wilds",
    ["Questlinien in der Schreckensoede"] = "Questlines in Dread Wastes",
    ["Quel'Danas-Dailys"] = "Quel'Danas dailies",
    ["Rüstungsschmied Goldwappen"] = "Armorsmith Goldcrest",
    ["Schlund-Aktivitäten"] = "Maw activities",
    ["Scherbenkueste"] = "Broken Shore",
    ["Schreckensoede"] = "Dread Wastes",
    ["Schrein der Sieben Sterne"] = "Shrine of Seven Stars",
    ["Schrein der Zwei Monde"] = "Shrine of Two Moons",
    ["Seher-Aufgaben in Shattrath"] = "Scryer tasks in Shattrath",
    ["Shattrath- und Tempelaufgaben"] = "Shattrath and temple tasks",
    ["Shattrath-Stadtfraktionen"] = "Shattrath city factions",
    ["Sholazarbecken"] = "Sholazar Basin",
    ["Story- und Nebenkapitel in Dornogal"] = "Story and side chapters in Dornogal",
    ["Story- und Nebenkapitel in Gundargaz"] = "Story and side chapters in Gundargaz",
    ["Wöchentlicher Pakt"] = "Weekly pact",
    ["Wöchentliche Kartellwahl"] = "Weekly cartel contract",
    ["Story- und Weltquests"] = "Story and world quests",
    ["Sturmsangtal"] = "Stormsong Valley",
    ["Sturmschild"] = "Stormshield",
    ["Tal der Ewigen Blueten"] = "Vale of Eternal Blossoms",
    ["Tal der Vier Winde"] = "Valley of the Four Winds",
    ["Temporale Nebenaktivitäten"] = "Temporal side activities",
    ["Verbotene Insel"] = "Forbidden Reach",
    ["Weltquests auf der Dorninsel"] = "World quests on the Isle of Dorn",
    ["Weltquests in Azj-Kahet"] = "World quests in Azj-Kahet",
    ["Weltquests in Heilsturz"] = "World quests in Hallowfall",
    ["Weltquests in The Ringing Deeps"] = "World quests in The Ringing Deeps",
    ["Waldläufer Allorn"] = "Ranger Allorn",
}

local LABEL_MAP = {
    ["Blutritter"] = "Blood Knight",
    ["Magister"] = "Magister",
    ["Risshändlerin"] = "Rift Vendor",
    ["Rüstmeister"] = "Quartermaster",
    ["Schemen der Gasse"] = "Lane Warden",
    ["Weltenwanderer"] = "Wayfarer",
}

local KIND_MAP = {
    ["Cluster"] = "Cluster",
    ["Dungeon"] = "Dungeon",
    ["Einmalig/Warband"] = "One-time/Warband",
    ["Hub"] = "Hub",
    ["Raid"] = "Raid",
    ["Recurring"] = "Recurring",
    ["Stadt/Instanzen"] = "City/Instances",
    ["Stadtfraktion"] = "City faction",
    ["Story"] = "Story",
    ["Story/Zone"] = "Story/Zone",
    ["Täglich"] = "Daily",
    ["Täglich/Wiederholbar"] = "Daily/Repeatable",
    ["Weekly"] = "Weekly",
    ["Weltquests"] = "World quests",
    ["Wiederkehrend"] = "Recurring",
    ["Wöchentlich"] = "Weekly",
    ["Wöchentlich/Event"] = "Weekly/Event",
    ["Zone"] = "Zone",
    ["Zone/Event"] = "Zone/Event",
    ["Zone/Stadt"] = "Zone/City",
}

local function translateTitle(value)
    if not value then
        return nil
    end

    if TITLE_MAP[value] then
        return TITLE_MAP[value]
    end

    local translated = value
    translated = translated:gsub("^Die ", "The ")
    translated = translated:gsub("^Der ", "The ")
    translated = translated:gsub("Stadtfraktionen", "city factions")
    translated = translated:gsub("Aktivitäten", "activities")
    translated = translated:gsub("Aktivitaeten", "activities")
    translated = translated:gsub("Questlinien", "Questlines")
    translated = translated:gsub("Weltquests", "World quests")
    translated = translated:gsub("Lokale Aufgaben", "Local tasks")
    translated = translated:gsub("Aufgaben", "tasks")
    return translated
end

local function buildEnglishSummary(entry)
    local activityTitles = {}
    for _, activity in ipairs(entry.activities or {}) do
        local title = translateTitle(activity.title)
        if title and title ~= "" then
            activityTitles[#activityTitles + 1] = title
        end
    end

    if #activityTitles == 1 then
        return string.format("Retail content for this faction is centered on %s.", activityTitles[1])
    end

    if #activityTitles == 2 then
        return string.format("Retail content for this faction is centered on %s and %s.", activityTitles[1], activityTitles[2])
    end

    if #activityTitles >= 3 then
        return string.format(
            "Retail content for this faction is centered on %s, %s, and %s.",
            activityTitles[1],
            activityTitles[2],
            activityTitles[3]
        )
    end

    if entry.quartermasters and #entry.quartermasters > 0 then
        return "Retail content for this faction includes quartermaster support."
    end

    return "Retail content for this faction is available in the retail core."
end

local function buildQuartermasters(quartermasters, translator)
    local output = {}
    for index, quartermaster in ipairs(quartermasters or {}) do
        output[index] = {
            name = translator(quartermaster.name),
            label = LABEL_MAP[quartermaster.label] or translator(quartermaster.label),
        }
    end
    return output
end

local function buildActivities(activities, translator)
    local output = {}
    for index, activity in ipairs(activities or {}) do
        output[index] = {
            title = translator(activity.title),
            kind = KIND_MAP[activity.kind] or translator(activity.kind),
        }
    end
    return output
end

local function buildPayload(sourceFactions, summaryTranslator, stringTranslator)
    local payload = {
        factions = {},
    }

    for factionID, entry in pairs(collected.factions) do
        local sourceEntry = sourceFactions and sourceFactions[factionID] or entry
        local localized = {}
        localized.summary = summaryTranslator(factionID, sourceEntry or entry)

        if sourceEntry and sourceEntry.quartermasters and #sourceEntry.quartermasters > 0 then
            localized.quartermasters = buildQuartermasters(sourceEntry.quartermasters, stringTranslator)
        end

        if sourceEntry and sourceEntry.activities and #sourceEntry.activities > 0 then
            localized.activities = buildActivities(sourceEntry.activities, stringTranslator)
        end

        payload.factions[factionID] = localized
    end

    return payload
end

local function serialize(value, indent)
    indent = indent or 0
    local spacing = string.rep("    ", indent)
    local nextSpacing = string.rep("    ", indent + 1)

    if type(value) == "string" then
        return string.format("%q", value)
    end

    if type(value) ~= "table" then
        return tostring(value)
    end

    local isArray = (#value > 0)
    local parts = {"{"}

    if isArray then
        for _, entry in ipairs(value) do
            parts[#parts + 1] = string.format("%s%s,", nextSpacing, serialize(entry, indent + 1))
        end
    else
        local keys = {}
        for key in pairs(value) do
            keys[#keys + 1] = key
        end
        table.sort(keys, function(a, b)
            if type(a) == type(b) then
                return a < b
            end
            return tostring(a) < tostring(b)
        end)

        for _, key in ipairs(keys) do
            local formattedKey
            if type(key) == "number" then
                formattedKey = string.format("[%d]", key)
            else
                formattedKey = key
            end
            parts[#parts + 1] = string.format("%s%s = %s,", nextSpacing, formattedKey, serialize(value[key], indent + 1))
        end
    end

    parts[#parts + 1] = spacing .. "}"
    return table.concat(parts, "\n")
end

local function writeLocale(locale, payload)
    local outPath = root .. "locales/" .. locale .. ".lua"
    local handle = assert(io.open(outPath, "w"))
    handle:write("local api = _G.RepuAPI\n\n")
    handle:write("if not api or not api.RegisterRetailContentLocale then\n")
    handle:write("    return\n")
    handle:write("end\n\n")
    handle:write(string.format("api.RegisterRetailContentLocale(%q, %s)\n", locale, serialize(payload, 0)))
    handle:close()
end

local function loadExistingLocale(locale)
    local outPath = root .. "locales/" .. locale .. ".lua"
    local handle = io.open(outPath, "r")
    if not handle then
        return nil
    end
    handle:close()

    local captured
    local previousAPI = _G.RepuAPI
    _G.RepuAPI = {
        RegisterRetailContentLocale = function(loadedLocale, payload)
            if loadedLocale == locale then
                captured = shallowCopy(payload)
            end
        end,
    }
    local ok = pcall(dofile, outPath)
    _G.RepuAPI = previousAPI
    if not ok then
        return nil
    end
    return captured
end

local germanPayload = buildPayload(
    nil,
    function(_, entry)
        return entry.summary
    end,
    function(value)
        return value
    end
)

local existingGerman = loadExistingLocale("deDE")
if existingGerman and countKeys(existingGerman.factions) > 0 then
    germanPayload = existingGerman
end

local englishDescriptions = loadEnglishDescriptionCache()

local englishPayload = buildPayload(
    nil,
    function(factionID, entry)
        local descriptionEntry = englishDescriptions[tostring(factionID)] or nil
        if descriptionEntry and descriptionEntry.description and descriptionEntry.description ~= "" then
            return descriptionEntry.description
        end
        if entry.summary and entry.summary ~= "" then
            return entry.summary
        end
        return buildEnglishSummary(entry)
    end,
    translateTitle
)

writeLocale("enUS", englishPayload)
writeLocale("deDE", germanPayload)
