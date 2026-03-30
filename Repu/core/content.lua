local _, ns = ...

local function isRealFaction(faction)
    return faction and faction.factionID and not faction.isVirtualGroup and faction.factionID < 8000000
end

local function resolveContentText(entry, keyField, valueField)
    if not entry then
        return nil
    end

    local key = entry[keyField]
    if key then
        return ns.I18n:GetText("retail_content_text", key)
    end

    return entry[valueField]
end

local function resolveLocation(location)
    if not location then
        return nil
    end

    local resolved = ns.Utils:ShallowCopy(location)
    resolved.title = resolveContentText(location, "titleKey", "title")
    return resolved
end

local function resolveQuartermasters(quartermasters)
    local resolved = {}
    for index, quartermaster in ipairs(quartermasters or {}) do
        resolved[index] = ns.Utils:ShallowCopy(quartermaster)
        resolved[index].name = resolveContentText(quartermaster, "nameKey", "name")
        resolved[index].label = resolveContentText(quartermaster, "labelKey", "label")
        resolved[index].location = resolveLocation(quartermaster.location)
    end
    return resolved
end

local function resolveActivities(activities)
    local resolved = {}
    for index, activity in ipairs(activities or {}) do
        resolved[index] = ns.Utils:ShallowCopy(activity)
        resolved[index].title = resolveContentText(activity, "titleKey", "title")
        resolved[index].kind = resolveContentText(activity, "kindKey", "kind")
        resolved[index].location = resolveLocation(activity.location)
        resolved[index].questgiverName = resolveContentText(activity, "questgiverNameKey", "questgiverName")
        resolved[index].questgiverLabel = resolveContentText(activity, "questgiverLabelKey", "questgiverLabel")
        resolved[index].questgiverLocation = resolveLocation(activity.questgiverLocation)
    end
    return resolved
end

local function getRuntimeValue(key)
    if ns.State and ns.State.GetRuntimeValue then
        return ns.State:GetRuntimeValue(key)
    end

    return ns.State and ns.State.runtime and ns.State.runtime[key] or nil
end

local function isSilvermoonCourtChild(factionID)
    return factionID == 2711 or factionID == 2712 or factionID == 2713 or factionID == 2714
end

local function resolveSilvermoonCourtQuestgiver(contentApi)
    local childFactionID = tonumber(getRuntimeValue("lastRelevantFactionID") or 0)
    if not isSilvermoonCourtChild(childFactionID) then
        return nil
    end

    local childContent = contentApi:GetFactionContent(childFactionID)
    local childActivities = resolveActivities(childContent.activities or {})
    return childActivities[1]
end

local function mergeContent(base, overlay)
    if not overlay then
        return base
    end

    base = ns.Utils:ShallowCopy(base or {})

    for key, value in pairs(overlay) do
        if type(value) == "table" then
            if #value > 0 then
                local copy = {}
                local baseList = type(base[key]) == "table" and base[key] or {}
                for index, entry in ipairs(value) do
                    if type(entry) == "table" then
                        local baseEntry = type(baseList[index]) == "table" and baseList[index] or {}
                        copy[index] = mergeContent(baseEntry, entry)
                    else
                        copy[index] = entry
                    end
                end
                base[key] = copy
            else
                base[key] = mergeContent(type(base[key]) == "table" and base[key] or {}, value)
            end
        else
            base[key] = value
        end
    end

    return base
end

function ns.Content:RegisterFlavorContent(flavor, payload)
    self.registry = self.registry or {}
    self.registry[flavor] = mergeContent(self.registry[flavor] or {}, payload or {})
end

function ns.Content:RegisterRetailContentModule(payload)
    self.retailModules = self.retailModules or {}
    self.retailModules[#self.retailModules + 1] = payload
    _G.RepuAPIRetailContentModules = _G.RepuAPIRetailContentModules or {}
    _G.RepuAPIRetailContentModules[#_G.RepuAPIRetailContentModules + 1] = payload
end

function ns.Content:RegisterRetailContentLocale(locale, payload)
    ns.I18n:RegisterDomain("retail_content", locale, payload or {})
end

local function getRetailLocalePayload(self)
    local payload = ns.I18n:GetDomain("retail_content")
    return payload or {}
end

function ns.Content:GetFactionContent(factionID)
    self.registry = self.registry or {}
    local flavor = ns.Data:GetActiveFlavor()
    local shared = (self.registry.shared and self.registry.shared.factions) or {}
    local flavorData = (self.registry[flavor] and self.registry[flavor].factions) or {}
    local content = mergeContent(shared[factionID] or {}, flavorData[factionID] or {})

    if flavor == "retail" then
        local localePayload = getRetailLocalePayload(self)
        local localized = localePayload.factions and localePayload.factions[factionID] or nil
        if localized then
            content = mergeContent(content, localized)
        end
    end

    return content
end

function ns.Content:GetFactionDetails(candidate, context)
    local faction = candidate and candidate.faction or nil
    if not faction then
        return nil
    end

    local content = self:GetFactionContent(faction.factionID)
    local summary = content.summary

    if content.summaryKey then
        summary = ns.I18n:GetText("retail_content_text", content.summaryKey)
    elseif
        context
        and context.activeFlavor == "retail"
        and isRealFaction(faction)
        and faction.description
        and faction.description ~= ""
        and content.summarySource ~= "curated"
    then
        summary = faction.description
    end

    local activities = resolveActivities(content.activities or {})

    if faction.factionID == 2710 then
        local childActivity = resolveSilvermoonCourtQuestgiver(self)
        if childActivity then
            for _, activity in ipairs(activities) do
                activity.questgiverName = childActivity.questgiverName or activity.questgiverName
                activity.questgiverLabel = childActivity.questgiverLabel or activity.questgiverLabel
                activity.questgiverLocation = childActivity.questgiverLocation or activity.questgiverLocation
            end
        end
    end

    return {
        factionID = faction.factionID,
        name = faction.name,
        standingLabel = faction.standingLabel,
        progressValue = faction.progressValue,
        progressMax = faction.progressMax,
        progressPct = faction.progressPct,
        renownLevel = faction.renownLevel,
        isMajorFaction = faction.isMajorFaction,
        isVirtualGroup = faction.isVirtualGroup and true or false,
        hasRepEntry = faction.hasRepEntry,
        isKnownMissing = faction.isKnownMissing and true or false,
        description = faction.description,
        sourceType = candidate.sourceType,
        sourceKey = candidate.sourceKey,
        isInherited = candidate.isInherited and true or false,
        note = candidate.note,
        summary = summary,
        contentSource = content.source,
        contentConfidence = content.confidence,
        quartermasters = resolveQuartermasters(content.quartermasters or {}),
        activities = activities,
        context = {
            zoneName = context and context.zoneName or nil,
            subZoneName = context and context.subZoneName or nil,
        },
    }
end

_G.RepuAPI = _G.RepuAPI or {}
_G.RepuAPI.RegisterFlavorContent = function(flavor, payload)
    ns.Content:RegisterFlavorContent(flavor, payload)
end
_G.RepuAPI.RegisterRetailContentModule = function(payload)
    ns.Content:RegisterRetailContentModule(payload)
end
_G.RepuAPI.RegisterRetailContentLocale = function(locale, payload)
    ns.Content:RegisterRetailContentLocale(locale, payload)
end
