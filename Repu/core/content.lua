local _, ns = ...

local function mergeContent(base, overlay)
    if not overlay then
        return base
    end

    base = ns.Utils:ShallowCopy(base or {})

    for key, value in pairs(overlay) do
        if type(value) == "table" then
            if #value > 0 then
                local copy = {}
                for index, entry in ipairs(value) do
                    copy[index] = type(entry) == "table" and ns.Utils:ShallowCopy(entry) or entry
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
    self.retailContentLocales = self.retailContentLocales or {}
    self.retailContentLocales[locale] = mergeContent(self.retailContentLocales[locale] or {}, payload or {})
end

local function getRetailLocalePayload(self)
    local locale = _G.GetLocale and _G.GetLocale() or "enUS"
    local locales = self.retailContentLocales or {}
    local english = locales.enUS or {}
    local active = locale ~= "enUS" and locales[locale] or nil

    if active then
        return mergeContent(english, active)
    end

    return english
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
        summary = content.summary,
        contentSource = content.source,
        contentConfidence = content.confidence,
        quartermasters = content.quartermasters or {},
        activities = content.activities or {},
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
