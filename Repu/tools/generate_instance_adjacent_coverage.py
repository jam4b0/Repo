#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from coverage_key_utils import esc_lua, normalized_subzone_key


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate coverage for remaining instance-adjacent retail subzones."
    )
    parser.add_argument(
        "--remaining",
        default="/tmp/repu_remaining_candidates.json",
        help="Path to the remaining-candidates JSON report.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_instance_adjacent_generated.lua",
        help="Where to write the generated instance-adjacent coverage module.",
    )
    return parser.parse_args()


def load_report(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def collect_rows(report: dict) -> list[dict]:
    rows = []
    for row in report["buckets"]["instance_adjacent"]:
        if row["kind"] != "subZone":
            continue
        rows.append(
            {
                "mapID": row["mapID"],
                "key": row["key"],
                "name": row["name"],
                "group": row["group"],
            }
        )
    rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    return rows


def render_module(rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from remaining instance-adjacent retail subzones.")
    lines.append("-- These entries improve location coverage near or within instance-like map slices without inventing faction mappings.")
    lines.append("ns.Data:RegisterRetailModule({")
    lines.append("    locations = {")
    lines.append("        zones = {},")
    lines.append("        subZones = {")
    for row in rows:
        key = normalized_subzone_key(row["mapID"], row["name"])
        name = esc_lua(row["name"])
        group_name = esc_lua(row["group"])
        lines.append(f'            ["{key}"] = {{')
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated coverage for an instance-adjacent subzone; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(f'                subZoneKeys = {{ "{name}" }},')
        lines.append(
            '                tags = { "subzone", "coverage-only", "generated-review", "instance-adjacent", "'
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
    report = load_report(Path(args.remaining))
    rows = collect_rows(report)
    output = Path(args.out)
    output.write_text(render_module(rows), encoding="utf-8")

    print(f"Generated instance-adjacent subZones: {len(rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
