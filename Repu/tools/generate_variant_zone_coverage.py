#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


EXPLICIT_VARIANT_KEEP = {
    14,
    62,
    70,
    76,
    97,
    103,
    123,
    1577,
    2354,
    2424,
    2432,
    2565,
    2566,
}

EXPLICIT_VARIANT_EXCLUDE = {
    2366,  # Die Wandernde Insel
    276,   # Der Mahlstrom
    588,   # Ashran
    790,   # Das Auge Azsharas
    2372,  # Arathihochland variant
    2403,  # Vision von Orgrimmar
    2404,  # Vision von Sturmwind
    2451,  # Arathihochland variant
    504,   # Insel des Donners
    241,   # Schattenhochland variant
    2070,  # Tirisfal variant
    244,   # Tol Barad variant
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate explicit coverage for retained retail variant zones."
    )
    parser.add_argument(
        "--priority",
        default="/tmp/repu_curation_priority.json",
        help="Path to the priority report JSON.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_variants_generated.lua",
        help="Where to write the generated variant coverage module.",
    )
    return parser.parse_args()


def load_priority(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def collect_rows(priority: dict) -> tuple[list[dict], list[dict]]:
    keep_rows = []
    excluded_rows = []
    for group in priority["groups"]:
        for row in group["zones"]:
            if row.get("candidateClass") != "variant":
                continue
            payload = {
                "mapID": row["mapID"],
                "name": row["name"],
                "group": group["name"],
                "reviewReasons": row.get("reviewReasons", []),
            }
            if row["mapID"] in EXPLICIT_VARIANT_KEEP:
                keep_rows.append(payload)
            elif row["mapID"] in EXPLICIT_VARIANT_EXCLUDE:
                excluded_rows.append(payload)
    keep_rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    excluded_rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    return keep_rows, excluded_rows


def render_module(rows: list[dict], excluded_rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from variant-zone review.")
    lines.append("-- This file contains only explicit keep-cases among duplicate-name zones.")
    for row in excluded_rows:
        lines.append(
            "-- excluded variant: %s (%s, mapID=%d)"
            % (row["name"], row["group"], row["mapID"])
        )
    lines.append("ns.Data:RegisterRetailModule({")
    lines.append("    locations = {")
    lines.append("        zones = {")
    for row in rows:
        name = row["name"].replace("\\", "\\\\").replace('"', '\\"')
        group_name = row["group"].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f"            [{row['mapID']}] = {{")
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated explicit keep-case for a reviewed variant zone; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "zone", "coverage-only", "generated-variant", "reviewed-variant-keep", "'
            + group_name
            + '" },'
        )
        lines.append("            },")
    lines.append("        },")
    lines.append("        subZones = {},")
    lines.append("        instances = {},")
    lines.append("        raids = {},")
    lines.append("    },")
    lines.append("})")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    args = parse_args()
    priority = load_priority(Path(args.priority))
    keep_rows, excluded_rows = collect_rows(priority)
    output = Path(args.out)
    output.write_text(render_module(keep_rows, excluded_rows), encoding="utf-8")

    print(f"Generated kept variant zones: {len(keep_rows)}")
    print(f"Documented excluded variant zones: {len(excluded_rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
