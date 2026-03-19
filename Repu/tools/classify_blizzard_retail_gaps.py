#!/usr/bin/env python3

from __future__ import annotations

import json
from collections import Counter
from pathlib import Path


AUDIT = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/tools/blizzard_retail_faction_audit.json")
OUT = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/tools/blizzard_retail_gap_classes.json")

GENERIC_IGNORE = {
    67, 469, 891, 892, 980, 1097, 1118, 1162, 1168, 1169, 1245, 1444, 1834, 2104, 2414, 2506, 2569, 2593, 2698,
}

TEST_OR_PLACEHOLDER = {1072, 2662}

OPTIONAL_PVP_OR_BRAWLER = {
    509, 510, 729, 730, 889, 890, 1374, 1419, 1690, 1691, 2010, 2011, 2371, 2372, 2766, 2767,
}

SUPSERSEDED_BY_CURRENT_MODEL = {
    911,   # Silvermoon City -> Silvermoon Court family
    946,   # Honor Hold -> outland not yet modeled as retail core
    1037,  # Alliance Vanguard -> child header
    1050,  # Valiance Expedition -> child of Alliance Vanguard
    1052,  # Horde Expedition -> child header
    1064,  # The Taunka -> child of Horde Expedition
    1085,  # Warsong Offensive -> child of Horde Expedition
    1094,  # Silver Covenant -> child of Alliance Vanguard
    1178,  # Hellscream's Reach -> Tol Barad side faction
    1242,  # Pearlfin Jinyu -> older faction header
    1352,  # Huojin Pandaren
    1353,  # Tushui Pandaren
    1388,  # Sunreaver Onslaught -> side-dependent isle faction
    1681,  # Vol'jin's Spear
    1682,  # Wrynn's Vanguard
    1708,  # Laughing Skull Orcs
    2103,  # Zandalari Empire -> legacy BfA city-state
    2156,  # Talanji's Expedition
    2159,  # 7th Legion
    2400,  # Waveblade Ankoan -> allied Nazjatar side rep
    2601,  # The Weaver -> modeled as child under Severed Threads
    2605,  # The General -> modeled as child under Severed Threads
    2607,  # The Vizier -> modeled as child under Severed Threads
}

MODERN_RENOWN_CANDIDATES = {2564, 2574, 2658, 2688, 2736}

MODERN_SIDE_SYSTEMS = {
    2135, 2163, 2164, 2395, 2417, 2439, 2465, 2472, 2517, 2518, 2523, 2524, 2526, 2544, 2550, 2553, 2615, 2663, 2664, 2665, 2666, 2669,
}

LEGACY_CANDIDATES = {
    54, 70, 87, 92, 93, 270, 349, 369, 470, 577, 749, 809, 909, 910, 922, 970, 990, 1015, 1067,
    1126, 1135, 1174, 1216, 1228, 1273, 1275, 1276, 1277, 1278, 1279, 1280, 1281, 1282, 1283,
    1337, 1341, 1345, 1358, 1359, 1416, 1440, 1515, 1733, 1735, 1736, 1737, 1738, 1739, 1740, 1741,
    1975, 1984, 2018, 2097, 2098, 2099, 2100, 2101, 2102, 2445, 2446, 2447, 2448, 2449, 2450, 2451,
    2452, 2453, 2454, 2455, 2456, 2457, 2458, 2459, 2460, 2461, 2462, 2469, 2568, 2640, 2671, 2673,
    2675, 2677, 2685, 2711, 2712, 2713, 2714, 2744, 2770,
}


def classify(row: dict) -> str:
    faction_id = row["factionID"]
    classification = row.get("classification")

    if faction_id in GENERIC_IGNORE or classification == "generic_header":
        return "ignore_header"
    if faction_id in TEST_OR_PLACEHOLDER:
        return "ignore_placeholder"
    if faction_id in OPTIONAL_PVP_OR_BRAWLER:
        return "optional_pvp_brawler"
    if faction_id in SUPSERSEDED_BY_CURRENT_MODEL:
        return "superseded_by_current_model"
    if faction_id in MODERN_RENOWN_CANDIDATES or classification == "renown":
        return "candidate_modern_renown"
    if faction_id in MODERN_SIDE_SYSTEMS:
        return "candidate_modern_side_system"
    if faction_id in LEGACY_CANDIDATES:
        return "candidate_legacy_or_side_rep"
    if classification == "faction_header":
        return "candidate_faction_header"
    if classification == "header":
        return "candidate_header"
    return "candidate_unclassified"


def main() -> int:
    report = json.loads(AUDIT.read_text(encoding="utf-8"))
    rows = []
    for row in report["blizzardMissingInCore"]:
        enriched = dict(row)
        enriched["gapClass"] = classify(row)
        rows.append(enriched)

    rows.sort(key=lambda row: (row["gapClass"], (row.get("name") or "").lower(), row["factionID"]))
    counts = Counter(row["gapClass"] for row in rows)

    out = {
        "meta": report["meta"],
        "gapClassCounts": dict(sorted(counts.items())),
        "rows": rows,
    }
    OUT.write_text(json.dumps(out, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print("Gap classes:")
    for key, value in sorted(counts.items()):
        print(f"  {key}: {value}")
    print(f"Wrote report: {OUT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
