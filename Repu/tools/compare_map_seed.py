#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path


RETAIL_MODULES = [
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_generated.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_hubs_generated.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_wave2_generated.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_cleanup_generated.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/eastern_kingdoms.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/kalimdor.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/outland.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/northrend.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/pandaria.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/draenor.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/broken_isles.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/bfa.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/shadowlands.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/dragonflight.lua",
    "/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/current.lua",
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Compare generated client seed with current retail location modules."
    )
    parser.add_argument(
        "--seed",
        default="/tmp/repu_generated_seed.json",
        help="Path to generated client seed JSON.",
    )
    return parser.parse_args()


def extract_balanced_block(text: str, anchor: str) -> str:
    start = text.find(anchor)
    if start == -1:
        return ""
    brace_start = text.find("{", start)
    if brace_start == -1:
        return ""

    depth = 0
    for index in range(brace_start, len(text)):
        char = text[index]
        if char == "{":
            depth += 1
        elif char == "}":
            depth -= 1
            if depth == 0:
                return text[brace_start + 1 : index]
    return ""


def split_top_level_entries(block: str) -> list[tuple[str, str]]:
    entries: list[tuple[str, str]] = []
    index = 0
    length = len(block)

    while index < length:
        while index < length and block[index].isspace():
            index += 1
        if index >= length:
            break

        if block[index] != "[":
            index += 1
            continue

        key_start = index
        key_end = block.find("]", key_start)
        if key_end == -1:
            break
        key = block[key_start + 1 : key_end].strip().strip('"')

        eq_index = block.find("=", key_end)
        if eq_index == -1:
            break
        brace_start = block.find("{", eq_index)
        if brace_start == -1:
            break

        depth = 0
        body_end = None
        for cursor in range(brace_start, length):
            char = block[cursor]
            if char == "{":
                depth += 1
            elif char == "}":
                depth -= 1
                if depth == 0:
                    body_end = cursor
                    break
        if body_end is None:
            break

        body = block[brace_start + 1 : body_end]
        entries.append((key, body))
        index = body_end + 1

    return entries


def parse_name(body: str) -> str | None:
    match = re.search(r'name\s*=\s*"([^"]+)"', body)
    return match.group(1) if match else None


def parse_map_ids(body: str) -> list[int]:
    match = re.search(r"mapIDs\s*=\s*\{([^}]*)\}", body, re.S)
    if not match:
        return []
    return [int(value) for value in re.findall(r"\d+", match.group(1))]


def parse_retail_locations(path: Path) -> dict:
    text = path.read_text(encoding="utf-8")
    zones_block = extract_balanced_block(text, "zones = {")
    subzones_block = extract_balanced_block(text, "subZones = {")

    zones = {}
    subzones = {}

    for key, body in split_top_level_entries(zones_block):
        name = parse_name(body)
        map_ids = parse_map_ids(body)
        if not name:
            continue
        zones[key] = {
            "name": name,
            "mapIDs": map_ids,
            "module": path.name,
        }

    for key, body in split_top_level_entries(subzones_block):
        name = parse_name(body)
        map_ids = parse_map_ids(body)
        if not name:
            continue
        subzones[key] = {
            "name": name,
            "mapIDs": map_ids,
            "module": path.name,
        }

    return {
        "zones": zones,
        "subZones": subzones,
    }


def load_curated_retail() -> dict:
    merged = {
        "zones": {},
        "subZones": {},
    }
    for raw_path in RETAIL_MODULES:
        parsed = parse_retail_locations(Path(raw_path))
        merged["zones"].update(parsed["zones"])
        merged["subZones"].update(parsed["subZones"])
    return merged


def compare(seed: dict, curated: dict) -> dict:
    seed_zone_ids = {int(key) for key in seed["locations"]["zones"].keys()}
    seed_subzone_ids = {int(key.split(":", 1)[0]) for key in seed["locations"]["subZones"].keys()}

    curated_zone_ids = set()
    curated_subzone_ids = set()

    for key, entry in curated["zones"].items():
        curated_zone_ids.add(int(key))
        for map_id in entry["mapIDs"]:
            curated_zone_ids.add(int(map_id))

    for entry in curated["subZones"].values():
        for map_id in entry["mapIDs"]:
            curated_subzone_ids.add(int(map_id))

    zones_overlap = sorted(seed_zone_ids & curated_zone_ids)
    zones_seed_only = sorted(seed_zone_ids - curated_zone_ids)
    zones_curated_only = sorted(curated_zone_ids - seed_zone_ids)

    subzones_overlap = sorted(seed_subzone_ids & curated_subzone_ids)
    subzones_seed_only = sorted(seed_subzone_ids - curated_subzone_ids)
    subzones_curated_only = sorted(curated_subzone_ids - seed_subzone_ids)

    return {
        "zones": {
            "seed": len(seed_zone_ids),
            "curated": len(curated_zone_ids),
            "overlap": len(zones_overlap),
            "seedOnly": zones_seed_only,
            "curatedOnly": zones_curated_only,
        },
        "subZones": {
            "seed": len(seed_subzone_ids),
            "curated": len(curated_subzone_ids),
            "overlap": len(subzones_overlap),
            "seedOnly": subzones_seed_only,
            "curatedOnly": subzones_curated_only,
        },
    }


def sample_names_by_map_id(seed: dict, curated: dict, ids: list[int], section: str, limit: int = 12) -> list[tuple[int, str]]:
    results = []
    if section == "zones":
        seed_lookup = {int(key): entry["name"] for key, entry in seed["locations"]["zones"].items()}
        curated_lookup = {}
        for key, entry in curated["zones"].items():
            curated_lookup[int(key)] = entry["name"]
            for map_id in entry["mapIDs"]:
                curated_lookup.setdefault(int(map_id), entry["name"])
    else:
        seed_lookup = {int(key.split(":", 1)[0]): entry["name"] for key, entry in seed["locations"]["subZones"].items()}
        curated_lookup = {}
        for entry in curated["subZones"].values():
            for map_id in entry["mapIDs"]:
                curated_lookup.setdefault(int(map_id), entry["name"])

    for map_id in ids[:limit]:
        results.append((map_id, seed_lookup.get(map_id) or curated_lookup.get(map_id) or "?"))
    return results


def main() -> int:
    args = parse_args()
    seed = json.loads(Path(args.seed).read_text(encoding="utf-8"))
    curated = load_curated_retail()
    result = compare(seed, curated)

    print("Zone comparison")
    print(result["zones"])
    print("Zone seed-only sample", sample_names_by_map_id(seed, curated, result["zones"]["seedOnly"], "zones"))
    print("Zone curated-only sample", sample_names_by_map_id(seed, curated, result["zones"]["curatedOnly"], "zones"))

    print("\nSubZone comparison")
    print(result["subZones"])
    print("SubZone seed-only sample", sample_names_by_map_id(seed, curated, result["subZones"]["seedOnly"], "subZones"))
    print("SubZone curated-only sample", sample_names_by_map_id(seed, curated, result["subZones"]["curatedOnly"], "subZones"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
