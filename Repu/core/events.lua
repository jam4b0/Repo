local _, ns = ...

local runtimeEvents = {
    "PLAYER_ENTERING_WORLD",
    "ZONE_CHANGED",
    "ZONE_CHANGED_INDOORS",
    "ZONE_CHANGED_NEW_AREA",
    "UPDATE_FACTION",
    "CHAT_MSG_COMBAT_FACTION_CHANGE",
    "PLAYER_REGEN_DISABLED",
    "PLAYER_REGEN_ENABLED",
}

function ns.Events:Init()
    self.frame = CreateFrame("Frame")
    self.frame:SetScript("OnEvent", function(_, event)
        if event == "UPDATE_FACTION" and ns.Compat:ShouldSuppressUpdateFaction() then
            return
        end
        ns.State:QueueRefresh(event)
    end)
    ns.UI:RegisterOptions()
end

function ns.Events:RegisterRuntimeEvents()
    for _, eventName in ipairs(runtimeEvents) do
        self.frame:RegisterEvent(eventName)
    end
end
