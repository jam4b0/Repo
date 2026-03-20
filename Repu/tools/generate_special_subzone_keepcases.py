#!/usr/bin/env python3

from __future__ import annotations

import argparse
from pathlib import Path

from coverage_key_utils import esc_lua, normalized_subzone_key


KEEP_ROWS = [
    {"mapID": 1531, "key": "1531:Dreckopolis", "name": "Dreckopolis", "group": "Kezan", "tag": "special-subzone-keep"},
    {"mapID": 1532, "key": "1532:Dreckopolis", "name": "Dreckopolis", "group": "Kezan", "tag": "special-subzone-keep"},
    {"mapID": 427, "key": "427:Eisklammtal", "name": "Eisklammtal", "group": "Dun Morogh", "tag": "special-subzone-keep"},
    {"mapID": 834, "key": "834:Eisklammtal", "name": "Eisklammtal", "group": "Dun Morogh", "tag": "special-subzone-keep"},
    {"mapID": 971, "key": "971:Telogrusriss", "name": "Telogrusriss", "group": "Die Verheerten Inseln", "tag": "special-subzone-keep"},
    {"mapID": 972, "key": "972:Telogrusriss", "name": "Telogrusriss", "group": "Die Verheerten Inseln", "tag": "special-subzone-keep"},
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate explicit keep-cases for the last approved retail special subzones."
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_special_subzones_generated.lua",
        help="Where to write the generated special-subzone coverage module.",
    )
    return parser.parse_args()


def render_module(rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated explicit keep-cases for the last approved retail special subzones.")
    lines.append("ns.Data:RegisterRetailModule({")
    lines.append("    locations = {")
    lines.append("        zones = {},")
    lines.append("        subZones = {")
    for row in rows:
        key = normalized_subzone_key(row["mapID"], row["name"])
        name = esc_lua(row["name"])
        group_name = esc_lua(row["group"])
        tag = esc_lua(row["tag"])
        lines.append(f'            ["{key}"] = {{')
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated explicit keep-case for a special retail subzone skeleton entry; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(f'                subZoneKeys = {{ "{name}" }},')
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
    print(f"Generated special keep-case subZones: {len(KEEP_ROWS)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
