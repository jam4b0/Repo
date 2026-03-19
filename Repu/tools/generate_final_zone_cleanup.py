#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


KEEP_ZONE_IDS = {
    174,   # Die Verlorenen Inseln
    463,   # Echoinseln
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate the final curated keep-set from remaining zone candidates."
    )
    parser.add_argument(
        "--remaining",
        default="/tmp/repu_remaining_candidates.json",
        help="Path to the remaining-candidates JSON report.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_cleanup_generated.lua",
        help="Where to write the generated cleanup module.",
    )
    return parser.parse_args()


def load_report(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def collect_keep_rows(report: dict) -> list[dict]:
    rows = []
    for bucket in ("normal_zones", "technical_or_ui"):
        for row in report["buckets"][bucket]:
            if row["kind"] == "zone" and row["mapID"] in KEEP_ZONE_IDS:
                rows.append(row)
    rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    return rows


def render_module(rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from final remaining-zone cleanup.")
    lines.append("-- Only explicit keep-cases are included here.")
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
            '                notes = "Generated final cleanup keep-case from remaining candidates; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(
            '                tags = { "zone", "coverage-only", "generated-cleanup", "remaining-keep", "'
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
    rows = collect_keep_rows(report)
    output = Path(args.out)
    output.write_text(render_module(rows), encoding="utf-8")
    print(f"Generated final cleanup keep zones: {len(rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
