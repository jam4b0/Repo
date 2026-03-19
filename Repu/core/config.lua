local _, ns = ...

local defaults = {
    version = 1,
    profile = {
        point = "CENTER",
        relativePoint = "CENTER",
        x = 0,
        y = -120,
        scale = 1,
        locked = false,
        hideExalted = true,
        maxBars = 5,
        width = 320,
        rowHeight = 22,
        debug = false,
    },
    debug = {
        enabled = false,
        autoCapture = true,
        maxCaptures = 200,
        sweepMode = false,
        defaultMaxCaptures = 200,
        sweepMaxCaptures = 2000,
        captures = {},
        lastCaptureKey = nil,
        lastDiagnostics = {
            location = nil,
            unmapped = nil,
            api = nil,
        },
        mapScan = {
            scannedAt = nil,
            roots = {},
            nodeCount = 0,
            nodesByID = {},
            orderedMapIDs = {},
        },
    },
    runtime = {
        lastRelevantFactionID = nil,
    },
}

function ns.Config:Init()
    self.defaults = defaults
end

function ns.Config:GetDefaults()
    return self.defaults
end
