local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [47] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 87,
                        title = "Ironforge",
                    },
                    title = "Ironforge",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "This Alliance capital is the pride of the Dun Morogh dwarves.  Home to King Magni.",
        },
        [59] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 32,
                        title = "Searing Gorge",
                    },
                    title = "Searing Gorge",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 36,
                        title = "Burning Steppes",
                    },
                    title = "Burning Steppes",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 242,
                        title = "Blackrock Depths",
                    },
                    name = "Lokhtos Darkbargainer",
                },
            },
            source = "curated",
            summary = "The dwarves of the Thorium Brotherhood epitomize excellence in craftsmanship and are bent on unlocking the secrets of Blackrock Mountain.",
        },
        [68] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 90,
                        title = "Undercity",
                    },
                    title = "Undercity",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Led by Sylvanas Windrunner, the Forsaken have joined a tenuous alliance with the Horde and established this capital in the vast depths under the Ruins of Lordaeron.",
        },
        [69] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 89,
                        title = "Darnassus",
                    },
                    title = "Darnassus",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "This Alliance capital is populated by Night Elves and is located in the Island of Teldrassil.  Ruled by the Priestess of the Moon, Tyrande Whisperwind.",
        },
        [72] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 84,
                        title = "Stormwind",
                    },
                    title = "Stormwind",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "One of the last bastions of human power, this Alliance capital is ruled by the young but wise king, Anduin Wrynn.",
        },
        [76] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 85,
                        title = "Orgrimmar",
                    },
                    title = "Orgrimmar",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Founded by Thrall, this Horde capital city is home to many of the proud orc clans of Durotar.",
        },
        [81] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 86,
                        title = "Thunder Bluff",
                    },
                    title = "Thunder Bluff",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Baine Bloodhoof leads his people, the proud Tauren, from this mighty Horde capital.",
        },
        [369] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 71,
                        title = "Tanaris",
                    },
                    title = "Tanaris",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 71,
                        title = "Gadgetzan",
                    },
                    title = "Gadgetzan",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Capital of the Steamwheedle Cartel and home to goblinhood's finest engineers, alchemists and merchants.",
        },
        [470] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 10,
                        title = "Northern Barrens",
                    },
                    title = "Northern Barrens",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 10,
                        title = "Ratchet",
                    },
                    title = "Ratchet",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Part of the Steamwheedle Cartel, this goblin city provides a neutral haven for those that wish to trade goods and services in the Barrens.",
        },
        [529] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 22,
                        title = "Western Plaguelands",
                    },
                    title = "Western Plaguelands",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 23,
                        title = "Eastern Plaguelands",
                    },
                    title = "Eastern Plaguelands",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "An organization focused on protecting Azeroth from the threat of the Scourge.  Strongholds of the Argent Dawn can be found in the Eastern and Western Plaguelands.",
        },
        [530] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 63,
                        title = "Ashenvale",
                    },
                    title = "Ashenvale",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "This tribe of exiled trolls has joined forces with Thrall and the Horde.  They now call Durotar their home, which they share with their orc allies.",
        },
        [576] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 77,
                        title = "Felwood",
                    },
                    title = "Felwood",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "As the last uncorrupted furbolg tribe, the Timbermaw seek to preserve their spiritual ways and end the suffering of their brethren.",
        },
        [577] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 83,
                        title = "Winterspring",
                    },
                    title = "Winterspring",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 83,
                        title = "Everlook",
                    },
                    title = "Everlook",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "This trading post is run by the goblins of the Steamwheedle Cartel and it sits in the crossroads of Winterspring's main trade routes.",
        },
        [609] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 66,
                        title = "Desolace",
                    },
                    title = "Desolace",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 69,
                        title = "Feralas",
                    },
                    title = "Feralas",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 80,
                        title = "Moonglade",
                    },
                    title = "Moonglade",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 81,
                        title = "Silithus",
                    },
                    title = "Silithus",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The druids of Cenarion Circle are guardians of nature and make their home in tranquil Moonglade.",
        },
        [749] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Molten Core",
                    },
                    title = "Molten Core",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "These elementals have made their home on the islands east of Azshara.  Sworn enemies of the armies of Ragnaros.",
        },
        [910] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Temple of Ahn'Qiraj",
                    },
                    title = "Temple of Ahn'Qiraj",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Ruins of Ahn'Qiraj",
                    },
                    title = "Ruins of Ahn'Qiraj",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The descendants of the Bronze Dragonflight are the guardians of time and care little for the mortal races.",
        },
        [930] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 103,
                        title = "The Exodar",
                    },
                    title = "The Exodar",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 97,
                        title = "Azuremyst Isle",
                    },
                    title = "Azuremyst Isle",
                },
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 106,
                        title = "Bloodmyst Isle",
                    },
                    title = "Bloodmyst Isle",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The naaru vessel that brought the draenei to Azeroth.  Though stranded in the Azuremyst Isles, it acts as a home city for this noble race.",
        },
        [1133] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 76,
                        title = "Azshara",
                    },
                    title = "Azshara",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Run by the ruthless Trade Prince Gallywix, the Bilgewater Cartel is the most powerful trading company on the Isle of Kezan. From their headquarters at Bilgewater Port, the cartel dominates trade all over the South Seas.",
        },
        [1134] = {
            activities = {
                {
                    kind = "Zone/City",
                    location = {
                        mapID = 1577,
                        title = "Gilneas",
                    },
                    title = "Gilneas",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The people of Gilneas are a nation of survivors.  Having walled themselves off from the rest of humanity, they must now face new threats from within.",
        },
    },
})
