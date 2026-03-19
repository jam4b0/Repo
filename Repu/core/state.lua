local _, ns = ...

local Utils = ns.Utils

local function mergeDefaults(target, defaults)
    target = target or {}
    for key, value in pairs(defaults or {}) do
        if type(value) == "table" then
            target[key] = mergeDefaults(type(target[key]) == "table" and target[key] or {}, value)
        elseif target[key] == nil then
            target[key] = value
        end
    end
    return target
end

function ns.State:Init()
    RepuDB = mergeDefaults(RepuDB, ns.Config:GetDefaults())
    self.db = RepuDB
    self.runtime = {
        refreshQueued = false,
        lastRefreshReason = nil,
        lastRefreshAt = 0,
        context = nil,
        coverage = nil,
        rawFactions = {},
        matches = {},
        prioritized = {},
        visible = {},
    }
end

function ns.State:GetDB()
    return self.db
end

function ns.State:GetDebugDB()
    return self.db.debug
end

function ns.State:GetProfile()
    return self.db.profile
end

function ns.State:SetRuntimeValue(key, value)
    self.db.runtime[key] = value
end

function ns.State:GetRuntimeValue(key)
    return self.db.runtime[key]
end

function ns.State:GetSnapshot()
    return {
        context = self.runtime.context,
        coverage = self.runtime.coverage,
        rawFactions = self.runtime.rawFactions,
        matches = self.runtime.matches,
        prioritized = self.runtime.prioritized,
        visible = self.runtime.visible,
        reason = self.runtime.lastRefreshReason,
        lastRefreshAt = self.runtime.lastRefreshAt,
    }
end

function ns.State:QueueRefresh(reason, options)
    if self.runtime.refreshQueued then
        self.runtime.pendingReason = reason or self.runtime.pendingReason or "UNKNOWN"
        self.runtime.pendingOptions = options or self.runtime.pendingOptions
        return
    end

    self.runtime.refreshQueued = true
    self.runtime.pendingReason = reason or "UNKNOWN"
    self.runtime.pendingOptions = options

    local function run()
        self.runtime.refreshQueued = false
        self:Refresh(self.runtime.pendingReason, self.runtime.pendingOptions)
        self.runtime.pendingReason = nil
        self.runtime.pendingOptions = nil
    end

    if C_Timer and C_Timer.After then
        C_Timer.After(0.05, run)
    else
        run()
    end
end

function ns.State:Refresh(reason, options)
    self.runtime.lastRefreshReason = reason or "MANUAL"
    self.runtime.lastRefreshAt = GetTime()

    local context = ns.Location:BuildContext()
    local coverage = ns.Data:GetCoverage(context)
    local rawFactions = ns.Factions:CollectAll()
    local matches = ns.Factions:BuildMatches(rawFactions, context)
    local prioritized = ns.Scoring:Prioritize(matches, rawFactions, context, options)
    local visible = ns.Factions:SelectVisible(prioritized, context)

    self.runtime.context = context
    self.runtime.coverage = coverage
    self.runtime.rawFactions = rawFactions
    self.runtime.matches = matches
    self.runtime.prioritized = prioritized
    self.runtime.visible = visible

    if visible[1] and visible[1].factionID then
        self:SetRuntimeValue("lastRelevantFactionID", visible[1].factionID)
    end

    ns.UI:Refresh(visible, context)
    ns.Debug:OnRefresh(self.runtime.lastRefreshReason)
end
