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
local contentTextLocales = {
    enUS = root .. "locales/content_text_enUS.lua",
    deDE = root .. "locales/content_text_deDE.lua",
}

local files = {
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
    ["Ve'naris Zuflucht"] = "Ve'nari's Refuge",
    ["Tiefenheim"] = "Deepholm",
    ["Schattenhochland"] = "Twilight Highlands",
    ["Halbinsel von Tol Barad"] = "Tol Barad Peninsula",
    ["Halbhuegel"] = "Halfhill",
    ["Zeitlose Insel"] = "Timeless Isle",
    ["Tiragardesund"] = "Tiragarde Sound",
    ["Neueheim"] = "Newhome",
    ["Kueste des Erwachens"] = "The Waking Shores",
    ["Kartellwahl: Garbagio Treueclub"] = "Cartel contract: Gallagio Loyalty Rewards Club",
    ["Zul'Aman-Kampagne"] = "Zul'Aman campaign",
    ["Leerensturm-Kampagne"] = "Voidstorm campaign",
    ["Harandar-Kampagne"] = "Harandar campaign",
    ["Suramar-Kampagne"] = "Suramar campaign",
    ["Northrend-Dungeons mit Dalaran-Bezug"] = "Northrend dungeons tied to Dalaran",
    ["Throne of Thander"] = "Throne of Thunder",
    ["Shadowmoon Burial Groands"] = "Shadowmoon Burial Grounds",
    ["Gandrak"] = "Gundrak",
    ["C.H.E.T.T.-Liste"] = "C.H.E.T.T. List",
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

local function normalizeEnglishText(value)
    if not value or value == "" then
        return value
    end

    if TITLE_MAP[value] then
        return TITLE_MAP[value]
    end

    if LABEL_MAP[value] then
        return LABEL_MAP[value]
    end

    if KIND_MAP[value] then
        return KIND_MAP[value]
    end

    local replacements = {
        { "Neueheim", "Newhome" },
        { "Tiragardesund", "Tiragarde Sound" },
        { "Ve'naris Zuflucht", "Ve'nari's Refuge" },
        { "Kueste des Erwachens", "The Waking Shores" },
        { "Tiefenheim", "Deepholm" },
        { "Schattenhochland", "Twilight Highlands" },
        { "Halbinsel von Tol Barad", "Tol Barad Peninsula" },
        { "Halbhuegel", "Halfhill" },
        { "Zeitlose Insel", "Timeless Isle" },
        { "Suramar%-Kampagne", "Suramar campaign" },
        { "Northrend%-Dungeons mit Dalaran%-Bezug", "Northrend dungeons tied to Dalaran" },
        { "C%.H%.E%.T%.T%.%-Liste", "C.H.E.T.T. List" },
        { "Kartellwahl: Garbagio Treueclub", "Cartel contract: Gallagio Loyalty Rewards Club" },
        { "Zul'Aman%-Kampagne", "Zul'Aman campaign" },
        { "Leerensturm%-Kampagne", "Voidstorm campaign" },
        { "Harandar%-Kampagne", "Harandar campaign" },
        { "Throne of Thander", "Throne of Thunder" },
        { "Shadowmoon Burial Groands", "Shadowmoon Burial Grounds" },
        { "Gandrak", "Gundrak" },
    }

    for _, replacement in ipairs(replacements) do
        value = value:gsub(replacement[1], replacement[2])
    end

    return value
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
        local localized = {}
        if quartermaster.nameKey then
            localized.nameKey = quartermaster.nameKey
        else
            localized.name = translator(quartermaster.name)
        end
        if quartermaster.labelKey then
            localized.labelKey = quartermaster.labelKey
        else
            localized.label = LABEL_MAP[quartermaster.label] or translator(quartermaster.label)
        end
        if quartermaster.location then
            localized.location = {}
            if quartermaster.location.titleKey then
                localized.location.titleKey = quartermaster.location.titleKey
            else
                localized.location.title = translator(quartermaster.location.title)
            end
        end
        output[index] = localized
    end
    return output
end

local function buildActivities(activities, translator)
    local output = {}
    for index, activity in ipairs(activities or {}) do
        local localized = {}
        if activity.titleKey then
            localized.titleKey = activity.titleKey
        else
            localized.title = translator(activity.title)
        end
        if activity.kindKey then
            localized.kindKey = activity.kindKey
        else
            localized.kind = KIND_MAP[activity.kind] or translator(activity.kind)
        end
        if activity.location then
            localized.location = {}
            if activity.location.titleKey then
                localized.location.titleKey = activity.location.titleKey
            else
                localized.location.title = translator(activity.location.title)
            end
        end
        output[index] = localized
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
        local summary = summaryTranslator(factionID, sourceEntry or entry)
        if summary and summary ~= "" then
            localized.summary = summary
        end

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

local function buildTextPayload(sourcePayload, fallbackPayload)
    local payload = {}
    for factionID, entry in pairs(collected.factions) do
        if entry.summaryKey then
            local key = entry.summaryKey
            local sourceEntry = sourcePayload and sourcePayload.factions and sourcePayload.factions[factionID] or nil
            local summary = (sourceEntry and sourceEntry.summary) or (fallbackPayload and fallbackPayload[key]) or entry.summary
            if summary and summary ~= "" then
                payload[key] = summary
            end
        end
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
            elseif tostring(key):match("^[A-Za-z_][A-Za-z0-9_]*$") then
                formattedKey = key
            else
                formattedKey = string.format("[%q]", key)
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
    handle:write("if not api or not api.RegisterLocaleDomain then\n")
    handle:write("    return\n")
    handle:write("end\n\n")
    handle:write(string.format("api.RegisterLocaleDomain(%q, %q, %s)\n", "retail_content", locale, serialize(payload, 0)))
    handle:close()
end

local function writeTextLocale(locale, payload)
    local outPath = contentTextLocales[locale]
    local handle = assert(io.open(outPath, "w"))
    handle:write("local api = _G.RepuAPI\n\n")
    handle:write("if not api or not api.RegisterLocaleDomain then\n")
    handle:write("    return\n")
    handle:write("end\n\n")
    handle:write(string.format("api.RegisterLocaleDomain(%q, %q, %s)\n", "retail_content_text", locale, serialize(payload, 0)))
    handle:close()
end

local function loadExistingLocale(locale, domain, outPath)
    outPath = outPath or (root .. "locales/" .. locale .. ".lua")
    local handle = io.open(outPath, "r")
    if not handle then
        return nil
    end
    handle:close()

    local captured
    local previousAPI = _G.RepuAPI
    _G.RepuAPI = {
        RegisterLocaleDomain = function(loadedDomain, loadedLocale, payload)
            if loadedDomain == domain and loadedLocale == locale then
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
        if entry.summaryKey or entry.summarySource == "blizzard" then
            return nil
        end
        return entry.summary
    end,
    function(value)
        return value
    end
)

local existingGerman = loadExistingLocale("deDE", "retail_content")
local existingEnglish = loadExistingLocale("enUS", "retail_content")
if existingGerman and countKeys(existingGerman.factions) > 0 then
    for factionID, entry in pairs(germanPayload.factions or {}) do
        local existingEntry = existingGerman.factions and existingGerman.factions[factionID] or nil
        if existingEntry and existingEntry.summary and not entry.summary then
            entry.summary = existingEntry.summary
        end
    end
end

local englishDescriptions = loadEnglishDescriptionCache()

local function summaryUsesBlizzard(factionID, entry)
    if entry.summaryKey then
        return false
    end
    if entry.summarySource == "curated" then
        return false
    end
    local descriptionEntry = englishDescriptions[tostring(factionID)] or nil
    return descriptionEntry and descriptionEntry.description and descriptionEntry.description ~= ""
end

local function generatedKey(prefix, factionID, ...)
    local parts = { prefix, tostring(factionID) }
    for index = 1, select("#", ...) do
        parts[#parts + 1] = tostring(select(index, ...))
    end
    return table.concat(parts, ".")
end

local function buildNeutralPayload()
    local payload = { factions = {} }

    for factionID, entry in pairs(collected.factions) do
        local localized = {}

        if entry.summaryKey then
            localized.summaryKey = entry.summaryKey
        elseif not summaryUsesBlizzard(factionID, entry) then
            localized.summaryKey = generatedKey("faction", factionID, "summary")
        end

        if entry.quartermasters and #entry.quartermasters > 0 then
            localized.quartermasters = {}
            for index, quartermaster in ipairs(entry.quartermasters) do
                local localizedQuartermaster = {}
                localizedQuartermaster.nameKey = quartermaster.nameKey or generatedKey("faction", factionID, "quartermaster", index, "name")
                localizedQuartermaster.labelKey = quartermaster.labelKey or generatedKey("faction", factionID, "quartermaster", index, "label")
                if quartermaster.location then
                    localizedQuartermaster.location = {}
                    localizedQuartermaster.location.titleKey = quartermaster.location.titleKey or generatedKey("faction", factionID, "quartermaster", index, "location", "title")
                end
                localized.quartermasters[index] = localizedQuartermaster
            end
        end

        if entry.activities and #entry.activities > 0 then
            localized.activities = {}
            for index, activity in ipairs(entry.activities) do
                local localizedActivity = {}
                localizedActivity.titleKey = activity.titleKey or generatedKey("faction", factionID, "activity", index, "title")
                localizedActivity.kindKey = activity.kindKey or generatedKey("faction", factionID, "activity", index, "kind")
                if activity.location then
                    localizedActivity.location = {}
                    localizedActivity.location.titleKey = activity.location.titleKey or generatedKey("faction", factionID, "activity", index, "location", "title")
                end
                localized.activities[index] = localizedActivity
            end
        end

        payload.factions[factionID] = localized
    end

    return payload
end

local neutralPayload = buildNeutralPayload()

local function buildTextPayload(locale, neutralSource, retailSource, existingRetailLocale, existingTextLocale)
    local payload = {}

    local function carry(key, value)
        if locale == "enUS" then
            value = normalizeEnglishText(value)
        end
        if value and value ~= "" then
            payload[key] = value
        end
    end

    for factionID, neutralEntry in pairs(neutralSource.factions or {}) do
        local sourceEntry = retailSource.factions and retailSource.factions[factionID] or nil
        local localeEntry = existingRetailLocale and existingRetailLocale.factions and existingRetailLocale.factions[factionID] or nil

        if neutralEntry.summaryKey then
            local summaryValue = (localeEntry and localeEntry.summary) or (sourceEntry and sourceEntry.summary)
            if locale == "enUS" and (not summaryValue or summaryValue == "") then
                summaryValue = buildEnglishSummary(sourceEntry or {})
            end
            carry(neutralEntry.summaryKey, summaryValue or (existingTextLocale and existingTextLocale[neutralEntry.summaryKey]))
        end

        for index, neutralQuartermaster in ipairs(neutralEntry.quartermasters or {}) do
            local sourceQuartermaster = sourceEntry and sourceEntry.quartermasters and sourceEntry.quartermasters[index] or nil
            local localeQuartermaster = localeEntry and localeEntry.quartermasters and localeEntry.quartermasters[index] or nil
            carry(neutralQuartermaster.nameKey, (localeQuartermaster and localeQuartermaster.name) or (sourceQuartermaster and sourceQuartermaster.name) or (existingTextLocale and existingTextLocale[neutralQuartermaster.nameKey]))
            carry(neutralQuartermaster.labelKey, (localeQuartermaster and localeQuartermaster.label) or (sourceQuartermaster and sourceQuartermaster.label) or (existingTextLocale and existingTextLocale[neutralQuartermaster.labelKey]))
            if neutralQuartermaster.location and neutralQuartermaster.location.titleKey then
                local sourceTitle = sourceQuartermaster and sourceQuartermaster.location and sourceQuartermaster.location.title or nil
                local localeTitle = localeQuartermaster and localeQuartermaster.location and localeQuartermaster.location.title or nil
                carry(neutralQuartermaster.location.titleKey, localeTitle or sourceTitle or (existingTextLocale and existingTextLocale[neutralQuartermaster.location.titleKey]))
            end
        end

        for index, neutralActivity in ipairs(neutralEntry.activities or {}) do
            local sourceActivity = sourceEntry and sourceEntry.activities and sourceEntry.activities[index] or nil
            local localeActivity = localeEntry and localeEntry.activities and localeEntry.activities[index] or nil
            carry(neutralActivity.titleKey, (localeActivity and localeActivity.title) or (sourceActivity and sourceActivity.title) or (existingTextLocale and existingTextLocale[neutralActivity.titleKey]))
            carry(neutralActivity.kindKey, (localeActivity and localeActivity.kind) or (sourceActivity and sourceActivity.kind) or (existingTextLocale and existingTextLocale[neutralActivity.kindKey]))
            if neutralActivity.location and neutralActivity.location.titleKey then
                local sourceTitle = sourceActivity and sourceActivity.location and sourceActivity.location.title or nil
                local localeTitle = localeActivity and localeActivity.location and localeActivity.location.title or nil
                carry(neutralActivity.location.titleKey, localeTitle or sourceTitle or (existingTextLocale and existingTextLocale[neutralActivity.location.titleKey]))
            end
        end
    end

    for key, value in pairs(existingTextLocale or {}) do
        if payload[key] == nil then
            payload[key] = value
        end
    end

    return payload
end

local existingEnglishText = loadExistingLocale("enUS", "retail_content_text", contentTextLocales.enUS)
local existingGermanText = loadExistingLocale("deDE", "retail_content_text", contentTextLocales.deDE)

local englishTextPayload = buildTextPayload("enUS", neutralPayload, collected, existingEnglish, existingEnglishText)
local germanTextPayload = buildTextPayload("deDE", neutralPayload, collected, existingGerman, existingGermanText)

writeLocale("enUS", neutralPayload)
writeLocale("deDE", neutralPayload)
writeTextLocale("enUS", englishTextPayload)
writeTextLocale("deDE", germanTextPayload)
