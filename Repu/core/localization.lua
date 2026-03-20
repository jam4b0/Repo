local _, ns = ...

ns.Locale = ns.Locale or {}

local Locale = ns.Locale
ns.L = ns.L or setmetatable({}, {
    __index = function(_, key)
        return key
    end,
})

function Locale:Register(locale, payload)
    ns.I18n:RegisterDomain("ui", locale, payload or {})
end

function Locale:Apply(locale)
    local active, resolved = ns.I18n:GetDomain("ui", locale)
    local base = ns.I18n:GetDomain("ui", "enUS")

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
    return ns.I18n:GetText("ui", key, self.activeLocale)
end

function Locale:Format(key, ...)
    return ns.I18n:Format("ui", key, self.activeLocale, ...)
end
