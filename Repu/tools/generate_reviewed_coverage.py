#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a reviewed retail coverage module from client-seed candidates."
    )
    parser.add_argument(
        "--priority",
        default="/tmp/repu_curation_priority.json",
        help="Path to the priority report JSON.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_generated.lua",
        help="Where to write the generated retail coverage module.",
    )
    return parser.parse_args()


def load_priority(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def collect_zone_rows(report: dict) -> list[dict]:
    rows: list[dict] = []
    for group in report["groups"]:
        for row in group["zones"]:
            if row.get("candidateClass") != "zone":
                continue
            rows.append(
                {
                    "mapID": row["mapID"],
                    "name": row["name"],
                    "groupName": group["name"],
                }
            )
    rows.sort(key=lambda item: (item["groupName"].lower(), item["name"].lower(), item["mapID"]))
    return rows


def render_module(rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from client seed review. This file only upgrades zone coverage;")
    lines.append("-- it intentionally does not invent faction mappings.")
    lines.append("ns.Data:RegisterRetailModule({")
    lines.append("    locations = {")
    lines.append("        zones = {")
    for row in rows:
        name = row["name"].replace("\\", "\\\\").replace('"', '\\"')
        group_name = row["groupName"].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f"            [{row['mapID']}] = {{")
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated reviewed coverage from client_seed priority matrix; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "zone", "coverage-only", "generated-review", "client-seed-reviewed", "'
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
    rows = collect_zone_rows(priority)
    output = Path(args.out)
    output.write_text(render_module(rows), encoding="utf-8")

    print(f"Generated reviewed coverage zones: {len(rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
