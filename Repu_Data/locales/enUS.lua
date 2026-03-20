local api = _G.RepuAPI

if not api or not api.RegisterRetailContentLocale then
    return
end

api.RegisterRetailContentLocale("enUS", {
    factions = {
        [21] = {
            summary = "This booming coastal city is run by Baron Revilgaz of the Blackwater Raiders.  Mortal enemies of the Bloodsail Buccaneers and part of the Steamwheedle Cartel.",
        },
        [47] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Ironforge",
                },
            },
            summary = "This Alliance capital is the pride of the Dun Morogh dwarves.  Home to King Magni.",
        },
        [59] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Searing Gorge",
                },
                {
                    kind = "Zone/City",
                    title = "Burning Steppes",
                },
            },
            summary = "The dwarves of the Thorium Brotherhood epitomize excellence in craftsmanship and are bent on unlocking the secrets of Blackrock Mountain.",
        },
        [68] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Undercity",
                },
            },
            summary = "Led by Sylvanas Windrunner, the Forsaken have joined a tenuous alliance with the Horde and established this capital in the vast depths under the Ruins of Lordaeron.",
        },
        [69] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Darnassus",
                },
            },
            summary = "This Alliance capital is populated by Night Elves and is located in the Island of Teldrassil.  Ruled by the Priestess of the Moon, Tyrande Whisperwind.",
        },
        [72] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Stormwind",
                },
            },
            summary = "One of the last bastions of human power, this Alliance capital is ruled by the young but wise king, Anduin Wrynn.",
        },
        [76] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Orgrimmar",
                },
            },
            summary = "Founded by Thrall, this Horde capital city is home to many of the proud orc clans of Durotar.",
        },
        [81] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Thunder Bluff",
                },
            },
            summary = "Baine Bloodhoof leads his people, the proud Tauren, from this mighty Horde capital.",
        },
        [369] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Tanaris",
                },
                {
                    kind = "Zone/City",
                    title = "Gadgetzan",
                },
            },
            summary = "Capital of the Steamwheedle Cartel and home to goblinhood's finest engineers, alchemists and merchants.",
        },
        [470] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Northern Barrens",
                },
                {
                    kind = "Zone/City",
                    title = "Ratchet",
                },
            },
            summary = "Part of the Steamwheedle Cartel, this goblin city provides a neutral haven for those that wish to trade goods and services in the Barrens.",
        },
        [529] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Western Plaguelands",
                },
                {
                    kind = "Zone/City",
                    title = "Eastern Plaguelands",
                },
            },
            summary = "An organization focused on protecting Azeroth from the threat of the Scourge.  Strongholds of the Argent Dawn can be found in the Eastern and Western Plaguelands.",
        },
        [530] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Ashenvale",
                },
            },
            summary = "This tribe of exiled trolls has joined forces with Thrall and the Horde.  They now call Durotar their home, which they share with their orc allies.",
        },
        [576] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Felwood",
                },
            },
            summary = "As the last uncorrupted furbolg tribe, the Timbermaw seek to preserve their spiritual ways and end the suffering of their brethren.",
        },
        [577] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Winterspring",
                },
                {
                    kind = "Zone/City",
                    title = "Everlook",
                },
            },
            summary = "This trading post is run by the goblins of the Steamwheedle Cartel and it sits in the crossroads of Winterspring's main trade routes.",
        },
        [589] = {
            summary = "This small group of reclusive night elves raises and trains wintersabers in the Winterspring area.",
        },
        [609] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Desolace",
                },
                {
                    kind = "Zone/City",
                    title = "Feralas",
                },
                {
                    kind = "Zone/City",
                    title = "Moonglade",
                },
                {
                    kind = "Zone/City",
                    title = "Silithus",
                },
            },
            summary = "The druids of Cenarion Circle are guardians of nature and make their home in tranquil Moonglade.",
        },
        [749] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Molten Core",
                },
            },
            summary = "These elementals have made their home on the islands east of Azshara.  Sworn enemies of the armies of Ragnaros.",
        },
        [909] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Darkmoon Island",
                },
            },
            summary = "A carnival that showcases the weird and the extraordinary, located on a mysterious island only accessible for the first week of every month.",
        },
        [910] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Temple of Ahn'Qiraj",
                },
                {
                    kind = "Raid",
                    title = "Ruins of Ahn'Qiraj",
                },
            },
            summary = "The descendants of the Bronze Dragonflight are the guardians of time and care little for the mortal races.",
        },
        [930] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "The Exodar",
                },
                {
                    kind = "Zone/City",
                    title = "Azuremyst Isle",
                },
                {
                    kind = "Zone/City",
                    title = "Bloodmyst Isle",
                },
            },
            summary = "The naaru vessel that brought the draenei to Azeroth.  Though stranded in the Azuremyst Isles, it acts as a home city for this noble race.",
        },
        [932] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Aldor-tasks in Shattrath",
                },
            },
            summary = "An ancient order of draenei priests once run by Velen, the Aldor are currently led by High Priestess Ishanah.  They are servants of the naaru in Shattrath City known as the Sha'tar.  Rivals of the Scryers.",
        },
        [933] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Netherstorm",
                },
                {
                    kind = "Hub",
                    title = "Area 52",
                },
            },
            summary = "Led by Nexus-Prince Haramad, the Consortium is a loosely affiliated cartel of ethereal smugglers, traders and thieves that has come to Outland to benefit from its riches.",
        },
        [934] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Scryer tasks in Shattrath",
                },
            },
            summary = "Voren'thal the Seer leads the dissident blood elves who've rejected Kael'thas' path to power.  They've joined forces with the naaru of Shattrath City, much to the dismay of the Aldor.",
        },
        [935] = {
            activities = {
                {
                    kind = "City/Instances",
                    title = "Shattrath and temple tasks",
                },
            },
            summary = "The Sha'tar are a group of powerful naaru who rule over a rebuilt Shattrath City.  With the help of the Aldor and the Scryers, they lead the battle against Illidan and the Burning Legion.",
        },
        [941] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Nagrand",
                },
                {
                    kind = "Hub",
                    title = "Garadar",
                },
            },
            summary = "This reclusive group of brown-skinned orcs has escaped any form of demonic corruption.  They have retained their traditional way of life in the face of great changes in Outland.",
        },
        [942] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zangarmarschen",
                },
                {
                    kind = "Hub",
                    title = "Cenarionszuflucht",
                },
            },
            summary = "An exploratory force sent to Outland by the Cenarion Circle to study surviving life forms.  The Cenarion Expedition has quickly gained in size and autonomy since the opening of the Dark Portal.",
        },
        [946] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Hellfire Peninsula",
                },
                {
                    kind = "Hub",
                    title = "Honor Hold",
                },
            },
            summary = "Vestiges of the Sons of Lothar, veterans of the Alliance that first came into Draenor, have steadfastly held on to this Hellfire outpost.  They are now joined by the armies from Stormwind and Ironforge.",
        },
        [947] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Hellfire Peninsula",
                },
                {
                    kind = "Dungeon",
                    title = "The Shattered Halls",
                },
            },
            summary = "The expedition sent through the Dark Portal by Thrall has built a stronghold in Hellfire Peninsula.  Thrallmar serves as a base of operations for much of the Horde's activities in Outland.",
        },
        [967] = {
            summary = "A secret sect of the Kirin Tor founded to spy on Medivh and his activities.",
        },
        [970] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zangarmarschen",
                },
                {
                    kind = "Hub",
                    title = "Sporeggar",
                },
            },
            summary = "The sporelings are a mostly peaceful race of mushroom-men native to Outland. Their home is located in the southern bogs of Zangarmarsh.",
        },
        [978] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Nagrand",
                },
                {
                    kind = "Hub",
                    title = "Telaar",
                },
            },
            summary = "Draenei for \"redeemed.\"  These Broken have escaped the grasp of their various slavers in Outland and have made their home in Nagrand.  It is there that they seek to rediscover their destiny.",
        },
        [989] = {
            activities = {
                {
                    kind = "Dungeon",
                    title = "Old Hillsbrad Foothills",
                },
                {
                    kind = "Dungeon",
                    title = "The Black Morass",
                },
            },
            summary = "The Keepers of Time are bronze dragons hand-picked by Nozdormu to watch over the Caverns of Time.",
        },
        [990] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Hyjal Summit",
                },
            },
            summary = "A secretive subgroup of the Bronze Dragonflight, led by Soridormi, prime mate of Nozdormu.",
        },
        [1011] = {
            activities = {
                {
                    kind = "City faction",
                    title = "Lower City tasks",
                },
            },
            summary = "The refugees of Shattrath come from diverse backgrounds and races.  Word of helpful deeds spreads quickly among the Denizens of Lower City.",
        },
        [1012] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenmondtal",
                },
                {
                    kind = "Raid",
                    title = "Black Temple",
                },
            },
            summary = "The elite of the Broken tribe known as the Ashtongue, officially aligned with Illidan. The Deathsworn are Akama's most trusted lieutenants and are privy to their leader's mysterious motivations.",
        },
        [1015] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenmondtal",
                },
                {
                    kind = "Hub",
                    title = "Netherwing Ledge",
                },
            },
            summary = "This unusual brood of dragons was spawned from the eggs of Deathwing's black dragonflight, and infused with raw nether-energies.  Now, they seek to find their identity beyond the shadows of their father's destructive heritage.",
        },
        [1031] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schergrat",
                },
                {
                    kind = "Daily/Repeatable",
                    title = "Skyguard-tasks",
                },
            },
            summary = "An airborne military force created by Shattrath City to deal with the threats that loom in the highest reaches of Outland.",
        },
        [1038] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schergrat",
                },
                {
                    kind = "Hub",
                    title = "Ogri'la",
                },
            },
            summary = "The enlightened denizens of Ogri'la have made their dwelling in the western Blade's Edge Mountains, where proximity to apexis crystals has caused them to transcend their brutish ogre nature.",
        },
        [1067] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Howling Fjord",
                },
            },
            summary = "The Forsaken tasked by Sylvanas Windrunner with enacting Undercity's vengeance against Arthas by delivering the latest strain of their deadly Plague.",
        },
        [1068] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Howling Fjord",
                },
            },
            summary = "This organization seeks to find the origin of the dwarven race by collecting Titan artifacts.  Their most recent research has led them to various archeological sites in Northrend.",
        },
        [1073] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Borean Tundra",
                },
            },
            summary = "The tuskarr are a tough but peaceful people who derive their livelihood from fishing and whaling.  Their settlements have recently come under fierce attack and welcome any allies who would come to their aid.",
        },
        [1077] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of Quel'Danas",
                },
                {
                    kind = "Daily",
                    title = "Quel'Danas dailies",
                },
            },
            summary = "Shattrath City's final push against Prince Kael'thas' operations in the Sunwell.",
        },
        [1090] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Dalaran city activities",
                },
                {
                    kind = "Dungeon",
                    title = "Northrend-Dungeons mit Dalaran-Bezug",
                },
            },
            summary = "The mages and archmages running the city of Dalaran.  Faced with the rising threats of the Blue Dragonflight and the Scourge, they've transported their city to the heart of Northrend.",
        },
        [1091] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Dragonblight",
                },
            },
            summary = "With the Blue Dragonflight's violent upheaval against all mortal users of magic, the remaining dragonflights have banded under the leadership of the Red Dragonflight to combat their wayward kin.",
        },
        [1098] = {
            activities = {
                {
                    kind = "Dungeon",
                    title = "Halls of Lightning",
                },
                {
                    kind = "Raid",
                    title = "Ulduar",
                },
            },
            summary = "Freed from the grasp of the Lich King, his former Death Knights have regrouped against him under the banner of Highlord Darion Mograine.",
        },
        [1104] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Sholazar Basin",
                },
            },
            summary = "Driven from their lands by the Scourge, this fierce tribe of wolvar stumbled upon Sholazar Basin, where they intend to make their new home.  Their aggressive nature has put them at odds with the various gorloc tribes known collectively as the Oracles.",
        },
        [1105] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Zul'Drak",
                },
                {
                    kind = "Dungeon",
                    title = "Gandrak",
                },
            },
            summary = "The gorlocs of Sholazar Basin are a race of reptilian creatures who see themselves as guardians of the titan technology that remains in the zone (though they understand little of it).  They find themselves in an escalating territorial war with the wolvar.",
        },
        [1106] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Argent Crusade",
                },
                {
                    kind = "Story/Zone",
                    title = "Questlines in Icecrown",
                },
            },
            summary = "Led by Tirion Fordring, the Argent Crusade combines the reformed Order of the Silver Hand with the Argent Dawn in one final push against the forces of the Lich King.",
        },
        [1119] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "K3 and Storm Peaks questlines",
                },
            },
            summary = "The frost giants of the Storm Peaks are a war-like race that makes their home in Dun Niffelem.",
        },
        [1124] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Vault of Archavon",
                },
            },
            summary = "Traditionally barred from Dalaran, the Horde has been accepted into the city through the efforts of Archmage Aethas Sunreaver.  His followers have taken up his name and watch over the ward known as Sunreaver's Sanctuary.",
        },
        [1126] = {
            activities = {
                {
                    kind = "Zone",
                    title = "The Storm Peaks",
                },
            },
            summary = "This mysterious race of frost dwarves makes their home in the Storm Peaks.  They've recently befriended members of the Explorers' League and welcome Alliance members within their settlements.",
        },
        [1133] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Azshara",
                },
            },
            summary = "Run by the ruthless Trade Prince Gallywix, the Bilgewater Cartel is the most powerful trading company on the Isle of Kezan. From their headquarters at Bilgewater Port, the cartel dominates trade all over the South Seas.",
        },
        [1134] = {
            activities = {
                {
                    kind = "Zone/City",
                    title = "Gilneas",
                },
            },
            summary = "The people of Gilneas are a nation of survivors.  Having walled themselves off from the rest of humanity, they must now face new threats from within.",
        },
        [1156] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Icecrown Citadel",
                },
            },
            summary = "Under a pact by Tirion Fordring and Darion Mograine, the Argent Crusade and the Knights of the Ebon Blade have set aside their differences during the attack on Icecrown Citadel until the Lich King is slain.",
        },
        [1158] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Hyjal",
                },
            },
            summary = "Faced with the impending devastation of Mount Hyjal, the most powerful members of the Cenarion Circle have joined forces with their Emerald Dragonflight allies to fend off Ragnaros' elemental hordes and the Twilight's Hammer.",
        },
        [1171] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tiefenheim",
                },
            },
            summary = "The elemental plane of earth, Deepholm, is ruled by Therazane and her children, the Stone Lords.  After witnessing the devastation Deathwing and his followers caused her realm, Therazane treats all outsiders with open hostility.",
        },
        [1172] = {
            summary = "This wayward orc clan was once empowered by Deathwing himself to enslave red dragons, including Alexstrasza.  Currently less numerous and powerful, the Dragonmaw make their home in the Twilight Highlands.",
        },
        [1173] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Uldum",
                },
            },
            summary = "The cat-like people of Ramkahen are the descendants of the Tol'vir, guardians of Uldum.  Though they've lost their stone bodies, protecting the secrets of the titans is still a part of their rigid tradition.",
        },
        [1174] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenhochland",
                },
            },
            summary = "The Wildhammer dwarves are known for their near-reckless courage as well as their unsurpassed gryphon-riding skills.  After losing their home of Grim Batol to a Dark Iron Curse, they've spread their dwellings around the Twilight Highlands.",
        },
        [1177] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tol Barad",
                },
                {
                    kind = "Zone",
                    title = "Halbinsel von Tol Barad",
                },
            },
            summary = "Once led by Duke Reginald Baradin II, this fierce army has historic ties to the island stronghold of Tol Barad.  They have joined the forces of the Alliance in an effort to repeal the Horde invaders and gain control of this strategic island.",
        },
        [1178] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tol Barad",
                },
                {
                    kind = "Zone",
                    title = "Halbinsel von Tol Barad",
                },
            },
            summary = "Hellscream's Reach is an elite Horde regiment comprised solely of veterans of multiple tours of duty.   Handpicked by Garrosh himself, he has commanded them to take complete control of Tol Barad.  Failure is not an option.",
        },
        [1204] = {
            summary = "Infuriated by the destruction wrought by the Lord of Flame, the Cenarion Circle seize the initiative, fighting back against Ragnaros and driving deep into the very heart of the Firelands.",
        },
        [1269] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Vale of Eternal Blossoms",
                },
                {
                    kind = "Dungeon",
                    title = "Mogu'shan Palace",
                },
            },
            summary = "This mysterious society of Pandaren intend to solve the Mogu problem once and for all.",
        },
        [1270] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in the Jade Forest",
                },
                {
                    kind = "Dungeon",
                    title = "Shado-Pan Monastery",
                },
            },
            summary = "The shadowy protectors of Pandaria's temples, the Shado-Pan are wrought with mystery.",
        },
        [1271] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Dread Wastes",
                },
                {
                    kind = "Raid",
                    title = "Heart of Fear",
                },
            },
            summary = "Guardians of the East Temple",
        },
        [1272] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Valley of the Four Winds",
                },
                {
                    kind = "Hub",
                    title = "Halbhuegel",
                },
            },
            summary = "The Tillers are peaceful and productive pandaren, working with the land to feed the massive appetites of their people.",
        },
        [1302] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Questlines in Krasarang Wilds",
                },
            },
            summary = "The Anglers are a group of Pandaren fisherman that hope to feed their people and grow their knowledge of fishing.",
        },
        [1337] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Dread Wastes",
                },
                {
                    kind = "Hub",
                    title = "Klaxxi'vess",
                },
                {
                    kind = "Raid",
                    title = "Heart of Fear",
                },
            },
            summary = "These Mantid Elders are untouched by the corruption and insanity that has overtaken the remainder of the Mantid Swarm. They seek to work with the races of Pandaria to restore their Queen to glory.",
        },
        [1359] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Vale of Eternal Blossoms",
                },
                {
                    kind = "Story",
                    title = "Wrathion-Endgame",
                },
            },
            summary = "Black Prince Wrathion is the last of the black dragons. He has been known to richly reward those who earn his trust and support his endeavors.",
        },
        [1375] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Shrine of Two Moons",
                },
            },
            summary = "Horde forces in Pandaria, stationed at Domination Point in Krasarang Wilds.",
        },
        [1376] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Shrine of Seven Stars",
                },
            },
            summary = "Alliance forces in Pandaria, stationed at Lion's Landing in Krasarang Wilds.",
        },
        [1387] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of Thunder",
                },
            },
            summary = "Ignited by Jaina's fury, the Kirin Tor Offensive seek to seize Thunder Isle for the glory of the Alliance!",
        },
        [1388] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of Thunder",
                },
            },
            summary = "Outcast from Dalaran, the Sunreaver Onslaught fight to obtain powerful mogu artifacts from among the ruins of Thunder Isle, and to secure their future if the Horde falls to anarchy.",
        },
        [1416] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Schattenmondtal",
                },
                {
                    kind = "Raid",
                    title = "Black Temple",
                },
            },
            summary = "Akama is distrustful of Warlocks after witnessing Illidan's fall to his own corruption, followed by the invasion of the Black Temple by Warlocks after the Cataclysm.",
        },
        [1435] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Isle of the Thunder King",
                },
                {
                    kind = "Raid",
                    title = "Throne of Thander",
                },
            },
            summary = "These valorous Shado-Pan venture into the Throne of Thunder to vanquish the evil found within, and exact justice for the centuries of slavery they endured under the Thunder King's reign.",
        },
        [1445] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Frostfeuergrat",
                },
                {
                    kind = "Hub",
                    title = "War Mill",
                },
            },
            summary = "The Frostwolf orcs of Frostfire Ridge are a tight-knit family of brutal warriors, well equipped to deal with the savage realities of Draenor.",
        },
        [1492] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zeitlose Insel",
                },
                {
                    kind = "Raid",
                    title = "Siege of Orgrimmar",
                },
            },
            summary = "Shaohao, the long lost Emperor of the Pandaren people, is a personage worthy of deep respect.",
        },
        [1515] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Spires of Arak",
                },
            },
            summary = "Working from the shadows, the Arakkoa Outcasts seek to bring a brighter tomorrow.",
        },
        [1710] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Moonfall",
                },
                {
                    kind = "Hub",
                    title = "Outpost of the Awakened",
                },
            },
            summary = "The defenders of Shattrath struggle to regain control of their capital city, having been betrayed from within.",
        },
        [1711] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Gorgrond",
                },
                {
                    kind = "Dungeon",
                    title = "Grimrail Depot",
                },
            },
            summary = "The goblins of the Steamwheedle Preservation Society seek to liberate relics from the ogres of Nagrand with the noble intention of selling them to the highest bidder.",
        },
        [1731] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Nagrand",
                },
                {
                    kind = "Dungeon",
                    title = "Shadowmoon Burial Groands",
                },
            },
            summary = "Under the leadership of five powerful exarchs, the draenei of Draenor have prospered in a savage world.",
        },
        [1828] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Highmountain",
                },
                {
                    kind = "Dungeon",
                    title = "Neltharion's Lair",
                },
            },
            summary = "The Highmountain Tribe has dwindled in numbers over the years, and with the drogbar threat looming, seek new allies to save their homeland.",
        },
        [1847] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Warspear",
                },
            },
            summary = "Yrel has assembled the remaining Exarchs and is calling for a crusade in Velen's name. Together they are working to establish a foothold in Tanaan Jungle and to overthrow Gul'dan.",
        },
        [1848] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tanaan-Dschungel",
                },
                {
                    kind = "Raid",
                    title = "Hellfire Citadel",
                },
            },
            summary = "Seeking to protect Azeroth with a decisive victory on Draenor, Warchief Vol'jin is assembling an elite team of champions to establish a foothold in Tanaan Jungle and to overthrow Gul'dan.",
        },
        [1849] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Stormshield",
                },
            },
            summary = "Survivors of a grisly civil war, these beleaguered arakkoans hope the reclamation of apexis artifacts will hold the key to peacefully rebuilding their civilization.",
        },
        [1850] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Spires of Arak",
                },
                {
                    kind = "Dungeon",
                    title = "Auchindoun",
                },
            },
            summary = "The treacherous wilds of Tanaan Jungle have attracted the craftiest hunters from both Azeroth and Draenor. To defeat the beasts of Tanaan, one must become a beast.",
        },
        [1859] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Suramar-Kampagne",
                },
                {
                    kind = "Hub",
                    title = "Shal'Aran",
                },
            },
            summary = "These exiled Nightborne elves suffer withdrawals after being cut off from the Nightwell. They oppose their people's alliance with the Legion and fight for some kind of redemption.",
        },
        [1883] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Legion-Dalaran",
                },
                {
                    kind = "Hub",
                    title = "Krasus' Landing",
                },
            },
            summary = "The druids and their allies in Val'sharah have guarded the Emerald Dream since time immemorial.",
        },
        [1894] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Broken Shore",
                },
                {
                    kind = "Raid",
                    title = "Tomb of Sargeras",
                },
            },
            summary = "After Legion forces broke the Vault of the Wardens with the aid of Gul'dan, what few Wardens remain are determined to rebuild their prison and hunt down the terrifying beasts that were let loose when it fell.",
        },
        [1900] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Azsuna",
                },
                {
                    kind = "Dungeon",
                    title = "Eye of Azshara",
                },
            },
            summary = "The ghostly Court of Farondis and its allies continue the fight against an onslaught of invaders on the cursed island of Azsuna.",
        },
        [1948] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Sturmheim",
                },
                {
                    kind = "Hub",
                    title = "Haimont",
                },
            },
            summary = "These are the chosen warriors of Odyn, sworn to his service in life and death.",
        },
        [2045] = {
            activities = {
                {
                    kind = "Dungeon",
                    title = "Vault of the Wardens",
                },
            },
            summary = "The coalition of orders dedicated to defeating the Legion at the Tomb of Sargeras and Broken Shore.",
        },
        [2135] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Time Rifts",
                },
                {
                    kind = "Zone",
                    title = "Temporal side activities",
                },
            },
            summary = "Chronormu (Chromie for short) has always been one of the more active, approachable bronze dragons. Strengthening your bond with her will increase her power in the Deaths of Chromie scenario.",
        },
        [2157] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zuldazar",
                },
                {
                    kind = "Hub",
                    title = "Dazar'alor",
                },
            },
            summary = "A special delegation of the Horde army, focused on disrupting Alliance operations in Kul Tiras.",
        },
        [2158] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Vol'dun",
                },
            },
            summary = "Comprised of exiles and scavengers, the Voldunai use their knowledge of the sands to thrive where others would wither and die.",
        },
        [2160] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Tiragardesand",
                },
                {
                    kind = "Hub",
                    title = "Boralus",
                },
            },
            summary = "Masters of the sea and commanders of Azeroth's finest navy, the distinguished Proudmoore family has led Kul Tiras for decades from their seat of power in Boralus.",
        },
        [2161] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Drustvar",
                },
                {
                    kind = "Dungeon",
                    title = "Waycrest Manor",
                },
            },
            summary = "An ancient Kul Tiran order resurrected to battle the threat of witchcraft, the Order of Embers fights with knowledge guiding their blades.",
        },
        [2162] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Stormsong Valley",
                },
                {
                    kind = "Dungeon",
                    title = "Shrine of the Storm",
                },
            },
            summary = "Home to farmers, craftsmen, soldiers, and the mysterious tidesages, the Storm's Wake seeks to reclaim Stormsong Valley and affirm their place in Kul Tiras.",
        },
        [2165] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Krokuun",
                },
                {
                    kind = "Zone",
                    title = "Argus activities",
                },
            },
            summary = "After the fall of Argus, the draenei's finest warriors followed the prime naaru Xe'ra across the cosmos in an eternal war to bring about the Legion's end. Since then, other survivors of the Burning Crusade have joined the ranks of the Lightforged.",
        },
        [2170] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Argus activities",
                },
                {
                    kind = "Raid",
                    title = "Antorus, the Burning Throne",
                },
            },
            summary = "Although many struggled to oppose the Burning Legion's conquest of Argus, not all were able to escape. Emboldened by the arrival of new allies, these refugees and outcasts stand united in their mission to reclaim their home.",
        },
        [2370] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Neueheim",
                },
                {
                    kind = "Zone",
                    title = "Nazjatar",
                },
            },
            summary = "Retail content for this faction is centered on Neueheim and Nazjatar.",
        },
        [2373] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Mezzamere",
                },
                {
                    kind = "Zone",
                    title = "Nazjatar",
                },
            },
            summary = "Oppressed by the Naga, these refugees have banded together to rise up and seize their freedom.",
        },
        [2391] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Mechagon",
                },
                {
                    kind = "Hub",
                    title = "Rostbolzen",
                },
            },
            summary = "The Rustbolt Resistance holds the line against King Mechagon and his evil plans.",
        },
        [2395] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Sturmsangtal side content",
                },
            },
            summary = "A species of bee known for their unusual size. While newcomers to Stormsong Valley, they quickly made their presence known to adventurers and insect enthusiasts alike.",
        },
        [2407] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Bastion",
                },
                {
                    kind = "Dungeon",
                    title = "Spires of Ascension",
                },
            },
            summary = "Kyrian who complete the arduous process of purging their mortal encumbrances are deemed worthy of the rite of ascension, earning their wings and pledging eternal service to the Archon.",
        },
        [2410] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Maldraxxus",
                },
                {
                    kind = "Dungeon",
                    title = "Theater of Pain",
                },
            },
            summary = "Long ago, the Primus established the five houses of Maldraxxus to build the ultimate fighting force. Through might, cleverness, and guile, this unyielding armada is pledged to defend the Shadowlands against all threats.",
        },
        [2413] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Revendreth",
                },
                {
                    kind = "Dungeon",
                    title = "Halls of Atonement",
                },
            },
            summary = "After countless ages spent under the rule of Sire Denathrius, authority in Revendreth is now shared amongst the Court of Harvesters. These noble venthyr carry out the sacred duty of redeeming prideful souls.",
        },
        [2415] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Ny'alotha, the Waking City",
                },
            },
            summary = "A group of mogu loyal to the titan keeper Ra, they are charged with defending the Engine of Nalak'sha from N'Zoth's minions.",
        },
        [2417] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Uldum",
                },
            },
            summary = "A loose coalition of allies headed by the Tol'vir, the Uldum Accord was founded to protect the Forge of Origination from enemy forces.",
        },
        [2432] = {
            activities = {
                {
                    kind = "Zone",
                    title = "The Maw",
                },
                {
                    kind = "Hub",
                    title = "Ve'naris Zuflucht",
                },
            },
            summary = "Ve'nari knows more about the Maw than anyone, and she might share a fraction of that information with you if you earn her regard.",
        },
        [2439] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Absolution Crypt",
                },
            },
            summary = "Fiercely devoted to the Accuser, these archivists seek to restore and catalog the sinstones fragmented by the Lord Chamberlain and his Inquisitor allies.",
        },
        [2464] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Ardenweald",
                },
                {
                    kind = "Dungeon",
                    title = "Mists of Tirna Scithe",
                },
            },
            summary = "The anima drought and Drust invasion consume the Winter Queen and Wild Hunt's attention, leaving the droman of the Court of Night to protect the wildseeds and defend their groves.",
        },
        [2465] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Ardenweald",
                },
            },
            summary = "Called to serve the Winter Queen in times of dire need, the Wild Hunt assembles the finest huntresses and hunters in all of Ardenweald. In the face of drought and peril, the Wild Hunt stands ready to defend the forest.",
        },
        [2470] = {
            activities = {
                {
                    kind = "Raid",
                    title = "Sanctum of Domination",
                },
            },
            summary = "The combined might of the Shadowlands covenants, brought forth to breach the Sanctum of Domination.",
        },
        [2472] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Korthia",
                },
                {
                    kind = "Hub",
                    title = "Keeper's Respite",
                },
                {
                    kind = "Recurring",
                    title = "Relic research",
                },
            },
            summary = "Korthian attendants have committed their existence to researching relics from across the Shadowlands. Led by their Archivist, they are dedicated to recovering the relics scattered across Korthia in the wake of the mawsworn invasion.",
        },
        [2478] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Zereth Mortis",
                },
                {
                    kind = "Hub",
                    title = "Haven",
                },
            },
            summary = "Once members of Cartel Al, the Enlightened have abandoned the pursuit of profit and glory out of devotion to the First Ones. By earning their favor, the brokers may be willing to share the knowledge they have gleaned.",
        },
        [2503] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Grand Hunt",
                },
                {
                    kind = "Zone",
                    title = "Ohn'ahran Plains",
                },
            },
            summary = "Centaur clans roam the Ohn'ahran Plains, where they follow the call of the wind and seek the thrill of the hunt.",
        },
        [2507] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Siege on Dragonbane Keep",
                },
                {
                    kind = "Zone",
                    title = "The Waking Shores",
                },
            },
            summary = "A joint expedition of the Explorers' League and Reliquary, this fearless group of adventurers, scholars, and crafters seek to uncover the many mysteries of the Dragon Isles.",
        },
        [2510] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Valdrakken",
                },
                {
                    kind = "Zone",
                    title = "Thaldraszus",
                },
            },
            summary = "Centered in their most ancient city, the Valdrakken Accord is the unified might of all dragonkind, seeking to protect not only their island home but all of Azeroth.",
        },
        [2511] = {
            activities = {
                {
                    kind = "Weekly/Event",
                    title = "Community Feast",
                },
                {
                    kind = "Zone",
                    title = "The Azure Span",
                },
            },
            summary = "The Iskaara Tuskarr have been on the Dragon Isles for generations, living in harmony and telling tales of the world around them.",
        },
        [2517] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Waking Shores black dragonflight content",
                },
            },
            summary = "Long focused on protecting Azeroth, Wrathion's gaze has now turned to the future of the black dragonflight... and his destiny.",
        },
        [2518] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Waking Shores black dragonflight content",
                },
            },
            summary = "Sabellian has established a new generation of uncorrupt black dragons, and works to protect it at all costs.",
        },
        [2523] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Obsidian side content",
                },
            },
            summary = "Led by the brave Scalecommander Cindrethresh, the Dark Talons were trained to be the secret weapon of the black dragonflight. Today, these dracthyr use their skills to turn the tide of any battle regardless of how outnumbered they are.",
        },
        [2524] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Obsidian side content",
                },
            },
            summary = "Led by the stalwart Scalecommander Azurathel, the Obsidian Warders were trained to be the shield of the black dragonflight. Today these dracthyr use those skills to defend those most in need against overwhelming odds.",
        },
        [2526] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Azure Span side quests",
                },
            },
            summary = "The Winterpelt Furbolg speak a language no one seems to understand. Perhaps more will be revealed in the future.",
        },
        [2544] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Valdrakken professions hub",
                },
            },
            summary = "Retail content for this faction is centered on Valdrakken professions hub.",
        },
        [2550] = {
            activities = {
                {
                    kind = "Zone",
                    title = "Azure Span side content",
                },
            },
            summary = "The Cobalt Assembly was once a place where blue dragons would conjure marvelous creations with arcane magic. Now it has fallen into the hands of the Sundered Flame who intend to use its magic for war.",
        },
        [2553] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "When Time Needs Mending",
                },
            },
            summary = "Soridormi's timewalkers travel the timeways and defend our world against limitless alternatives. When our timeline is under temporal assault or falling apart, Soridormi is the commander who holds everything together.",
        },
        [2564] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Loamm",
                },
                {
                    kind = "Weekly",
                    title = "Sniffenseeking",
                },
                {
                    kind = "Zone",
                    title = "Zaralek world content",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Mimuup",
                },
            },
            summary = "Underneath the Dragon Isles, deep in Zaralek Cavern, lies the niffen town of Loamm. The friendly traders there are renowned for their hospitality, sense of smell, and peculiar bartering trade system.",
        },
        [2570] = {
            activities = {
                {
                    kind = "Weekly/Event",
                    title = "Spreading the Light",
                },
                {
                    kind = "World quests",
                    title = "World quests in Hallowfall",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Auralia Steelstrike",
                },
            },
            summary = "The Arathi of the Hallowfall Expedition safeguard the star Beledar from the many threats found under Khaz Algar. Cut off from their overseas empire, they have built a new home with the strength of their faith in the Sacred Flame.",
        },
        [2574] = {
            activities = {
                {
                    kind = "Hub",
                    title = "Central Encampment",
                },
                {
                    kind = "Zone",
                    title = "Emerald Dream world content",
                },
                {
                    kind = "Story",
                    title = "Story chapters in the Dream",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Pipsee",
                },
            },
            summary = "A coalition of various races ready to defend the Emerald Dream against any and all threats.",
        },
        [2590] = {
            activities = {
                {
                    kind = "World quests",
                    title = "World quests on the Isle of Dorn",
                },
                {
                    kind = "One-time/Warband",
                    title = "Story and side chapters in Dornogal",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Auditor Balwurz",
                },
            },
            summary = "Ruling from the Foundation Hall under the leadership of Councilward Merrix, the Council of Dornogal makes decisions affecting all earthen in the Isle of Dorn.",
        },
        [2594] = {
            activities = {
                {
                    kind = "World quests",
                    title = "World quests in The Ringing Deeps",
                },
                {
                    kind = "One-time/Warband",
                    title = "Story and side chapters in Gundargaz",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Waxmonger Squick",
                },
            },
            summary = "Throughout the Ringing Deeps, neglected machinery awaits repair. While Machine Speakers lend their technological acumen, kobolds scavenge parts left behind. Anyone wanting to explore and rebuild is welcome to help.",
        },
        [2600] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Weekly pact",
                },
                {
                    kind = "World quests",
                    title = "World quests in Azj-Kahet",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Y'tekhi",
                },
            },
            summary = "Queen Ansurek's tumultuous reign has not been without its detractors. The Severed Threads work cleverly and quietly behind the scenes to unravel the tapestry of Ansurek's iron rule from within.",
        },
        [2601] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pact of the Weaver",
                },
            },
            summary = "Once the Royal Weaver, the Widow Arak'nai now carefully watches her former home with a critical eye. With a network of weave-rats and spies at her disposal, there is little that escapes her notice.",
        },
        [2605] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pact of the General",
                },
            },
            summary = "Once the most renowned military leader in Azj-Kahet, Anub'azal has been passed over in favor of one of Ansurek's beloved Ascended. This simply will not stand.",
        },
        [2607] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Pact of the Vizier",
                },
            },
            summary = "Perched in the most dangerous position of all, Executor Nizrek spends his days as Queen Ansurek's most loyal advisor. Fortunately, Ansurek has yet to discover that the rest of his time is spent trying to end her reign.",
        },
        [2615] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Azerothian Archives",
                },
                {
                    kind = "Zone",
                    title = "Archive activities in Tyrhold",
                },
            },
            summary = "A charter group of scholars from the Dragonscale Expedition dedicated to the preservation of the antiquities for future generations.",
        },
        [2653] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Weekly cartel contract",
                },
                {
                    kind = "Weekly",
                    title = "C.H.E.T.T.-Liste",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Smaks Topskimmer",
                },
            },
            summary = "Undermine isn't like other towns. There are no kings or chiefs, just cartels. Everyone wants to be part of the cartels. It's even better than being a king, because you can only have one king. But Undermine's got a lot of cartels, and they all need a pal.",
        },
        [2658] = {
            activities = {
                {
                    kind = "Story",
                    title = "K'aresh campaign",
                },
                {
                    kind = "Zone",
                    title = "K'aresh world content",
                },
            },
            summary = "A coalition of cartels from brokers and ethereals formed with an impossible goal. To save a facet of their destroyed world from the All-Devouring.",
        },
        [2671] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Venture Company",
                },
            },
            summary = "Venture Company doesn't have the best rep in town, but no one harvests, mines, or drills faster. You want nice? Find a book club. You want raw material? Venture's got you covered.",
        },
        [2673] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Bilgewasserkartell",
                },
            },
            summary = "The Bilgewater Cartel has had more ups and downs than most, but no one can build and invent like they can. From cities to pool toys to [CLASSIFIED], Bilgewater builds it best.",
        },
        [2675] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Schwarzmeer AG",
                },
            },
            summary = "Blackwater Cartel is new to the cart, formerly plying the seas as pirates. But they are already making waves with shipping and luxury vacations. They can move any cargo, anywhere, any time, and now it's all nice and legal.",
        },
        [2677] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Dampfdruckkartell",
                },
            },
            summary = "Steamwheedle may be the oldest and largest cartel in Undermine. They have had their hands in almost every industry and their reach spans Azeroth and beyond. These days, with the rise of Noggenfogger, it's the alchemy that they are known for.",
        },
        [2685] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Kartellwahl: Garbagio Treueclub",
                },
            },
            summary = "The Gallagio is under new management, well it will be. And when it is, you want to be on their good side right? So, make the Gallagio a better place and make some new friends.",
        },
        [2688] = {
            activities = {
                {
                    kind = "Zone/Event",
                    title = "Hallowfall defense activities",
                },
                {
                    kind = "Recurring",
                    title = "Mereldar call to arms",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Raen Dawncavalyr",
                },
            },
            summary = "When Hallowfall comes under threat and the army stretched thin, a call to arms is issued to those with the strength to wield a weapon and Flame's Radiance is formed. All allies are welcome to join in Hallowfall's defense.",
        },
        [2696] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Zul'Aman-Kampagne",
                },
                {
                    kind = "Zone",
                    title = "Local tasks in the Amani area",
                },
            },
            summary = "The Amani conquered and claimed the majority of Eastern Kingdoms for thousands of years, but were forced back into current-day Zul'Aman once the elves and humans colonized the land themselves.",
        },
        [2699] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Leerensturm-Kampagne",
                },
                {
                    kind = "Zone",
                    title = "Local tasks in Voidstorm",
                },
            },
            summary = "In the vortex of terror and violence that is the Voidstorm, few have the mettle to survive. The Singularity, gathered by Magister Umbric and the ren'dorei, encompasses any who would brave this fearsome land to stand up to Xal'atath.",
        },
        [2704] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Harandar-Kampagne",
                },
                {
                    kind = "Zone",
                    title = "Local tasks in Harandar",
                },
            },
            summary = "Called to Harandar by the echo of their Goddess' song, the Hara'ti watch over her cradle in hopes that she may one day return.",
        },
        [2710] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Magister",
                    name = "Lehrling Diell",
                },
                {
                    label = "Blood Knight",
                    name = "Armorsmith Goldcrest",
                },
                {
                    label = "Lane Warden",
                    name = "Neriv",
                },
                {
                    label = "Wayfarer",
                    name = "Ranger Allorn",
                },
            },
            summary = "Through elegance, intellect, and political precision, the Court ensures that Silvermoon City's light shines eternally radiant, and distinctly its own.",
        },
        [2711] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Lehrling Diell",
                },
            },
            summary = "Scholars, arcanists, and politicians of Silvermoon City, with intellects sharpened by hundreds of years of study.",
        },
        [2712] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Armorsmith Goldcrest",
                },
            },
            summary = "Silvermoon City's elves-at-arms. Stalwart heroes and chosen champions of the sun, they follow Lady Liadrin into battle to smite the foes of the Sin'dorei.",
        },
        [2713] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Ranger Allorn",
                },
            },
            summary = "Elite rangers of the Sin'dorei, formally tasked with guarding the forests, borders, and wildlands of the Eversong Woods.",
        },
        [2714] = {
            activities = {
                {
                    kind = "Weekly",
                    title = "Saltherils Soiree",
                },
            },
            quartermasters = {
                {
                    label = "Quartermaster",
                    name = "Neriv",
                },
            },
            summary = "12.0 Z1 Eversong - Court Friendship Faction",
        },
        [2736] = {
            activities = {
                {
                    kind = "Recurring",
                    title = "Manaforge sabotage operations",
                },
            },
            summary = "While the K'aresh Trust works to unite the people of their dying star, some members prefer a more direct approach. Using all method of covert and under-handed tactics, the Manaforge Vandals seek to dismantle Salhadaar's forces by any means necessary.",
        },
        [2770] = {
            activities = {
                {
                    kind = "Story/Zone",
                    title = "Voidstorm",
                },
                {
                    kind = "Hub",
                    title = "Obskurionzitadelle",
                },
            },
            summary = "Deep within the Voidstorm, the war between Vidious and Ziadan rages on.",
        },
        [9000111] = {
            activities = {
                {
                    kind = "Cluster",
                    title = "Shattrath city factions",
                },
            },
            summary = "Shattrath is modeled as a legacy family cluster in the retail core. It groups Sha'tar, Aldor, Scryers, and Lower City so the city appears as a coherent reputation block instead of unrelated one-off entries.",
        },
    },
})
