local _, ns = ...

ns.Locale = ns.Locale or {}

local Locale = ns.Locale

Locale.registry = Locale.registry or {}
ns.L = ns.L or setmetatable({}, {
    __index = function(_, key)
        return key
    end,
})

local function merge(target, source)
    for key, value in pairs(source or {}) do
        target[key] = value
    end
end

local function resolveLocaleKey(locale)
    if not locale or locale == "" then
        return "enUS"
    end

    if Locale.registry[locale] then
        return locale
    end

    local language = string.sub(locale, 1, 2)
    if language == "de" and Locale.registry.deDE then
        return "deDE"
    end
    if language == "en" and Locale.registry.enUS then
        return "enUS"
    end

    return "enUS"
end

function Locale:Register(locale, payload)
    self.registry[locale] = payload or {}
end

function Locale:Apply(locale)
    local base = self.registry.enUS or {}
    local resolved = resolveLocaleKey(locale)
    local active = {}

    merge(active, base)
    if resolved ~= "enUS" then
        merge(active, self.registry[resolved] or {})
    end

    self.activeLocale = resolved
    ns.L = setmetatable(active, {
        __index = function(_, key)
            return base[key] or key
        end,
    })

    return ns.L
end

function Locale:Init()
    local locale = GetLocale and GetLocale() or "enUS"
    return self:Apply(locale)
end

function Locale:Get(key)
    local active = ns.L or {}
    return active[key] or key
end

function Locale:Format(key, ...)
    local pattern = self:Get(key)
    if select("#", ...) == 0 then
        return pattern
    end
    return string.format(pattern, ...)
end
