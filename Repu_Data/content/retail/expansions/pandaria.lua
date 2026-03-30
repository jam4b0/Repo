local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1269] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 390,
                        title = "Vale of Eternal Blossoms",
                    },
                    title = "Vale of Eternal Blossoms",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Mogu'shan Palace",
                    },
                    title = "Mogu'shan Palace",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 390,
                        title = "Shrine of Seven Stars",
                        x = 0.842,
                        y = 0.628,
                    },
                    name = "Jaluu the Generous",
                },
            },
            source = "curated",
            summary = "This mysterious society of Pandaren intend to solve the Mogu problem once and for all.",
        },
        [1270] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 371,
                        title = "The Jade Forest",
                    },
                    title = "Questlines in the Jade Forest",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Shado-Pan Monastery",
                    },
                    title = "Shado-Pan Monastery",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 371,
                        title = "Shado-Pan Garrison",
                        x = 0.489,
                        y = 0.706,
                    },
                    name = "Rushi the Fox",
                },
            },
            source = "curated",
            summary = "The shadowy protectors of Pandaria's temples, the Shado-Pan are wrought with mystery.",
        },
        [1271] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 418,
                        title = "Dread Wastes",
                    },
                    title = "Questlines in Dread Wastes",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Heart of Fear",
                    },
                    title = "Heart of Fear",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 371,
                        title = "The Arboretum",
                        x = 0.566,
                        y = 0.444,
                    },
                    name = "San Redscale",
                },
            },
            source = "curated",
            summary = "Guardians of the East Temple",
        },
        [1272] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 376,
                        title = "Valley of the Four Winds",
                    },
                    title = "Valley of the Four Winds",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 376,
                        title = "Halbhuegel",
                    },
                    title = "Halbhuegel",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 376,
                        title = "Halfhill",
                        x = 0.532,
                        y = 0.518,
                    },
                    name = "Gina Mudclaw",
                },
            },
            source = "curated",
            summary = "The Tillers are peaceful and productive pandaren, working with the land to feed the massive appetites of their people.",
        },
        [1302] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 388,
                        title = "Krasarang Wilds",
                    },
                    title = "Questlines in Krasarang Wilds",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 388,
                        title = "Anglers Wharf",
                        x = 0.684,
                        y = 0.434,
                    },
                    name = "Nat Pagle",
                },
            },
            source = "curated",
            summary = "The Anglers are a group of Pandaren fisherman that hope to feed their people and grow their knowledge of fishing.",
        },
        [1337] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 418,
                        title = "Dread Wastes",
                    },
                    title = "Dread Wastes",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 418,
                        title = "Klaxxi'vess",
                    },
                    title = "Klaxxi'vess",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Heart of Fear",
                    },
                    title = "Heart of Fear",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 418,
                        title = "Klaxxi'vess",
                        x = 0.550,
                        y = 0.356,
                    },
                    name = "Ambersmith Zikk",
                },
            },
            source = "curated",
            summary = "These Mantid Elders are untouched by the corruption and insanity that has overtaken the remainder of the Mantid Swarm. They seek to work with the races of Pandaria to restore their Queen to glory.",
        },
        [1359] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 390,
                        title = "Vale of Eternal Blossoms",
                    },
                    title = "Vale of Eternal Blossoms",
                },
                {
                    kind = "Story",
                    location = {
                        mapID = 390,
                        title = "Vale of Eternal Blossoms",
                    },
                    title = "Wrathion-Endgame",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Black Prince Wrathion is the last of the black dragons. He has been known to richly reward those who earn his trust and support his endeavors.",
        },
        [1375] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 390,
                        title = "Shrine of Two Moons",
                    },
                    title = "Shrine of Two Moons",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 388,
                        title = "Domination Point",
                    },
                    title = "Dominance Offensive daily quests",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Horde forces in Pandaria, stationed at Domination Point in Krasarang Wilds.",
        },
        [1376] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 390,
                        title = "Shrine of Seven Stars",
                    },
                    title = "Shrine of Seven Stars",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 388,
                        title = "Lion's Landing",
                    },
                    title = "Operation: Shieldwall daily quests",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Alliance forces in Pandaria, stationed at Lion's Landing in Krasarang Wilds.",
        },
        [1387] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 507,
                        title = "Isle of Thunder",
                    },
                    title = "Isle of Thunder",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 507,
                        title = "Isle of Thunder",
                    },
                    title = "Isle of Thunder daily quests",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Ignited by Jaina's fury, the Kirin Tor Offensive seek to seize Thunder Isle for the glory of the Alliance!",
        },
        [1388] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 507,
                        title = "Isle of Thunder",
                    },
                    title = "Isle of Thunder",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 507,
                        title = "Isle of Thunder",
                    },
                    title = "Isle of Thunder daily quests",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Outcast from Dalaran, the Sunreaver Onslaught fight to obtain powerful mogu artifacts from among the ruins of Thunder Isle, and to secure their future if the Horde falls to anarchy.",
        },
        [1435] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 507,
                        title = "Isle of the Thunder King",
                    },
                    title = "Isle of the Thunder King",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Throne of Thunder",
                    },
                    title = "Throne of Thunder",
                },
                {
                    kind = "Recurring",
                    location = {
                        title = "Throne of Thunder",
                    },
                    title = "Raid clears and assault turn-ins",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "These valorous Shado-Pan venture into the Throne of Thunder to vanquish the evil found within, and exact justice for the centuries of slavery they endured under the Thunder King's reign.",
        },
        [1492] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 554,
                        title = "Timeless Isle",
                    },
                    title = "Timeless Isle",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Siege of Orgrimmar",
                    },
                    title = "Siege of Orgrimmar",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Shaohao, the long lost Emperor of the Pandaren people, is a personage worthy of deep respect.",
        },
    },
})
