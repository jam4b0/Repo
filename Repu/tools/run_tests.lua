local root = "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/"

local function loadAddonFile(relPath, ns)
    local chunk, err = loadfile(root .. relPath)
    if not chunk then
        error(err)
    end
    return chunk(nil, ns)
end

local suiteArg = arg[1] or "retail"

local suiteConfigs = {
    classic = {
        flavor = "classic",
        casePath = "tests/cases/classic/mapping.lua",
        files = {
            "data/classic.lua",
        },
    },
    tbc = {
        flavor = "tbc",
        casePath = "tests/cases/tbc/mapping.lua",
        files = {
            "data/tbc.lua",
        },
    },
    wrath = {
        flavor = "wrath",
        casePath = "tests/cases/wrath/mapping.lua",
        files = {
            "data/wrath.lua",
        },
    },
    cata = {
        flavor = "cata",
        casePath = "tests/cases/cata/mapping.lua",
        files = {
            "data/cata.lua",
        },
    },
    mop = {
        flavor = "mop",
        casePath = "tests/cases/mop/mapping.lua",
        files = {
            "data/mop.lua",
        },
    },
    retail = {
        flavor = "retail",
        casePath = "tests/cases/retail/mapping.lua",
        files = {
            "data/retail/coverage/client_seed.lua",
            "data/retail/coverage/generated/coverage_generated.lua",
            "data/retail/coverage/generated/coverage_wave2_generated.lua",
            "data/retail/coverage/generated/coverage_cleanup_generated.lua",
            "data/retail/coverage/generated/coverage_variants_generated.lua",
            "data/retail/coverage/generated/coverage_world_variants_generated.lua",
            "data/retail/coverage/generated/coverage_event_variants_generated.lua",
            "data/retail/coverage/generated/coverage_instance_adjacent_generated.lua",
            "data/retail/coverage/generated/coverage_instance_variants_generated.lua",
            "data/retail/coverage/generated/coverage_mixed_world_subzones_generated.lua",
            "data/retail/coverage/generated/coverage_special_zones_generated.lua",
            "data/retail/coverage/generated/coverage_special_subzones_generated.lua",
            "data/retail/coverage/generated/coverage_hubs_generated.lua",
            "data/retail/coverage/generated/coverage_hubs_wave2_generated.lua",
            "data/retail/coverage/generated/coverage_final_subzones_generated.lua",
            "data/retail/variants/catalog.lua",
            "data/retail/mappings/regions/kalimdor.lua",
            "data/retail/mappings/regions/eastern_kingdoms.lua",
            "data/retail/mappings/regions/outland.lua",
            "data/retail/mappings/regions/northrend.lua",
            "data/retail/mappings/regions/pandaria.lua",
            "data/retail/mappings/regions/cataclysm.lua",
            "data/retail/mappings/regions/broken_isles.lua",
            "data/retail/mappings/regions/bfa.lua",
            "data/retail/mappings/regions/shadowlands.lua",
            "data/retail/mappings/regions/dragonflight.lua",
            "data/retail/mappings/regions/draenor.lua",
            "data/retail/mappings/regions/war_within.lua",
            "data/retail/mappings/regions/midnight.lua",
            "data/retail.lua",
        },
    },
}

local orderedSuites = { "classic", "tbc", "wrath", "cata", "mop", "retail" }

local function makeNamespace(flavor)
    UNKNOWN = "UNKNOWN"

    local ns = {
        Utils = {},
        Locale = {},
        Data = {},
        Inference = {},
        Scoring = {},
        Factions = {},
        State = {
            runtime = {},
            profile = {
                maxBars = 5,
                showRetailCompanions = true,
                hideExalted = false,
            },
        },
        Compat = {},
    }

    function ns.State:GetProfile()
        return self.profile
    end

    function ns.State:GetRuntimeValue(key)
        return self.runtime and self.runtime[key] or nil
    end

    function ns.Compat:GetFlavor()
        return flavor
    end

    function ns.Compat:GetStandingLabel(standingID)
        local labels = {
            [1] = "Hated",
            [2] = "Hostile",
            [3] = "Unfriendly",
            [4] = "Neutral",
            [5] = "Friendly",
            [6] = "Honored",
            [7] = "Revered",
            [8] = "Exalted",
        }
        return labels[standingID] or "Unknown"
    end

    function ns.Compat:GetFactionDataByID(factionID)
        local raw = ns.State.runtime and ns.State.runtime.rawFactions or nil
        return raw and raw.byID and raw.byID[factionID] or nil
    end

    return ns
end

local function loadSuite(flavor, config)
    local ns = makeNamespace(flavor)

    loadAddonFile("core/utils.lua", ns)
    loadAddonFile("core/localization.lua", ns)
    loadAddonFile("locales/enUS.lua", ns)
    loadAddonFile("locales/deDE.lua", ns)
    ns.Locale:Apply("enUS")
    loadAddonFile("data/shared.lua", ns)

    for _, relPath in ipairs(config.files) do
        loadAddonFile(relPath, ns)
    end

    loadAddonFile("core/inference.lua", ns)
    loadAddonFile("core/scoring.lua", ns)
    loadAddonFile("core/factions.lua", ns)

    ns.Data:Init()
    return ns
end

local function normalizeFaction(ns, row)
    row = ns.Utils:ShallowCopy(row)
    row.nameKey = ns.Utils:NormalizeKey(row.name)
    row.description = row.description or nil
    row.index = row.index or 0
    row.standingID = row.standingID or 0
    row.min = row.min or 0
    row.max = row.max or (row.progressMax or 0)
    row.value = row.value or (row.progressValue or 0)
    row.progressValue = row.progressValue or 0
    row.progressMax = row.progressMax or 0
    row.progressPct = row.progressPct or 0
    row.isWatched = row.isWatched or false
    row.isChild = row.isChild or false
    row.isExalted = row.isExalted or false
    row.isAccountWide = row.isAccountWide or false
    row.isMajorFaction = row.isMajorFaction or false
    row.hasRepEntry = row.hasRepEntry ~= false
    row.parentFactionID = row.parentFactionID
    row.standingLabel = row.standingLabel or (row.isMajorFaction and ns.Locale:Get("UI_RENOWN_LABEL") or ns.Compat:GetStandingLabel(row.standingID))
    return row
end

local function buildRawFactions(ns, rows)
    local collection = {
        list = {},
        byID = {},
        byName = {},
        childIDsByParent = {},
        virtualParentsByID = {},
        virtualParentByChildID = {},
    }

    for index, row in ipairs(rows or {}) do
        local faction = normalizeFaction(ns, row)
        faction.index = index
        collection.list[#collection.list + 1] = faction
        if faction.factionID then
            collection.byID[faction.factionID] = faction
        end
        if faction.nameKey then
            collection.byName[faction.nameKey] = faction
        end
        if faction.parentFactionID and faction.factionID then
            collection.childIDsByParent[faction.parentFactionID] = collection.childIDsByParent[faction.parentFactionID] or {}
            table.insert(collection.childIDsByParent[faction.parentFactionID], faction.factionID)
        end
    end

    return collection
end

local function factionIDs(visible)
    local ids = {}
    for _, row in ipairs(visible or {}) do
        ids[#ids + 1] = row.factionID
    end
    return ids
end

local function hasFactionID(rows, factionID)
    for _, row in ipairs(rows or {}) do
        if row.factionID == factionID then
            return true
        end
    end
    return false
end

local function runCase(ns, case)
    ns.State.profile = ns.Utils:DeepMerge({
        maxBars = 5,
        showRetailCompanions = true,
        hideExalted = false,
    }, case.profile or {})

    local rawFactions = buildRawFactions(ns, case.rawFactions or {})
    ns.State.runtime = {
        rawFactions = rawFactions,
        lastRelevantFactionID = case.lastRelevantFactionID,
    }

    local coverage = ns.Data:GetCoverage(case.context)
    local matches = ns.Factions:BuildMatches(rawFactions, case.context)
    local prioritized = ns.Scoring:Prioritize(matches, rawFactions, case.context)
    local visible = ns.Factions:SelectVisible(prioritized, case.context)

    if case.expectCoverage then
        for key, value in pairs(case.expectCoverage) do
            assert(coverage[key] == value, string.format("%s: expected coverage.%s=%s, got %s", case.name, key, tostring(value), tostring(coverage[key])))
        end
    end

    if case.expectVisibleCount ~= nil then
        assert(#visible == case.expectVisibleCount, string.format("%s: expected %d visible, got %d", case.name, case.expectVisibleCount, #visible))
    end

    if case.expectTopFactionID then
        assert(visible[1] and visible[1].factionID == case.expectTopFactionID,
            string.format("%s: expected top faction %s, got %s", case.name, tostring(case.expectTopFactionID), visible[1] and tostring(visible[1].factionID) or "nil"))
    end

    for _, factionID in ipairs(case.requireVisibleFactionIDs or {}) do
        assert(hasFactionID(visible, factionID), string.format("%s: expected visible faction %s", case.name, tostring(factionID)))
    end

    for _, factionID in ipairs(case.forbidVisibleFactionIDs or {}) do
        assert(not hasFactionID(visible, factionID), string.format("%s: forbidden visible faction %s", case.name, tostring(factionID)))
    end

    return {
        name = case.name,
        visible = factionIDs(visible),
    }
end

local function runSuite(suiteName)
    local config = suiteConfigs[suiteName]
    if not config then
        error("Unknown test suite: " .. tostring(suiteName))
    end

    local ns = loadSuite(config.flavor, config)
    local cases = dofile(root .. config.casePath)
    local passed = 0

    for _, case in ipairs(cases) do
        local ok, result = pcall(runCase, ns, case)
        if not ok then
            io.stderr:write("FAIL ", suiteName, "/", case.name, ": ", result, "\n")
            os.exit(1)
        end

        passed = passed + 1
        io.write("PASS ", suiteName, "/", case.name, " -> ")
        for index, factionID in ipairs(result.visible) do
            io.write(tostring(factionID))
            if index < #result.visible then
                io.write(",")
            end
        end
        io.write("\n")
    end

    io.write(string.format("Suite %s passed: %d cases\n", suiteName, passed))
    return passed
end

if suiteArg == "all" then
    local total = 0
    for _, suiteName in ipairs(orderedSuites) do
        total = total + runSuite(suiteName)
    end
    io.write(string.format("All suites passed: %d cases across %d suites\n", total, #orderedSuites))
    return
end

runSuite(suiteArg)
