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
    return parser.parse_args()


INSTANCE_HUB_MARKERS = (
    "bastion des zwielichts",
    "azurblaues gewölbe",
    "brunnen der ewigkeit",
    "das oculus",
    "gundrak",
    "grube von saron",
    "obsidiansanktum",
    "rubinsanktum",
    "zul'farrak",
    "aberrus",
    "tazavesh",
)

EVENT_MARKERS = (
    "braumondfest",
    "dunkelmond",
    "pandarenrevolution",
    "gnollkrieg",
    "krieg",
    "invasionspunkt",
    "großer invasionspunkt",
    "schwarze imperium",
    "herz von azeroth",
    "brodelnde küste",
)

TECHNICAL_MARKERS = (
    "deprecated",
    "map floor",
    "tropical isle",
    "inseln",
    "das große meer",
)


def normalize(value: str) -> str:
    return " ".join(value.strip().lower().split())


def load_priority(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


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


def build_report(priority: dict) -> dict:
    buckets: dict[str, list[dict]] = defaultdict(list)

    for group in priority["groups"]:
        for kind in ("zones", "subZones"):
            for row in group[kind]:
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
    report = build_report(priority)
    Path(args.out).write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print("Remaining candidate classes:")
    for key, rows in report["buckets"].items():
        print(f"  {key}: {len(rows)}")
    print(f"\nWrote report: {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
