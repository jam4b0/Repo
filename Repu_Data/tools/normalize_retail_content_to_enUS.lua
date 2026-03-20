local function deepCopy(value)
    if type(value) ~= "table" then
        return value
    end

    local copy = {}
    for key, entry in pairs(value) do
        copy[key] = deepCopy(entry)
    end
    return copy
end

local function deepMerge(target, source)
    for key, value in pairs(source or {}) do
        if type(value) == "table" and #value == 0 then
            target[key] = target[key] or {}
            deepMerge(target[key], value)
        else
            target[key] = deepCopy(value)
        end
    end
end

local root = "/root/Repo/Repu_Data/"

local contentFiles = {
    "content/retail/summary/generated.lua",
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

local TITLE_MAP = {
    ["Azurmythosinsel"] = "Azuremyst Isle",
    ["Blutmythosinsel"] = "Bloodmyst Isle",
    ["The Blutmythosinsel"] = "Bloodmyst Isle",
    ["Brennende Steppe"] = "Burning Steppes",
    ["Donnerfels"] = "Thunder Bluff",
    ["Dunkelmond-Insel"] = "Darkmoon Island",
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

local function translateString(value)
    if type(value) ~= "string" then
        return value
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
    translated = translated:gsub("Wöchentlich", "Weekly")
    translated = translated:gsub("Wiederkehrend", "Recurring")
    translated = translated:gsub("Täglich", "Daily")
    translated = translated:gsub("Rüstmeister", "Quartermaster")
    return translated
end

local function translateTitles(value)
    if type(value) ~= "table" then
        return value
    end

    for key, entry in pairs(value) do
        if type(entry) == "table" then
            translateTitles(entry)
        elseif type(entry) == "string" and (key == "title" or key == "name" or key == "label" or key == "kind") then
            value[key] = translateString(entry)
        end
    end
    return value
end

local englishLocales = { factions = {} }
_G.RepuAPI = {
    RegisterLocaleDomain = function(domain, locale, payload)
        if domain == "retail_content" and locale == "enUS" then
            deepMerge(englishLocales, payload or {})
        end
    end,
}
dofile(root .. "locales/enUS.lua")

local function loadModule(path)
    local payload
    _G.RepuAPI = {
        RegisterRetailContentModule = function(data)
            payload = deepCopy(data)
        end,
    }
    assert(loadfile(root .. path))()
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

    local isArray = #value > 0
    local lines = {"{"}

    if isArray then
        for _, entry in ipairs(value) do
            lines[#lines + 1] = string.format("%s%s,", nextSpacing, serialize(entry, indent + 1))
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
            lines[#lines + 1] = string.format("%s%s = %s,", nextSpacing, formattedKey, serialize(value[key], indent + 1))
        end
    end

    lines[#lines + 1] = spacing .. "}"
    return table.concat(lines, "\n")
end

local function normalizePayload(payload)
    payload = deepCopy(payload)
    for factionID, entry in pairs(payload.factions or {}) do
        local localized = englishLocales.factions and englishLocales.factions[factionID] or nil
        if localized then
            if localized.summary then
                entry.summary = localized.summary
            end
            if entry.quartermasters and localized.quartermasters then
                for index, quartermaster in ipairs(entry.quartermasters) do
                    local overlay = localized.quartermasters[index]
                    if overlay then
                        quartermaster.name = overlay.name or quartermaster.name
                        quartermaster.label = overlay.label or quartermaster.label
                    end
                end
            end
            if entry.activities and localized.activities then
                for index, activity in ipairs(entry.activities) do
                    local overlay = localized.activities[index]
                    if overlay then
                        activity.title = overlay.title or activity.title
                        activity.kind = overlay.kind or activity.kind
                    end
                end
            end
        end
        translateTitles(entry)
    end
    return payload
end

local function writeModule(path, payload)
    local handle = assert(io.open(root .. path, "w"))
    handle:write("local api = _G.RepuAPI\n\n")
    handle:write("if not api or not api.RegisterRetailContentModule then\n")
    handle:write("    return\n")
    handle:write("end\n\n")
    handle:write("api.RegisterRetailContentModule(")
    handle:write(serialize(payload, 0))
    handle:write(")\n")
    handle:close()
end

for _, path in ipairs(contentFiles) do
    local payload = loadModule(path)
    writeModule(path, normalizePayload(payload))
end
