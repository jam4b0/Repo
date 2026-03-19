#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path


INSTANCE_VARIANT_MARKERS = (
    "ahn'qiraj",
    "auge azsharas",
    "das oculus",
    "feuerlande",
    "grube von saron",
    "hyjalgipfel",
    "mardum",
    "niskara",
    "rubinsanktum",
    "spitzen des aufstiegs",
    "terrasse des endlosen frühlings",
    "tol dagor",
    "zul'gurub",
)

EVENT_VARIANT_MARKERS = (
    "vision von",
    "tol barad",
    "ashran",
    "insel des donners",
    "tempel von katmogu",
    "tausendwinter",
)

WORLD_VARIANT_MARKERS = (
    "arathihochland",
    "azshara",
    "azurmythosinsel",
    "die exodar",
    "die wandernde insel",
    "dunkelküste",
    "düstermarschen",
    "gilneas",
    "nazjatar",
    "schattenhochland",
    "tirisfal",
    "uldum",
    "verheerte küste",
)

TECHNICAL_VARIANT_MARKERS = (
    "das große meer",
    "der mahlstrom",
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Group remaining retail duplicate-name variants into review families."
    )
    parser.add_argument(
        "--remaining",
        default="/tmp/repu_remaining_candidates.json",
        help="Path to the remaining-candidates JSON report.",
    )
    parser.add_argument(
        "--out",
        default="/tmp/repu_variant_families.json",
        help="Where to write the grouped variant-family report.",
    )
    return parser.parse_args()


def normalize(value: str) -> str:
    return " ".join(value.strip().lower().split())


def classify_family(name: str) -> str:
    normalized = normalize(name)
    if any(marker in normalized for marker in TECHNICAL_VARIANT_MARKERS):
        return "technical_or_root_variant"
    if any(marker in normalized for marker in EVENT_VARIANT_MARKERS):
        return "event_or_pvp_variant"
    if any(marker in normalized for marker in INSTANCE_VARIANT_MARKERS):
        return "instance_or_raid_variant"
    if any(marker in normalized for marker in WORLD_VARIANT_MARKERS):
        return "world_or_phasing_variant"
    return "mixed_or_manual_review"


def build_manifest(remaining: dict) -> dict:
    families: dict[str, list[dict]] = defaultdict(list)
    for row in remaining["buckets"]["zone_variants"]:
        families[row["name"]].append(row)

    rendered = []
    for name, rows in families.items():
        rows.sort(key=lambda row: (row["kind"], row["group"].lower(), row["mapID"]))
        family_class = classify_family(name)
        rendered.append(
            {
                "name": name,
                "familyClass": family_class,
                "entryCount": len(rows),
                "entries": rows,
            }
        )

    rendered.sort(key=lambda item: (-item["entryCount"], item["name"].lower()))

    class_counts: dict[str, int] = defaultdict(int)
    for item in rendered:
        class_counts[item["familyClass"]] += 1

    return {
        "meta": {
            "familyCount": len(rendered),
            "entryCount": sum(item["entryCount"] for item in rendered),
            "familyClasses": dict(sorted(class_counts.items())),
        },
        "families": rendered,
    }


def main() -> int:
    args = parse_args()
    remaining = json.loads(Path(args.remaining).read_text(encoding="utf-8"))
    manifest = build_manifest(remaining)
    Path(args.out).write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print("Variant family classes:")
    for key, value in manifest["meta"]["familyClasses"].items():
        print(f"  {key}: {value}")
    print(f"Families: {manifest['meta']['familyCount']}")
    print(f"Entries: {manifest['meta']['entryCount']}")
    print(f"Wrote report: {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
