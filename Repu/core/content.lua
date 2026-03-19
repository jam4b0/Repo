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

function ns.Content:GetFactionContent(factionID)
    self.registry = self.registry or {}
    local flavor = ns.Data:GetActiveFlavor()
    local shared = (self.registry.shared and self.registry.shared.factions) or {}
    local flavorData = (self.registry[flavor] and self.registry[flavor].factions) or {}

    return mergeContent(shared[factionID] or {}, flavorData[factionID] or {})
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
