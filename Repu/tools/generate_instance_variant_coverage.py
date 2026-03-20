#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from coverage_key_utils import esc_lua, normalized_subzone_key


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate coverage for instance/raid duplicate-name variant families."
    )
    parser.add_argument(
        "--families",
        default="/tmp/repu_variant_families.json",
        help="Path to the variant-family manifest.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_instance_variants_generated.lua",
        help="Where to write the generated instance-variant coverage module.",
    )
    return parser.parse_args()


def load_manifest(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def collect_rows(manifest: dict) -> tuple[list[dict], list[dict]]:
    zone_rows = []
    subzone_rows = []
    for family in manifest["families"]:
        if family["familyClass"] != "instance_or_raid_variant":
            continue
        for entry in family["entries"]:
            payload = {
                "name": entry["name"],
                "group": entry["group"],
                "mapID": entry["mapID"],
            }
            if entry["kind"] == "zone":
                zone_rows.append(payload)
            else:
                payload["key"] = entry["key"]
                subzone_rows.append(payload)

    zone_rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    subzone_rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    return zone_rows, subzone_rows


def render_module(zone_rows: list[dict], subzone_rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from grouped instance/raid duplicate-name variants.")
    lines.append("-- These entries preserve skeleton coverage for instance-centric variant families.")
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
            '                notes = "Generated coverage for an instance/raid variant zone; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "zone", "coverage-only", "generated-variant", "instance-variant", "'
            + group_name
            + '" },'
        )
        lines.append("            },")
    lines.append("        },")
    lines.append("        subZones = {")
    for row in subzone_rows:
        key = normalized_subzone_key(row["mapID"], row["name"])
        name = esc_lua(row["name"])
        group_name = esc_lua(row["group"])
        lines.append(f'            ["{key}"] = {{')
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated coverage for an instance/raid variant subzone; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(f'                subZoneKeys = {{ "{name}" }},')
        lines.append(
            '                tags = { "subzone", "coverage-only", "generated-variant", "instance-variant", "'
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

    print(f"Generated instance/raid variant zones: {len(zone_rows)}")
    print(f"Generated instance/raid variant subZones: {len(subzone_rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
