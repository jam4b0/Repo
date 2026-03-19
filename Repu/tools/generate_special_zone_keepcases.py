#!/usr/bin/env python3

from __future__ import annotations

import argparse
from pathlib import Path


KEEP_ROWS = [
    {"mapID": 276, "name": "Der Mahlstrom", "group": "Der Mahlstrom", "tag": "technical-root-keep"},
    {"mapID": 790, "name": "Das Auge Azsharas", "group": "Die Verheerten Inseln", "tag": "instance-zone-keep"},
    {"mapID": 2472, "name": "Tazavesh", "group": "K'aresh", "tag": "instance-zone-keep"},
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate explicit keep-cases for the final open retail zone skeleton."
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_special_zones_generated.lua",
        help="Where to write the generated special-zone coverage module.",
    )
    return parser.parse_args()


def render_module(rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated explicit keep-cases for the last remaining open retail zone skeleton entries.")
    lines.append("ns.Data:RegisterRetailModule({")
    lines.append("    locations = {")
    lines.append("        zones = {")
    for row in rows:
        name = row["name"].replace("\\", "\\\\").replace('"', '\\"')
        group_name = row["group"].replace("\\", "\\\\").replace('"', '\\"')
        tag = row["tag"].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f"            [{row['mapID']}] = {{")
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated explicit keep-case for a special retail zone skeleton entry; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "zone", "coverage-only", "generated-review", "'
            + tag
            + '", "'
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
    output = Path(args.out)
    output.write_text(render_module(KEEP_ROWS), encoding="utf-8")
    print(f"Generated special keep-case zones: {len(KEEP_ROWS)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
