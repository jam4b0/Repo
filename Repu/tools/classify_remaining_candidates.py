#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Classify remaining retail curation candidates into actionable buckets."
    )
    parser.add_argument(
        "--priority",
        default="/tmp/repu_curation_priority.json",
        help="Path to the priority report JSON.",
    )
    parser.add_argument(
        "--out",
        default="/tmp/repu_remaining_candidates.json",
        help="Where to write the classification report.",
    )
    parser.add_argument(
        "--exclude-manifest",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/tools/excluded_retail_candidates.json",
        help="Optional exclusion manifest for already-reviewed non-actionable candidates.",
    )
    return parser.parse_args()


INSTANCE_HUB_MARKERS = (
    "ahn'qiraj",
    "bastion des zwielichts",
    "bucht von nashal",
    "azurblaues gewölbe",
    "brunnen der ewigkeit",
    "dämmerndes riff",
    "die andre seite",
    "das oculus",
    "das verlies",
    "der schwarze morast",
    "der drachenrücken",
    "düsterbruch",
    "eiskronenzitadelle",
    "finsterherzdickicht",
    "gluthof",
    "gundrak",
    "grube von saron",
    "helheim",
    "himmelsfeste",
    "höllenschlund",
    "ursocs unterschlupf",
    "kolosseum des aufstiegs",
    "malornes alptraum",
    "neltharions hort",
    "obsidiansanktum",
    "pechschwingenhort",
    "priorat der heiligen flamme",
    "reich der kälte",
    "rubinsanktum",
    "schloss nathria",
    "scharlachrote enklave",
    "sitz des triumvirats",
    "zul'farrak",
    "aberrus",
    "tazavesh",
    "verlorene stadt der tol'vir",
    "vestibül der ewigkeit",
    "wirbelnder nether",
    "zerschmetterter hain",
)

EVENT_MARKERS = (
    "braumondfest",
    "dunkelmond",
    "ein wenig geduld",
    "ein dolch im dunkel",
    "insel der eroberung",
    "insel von gilneas",
    "azmerloth",
    "baines rettung",
    "ein sturm braut sich zusammen",
    "felder der ewigen jagd",
    "shado-pan-kraftprobe",
    "pandarenrevolution",
    "gnollkrieg",
    "krieg",
    "invasionspunkt",
    "großer invasionspunkt",
    "ruinen von lordaeron",
    "ruinen von un'gol",
    "silithusrauferei",
    "strand der uralten",
    "schwarze imperium",
    "turnier der erhabenen",
    "unga ingu",
    "zukunft der primalisten",
    "zwillingsgipfel",
    "vorgebirge des alten hügellands",
    "vorgebirge des hügellands (süderstade vs. tarrens mühle)",
    "herz von azeroth",
    "brodelnde küste",
)

TECHNICAL_MARKERS = (
    "deprecated",
    "map floor",
    "minimap_",
    "tropical isle",
    "inseln",
    "das große meer",
)


def normalize(value: str) -> str:
    return " ".join(value.strip().lower().split())


def load_priority(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def load_excluded(path: Path) -> dict:
    if not path.exists():
        return {"zones": [], "subZones": []}
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


def classify(row: dict) -> str:
    candidate_class = row.get("candidateClass")
    reasons = set(row.get("reviewReasons", []))
    name = normalize(row["name"])

    if candidate_class == "variant":
        if "duplicate_name" in reasons:
            return "zone_variants"
        return "other_variants"

    if candidate_class == "pvp_or_event":
        return "pvp_or_event"

    if any(marker in name for marker in EVENT_MARKERS):
        return "event_or_scenario"

    if any(marker in name for marker in INSTANCE_HUB_MARKERS):
        return "instance_adjacent"

    if any(marker in name for marker in TECHNICAL_MARKERS):
        return "technical_or_ui"

    if row.get("candidateClass") == "hub":
        return "normal_hubs"

    if row.get("candidateClass") == "zone":
        return "normal_zones"

    return "other"


def build_report(priority: dict, excluded: dict) -> dict:
    buckets: dict[str, list[dict]] = defaultdict(list)
    zone_ids_curated = curated_zone_ids()
    subzone_ids_curated = curated_subzone_ids()
    zone_ids_excluded = {int(value) for value in excluded.get("zones", [])}
    subzone_ids_excluded = {int(value) for value in excluded.get("subZones", [])}

    for group in priority["groups"]:
        for kind in ("zones", "subZones"):
            for row in group[kind]:
                if kind == "zones" and int(row["mapID"]) in zone_ids_curated:
                    continue
                if kind == "subZones" and int(row["mapID"]) in subzone_ids_curated:
                    continue
                if kind == "zones" and int(row["mapID"]) in zone_ids_excluded:
                    continue
                if kind == "subZones" and int(row["mapID"]) in subzone_ids_excluded:
                    continue
                bucket = classify(row)
                buckets[bucket].append(
                    {
                        "kind": "zone" if kind == "zones" else "subZone",
                        "group": group["name"],
                        "mapID": row["mapID"],
                        "name": row["name"],
                        "candidateClass": row.get("candidateClass"),
                        "score": row.get("score"),
                        "reviewReasons": row.get("reviewReasons", []),
                        "key": row.get("key"),
                    }
                )

    for rows in buckets.values():
        rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))

    order = [
        "normal_zones",
        "normal_hubs",
        "zone_variants",
        "pvp_or_event",
        "event_or_scenario",
        "instance_adjacent",
        "technical_or_ui",
        "other_variants",
        "other",
    ]

    return {
        "meta": {
            "totalBuckets": len([key for key in order if key in buckets]),
            "totalCandidates": sum(len(rows) for rows in buckets.values()),
        },
        "buckets": {key: buckets.get(key, []) for key in order},
    }


def main() -> int:
    args = parse_args()
    priority = load_priority(Path(args.priority))
    excluded = load_excluded(Path(args.exclude_manifest))
    report = build_report(priority, excluded)
    Path(args.out).write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print("Remaining candidate classes:")
    for key, rows in report["buckets"].items():
        print(f"  {key}: {len(rows)}")
    print(f"\nWrote report: {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
