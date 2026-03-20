local _, ns = ...

ns.I18n = ns.I18n or {}

local I18n = ns.I18n

I18n.registry = I18n.registry or {}
I18n.cache = I18n.cache or {}

local function deepCopy(value)
    if type(value) ~= "table" then
        return value
    end

    local copy = {}
    for key, child in pairs(value) do
        copy[key] = deepCopy(child)
    end
    return copy
end

local function deepMerge(base, overlay)
    if type(overlay) ~= "table" then
        return overlay
    end

    base = type(base) == "table" and deepCopy(base) or {}

    for key, value in pairs(overlay) do
        if type(value) == "table" then
            if #value > 0 then
                local copy = {}
                for index, entry in ipairs(value) do
                    copy[index] = deepCopy(entry)
                end
                base[key] = copy
            else
                base[key] = deepMerge(base[key], value)
            end
        else
            base[key] = value
        end
    end

    return base
end

function I18n:ResolveLocale(locale, domain)
    local domains = self.registry[domain] or {}
    if not locale or locale == "" then
        return "enUS"
    end
    if domains[locale] then
        return locale
    end

    local language = string.sub(locale, 1, 2)
    if language == "de" and domains.deDE then
        return "deDE"
    end
    if language == "en" and domains.enUS then
        return "enUS"
    end

    return "enUS"
end

function I18n:RegisterDomain(domain, locale, payload)
    if not domain or not locale then
        return
    end

    self.registry[domain] = self.registry[domain] or {}
    self.registry[domain][locale] = deepMerge(self.registry[domain][locale], payload or {})
    self.cache[domain] = nil
end

function I18n:GetDomain(domain, locale)
    local domains = self.registry[domain] or {}
    local requestedLocale = locale or (GetLocale and GetLocale() or "enUS")
    local resolvedLocale = self:ResolveLocale(requestedLocale, domain)
    local cacheKey = resolvedLocale

    self.cache[domain] = self.cache[domain] or {}
    if self.cache[domain][cacheKey] then
        return deepCopy(self.cache[domain][cacheKey]), resolvedLocale
    end

    local payload = deepMerge({}, domains.enUS or {})
    if resolvedLocale ~= "enUS" then
        payload = deepMerge(payload, domains[resolvedLocale] or {})
    end

    self.cache[domain][cacheKey] = payload
    return deepCopy(payload), resolvedLocale
end

function I18n:GetText(domain, key, locale)
    local payload = self:GetDomain(domain, locale)
    return payload[key] or key
end

function I18n:Format(domain, key, locale, ...)
    local pattern = self:GetText(domain, key, locale)
    if select("#", ...) == 0 then
        return pattern
    end
    return string.format(pattern, ...)
end

_G.RepuAPI = _G.RepuAPI or {}
_G.RepuAPI.RegisterLocaleDomain = function(domain, locale, payload)
    I18n:RegisterDomain(domain, locale, payload)
end
_G.RepuAPI.GetLocaleDomain = function(domain, locale)
    local payload = I18n:GetDomain(domain, locale)
    return payload
end
_G.RepuAPI.GetLocalizedText = function(domain, key, locale, ...)
    if select("#", ...) == 0 then
        return I18n:GetText(domain, key, locale)
    end
    return I18n:Format(domain, key, locale, ...)
end
