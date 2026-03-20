local ADDON_NAME = ...

_G.RepuMapAPI = _G.RepuMapAPI or {}

local I18n = {
    domain = "map_ui",
    bundle = {},
    activeLocale = "enUS",
}

local function getLocale()
    return GetLocale and GetLocale() or "enUS"
end

function I18n:Register(locale, payload)
    local api = _G.RepuAPI
    if api and api.RegisterLocaleDomain then
        api.RegisterLocaleDomain(self.domain, locale, payload or {})
    end
end

function I18n:Apply(locale)
    local api = _G.RepuAPI
    self.activeLocale = locale or getLocale()
    if api and api.GetLocaleDomain then
        self.bundle = api.GetLocaleDomain(self.domain, self.activeLocale) or {}
    else
        self.bundle = {}
    end
    return self.bundle
end

function I18n:Get(key)
    return (self.bundle and self.bundle[key]) or key
end

function I18n:Format(key, ...)
    local pattern = self:Get(key)
    if select("#", ...) == 0 then
        return pattern
    end
    return string.format(pattern, ...)
end

_G.RepuMapAPI.I18n = I18n
