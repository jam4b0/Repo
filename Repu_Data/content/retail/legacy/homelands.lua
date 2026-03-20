local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

local function worldQuest(mapID, title)
    return {
        title = title,
        kind = "Zone/Stadt",
        location = {
            mapID = mapID,
            title = title,
        },
    }
end

api.RegisterRetailContentModule({
    factions = {
        [47] = {
            summary = "Klassische Zwergenfraktion von Eisenschmiede. In Retail taucht sie vor allem in Eisenschmiede, Dun Morogh, Loch Modan und angrenzenden Allianz-Gebieten als lokale Heimatfraktion auf.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(87, "Eisenschmiede"),
            },
        },
        [59] = {
            summary = "Die Thoriumbruderschaft deckt im Retail-Core vor allem die Blackrock-Gebiete rund um Sengende Schlucht und Brennende Steppe ab.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(32, "Sengende Schlucht"),
                worldQuest(36, "Brennende Steppe"),
            },
        },
        [68] = {
            summary = "Klassische Untotenfraktion von Unterstadt. In Retail taucht sie vor allem in Tirisfal, Silberwald, Unterstadt und angrenzenden Gebieten als lokale Heimatfraktion auf.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(90, "Unterstadt"),
            },
        },
        [69] = {
            summary = "Legacy-Hauptstadtfraktion von Darnassus. Im Retail-Core bleibt sie als klassische Allianz-Stadtfraktion erhalten, auch wenn die Stadt selbst heute nur noch in Legacy-Zusammenhängen relevant ist.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(89, "Darnassus"),
            },
        },
        [72] = {
            summary = "Klassische Menschenfraktion von Sturmwind. In Retail taucht sie in Sturmwind, Elwynn, Westfall, Rotkamm und angrenzenden Allianz-Gebieten als lokale Heimatfraktion auf.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(84, "Sturmwind"),
            },
        },
        [76] = {
            summary = "Klassische Orc-Hauptstadtfraktion von Orgrimmar. In Retail taucht sie in Orgrimmar, Durotar und Teilen des nördlichen Brachlands als lokale Heimatfraktion auf.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(85, "Orgrimmar"),
            },
        },
        [81] = {
            summary = "Klassische Tauren-Hauptstadtfraktion von Donnerfels. In Retail taucht sie in Donnerfels, Mulgore und den zugehörigen Tauren-Gebieten als lokale Heimatfraktion auf.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(86, "Donnerfels"),
            },
        },
        [529] = {
            summary = "Die Argentumdämmerung ist im Retail-Core die lokale Pestländer-Fraktion. Sie deckt vor allem Westliche und Östliche Pestländer sowie deren klassische Scharlach-/Geißel-Kontexte ab.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(22, "Westliche Pestländer"),
                worldQuest(23, "Östliche Pestländer"),
            },
        },
        [530] = {
            summary = "Die Dunkelspeertrolle werden im Retail-Core als lokale Horde-Fraktion in Teilen von Durotar, Eschental und den nördlichen Brachlanden genutzt.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(63, "Eschental"),
            },
        },
        [576] = {
            summary = "Holzschlundfeste deckt im Retail-Core die klassischen Grenzgebiete rund um Teufelswald und Winterquell ab.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(77, "Teufelswald"),
            },
        },
        [609] = {
            summary = "Der Cenarionzirkel ist im Retail-Core die lokale Fraktion für mehrere klassische Natur- und Wüstengebiete wie Desolace, Feralas, Mondlichtung und Silithus.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(66, "Desolace"),
                worldQuest(69, "Feralas"),
                worldQuest(80, "Mondlichtung"),
                worldQuest(81, "Silithus"),
            },
        },
        [749] = {
            summary = "Hydraxian Waterlords ist im Retail-Core ein klassischer Raid-Nebenruf von Molten Core. Er bleibt bewusst raidlokal und wird nicht mehr als normale Zonenfraktion von Azshara verwendet.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Molten Core", kind = "Raid", location = { title = "Molten Core" } },
            },
        },
        [910] = {
            summary = "Brood of Nozdormu ist im Retail-Core ein klassischer Ahn'Qiraj-Nebenruf. Er bleibt an die beiden Ahn'Qiraj-Raids gebunden und ersetzt dort nicht den generellen Silithus-Bezug.",
            source = "curated",
            confidence = "medium",
            activities = {
                { title = "Temple of Ahn'Qiraj", kind = "Raid", location = { title = "Temple of Ahn'Qiraj" } },
                { title = "Ruins of Ahn'Qiraj", kind = "Raid", location = { title = "Ruins of Ahn'Qiraj" } },
            },
        },
        [930] = {
            summary = "Die Exodar ist die Draenei-Hauptstadtfraktion. Im Retail-Core deckt sie die Stadt selbst sowie Azurmythos- und Blutmythosinsel als Heimatcluster ab.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(103, "Die Exodar"),
                worldQuest(97, "Azurmythosinsel"),
                worldQuest(106, "Die Blutmythosinsel"),
            },
        },
        [1133] = {
            summary = "Das Bilgewasserkartell ist im Retail-Core die lokale Goblinfraktion für Azshara und verwandte Goblin-Kontexte.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(76, "Azshara"),
            },
        },
        [1134] = {
            summary = "Gilneas ist im Retail-Core die lokale Fraktion für die gilneische Heimatstadt und ihr Umland.",
            source = "seed",
            confidence = "medium",
            activities = {
                worldQuest(1577, "Gilneas"),
            },
        },
        [369] = {
            summary = "Gadgetzan ist die neutrale Goblin-Stadtfraktion von Tanaris. Im Retail-Core ist sie als lokaler Hubanker für die Stadt selbst modelliert, nicht als ganze Zonenfraktion für Tanaris.",
            source = "curated",
            confidence = "medium",
            activities = {
                worldQuest(71, "Tanaris"),
                worldQuest(71, "Gadgetzan"),
            },
        },
        [470] = {
            summary = "Ratchet ist die neutrale Goblin-Hafenfraktion im Nördlichen Brachland. Im Retail-Core ist sie als lokaler Stadtanker für den Hafen modelliert.",
            source = "curated",
            confidence = "medium",
            activities = {
                worldQuest(10, "Nördliches Brachland"),
                worldQuest(10, "Ratchet"),
            },
        },
        [577] = {
            summary = "Everlook ist die neutrale Goblin-Stadtfraktion in Winterquell. Im Retail-Core ist sie als lokaler Hubanker für die Stadt selbst modelliert.",
            source = "curated",
            confidence = "medium",
            activities = {
                worldQuest(83, "Winterquell"),
                worldQuest(83, "Everlook"),
            },
        },
    },
})
