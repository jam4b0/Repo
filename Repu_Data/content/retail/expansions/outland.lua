local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [932] = {
            activities = {
                {
                    kind = "City faction",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    titleKey = "activity.shattrath.aldor_tasks.title",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 111,
                        title = "The Aldor Rise",
                        x = 0.470,
                        y = 0.260,
                    },
                    name = "Quartermaster Endarin",
                },
            },
            source = "curated",
            summary = "An ancient order of draenei priests once run by Velen, the Aldor are currently led by High Priestess Ishanah.  They are servants of the naaru in Shattrath City known as the Sha'tar.  Rivals of the Scryers.",
        },
        [933] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 104,
                        title = "Netherstorm",
                    },
                    title = "Netherstorm",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 104,
                        title = "Area 52",
                    },
                    title = "Area 52",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 107,
                        title = "Aeris Landing",
                    },
                    name = "Paulsta'ats",
                },
            },
            source = "curated",
            summary = "Led by Nexus-Prince Haramad, the Consortium is a loosely affiliated cartel of ethereal smugglers, traders and thieves that has come to Outland to benefit from its riches.",
        },
        [934] = {
            activities = {
                {
                    kind = "City faction",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    titleKey = "activity.shattrath.scryer_tasks.title",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 111,
                        title = "Scryer's Tier",
                        x = 0.600,
                        y = 0.640,
                    },
                    name = "Quartermaster Enuril",
                },
            },
            source = "curated",
            summary = "Voren'thal the Seer leads the dissident blood elves who've rejected Kael'thas' path to power.  They've joined forces with the naaru of Shattrath City, much to the dismay of the Aldor.",
        },
        [935] = {
            activities = {
                {
                    kind = "City/Instances",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    titleKey = "activity.shattrath.temple_tasks.title",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 111,
                        title = "Terrace of Light",
                        x = 0.516,
                        y = 0.416,
                    },
                    name = "Almaador",
                },
            },
            source = "curated",
            summary = "The Sha'tar are a group of powerful naaru who rule over a rebuilt Shattrath City.  With the help of the Aldor and the Scryers, they lead the battle against Illidan and the Burning Legion.",
        },
        [941] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 107,
                        title = "Nagrand",
                    },
                    title = "Nagrand",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 107,
                        title = "Garadar",
                    },
                    title = "Garadar",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 107,
                        title = "Garadar",
                        x = 0.534,
                        y = 0.370,
                    },
                    name = "Provisioner Nasela",
                },
            },
            source = "curated",
            summary = "This reclusive group of brown-skinned orcs has escaped any form of demonic corruption.  They have retained their traditional way of life in the face of great changes in Outland.",
        },
        [942] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 102,
                        title = "Zangarmarsh",
                    },
                    title = "Zangarmarsh",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 102,
                        title = "Cenarion Refuge",
                    },
                    title = "Cenarion Refuge",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 102,
                        title = "Cenarion Refuge",
                        x = 0.790,
                        y = 0.640,
                    },
                    name = "Fedryen Swiftspear",
                },
            },
            source = "curated",
            summary = "An exploratory force sent to Outland by the Cenarion Circle to study surviving life forms.  The Cenarion Expedition has quickly gained in size and autonomy since the opening of the Dark Portal.",
        },
        [946] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 100,
                        title = "Hellfire Peninsula",
                    },
                    title = "Hellfire Peninsula",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 100,
                        title = "Honor Hold",
                    },
                    title = "Honor Hold",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 100,
                        title = "Honor Hold",
                        x = 0.567,
                        y = 0.626,
                    },
                    name = "Logistics Officer Ulrike",
                },
            },
            source = "curated",
            summary = "Vestiges of the Sons of Lothar, veterans of the Alliance that first came into Draenor, have steadfastly held on to this Hellfire outpost.  They are now joined by the armies from Stormwind and Ironforge.",
        },
        [947] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 100,
                        title = "Hellfire Peninsula",
                    },
                    title = "Hellfire Peninsula",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "The Shattered Halls",
                    },
                    title = "The Shattered Halls",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 100,
                        title = "Thrallmar",
                    },
                    name = "Quartermaster Urgronn",
                },
            },
            source = "curated",
            summary = "The expedition sent through the Dark Portal by Thrall has built a stronghold in Hellfire Peninsula.  Thrallmar serves as a base of operations for much of the Horde's activities in Outland.",
        },
        [970] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 102,
                        title = "Zangarmarsh",
                    },
                    title = "Zangarmarsh",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 102,
                        title = "Sporeggar",
                    },
                    title = "Sporeggar",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 102,
                        title = "Sporeggar",
                    },
                    name = "Mycah",
                },
            },
            source = "curated",
            summary = "The sporelings are a mostly peaceful race of mushroom-men native to Outland. Their home is located in the southern bogs of Zangarmarsh.",
        },
        [978] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 107,
                        title = "Nagrand",
                    },
                    title = "Nagrand",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 107,
                        title = "Telaar",
                    },
                    title = "Telaar",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 107,
                        title = "Telaar",
                    },
                    name = "Trader Narasu",
                },
            },
            source = "curated",
            summary = "Draenei for \"redeemed.\"  These Broken have escaped the grasp of their various slavers in Outland and have made their home in Nagrand.  It is there that they seek to rediscover their destiny.",
        },
        [989] = {
            activities = {
                {
                    kind = "Dungeon",
                    location = {
                        title = "Old Hillsbrad Foothills",
                    },
                    title = "Old Hillsbrad Foothills",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "The Black Morass",
                    },
                    title = "The Black Morass",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 71,
                        title = "Caverns of Time",
                    },
                    name = "Alurmi",
                },
            },
            source = "curated",
            summary = "The Keepers of Time are bronze dragons hand-picked by Nozdormu to watch over the Caverns of Time.",
        },
        [990] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Hyjal Summit",
                    },
                    title = "Hyjal Summit",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "A secretive subgroup of the Bronze Dragonflight, led by Soridormi, prime mate of Nozdormu.",
        },
        [1011] = {
            activities = {
                {
                    kind = "City faction",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    titleKey = "activity.shattrath.lower_city_tasks.title",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 111,
                        title = "Lower City",
                    },
                    name = "Nakodu",
                },
            },
            source = "curated",
            summary = "The refugees of Shattrath come from diverse backgrounds and races.  Word of helpful deeds spreads quickly among the Denizens of Lower City.",
        },
        [1012] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 105,
                        title = "Shadowmoon Valley",
                    },
                    title = "Shadowmoon Valley",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Black Temple",
                    },
                    title = "Black Temple",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 105,
                        title = "Black Temple",
                    },
                    name = "Okuno",
                },
            },
            source = "curated",
            summary = "The elite of the Broken tribe known as the Ashtongue, officially aligned with Illidan. The Deathsworn are Akama's most trusted lieutenants and are privy to their leader's mysterious motivations.",
        },
        [1015] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 105,
                        title = "Shadowmoon Valley",
                    },
                    title = "Shadowmoon Valley",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 105,
                        title = "Netherwing Ledge",
                    },
                    title = "Netherwing Ledge",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 105,
                        title = "Netherwing Ledge",
                    },
                    name = "Drake Dealer Hurlunk",
                },
            },
            source = "curated",
            summary = "This unusual brood of dragons was spawned from the eggs of Deathwing's black dragonflight, and infused with raw nether-energies.  Now, they seek to find their identity beyond the shadows of their father's destructive heritage.",
        },
        [1031] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 109,
                        title = "Blade's Edge Mountains",
                    },
                    title = "Blade's Edge Mountains",
                },
                {
                    kind = "Daily/Repeatable",
                    location = {
                        mapID = 109,
                        title = "Blade's Edge Mountains",
                    },
                    title = "Skyguard daily tasks",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 109,
                        title = "Blackwind Landing",
                    },
                    name = "Grella",
                },
            },
            source = "curated",
            summary = "An airborne military force created by Shattrath City to deal with the threats that loom in the highest reaches of Outland.",
        },
        [1038] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 109,
                        title = "Blade's Edge Mountains",
                    },
                    title = "Blade's Edge Mountains",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 109,
                        title = "Ogri'la",
                    },
                    title = "Ogri'la",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 109,
                        title = "Ogri'la",
                    },
                    title = "Ogri'la apexis dailies",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The enlightened denizens of Ogri'la have made their dwelling in the western Blade's Edge Mountains, where proximity to apexis crystals has caused them to transcend their brutish ogre nature.",
        },
        [1077] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 122,
                        title = "Isle of Quel'Danas",
                    },
                    title = "Isle of Quel'Danas",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 122,
                        title = "Isle of Quel'Danas",
                    },
                    title = "Quel'Danas dailies",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Shattrath City's final push against Prince Kael'thas' operations in the Sunwell.",
        },
        [1416] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 105,
                        title = "Shadowmoon Valley",
                    },
                    title = "Shadowmoon Valley",
                },
                {
                    kind = "Raid",
                    location = {
                        title = "Black Temple",
                    },
                    title = "Black Temple",
                },
                {
                    kind = "Recurring",
                    location = {
                        title = "Black Temple",
                    },
                    title = "Black Temple support and attunement-era tasks",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Akama is distrustful of Warlocks after witnessing Illidan's fall to his own corruption, followed by the invasion of the Black Temple by Warlocks after the Cataclysm.",
        },
        [9000111] = {
            activities = {
                {
                    kind = "Cluster",
                    location = {
                        mapID = 111,
                        title = "Shattrath",
                    },
                    titleKey = "activity.shattrath.city_factions.title",
                },
            },
            confidence = "medium",
            source = "curated",
            summaryKey = "faction.9000111.summary",
        },
    },
})
