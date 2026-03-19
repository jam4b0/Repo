#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
from collections import defaultdict
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Group and prioritize map curation candidates by world block."
    )
    parser.add_argument(
        "--manifest",
        default="/tmp/repu_mapscan_manifest.json",
        help="Path to the JSON map manifest.",
    )
    parser.add_argument(
        "--seed",
        default="/tmp/repu_generated_seed.json",
        help="Path to the generated client seed JSON.",
    )
    parser.add_argument(
        "--out",
        default="/tmp/repu_curation_priority.json",
        help="Where to write the grouped priority report.",
    )
    return parser.parse_args()


SPECIAL_CLASSES = {"variant", "special", "pvp_or_event"}


def normalize_name(value: str) -> str:
    value = value.strip().lower()
    value = re.sub(r"\s+", " ", value)
    return value


def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def build_manifest_lookup(manifest: dict) -> tuple[dict[int, dict], dict[int, dict], dict[int, str]]:
    zones = {}
    subzones = {}
    parent_names = {}
    for bucket_name in ("continents", "zones", "hubs"):
        for entry in manifest["buckets"][bucket_name]:
            parent_names[entry["mapID"]] = entry["name"]
            if bucket_name == "zones":
                zones[entry["mapID"]] = entry
            elif bucket_name == "hubs":
                subzones[entry["mapID"]] = entry
    return zones, subzones, parent_names


def load_curated_sets() -> tuple[set[int], set[int]]:
    from compare_map_seed import load_curated_retail  # type: ignore

    curated = load_curated_retail()
    zone_ids: set[int] = set()
    subzone_ids: set[int] = set()

    for key, entry in curated["zones"].items():
        zone_ids.add(int(key))
        for map_id in entry["mapIDs"]:
            zone_ids.add(int(map_id))

    for entry in curated["subZones"].values():
        for map_id in entry["mapIDs"]:
            subzone_ids.add(int(map_id))

    return zone_ids, subzone_ids


def score_entry(entry: dict, kind: str) -> int:
    score = 0
    if kind == "zone":
        score += 100
    else:
        score += 60

    candidate_class = entry.get("candidateClass")
    if candidate_class == "zone":
        score += 40
    elif candidate_class == "hub":
        score += 30
    elif candidate_class == "continent":
        score += 10
    elif candidate_class in SPECIAL_CLASSES:
        score -= 40

    if entry.get("needsReview"):
        score -= 10
    if entry.get("duplicateName"):
        score -= 10

    name = normalize_name(entry["name"])
    if "dalaran" in name or "oribos" in name or "dornogal" in name:
        score += 20
    if "tal" in name or "stadt" in name or "hafen" in name:
        score += 5

    return score


def group_label(entry: dict) -> str:
    parent = entry.get("parentName") or "Unknown"
    return parent


def build_report(manifest: dict, seed: dict) -> dict:
    zone_manifest, subzone_manifest, _ = build_manifest_lookup(manifest)
    curated_zone_ids, curated_subzone_ids = load_curated_sets()

    groups: dict[str, dict] = defaultdict(lambda: {"zones": [], "subZones": []})

    for raw_map_id in seed["locations"]["zones"].keys():
        map_id = int(raw_map_id)
        if map_id in curated_zone_ids:
            continue
        manifest_entry = zone_manifest.get(map_id)
        if not manifest_entry:
            continue
        row = {
            "mapID": map_id,
            "name": manifest_entry["name"],
            "parentName": manifest_entry.get("parentName"),
            "candidateClass": manifest_entry.get("candidateClass"),
            "needsReview": manifest_entry.get("needsReview"),
            "reviewReasons": manifest_entry.get("reviewReasons", []),
            "score": score_entry(manifest_entry, "zone"),
        }
        groups[group_label(manifest_entry)]["zones"].append(row)

    for raw_key in seed["locations"]["subZones"].keys():
        map_id = int(raw_key.split(":", 1)[0])
        if map_id in curated_subzone_ids:
            continue
        manifest_entry = subzone_manifest.get(map_id)
        if not manifest_entry:
            continue
        row = {
            "mapID": map_id,
            "key": raw_key,
            "name": manifest_entry["name"],
            "parentName": manifest_entry.get("parentName"),
            "candidateClass": manifest_entry.get("candidateClass"),
            "needsReview": manifest_entry.get("needsReview"),
            "reviewReasons": manifest_entry.get("reviewReasons", []),
            "score": score_entry(manifest_entry, "subZone"),
        }
        groups[group_label(manifest_entry)]["subZones"].append(row)

    for group in groups.values():
        group["zones"].sort(key=lambda row: (-row["score"], row["name"].lower(), row["mapID"]))
        group["subZones"].sort(key=lambda row: (-row["score"], row["name"].lower(), row["mapID"]))

    ordered_groups = []
    for name, payload in groups.items():
        ordered_groups.append(
            {
                "name": name,
                "zoneCount": len(payload["zones"]),
                "subZoneCount": len(payload["subZones"]),
                "zones": payload["zones"],
                "subZones": payload["subZones"],
            }
        )

    ordered_groups.sort(
        key=lambda group: (
            -(group["zoneCount"] * 3 + group["subZoneCount"]),
            group["name"].lower(),
        )
    )

    return {
        "meta": {
            "groupCount": len(ordered_groups),
            "zoneCandidates": sum(group["zoneCount"] for group in ordered_groups),
            "subZoneCandidates": sum(group["subZoneCount"] for group in ordered_groups),
        },
        "groups": ordered_groups,
    }


def main() -> int:
    args = parse_args()
    manifest = load_json(Path(args.manifest))
    seed = load_json(Path(args.seed))
    report = build_report(manifest, seed)

    Path(args.out).write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print("Groups:", report["meta"]["groupCount"])
    print("Zone candidates:", report["meta"]["zoneCandidates"])
    print("SubZone candidates:", report["meta"]["subZoneCandidates"])
    print("\nTop groups:")
    for group in report["groups"][:12]:
        print(
            f"  {group['name']}: zones={group['zoneCount']} subZones={group['subZoneCount']}"
        )
    print(f"\nWrote report: {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
