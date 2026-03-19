local api = _G.RepuAPI

if not api or not api.RegisterFlavorContent then
    return
end

local function mergeInto(target, source)
    for key, value in pairs(source or {}) do
        if type(value) == "table" and #value == 0 then
            target[key] = target[key] or {}
            mergeInto(target[key], value)
        else
            target[key] = value
        end
    end
end

local payload = {
    factions = {},
}

for _, module in ipairs(_G.RepuAPIRetailContentModules or {}) do
    mergeInto(payload, module)
end

api.RegisterFlavorContent("retail", payload)
