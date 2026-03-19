#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


EXPLICIT_KEEP_ZONE_IDS = {
    588,   # Ashran
    504,   # Insel des Donners
    244,   # Tol Barad
    2403,  # Vision von Orgrimmar
    2404,  # Vision von Sturmwind
}

EXPLICIT_KEEP_SUBZONE_IDS = {
    1478,  # Ashran
    516,   # Insel des Donners
    773,   # Tol Barad
    1469,  # Vision von Orgrimmar
    1470,  # Vision von Sturmwind
    1334,  # Tausendwinter
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate coverage for selected event/pvp duplicate-name variants."
    )
    parser.add_argument(
        "--families",
        default="/tmp/repu_variant_families.json",
        help="Path to the variant-family manifest.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_event_variants_generated.lua",
        help="Where to write the generated event-variant coverage module.",
    )
    return parser.parse_args()


def load_manifest(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def collect_rows(manifest: dict) -> tuple[list[dict], list[dict]]:
    zone_rows = []
    subzone_rows = []
    for family in manifest["families"]:
        if family["familyClass"] != "event_or_pvp_variant":
            continue
        for entry in family["entries"]:
            if entry["kind"] == "zone" and entry["mapID"] in EXPLICIT_KEEP_ZONE_IDS:
                zone_rows.append(
                    {
                        "name": entry["name"],
                        "group": entry["group"],
                        "mapID": entry["mapID"],
                    }
                )
            if entry["kind"] == "subZone" and entry["mapID"] in EXPLICIT_KEEP_SUBZONE_IDS:
                subzone_rows.append(
                    {
                        "name": entry["name"],
                        "group": entry["group"],
                        "mapID": entry["mapID"],
                        "key": entry["key"],
                    }
                )

    zone_rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    subzone_rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    return zone_rows, subzone_rows


def render_module(zone_rows: list[dict], subzone_rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from grouped event/pvp duplicate-name variants.")
    lines.append("-- This file keeps only explicitly approved world-facing event/pvp variants.")
    lines.append("ns.Data:RegisterRetailModule({")
    lines.append("    locations = {")
    lines.append("        zones = {")
    for row in zone_rows:
        name = row["name"].replace("\\", "\\\\").replace('"', '\\"')
        group_name = row["group"].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f"            [{row['mapID']}] = {{")
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated coverage for an approved event/pvp world variant; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "zone", "coverage-only", "generated-variant", "event-pvp-variant", "'
            + group_name
            + '" },'
        )
        lines.append("            },")
    lines.append("        },")
    lines.append("        subZones = {")
    for row in subzone_rows:
        key = row["key"].replace("\\", "\\\\").replace('"', '\\"')
        name = row["name"].replace("\\", "\\\\").replace('"', '\\"')
        group_name = row["group"].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f'            ["{key}"] = {{')
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated coverage for an approved event/pvp variant subzone; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "subzone", "coverage-only", "generated-variant", "event-pvp-variant", "'
            + group_name
            + '" },'
        )
        lines.append("            },")
    lines.append("        },")
    lines.append("        instances = {},")
    lines.append("        raids = {},")
    lines.append("    },")
    lines.append("})")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    args = parse_args()
    manifest = load_manifest(Path(args.families))
    zone_rows, subzone_rows = collect_rows(manifest)
    output = Path(args.out)
    output.write_text(render_module(zone_rows, subzone_rows), encoding="utf-8")

    print(f"Generated event/pvp variant zones: {len(zone_rows)}")
    print(f"Generated event/pvp variant subZones: {len(subzone_rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
