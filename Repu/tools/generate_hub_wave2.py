#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from coverage_key_utils import esc_lua, normalized_subzone_key


EXPLICIT_HUB_KEEP = {
    1662,  # Konservatorium der Königin
    622,   # Sturmschild
    338,   # Geschmolzene Front
    2345,  # Tiefbeuteschlucht
    1648,  # Der Schlund
    750,   # Donnertotem
    218,   # Ruinen von Gilneas (Stadt)
    2146,  # Östliche Lichtungen
    793,   # Rabenwehr
    1468,  # Der Hain der Träume
}

EXPLICIT_HUB_EXCLUDE = {
    1917, 1717, 1715, 1691, 1711, 1560, 760, 447, 2431, 671, 1971, 694, 645,
    488, 1013, 908, 128, 1558, 169, 903, 234, 757, 2330, 1472, 731, 273, 274,
    327, 487, 450, 843, 2092, 1644, 1755, 206, 1479, 247, 904, 877, 649, 2085,
    277, 758, 733, 623, 571, 124,
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate explicit second-wave retail hub coverage keep-cases."
    )
    parser.add_argument(
        "--remaining",
        default="/tmp/repu_remaining_candidates.json",
        help="Path to the remaining-candidates JSON report.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_hubs_wave2_generated.lua",
        help="Where to write the generated hub coverage module.",
    )
    return parser.parse_args()


def load_report(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def collect_rows(report: dict) -> tuple[list[dict], list[dict]]:
    keep_rows = []
    excluded_rows = []
    for row in report["buckets"]["normal_hubs"]:
        payload = {
            "mapID": row["mapID"],
            "name": row["name"],
            "group": row["group"],
            "key": row["key"],
        }
        if row["mapID"] in EXPLICIT_HUB_KEEP:
            keep_rows.append(payload)
        elif row["mapID"] in EXPLICIT_HUB_EXCLUDE:
            excluded_rows.append(payload)
    keep_rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    excluded_rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    return keep_rows, excluded_rows


def render_module(rows: list[dict], excluded_rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from explicit second-wave hub review.")
    lines.append("-- This file keeps only outdoor or hub-like subzones that are safe enough for coverage.")
    for row in excluded_rows:
        lines.append(
            "-- excluded hub: %s (%s, mapID=%d)"
            % (row["name"], row["group"], row["mapID"])
        )
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
            '                notes = "Generated explicit keep-case for a reviewed hub/subzone; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(f'                subZoneKeys = {{ "{name}" }},')
        lines.append(
            '                tags = { "subzone", "coverage-only", "generated-review", "reviewed-hub-keep", "'
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
    keep_rows, excluded_rows = collect_rows(report)
    output = Path(args.out)
    output.write_text(render_module(keep_rows, excluded_rows), encoding="utf-8")

    print(f"Generated kept hubs: {len(keep_rows)}")
    print(f"Documented excluded hubs: {len(excluded_rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
