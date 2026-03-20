local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1158] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 198,
                        title = "Hyjal",
                    },
                    title = "Hyjal",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 198,
                        title = "Hyjal",
                    },
                    title = "Mount Hyjal dailies",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 198,
                        title = "Nordrassil",
                        x = 0.620,
                        y = 0.230,
                    },
                    name = "Provisioner Whitecloud",
                },
            },
            source = "curated",
            summary = "Faced with the impending devastation of Mount Hyjal, the most powerful members of the Cenarion Circle have joined forces with their Emerald Dragonflight allies to fend off Ragnaros' elemental hordes and the Twilight's Hammer.",
        },
        [1171] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 207,
                        title = "Deepholm",
                    },
                    title = "Deepholm",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 207,
                        title = "Therazane's Throne",
                        x = 0.569,
                        y = 0.132,
                    },
                    name = "D'lom the Collector",
                },
            },
            source = "curated",
            summary = "The elemental plane of earth, Deepholm, is ruled by Therazane and her children, the Stone Lords.  After witnessing the devastation Deathwing and his followers caused her realm, Therazane treats all outsiders with open hostility.",
        },
        [1173] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 249,
                        title = "Uldum",
                    },
                    title = "Uldum",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 249,
                        title = "Ramkahen",
                        x = 0.541,
                        y = 0.333,
                    },
                    name = "Blacksmith Abasi",
                },
            },
            source = "curated",
            summary = "The cat-like people of Ramkahen are the descendants of the Tol'vir, guardians of Uldum.  Though they've lost their stone bodies, protecting the secrets of the titans is still a part of their rigid tradition.",
        },
        [1174] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 241,
                        title = "Twilight Highlands",
                    },
                    title = "Twilight Highlands",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 241,
                        title = "Wildhammer Stronghold / Thundermar",
                    },
                    title = "Twilight Highlands support and Wildhammer war efforts",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "The Wildhammer dwarves are known for their near-reckless courage as well as their unsurpassed gryphon-riding skills.  After losing their home of Grim Batol to a Dark Iron Curse, they've spread their dwellings around the Twilight Highlands.",
        },
        [1177] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 244,
                        title = "Tol Barad",
                    },
                    title = "Tol Barad",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 245,
                        title = "Halbinsel von Tol Barad",
                    },
                    title = "Halbinsel von Tol Barad",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 245,
                        title = "Baradin Base Camp",
                    },
                    title = "Tol Barad daily quests",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 245,
                        title = "Baradin Base Camp",
                    },
                    name = "Quartermaster Brazie",
                },
            },
            source = "curated",
            summary = "Once led by Duke Reginald Baradin II, this fierce army has historic ties to the island stronghold of Tol Barad.  They have joined the forces of the Alliance in an effort to repeal the Horde invaders and gain control of this strategic island.",
        },
        [1178] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 244,
                        title = "Tol Barad",
                    },
                    title = "Tol Barad",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 245,
                        title = "Halbinsel von Tol Barad",
                    },
                    title = "Halbinsel von Tol Barad",
                },
                {
                    kind = "Daily",
                    location = {
                        mapID = 245,
                        title = "Hellscream's Grasp",
                    },
                    title = "Tol Barad daily quests",
                },
            },
            confidence = "medium",
            quartermasters = {
                {
                    label = "Quartermaster",
                    location = {
                        mapID = 245,
                        title = "Hellscream's Grasp",
                        x = 0.545,
                        y = 0.814,
                    },
                    name = "Pogg",
                },
            },
            source = "curated",
            summary = "Hellscream's Reach is an elite Horde regiment comprised solely of veterans of multiple tours of duty.   Handpicked by Garrosh himself, he has commanded them to take complete control of Tol Barad.  Failure is not an option.",
        },
        [2417] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 249,
                        title = "Uldum",
                    },
                    title = "Uldum",
                },
                {
                    kind = "Recurring",
                    location = {
                        mapID = 249,
                        title = "Ramkahen / Accord operations",
                    },
                    title = "Assaults and Uldum defense objectives",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "A loose coalition of allies headed by the Tol'vir, the Uldum Accord was founded to protect the Forge of Origination from enemy forces.",
        },
    },
})
