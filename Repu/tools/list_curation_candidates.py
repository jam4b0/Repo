#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="List map seed entries that still need curated retail coverage."
    )
    parser.add_argument(
        "--seed",
        default="/tmp/repu_generated_seed.json",
        help="Path to generated client seed JSON.",
    )
    parser.add_argument(
        "--compare-report",
        default="",
        help="Optional path to persist a JSON report.",
    )
    return parser.parse_args()


def load_seed(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def curated_zone_ids() -> set[int]:
    from compare_map_seed import load_curated_retail  # type: ignore

    curated = load_curated_retail()
    ids: set[int] = set()
    for key, entry in curated["zones"].items():
        ids.add(int(key))
        for map_id in entry["mapIDs"]:
            ids.add(int(map_id))
    return ids


def curated_subzone_ids() -> set[int]:
    from compare_map_seed import load_curated_retail  # type: ignore

    curated = load_curated_retail()
    ids: set[int] = set()
    for entry in curated["subZones"].values():
        for map_id in entry["mapIDs"]:
            ids.add(int(map_id))
    return ids


def main() -> int:
    args = parse_args()
    seed = load_seed(Path(args.seed))
    zone_ids_curated = curated_zone_ids()
    subzone_ids_curated = curated_subzone_ids()

    zone_candidates = []
    for raw_map_id, entry in seed["locations"]["zones"].items():
        map_id = int(raw_map_id)
        if map_id in zone_ids_curated:
            continue
        zone_candidates.append(
            {
                "mapID": map_id,
                "name": entry["name"],
                "tags": entry.get("tags", []),
            }
        )

    subzone_candidates = []
    for raw_key, entry in seed["locations"]["subZones"].items():
        map_id = int(raw_key.split(":", 1)[0])
        if map_id in subzone_ids_curated:
            continue
        subzone_candidates.append(
            {
                "mapID": map_id,
                "key": raw_key,
                "name": entry["name"],
                "tags": entry.get("tags", []),
            }
        )

    zone_candidates.sort(key=lambda item: (item["name"].lower(), item["mapID"]))
    subzone_candidates.sort(key=lambda item: (item["name"].lower(), item["mapID"]))

    report = {
        "zoneCandidates": zone_candidates,
        "subZoneCandidates": subzone_candidates,
    }

    print("Zone curation candidates:", len(zone_candidates))
    for row in zone_candidates[:20]:
        print(f"  {row['mapID']:>4} {row['name']} tags={','.join(row['tags'])}")

    print("\nSubZone curation candidates:", len(subzone_candidates))
    for row in subzone_candidates[:20]:
        print(f"  {row['mapID']:>4} {row['name']} key={row['key']} tags={','.join(row['tags'])}")

    if args.compare_report:
        Path(args.compare_report).write_text(
            json.dumps(report, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        print(f"\nWrote report: {args.compare_report}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
