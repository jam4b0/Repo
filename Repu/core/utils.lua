local _, ns = ...

function ns.Utils:Clamp(value, minimum, maximum)
    if value < minimum then
        return minimum
    end
    if value > maximum then
        return maximum
    end
    return value
end

function ns.Utils:Round(value, decimals)
    local factor = 10 ^ (decimals or 0)
    return math.floor((value * factor) + 0.5) / factor
end

function ns.Utils:NormalizeKey(value)
    if not value or value == "" then
        return nil
    end

    local normalized = tostring(value):lower()
    normalized = normalized:gsub("[%c%p]", " ")
    normalized = normalized:gsub("%s+", " ")
    normalized = normalized:gsub("^%s+", "")
    normalized = normalized:gsub("%s+$", "")

    if normalized == "" then
        return nil
    end

    return normalized
end

function ns.Utils:ShallowCopy(source)
    local copy = {}
    for key, value in pairs(source or {}) do
        copy[key] = value
    end
    return copy
end

function ns.Utils:DeepMerge(target, source)
    target = target or {}
    for key, value in pairs(source or {}) do
        if type(value) == "table" then
            target[key] = self:DeepMerge(type(target[key]) == "table" and target[key] or {}, value)
        else
            target[key] = value
        end
    end
    return target
end

function ns.Utils:EnsureTable(container, key)
    container[key] = container[key] or {}
    return container[key]
end

function ns.Utils:TableLength(tbl)
    local count = 0
    for _ in pairs(tbl or {}) do
        count = count + 1
    end
    return count
end

local function stringify(value, depth, visited)
    depth = depth or 0
    visited = visited or {}

    if type(value) ~= "table" then
        if type(value) == "string" then
            return string.format("%q", value)
        end
        return tostring(value)
    end

    if visited[value] then
        return '"<cycle>"'
    end

    if depth > 4 then
        return '"<max-depth>"'
    end

    visited[value] = true

    local entries = {}
    for key, entry in pairs(value) do
        entries[#entries + 1] = "[" .. stringify(key, depth + 1, visited) .. "]=" .. stringify(entry, depth + 1, visited)
    end

    table.sort(entries)
    visited[value] = nil

    return "{ " .. table.concat(entries, ", ") .. " }"
end

function ns.Utils:Stringify(value)
    return stringify(value, 0, {})
end
