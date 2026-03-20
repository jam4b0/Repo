local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [2407] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Bastion",
                    },
                    title = "Bastion",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Spires of Ascension",
                    },
                    title = "Spires of Ascension",
                },
                {
                    kind = "Weekly",
                    location = {
                        title = "Bastion",
                    },
                    title = "World quests and covenant callings",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "Sanctum of Binding",
                    },
                    name = "Adjutant Nikos",
                },
            },
            source = "curated",
            summary = "Kyrian who complete the arduous process of purging their mortal encumbrances are deemed worthy of the rite of ascension, earning their wings and pledging eternal service to the Archon.",
        },
        [2410] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Maldraxxus",
                    },
                    title = "Maldraxxus",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Theater of Pain",
                    },
                    title = "Theater of Pain",
                },
                {
                    kind = "Weekly",
                    location = {
                        title = "Maldraxxus",
                    },
                    title = "World quests and covenant callings",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "Theater of Pain",
                    },
                    name = "Nalcorn Talsen",
                },
            },
            source = "curated",
            summary = "Long ago, the Primus established the five houses of Maldraxxus to build the ultimate fighting force. Through might, cleverness, and guile, this unyielding armada is pledged to defend the Shadowlands against all threats.",
        },
        [2413] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Revendreth",
                    },
                    title = "Revendreth",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Halls of Atonement",
                    },
                    title = "Halls of Atonement",
                },
                {
                    kind = "Weekly",
                    location = {
                        title = "Revendreth",
                    },
                    title = "World quests and covenant callings",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "Darkhaven",
                    },
                    name = "Mistress Mihaela",
                },
            },
            source = "curated",
            summary = "After countless ages spent under the rule of Sire Denathrius, authority in Revendreth is now shared amongst the Court of Harvesters. These noble venthyr carry out the sacred duty of redeeming prideful souls.",
        },
        [2432] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "The Maw",
                    },
                    title = "The Maw",
                },
                {
                    kind = "Hub",
                    location = {
                        title = "Ve'nari's Refuge",
                    },
                    title = "Ve'nari's Refuge",
                },
                {
                    kind = "Recurring",
                    location = {
                        title = "The Maw",
                    },
                    title = "Stygia, rares, and Maw objectives",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "Ve'nari's Refuge",
                    },
                    name = "Ve'nari",
                },
            },
            source = "curated",
            summary = "Ve'nari knows more about the Maw than anyone, and she might share a fraction of that information with you if you earn her regard.",
        },
        [2439] = {
            activities = {
                {
                    kind = "Hub",
                    location = {
                        title = "Revendreth",
                    },
                    title = "Absolution Crypt",
                },
                {
                    kind = "Daily",
                    location = {
                        title = "Revendreth",
                    },
                    title = "Avowed hunts and daily restoration work",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "Sinposium",
                    },
                    name = "Mistress Mihaela",
                },
            },
            source = "curated",
            summary = "Fiercely devoted to the Accuser, these archivists seek to restore and catalog the sinstones fragmented by the Lord Chamberlain and his Inquisitor allies.",
        },
        [2464] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Ardenweald",
                    },
                    title = "Ardenweald",
                },
                {
                    kind = "Dungeon",
                    location = {
                        title = "Mists of Tirna Scithe",
                    },
                    title = "Mists of Tirna Scithe",
                },
                {
                    kind = "Recurring",
                    location = {
                        title = "Ardenweald",
                    },
                    title = "Court of Night support and anima work",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The anima drought and Drust invasion consume the Winter Queen and Wild Hunt's attention, leaving the droman of the Court of Night to protect the wildseeds and defend their groves.",
        },
        [2465] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Ardenweald",
                    },
                    title = "Ardenweald",
                },
                {
                    kind = "Weekly",
                    location = {
                        title = "Heart of the Forest",
                    },
                    title = "World quests and covenant callings",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "Heart of the Forest",
                    },
                    name = "Elwyn",
                },
            },
            source = "curated",
            summary = "Called to serve the Winter Queen in times of dire need, the Wild Hunt assembles the finest huntresses and hunters in all of Ardenweald. In the face of drought and peril, the Wild Hunt stands ready to defend the forest.",
        },
        [2470] = {
            activities = {
                {
                    kind = "Raid",
                    location = {
                        title = "Sanctum of Domination",
                    },
                    title = "Sanctum of Domination",
                },
                {
                    kind = "Recurring",
                    location = {
                        title = "Korthia",
                    },
                    title = "Covenant assaults and Death's Advance objectives",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The combined might of the Shadowlands covenants, brought forth to breach the Sanctum of Domination.",
        },
        [2472] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 1961,
                        title = "Korthia",
                    },
                    title = "Korthia",
                },
                {
                    kind = "Hub",
                    location = {
                        mapID = 1961,
                        title = "Keeper's Respite",
                    },
                    title = "Keeper's Respite",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 1961,
                        title = "Korthia",
                    },
                    title = "Relic research",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 1961,
                        title = "Keeper's Respite",
                    },
                    name = "Archivist Roh-Suir",
                },
            },
            source = "curated",
            summary = "Korthian attendants have committed their existence to researching relics from across the Shadowlands. Led by their Archivist, they are dedicated to recovering the relics scattered across Korthia in the wake of the mawsworn invasion.",
        },
        [2478] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        title = "Zereth Mortis",
                    },
                    title = "Zereth Mortis",
                },
                {
                    kind = "Hub",
                    location = {
                        title = "Haven",
                    },
                    title = "Haven",
                },
                {
                    kind = "Weekly",
                    location = {
                        title = "Zereth Mortis",
                    },
                    title = "World quests and weekly patterns",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        title = "Haven",
                    },
                    name = "Vilo",
                },
            },
            source = "curated",
            summary = "Once members of Cartel Al, the Enlightened have abandoned the pursuit of profit and glory out of devotion to the First Ones. By earning their favor, the brokers may be willing to share the knowledge they have gleaned.",
        },
    },
})
