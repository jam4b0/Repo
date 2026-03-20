local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

local function zoneActivity(mapID, title)
    return {
        title = title,
        kind = "Zone",
        location = {
            mapID = mapID,
            title = title,
        },
    }
end

api.RegisterRetailContentModule({
    factions = {
        [1158] = {
            summary = "Die Wächter des Hyjal sind der lokale Cataclysm-Rufblock für Hyjal und die dortigen Elementar- und Druidenkonflikte.",
            source = "curated",
            confidence = "medium",
            activities = {
                zoneActivity(198, "Hyjal"),
            },
        },
        [1171] = {
            summary = "Therazane ist die lokale Fraktion von Tiefenheim und dem Tempel der Erde. Der Kernfortschritt kommt aus der Zone selbst.",
            source = "curated",
            confidence = "medium",
            activities = {
                zoneActivity(207, "Tiefenheim"),
            },
        },
        [1173] = {
            summary = "Ramkahen ist die klassische lokale Fraktion von Uldum. Sie bleibt der stabile Heimatanker der Zone über mehrere Weltzustände hinweg.",
            source = "curated",
            confidence = "medium",
            activities = {
                zoneActivity(249, "Uldum"),
            },
        },
        [1174] = {
            summary = "Wildhammer Clan ist der Allianz-seitige Nebenruf der Schattenhochlande. Im Retail-Core bleibt er als klarer lokaler Alliance-Zweig der Zone modelliert.",
            source = "curated",
            confidence = "medium",
            activities = {
                zoneActivity(241, "Schattenhochland"),
            },
        },
        [1177] = {
            summary = "Baradin's Wardens ist die Allianz-Fraktion von Tol Barad und der Halbinsel von Tol Barad.",
            source = "curated",
            confidence = "medium",
            activities = {
                zoneActivity(244, "Tol Barad"),
                zoneActivity(245, "Halbinsel von Tol Barad"),
            },
        },
        [1178] = {
            summary = "Hellscream's Reach ist die Horde-Fraktion von Tol Barad und der Halbinsel von Tol Barad.",
            source = "curated",
            confidence = "medium",
            activities = {
                zoneActivity(244, "Tol Barad"),
                zoneActivity(245, "Halbinsel von Tol Barad"),
            },
        },
        [2417] = {
            summary = "Uldum Accord ergänzt den klassischen Uldum-Block um die spaeteren Angriffs- und Weltaktivitaeten der modernen Uldum-Zustände.",
            source = "curated",
            confidence = "medium",
            activities = {
                zoneActivity(249, "Uldum"),
            },
        },
    },
})
