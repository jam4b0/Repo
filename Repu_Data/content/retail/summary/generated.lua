local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [21] = {
            confidence = "low",
            source = "seed",
            summary = "This booming coastal city is run by Baron Revilgaz of the Blackwater Raiders.  Mortal enemies of the Bloodsail Buccaneers and part of the Steamwheedle Cartel.",
        },
        [589] = {
            confidence = "low",
            source = "seed",
            summary = "This small group of reclusive night elves raises and trains wintersabers in the Winterspring area.",
        },
        [933] = {
            confidence = "low",
            source = "seed",
            summary = "Led by Nexus-Prince Haramad, the Consortium is a loosely affiliated cartel of ethereal smugglers, traders and thieves that has come to Outland to benefit from its riches.",
        },
        [941] = {
            confidence = "low",
            source = "seed",
            summary = "This reclusive group of brown-skinned orcs has escaped any form of demonic corruption.  They have retained their traditional way of life in the face of great changes in Outland.",
        },
        [942] = {
            confidence = "low",
            source = "seed",
            summary = "An exploratory force sent to Outland by the Cenarion Circle to study surviving life forms.  The Cenarion Expedition has quickly gained in size and autonomy since the opening of the Dark Portal.",
        },
        [947] = {
            confidence = "low",
            source = "seed",
            summary = "The expedition sent through the Dark Portal by Thrall has built a stronghold in Hellfire Peninsula.  Thrallmar serves as a base of operations for much of the Horde's activities in Outland.",
        },
        [967] = {
            confidence = "low",
            source = "seed",
            summary = "A secret sect of the Kirin Tor founded to spy on Medivh and his activities.",
        },
        [978] = {
            confidence = "low",
            source = "seed",
            summary = "Draenei for \"redeemed.\"  These Broken have escaped the grasp of their various slavers in Outland and have made their home in Nagrand.  It is there that they seek to rediscover their destiny.",
        },
        [989] = {
            confidence = "low",
            source = "seed",
            summary = "The Keepers of Time are bronze dragons hand-picked by Nozdormu to watch over the Caverns of Time.",
        },
        [1012] = {
            confidence = "low",
            source = "seed",
            summary = "The elite of the Broken tribe known as the Ashtongue, officially aligned with Illidan. The Deathsworn are Akama's most trusted lieutenants and are privy to their leader's mysterious motivations.",
        },
        [1038] = {
            confidence = "low",
            source = "seed",
            summary = "The enlightened denizens of Ogri'la have made their dwelling in the western Blade's Edge Mountains, where proximity to apexis crystals has caused them to transcend their brutish ogre nature.",
        },
        [1068] = {
            confidence = "low",
            source = "seed",
            summary = "This organization seeks to find the origin of the dwarven race by collecting Titan artifacts.  Their most recent research has led them to various archeological sites in Northrend.",
        },
        [1073] = {
            confidence = "low",
            source = "seed",
            summary = "The tuskarr are a tough but peaceful people who derive their livelihood from fishing and whaling.  Their settlements have recently come under fierce attack and welcome any allies who would come to their aid.",
        },
        [1090] = {
            confidence = "low",
            source = "seed",
            summary = "The mages and archmages running the city of Dalaran.  Faced with the rising threats of the Blue Dragonflight and the Scourge, they've transported their city to the heart of Northrend.",
        },
        [1091] = {
            confidence = "low",
            source = "seed",
            summary = "With the Blue Dragonflight's violent upheaval against all mortal users of magic, the remaining dragonflights have banded under the leadership of the Red Dragonflight to combat their wayward kin.",
        },
        [1098] = {
            confidence = "low",
            source = "seed",
            summary = "Freed from the grasp of the Lich King, his former Death Knights have regrouped against him under the banner of Highlord Darion Mograine.",
        },
        [1104] = {
            confidence = "low",
            source = "seed",
            summary = "Driven from their lands by the Scourge, this fierce tribe of wolvar stumbled upon Sholazar Basin, where they intend to make their new home.  Their aggressive nature has put them at odds with the various gorloc tribes known collectively as the Oracles.",
        },
        [1105] = {
            confidence = "low",
            source = "seed",
            summary = "The gorlocs of Sholazar Basin are a race of reptilian creatures who see themselves as guardians of the titan technology that remains in the zone (though they understand little of it).  They find themselves in an escalating territorial war with the wolvar.",
        },
        [1106] = {
            confidence = "low",
            source = "seed",
            summary = "Led by Tirion Fordring, the Argent Crusade combines the reformed Order of the Silver Hand with the Argent Dawn in one final push against the forces of the Lich King.",
        },
        [1119] = {
            confidence = "low",
            source = "seed",
            summary = "The frost giants of the Storm Peaks are a war-like race that makes their home in Dun Niffelem.",
        },
        [1124] = {
            confidence = "low",
            source = "seed",
            summary = "Traditionally barred from Dalaran, the Horde has been accepted into the city through the efforts of Archmage Aethas Sunreaver.  His followers have taken up his name and watch over the ward known as Sunreaver's Sanctuary.",
        },
        [1156] = {
            confidence = "low",
            source = "seed",
            summary = "Under a pact by Tirion Fordring and Darion Mograine, the Argent Crusade and the Knights of the Ebon Blade have set aside their differences during the attack on Icecrown Citadel until the Lich King is slain.",
        },
        [1172] = {
            confidence = "low",
            source = "seed",
            summary = "This wayward orc clan was once empowered by Deathwing himself to enslave red dragons, including Alexstrasza.  Currently less numerous and powerful, the Dragonmaw make their home in the Twilight Highlands.",
        },
        [1177] = {
            confidence = "low",
            source = "seed",
            summary = "Once led by Duke Reginald Baradin II, this fierce army has historic ties to the island stronghold of Tol Barad.  They have joined the forces of the Alliance in an effort to repeal the Horde invaders and gain control of this strategic island.",
        },
        [1204] = {
            confidence = "low",
            source = "seed",
            summary = "Infuriated by the destruction wrought by the Lord of Flame, the Cenarion Circle seize the initiative, fighting back against Ragnaros and driving deep into the very heart of the Firelands.",
        },
        [1269] = {
            confidence = "low",
            source = "seed",
            summary = "This mysterious society of Pandaren intend to solve the Mogu problem once and for all.",
        },
        [1270] = {
            confidence = "low",
            source = "seed",
            summary = "The shadowy protectors of Pandaria's temples, the Shado-Pan are wrought with mystery.",
        },
        [1271] = {
            confidence = "low",
            source = "seed",
            summary = "Guardians of the East Temple",
        },
        [1272] = {
            confidence = "low",
            source = "seed",
            summary = "The Tillers are peaceful and productive pandaren, working with the land to feed the massive appetites of their people.",
        },
        [1302] = {
            confidence = "low",
            source = "seed",
            summary = "The Anglers are a group of Pandaren fisherman that hope to feed their people and grow their knowledge of fishing.",
        },
        [1375] = {
            confidence = "low",
            source = "seed",
            summary = "Horde forces in Pandaria, stationed at Domination Point in Krasarang Wilds.",
        },
        [1376] = {
            confidence = "low",
            source = "seed",
            summary = "Alliance forces in Pandaria, stationed at Lion's Landing in Krasarang Wilds.",
        },
        [1387] = {
            confidence = "low",
            source = "seed",
            summary = "Ignited by Jaina's fury, the Kirin Tor Offensive seek to seize Thunder Isle for the glory of the Alliance!",
        },
        [1435] = {
            confidence = "low",
            source = "seed",
            summary = "These valorous Shado-Pan venture into the Throne of Thunder to vanquish the evil found within, and exact justice for the centuries of slavery they endured under the Thunder King's reign.",
        },
        [1445] = {
            confidence = "low",
            source = "seed",
            summary = "The Frostwolf orcs of Frostfire Ridge are a tight-knit family of brutal warriors, well equipped to deal with the savage realities of Draenor.",
        },
        [1492] = {
            confidence = "low",
            source = "seed",
            summary = "Shaohao, the long lost Emperor of the Pandaren people, is a personage worthy of deep respect.",
        },
        [1710] = {
            confidence = "low",
            source = "seed",
            summary = "The defenders of Shattrath struggle to regain control of their capital city, having been betrayed from within.",
        },
        [1711] = {
            confidence = "low",
            source = "seed",
            summary = "The goblins of the Steamwheedle Preservation Society seek to liberate relics from the ogres of Nagrand with the noble intention of selling them to the highest bidder.",
        },
        [1731] = {
            confidence = "low",
            source = "seed",
            summary = "Under the leadership of five powerful exarchs, the draenei of Draenor have prospered in a savage world.",
        },
        [1828] = {
            confidence = "low",
            source = "seed",
            summary = "The Highmountain Tribe has dwindled in numbers over the years, and with the drogbar threat looming, seek new allies to save their homeland.",
        },
        [1847] = {
            confidence = "low",
            source = "seed",
            summary = "Yrel has assembled the remaining Exarchs and is calling for a crusade in Velen's name. Together they are working to establish a foothold in Tanaan Jungle and to overthrow Gul'dan.",
        },
        [1848] = {
            confidence = "low",
            source = "seed",
            summary = "Seeking to protect Azeroth with a decisive victory on Draenor, Warchief Vol'jin is assembling an elite team of champions to establish a foothold in Tanaan Jungle and to overthrow Gul'dan.",
        },
        [1849] = {
            confidence = "low",
            source = "seed",
            summary = "Survivors of a grisly civil war, these beleaguered arakkoans hope the reclamation of apexis artifacts will hold the key to peacefully rebuilding their civilization.",
        },
        [1850] = {
            confidence = "low",
            source = "seed",
            summary = "The treacherous wilds of Tanaan Jungle have attracted the craftiest hunters from both Azeroth and Draenor. To defeat the beasts of Tanaan, one must become a beast.",
        },
        [1859] = {
            confidence = "low",
            source = "seed",
            summary = "These exiled Nightborne elves suffer withdrawals after being cut off from the Nightwell. They oppose their people's alliance with the Legion and fight for some kind of redemption.",
        },
        [1883] = {
            confidence = "low",
            source = "seed",
            summary = "The druids and their allies in Val'sharah have guarded the Emerald Dream since time immemorial.",
        },
        [1894] = {
            confidence = "low",
            source = "seed",
            summary = "After Legion forces broke the Vault of the Wardens with the aid of Gul'dan, what few Wardens remain are determined to rebuild their prison and hunt down the terrifying beasts that were let loose when it fell.",
        },
        [1900] = {
            confidence = "low",
            source = "seed",
            summary = "The ghostly Court of Farondis and its allies continue the fight against an onslaught of invaders on the cursed island of Azsuna.",
        },
        [1948] = {
            confidence = "low",
            source = "seed",
            summary = "These are the chosen warriors of Odyn, sworn to his service in life and death.",
        },
        [2045] = {
            confidence = "low",
            source = "seed",
            summary = "The coalition of orders dedicated to defeating the Legion at the Tomb of Sargeras and Broken Shore.",
        },
        [2157] = {
            confidence = "low",
            source = "seed",
            summary = "A special delegation of the Horde army, focused on disrupting Alliance operations in Kul Tiras.",
        },
        [2158] = {
            confidence = "low",
            source = "seed",
            summary = "Comprised of exiles and scavengers, the Voldunai use their knowledge of the sands to thrive where others would wither and die.",
        },
        [2160] = {
            confidence = "low",
            source = "seed",
            summary = "Masters of the sea and commanders of Azeroth's finest navy, the distinguished Proudmoore family has led Kul Tiras for decades from their seat of power in Boralus.",
        },
        [2161] = {
            confidence = "low",
            source = "seed",
            summary = "An ancient Kul Tiran order resurrected to battle the threat of witchcraft, the Order of Embers fights with knowledge guiding their blades.",
        },
        [2162] = {
            confidence = "low",
            source = "seed",
            summary = "Home to farmers, craftsmen, soldiers, and the mysterious tidesages, the Storm's Wake seeks to reclaim Stormsong Valley and affirm their place in Kul Tiras.",
        },
        [2165] = {
            confidence = "low",
            source = "seed",
            summary = "After the fall of Argus, the draenei's finest warriors followed the prime naaru Xe'ra across the cosmos in an eternal war to bring about the Legion's end. Since then, other survivors of the Burning Crusade have joined the ranks of the Lightforged.",
        },
        [2170] = {
            confidence = "low",
            source = "seed",
            summary = "Although many struggled to oppose the Burning Legion's conquest of Argus, not all were able to escape. Emboldened by the arrival of new allies, these refugees and outcasts stand united in their mission to reclaim their home.",
        },
        [2370] = {
            confidence = "low",
            source = "seed",
            summary = "Retail content for this faction is centered on Neueheim and Nazjatar.",
        },
        [2373] = {
            confidence = "low",
            source = "seed",
            summary = "Oppressed by the Naga, these refugees have banded together to rise up and seize their freedom.",
        },
        [2391] = {
            confidence = "low",
            source = "seed",
            summary = "The Rustbolt Resistance holds the line against King Mechagon and his evil plans.",
        },
        [2407] = {
            confidence = "low",
            source = "seed",
            summary = "Kyrian who complete the arduous process of purging their mortal encumbrances are deemed worthy of the rite of ascension, earning their wings and pledging eternal service to the Archon.",
        },
        [2410] = {
            confidence = "low",
            source = "seed",
            summary = "Long ago, the Primus established the five houses of Maldraxxus to build the ultimate fighting force. Through might, cleverness, and guile, this unyielding armada is pledged to defend the Shadowlands against all threats.",
        },
        [2413] = {
            confidence = "low",
            source = "seed",
            summary = "After countless ages spent under the rule of Sire Denathrius, authority in Revendreth is now shared amongst the Court of Harvesters. These noble venthyr carry out the sacred duty of redeeming prideful souls.",
        },
        [2415] = {
            confidence = "low",
            source = "seed",
            summary = "A group of mogu loyal to the titan keeper Ra, they are charged with defending the Engine of Nalak'sha from N'Zoth's minions.",
        },
        [2432] = {
            confidence = "low",
            source = "seed",
            summary = "Ve'nari knows more about the Maw than anyone, and she might share a fraction of that information with you if you earn her regard.",
        },
        [2464] = {
            confidence = "low",
            source = "seed",
            summary = "The anima drought and Drust invasion consume the Winter Queen and Wild Hunt's attention, leaving the droman of the Court of Night to protect the wildseeds and defend their groves.",
        },
        [2470] = {
            confidence = "low",
            source = "seed",
            summary = "The combined might of the Shadowlands covenants, brought forth to breach the Sanctum of Domination.",
        },
        [2478] = {
            confidence = "low",
            source = "seed",
            summary = "Once members of Cartel Al, the Enlightened have abandoned the pursuit of profit and glory out of devotion to the First Ones. By earning their favor, the brokers may be willing to share the knowledge they have gleaned.",
        },
        [2503] = {
            confidence = "low",
            source = "seed",
            summary = "Centaur clans roam the Ohn'ahran Plains, where they follow the call of the wind and seek the thrill of the hunt.",
        },
        [2507] = {
            confidence = "low",
            source = "seed",
            summary = "A joint expedition of the Explorers' League and Reliquary, this fearless group of adventurers, scholars, and crafters seek to uncover the many mysteries of the Dragon Isles.",
        },
        [2510] = {
            confidence = "low",
            source = "seed",
            summary = "Centered in their most ancient city, the Valdrakken Accord is the unified might of all dragonkind, seeking to protect not only their island home but all of Azeroth.",
        },
        [2511] = {
            confidence = "low",
            source = "seed",
            summary = "The Iskaara Tuskarr have been on the Dragon Isles for generations, living in harmony and telling tales of the world around them.",
        },
        [2696] = {
            confidence = "low",
            source = "seed",
            summary = "The Amani conquered and claimed the majority of Eastern Kingdoms for thousands of years, but were forced back into current-day Zul'Aman once the elves and humans colonized the land themselves.",
        },
        [2699] = {
            confidence = "low",
            source = "seed",
            summary = "In the vortex of terror and violence that is the Voidstorm, few have the mettle to survive. The Singularity, gathered by Magister Umbric and the ren'dorei, encompasses any who would brave this fearsome land to stand up to Xal'atath.",
        },
    },
})
