#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a second coverage wave from remaining normal retail zones."
    )
    parser.add_argument(
        "--remaining",
        default="/tmp/repu_remaining_candidates.json",
        help="Path to the remaining-candidates JSON report.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_wave2_generated.lua",
        help="Where to write the generated second-wave coverage module.",
    )
    return parser.parse_args()


def load_report(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def render_module(rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from remaining candidate classification.")
    lines.append("-- This file only upgrades normal zone coverage and does not invent faction mappings.")
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
            '                notes = "Generated from remaining normal zone candidates; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "zone", "coverage-only", "generated-wave2", "remaining-normal-zone", "'
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
    report = load_report(Path(args.remaining))
    rows = sorted(
        report["buckets"]["normal_zones"],
        key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]),
    )
    output = Path(args.out)
    output.write_text(render_module(rows), encoding="utf-8")
    print(f"Generated second-wave normal zones: {len(rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
