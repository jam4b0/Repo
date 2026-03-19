#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
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


HUB_BLOCKLIST = (
    "aberrus",
    "alptraum",
    "arena",
    "azmerloth",
    "baines rettung",
    "braumondfest",
    "brodelnde küste",
    "brunnen der ewigkeit",
    "das schwarze imperium",
    "das verlies",
    "deprecated",
    "der gnollkrieg",
    "der mahlstrom",
    "dunkelmond",
    "feuerlande",
    "gnollkrieg",
    "großer invasionspunkt",
    "herz von azeroth",
    "himmelsfeste",
    "höllenschlund",
    "inseln",
    "invasionspunkt",
    "krieg",
    "markt",
    "pandarenrevolution",
    "ruinen von lordaeron",
    "schmelztiegel",
    "schwarze imperium",
    "tazavesh",
    "thorghast",
    "verhüllte",
)

SAFE_HUB_GROUPS = {
    "Die Östlichen Königreiche",
    "Kalimdor",
    "Nordend",
    "Pandaria",
    "Draenor",
    "Khaz Algar",
    "Quel'Thalas",
    "Kul Tiras",
    "Zandalar",
}


def normalize_name(value: str) -> str:
    value = value.strip().lower()
    value = re.sub(r"\s+", " ", value)
    return value


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


def is_safe_hub(row: dict, group_name: str) -> bool:
    if row.get("candidateClass") != "hub":
        return False
    if row.get("reviewReasons"):
        return False
    if group_name not in SAFE_HUB_GROUPS:
        return False

    name = normalize_name(row["name"])
    if any(marker in name for marker in HUB_BLOCKLIST):
        return False
    if any(char in row["name"] for char in (":", ",", "[", "]")):
        return False
    if len(name) < 4:
        return False
    return True


def collect_subzone_rows(report: dict) -> list[dict]:
    rows: list[dict] = []
    for group in report["groups"]:
        for row in group["subZones"]:
            if not is_safe_hub(row, group["name"]):
                continue
            rows.append(
                {
                    "mapID": row["mapID"],
                    "key": row["key"],
                    "name": row["name"],
                    "groupName": group["name"],
                }
            )
    rows.sort(key=lambda item: (item["groupName"].lower(), item["name"].lower(), item["mapID"]))
    return rows


def render_module(zone_rows: list[dict], subzone_rows: list[dict]) -> str:
    lines = []
    lines.append("local _, ns = ...")
    lines.append("")
    lines.append("-- Generated from client seed review. This file upgrades broad coverage only;")
    lines.append("-- it intentionally does not invent faction mappings.")
    lines.append("ns.Data:RegisterRetailModule({")
    lines.append("    locations = {")
    lines.append("        zones = {")
    for row in zone_rows:
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
    lines.append("        subZones = {")
    for row in subzone_rows:
        key = row["key"].replace("\\", "\\\\").replace('"', '\\"')
        name = row["name"].replace("\\", "\\\\").replace('"', '\\"')
        group_name = row["groupName"].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f'            ["{key}"] = {{')
        lines.append(f'                name = "{name}",')
        lines.append('                source = "seed",')
        lines.append('                confidence = "medium",')
        lines.append(
            '                notes = "Generated reviewed hub coverage from client_seed priority matrix; faction mapping pending.",'
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
    zone_rows = collect_zone_rows(priority)
    subzone_rows = collect_subzone_rows(priority)
    output = Path(args.out)
    output.write_text(render_module(zone_rows, subzone_rows), encoding="utf-8")

    print(f"Generated reviewed coverage zones: {len(zone_rows)}")
    print(f"Generated reviewed coverage subZones: {len(subzone_rows)}")
    print(f"Wrote module: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
