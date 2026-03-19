#!/usr/bin/env python3

from __future__ import annotations

import argparse
from pathlib import Path


KEEP_ROWS = [
    {"mapID": 717, "key": "717:Schreckensnarbe", "name": "Schreckensnarbe", "group": "Die Verheerten Inseln", "tag": "final-subzone-keep"},
    {"mapID": 718, "key": "718:Schreckensnarbe", "name": "Schreckensnarbe", "group": "Die Verheerten Inseln", "tag": "final-subzone-keep"},
    {"mapID": 417, "key": "417:Tempel von Katmogu", "name": "Tempel von Katmogu", "group": "Tal der Ewigen Blüten", "tag": "final-subzone-keep"},
    {"mapID": 449, "key": "449:Tempel von Katmogu", "name": "Tempel von Katmogu", "group": "Tal der Ewigen Blüten", "tag": "final-subzone-keep"},
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate final explicit keep-cases for the last retail subzone coverage candidates."
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_final_subzones_generated.lua",
        help="Where to write the generated final-subzone coverage module.",
    )
    return parser.parse_args()


def render_module(rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated explicit keep-cases for the last remaining retail subzone coverage candidates.")
    lines.append("ns.Data:RegisterRetailModule({")
    lines.append("    locations = {")
    lines.append("        zones = {},")
    lines.append("        subZones = {")
    for row in rows:
        key = row["key"].replace("\\", "\\\\").replace('"', '\\"')
        name = row["name"].replace("\\", "\\\\").replace('"', '\\"')
        group_name = row["group"].replace("\\", "\\\\").replace('"', '\\"')
        tag = row["tag"].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f'            ["{key}"] = {{')
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated explicit keep-case for a final retail subzone coverage candidate; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "subzone", "coverage-only", "generated-review", "'
            + tag
            + '", "'
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
    output = Path(args.out)
    output.write_text(render_module(KEEP_ROWS), encoding="utf-8")
    print(f"Generated final keep-case subZones: {len(KEEP_ROWS)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
