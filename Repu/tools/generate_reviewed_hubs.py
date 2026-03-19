#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from generate_reviewed_coverage import collect_subzone_rows  # type: ignore


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a conservative reviewed retail hub coverage module."
    )
    parser.add_argument(
        "--priority",
        default="/tmp/repu_curation_priority.json",
        help="Path to the priority report JSON.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_hubs_generated.lua",
        help="Where to write the generated retail hub coverage module.",
    )
    return parser.parse_args()


def load_priority(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def render_module(rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from client seed review. This file only upgrades conservative hub coverage;")
    lines.append("-- it intentionally does not invent faction mappings.")
    lines.append("ns.Data:RegisterRetailModule({")
    lines.append("    locations = {")
    lines.append("        zones = {},")
    lines.append("        subZones = {")
    for row in rows:
        key = row["key"].replace("\\", "\\\\").replace('"', '\\"')
        name = row["name"].replace("\\", "\\\\").replace('"', '\\"')
        group_name = row["groupName"].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f'            ["{key}"] = {{')
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated conservative hub coverage from client_seed priority matrix; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "subzone", "coverage-only", "generated-review", "client-seed-reviewed", "'
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
    priority = load_priority(Path(args.priority))
    rows = collect_subzone_rows(priority)
    output = Path(args.out)
    output.write_text(render_module(rows), encoding="utf-8")

    print(f"Generated reviewed hub coverage subZones: {len(rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
