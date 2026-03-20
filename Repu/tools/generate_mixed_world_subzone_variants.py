#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from coverage_key_utils import esc_lua, normalized_subzone_key


EXPLICIT_KEEP_SUBZONE_IDS = {
    448,   # Der Jadewald
    486,   # Krasarangwildnis
    498,   # Krasarangwildnis
    520,   # Tal der Ewigen Blüten
    523,   # Dun Morogh
    577,   # Tanaandschungel
    594,   # Shattrath
    696,   # Sturmheim
    1012,  # Sturmwind
    1181,  # Zuldazar
    1534,  # Orgrimmar
    1535,  # Durotar
    1603,  # Ardenwald
    1642,  # Val'sharah
    1688,  # Revendreth
    1689,  # Maldraxxus
    1709,  # Ardenwald
    1734,  # Revendreth
    2005,  # Ardenwald
    2135,  # Valdrakken
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate coverage for explicitly approved mixed/manual world subzone variants."
    )
    parser.add_argument(
        "--families",
        default="/tmp/repu_variant_families.json",
        help="Path to the variant-family manifest.",
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail/coverage_mixed_world_subzones_generated.lua",
        help="Where to write the generated mixed-world-variant coverage module.",
    )
    return parser.parse_args()


def load_manifest(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def collect_rows(manifest: dict) -> list[dict]:
    rows = []
    for family in manifest["families"]:
        if family["familyClass"] != "mixed_or_manual_review":
            continue
        for entry in family["entries"]:
            if entry["kind"] != "subZone":
                continue
            if entry["mapID"] not in EXPLICIT_KEEP_SUBZONE_IDS:
                continue
            rows.append(
                {
                    "name": entry["name"],
                    "group": entry["group"],
                    "mapID": entry["mapID"],
                    "key": entry["key"],
                }
            )
    rows.sort(key=lambda row: (row["group"].lower(), row["name"].lower(), row["mapID"]))
    return rows


def render_module(rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from explicitly approved mixed/manual world subzone variants.")
    lines.append("-- This file keeps only world-facing subzones from mixed duplicate-name families.")
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
            '                notes = "Generated coverage for an approved mixed/manual world subzone variant; faction mapping pending.",'
        )
        lines.append(f"                mapIDs = {{ {row['mapID']} }},")
        lines.append(f'                subZoneKeys = {{ "{name}" }},')
        lines.append(
            '                tags = { "subzone", "coverage-only", "generated-variant", "mixed-world-variant", "'
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
    rows = collect_rows(manifest)
    output = Path(args.out)
    output.write_text(render_module(rows), encoding="utf-8")

    print(f"Generated mixed/manual world subzone variants: {len(rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
