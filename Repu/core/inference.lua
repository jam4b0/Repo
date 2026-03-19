local _, ns = ...

local Utils = ns.Utils

local ignoredTerms = {
    ["the"] = true,
    ["der"] = true,
    ["die"] = true,
    ["das"] = true,
    ["und"] = true,
    ["von"] = true,
    ["des"] = true,
    ["den"] = true,
    ["dem"] = true,
    ["zur"] = true,
    ["zum"] = true,
    ["im"] = true,
    ["in"] = true,
}

local function collectLocationPhrases(context)
    local phrases = {}
    local seen = {}

    local function addPhrase(raw, kind, weight)
        local normalized = Utils:NormalizeKey(raw)
        if not normalized or #normalized < 5 or seen[normalized] then
            return
        end

        seen[normalized] = true
        phrases[#phrases + 1] = {
            raw = raw,
            key = normalized,
            kind = kind,
            weight = weight,
        }
    end

    addPhrase(context.subZoneName, "subZoneText", 210)
    addPhrase(context.zoneName, "zoneText", 190)
    addPhrase(context.mapName, "mapText", 180)
    addPhrase(context.instanceName, "instanceText", 220)

    return phrases
end

local function buildDescriptionHaystack(faction)
    return Utils:NormalizeKey(faction.description or "")
end

local function inferFromPhrases(faction, phrases)
    local haystack = buildDescriptionHaystack(faction)
    if not haystack then
        return nil
    end

    local factionNameKey = Utils:NormalizeKey(faction.name)
    local best = nil

    for _, phrase in ipairs(phrases) do
        if (not factionNameKey or factionNameKey ~= phrase.key) and haystack:find(phrase.key, 1, true) then
            local candidate = {
                factionID = faction.factionID,
                faction = faction,
                name = faction.name,
                sourceType = "inferred",
                sourceKey = phrase.raw,
                baseWeight = phrase.weight,
                note = "Description mentions current location",
                isDirect = false,
                isWatched = faction.isWatched,
                isExalted = faction.isExalted,
                progressPct = faction.progressPct,
                tags = { "inferred", "local" },
            }

            if not best or candidate.baseWeight > best.baseWeight then
                best = candidate
            end
        end
    end

    if best then
        return best
    end

    for _, phrase in ipairs(phrases) do
        if not factionNameKey or factionNameKey ~= phrase.key then
            local matchCount = 0
            for token in phrase.key:gmatch("%S+") do
                if #token >= 5 and not ignoredTerms[token] and haystack:find(token, 1, true) then
                    matchCount = matchCount + 1
                end
            end

            if matchCount >= 2 then
                local candidate = {
                    factionID = faction.factionID,
                    faction = faction,
                    name = faction.name,
                    sourceType = "inferred",
                    sourceKey = phrase.raw,
                    baseWeight = phrase.weight - 25,
                    note = "Description partially matches current location",
                    isDirect = false,
                    isWatched = faction.isWatched,
                    isExalted = faction.isExalted,
                    progressPct = faction.progressPct,
                    tags = { "inferred", "local" },
                }

                if not best or candidate.baseWeight > best.baseWeight then
                    best = candidate
                end
            end
        end
    end

    return best
end

function ns.Inference:BuildMatches(rawFactions, context, directMatches)
    local inferred = {}
    if context and context.activeFlavor == "retail" then
        return inferred
    end
    local phrases = collectLocationPhrases(context or {})
    if #phrases == 0 then
        return inferred
    end

    -- Description-based inference is only allowed as a supplement to an
    -- already grounded local result. It must not fabricate the only visible
    -- faction for an otherwise unmapped zone.
    if not directMatches or #directMatches == 0 then
        return inferred
    end

    local matchedFactions = {}
    local hasGroundedLocalMatch = false
    for _, match in ipairs(directMatches or {}) do
        matchedFactions[match.factionID or match.name] = true
        if match.sourceType ~= "inferred" and match.sourceType ~= "fallback" then
            hasGroundedLocalMatch = true
        end
    end

    if not hasGroundedLocalMatch then
        return inferred
    end

    for _, faction in ipairs(rawFactions.list or {}) do
        local dedupeKey = faction.factionID or faction.name
        if not matchedFactions[dedupeKey] then
            local candidate = inferFromPhrases(faction, phrases)
            if candidate then
                inferred[#inferred + 1] = candidate
            end
        end
    end

    return inferred
end
