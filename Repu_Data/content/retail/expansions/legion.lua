local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1828] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 650,
                        title = "Highmountain",
                    },
                    title = "Highmountain",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Neltharion's Lair",
                    },
                    title = "Neltharion's Lair",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The Highmountain Tribe has dwindled in numbers over the years, and with the drogbar threat looming, seek new allies to save their homeland.",
        },
        [1859] = {
            activities = {
                {
                    kind = "Story/Zone",
                    location = {
                        mapID = 680,
                        title = "Suramar",
                    },
                    title = "Suramar-Kampagne",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 680,
                        title = "Shal'Aran",
                    },
                    title = "Shal'Aran",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "These exiled Nightborne elves suffer withdrawals after being cut off from the Nightwell. They oppose their people's alliance with the Legion and fight for some kind of redemption.",
        },
        [1883] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        mapID = 627,
                        title = "Dalaran",
                    },
                    title = "Legion-Dalaran",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 627,
                        title = "Krasus' Landing",
                    },
                    title = "Krasus' Landing",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The druids and their allies in Val'sharah have guarded the Emerald Dream since time immemorial.",
        },
        [1894] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 646,
                        title = "Broken Shore",
                    },
                    title = "Broken Shore",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Tomb of Sargeras",
                    },
                    title = "Tomb of Sargeras",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "After Legion forces broke the Vault of the Wardens with the aid of Gul'dan, what few Wardens remain are determined to rebuild their prison and hunt down the terrifying beasts that were let loose when it fell.",
        },
        [1900] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 630,
                        title = "Azsuna",
                    },
                    title = "Azsuna",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Eye of Azshara",
                    },
                    title = "Eye of Azshara",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The ghostly Court of Farondis and its allies continue the fight against an onslaught of invaders on the cursed island of Azsuna.",
        },
        [1948] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 634,
                        title = "Sturmheim",
                    },
                    title = "Sturmheim",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 634,
                        title = "Haimont",
                    },
                    title = "Haimont",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "These are the chosen warriors of Odyn, sworn to his service in life and death.",
        },
        [2045] = {
            activities = {
                {
                    kind = "Dungeon",
                    location = {
                        title = "Vault of the Wardens",
                    },
                    title = "Vault of the Wardens",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The coalition of orders dedicated to defeating the Legion at the Tomb of Sargeras and Broken Shore.",
        },
        [2165] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 830,
                        title = "Krokuun",
                    },
                    title = "Krokuun",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 830,
                        title = "Argus",
                    },
                    title = "Argus activities",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "After the fall of Argus, the draenei's finest warriors followed the prime naaru Xe'ra across the cosmos in an eternal war to bring about the Legion's end. Since then, other survivors of the Burning Crusade have joined the ranks of the Lightforged.",
        },
        [2170] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 830,
                        title = "Argus",
                    },
                    title = "Argus activities",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Antorus, the Burning Throne",
                    },
                    title = "Antorus, the Burning Throne",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Although many struggled to oppose the Burning Legion's conquest of Argus, not all were able to escape. Emboldened by the arrival of new allies, these refugees and outcasts stand united in their mission to reclaim their home.",
        },
    },
})
