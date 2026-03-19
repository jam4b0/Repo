#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a Repu seed skeleton from a map-scan manifest."
    )
    parser.add_argument(
        "--manifest",
        default="/tmp/repu_mapscan_manifest.json",
        help="Path to the JSON manifest generated from mapScan.",
    )
    parser.add_argument(
        "--lua-out",
        default="/tmp/repu_generated_seed.lua",
        help="Where to write the Lua seed skeleton.",
    )
    parser.add_argument(
        "--json-out",
        default="/tmp/repu_generated_seed.json",
        help="Where to write the JSON seed skeleton.",
    )
    parser.add_argument(
        "--module-out",
        default="",
        help="Optional path for a generated Repu retail module file.",
    )
    return parser.parse_args()


def load_manifest(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def normalize_zone_entry(entry: dict) -> dict:
    return {
        "name": entry["name"],
        "source": "client_seed",
        "confidence": "low",
        "mapIDs": [entry["mapID"]],
        "factionIDs": [],
        "notes": "Generated from client map scan; faction mapping pending review.",
        "tags": ["generated", "client_scan", entry["candidateClass"]],
    }


def normalize_subzone_entry(entry: dict) -> dict:
    key = f'{entry["mapID"]}:{entry["name"]}'
    return key, {
        "name": entry["name"],
        "source": "client_seed",
        "confidence": "low",
        "mapIDs": [entry["mapID"]],
        "factionIDs": [],
        "notes": "Generated hub/subzone from client map scan; faction mapping pending review.",
        "tags": ["generated", "client_scan", entry["candidateClass"]],
    }


def build_seed(manifest: dict) -> dict:
    locations = {
        "zones": {},
        "subZones": {},
        "instances": {},
        "raids": {},
    }

    for entry in manifest["buckets"]["zones"]:
        if not entry.get("mapBasisEligible"):
            continue
        if entry.get("candidateClass") not in {"zone", "variant"}:
            continue
        locations["zones"][str(entry["mapID"])] = normalize_zone_entry(entry)

    for entry in manifest["buckets"]["hubs"]:
        if not entry.get("mapBasisEligible"):
            continue
        if entry.get("candidateClass") not in {"hub", "variant"}:
            continue
        key, subzone = normalize_subzone_entry(entry)
        locations["subZones"][key] = subzone

    meta = {
        "source": "client_seed",
        "confidence": "low",
        "rawNodeCount": manifest["meta"]["rawNodeCount"],
        "bucketCounts": manifest["meta"]["bucketCounts"],
        "mapBasisEligible": manifest["meta"]["mapBasisEligible"],
        "generatedAt": manifest["meta"]["generatedAt"],
        "scannedAt": manifest["meta"]["scannedAt"],
        "roots": manifest["meta"]["roots"],
    }

    return {
        "meta": meta,
        "locations": locations,
    }


def render_lua(seed: dict) -> str:
    def esc(value: str) -> str:
        return value.replace("\\", "\\\\").replace('"', '\\"')

    lines = []
    lines.append("-- Generated from Repu map manifest")
    lines.append("return {")
    lines.append("    meta = {")
    for key in ("source", "confidence", "rawNodeCount", "mapBasisEligible", "generatedAt", "scannedAt"):
        value = seed["meta"][key]
        if isinstance(value, str):
            lines.append(f'        {key} = "{esc(value)}",')
        else:
            lines.append(f"        {key} = {value},")
    lines.append("        roots = { " + ", ".join(str(v) for v in seed["meta"]["roots"]) + " },")
    lines.append("    },")
    lines.append("    locations = {")

    lines.append("        zones = {")
    for map_id in sorted(seed["locations"]["zones"], key=lambda value: int(value)):
        entry = seed["locations"]["zones"][map_id]
        lines.append(f"            [{map_id}] = {{")
        lines.append(f'                name = "{esc(entry["name"])}",')
        lines.append('                source = "client_seed",')
        lines.append('                confidence = "low",')
        lines.append(f"                mapIDs = {{ {entry['mapIDs'][0]} }},")
        lines.append("                factionIDs = {},")
        lines.append(f'                notes = "{esc(entry["notes"])}",')
        lines.append(
            "                tags = { "
            + ", ".join(f'"{esc(tag)}"' for tag in entry["tags"])
            + " },"
        )
        lines.append("            },")
    lines.append("        },")

    lines.append("        subZones = {")
    for key in sorted(seed["locations"]["subZones"]):
        entry = seed["locations"]["subZones"][key]
        lines.append(f'            ["{esc(key)}"] = {{')
        lines.append(f'                name = "{esc(entry["name"])}",')
        lines.append('                source = "client_seed",')
        lines.append('                confidence = "low",')
        lines.append(f"                mapIDs = {{ {entry['mapIDs'][0]} }},")
        lines.append("                factionIDs = {},")
        lines.append(f'                notes = "{esc(entry["notes"])}",')
        lines.append(
            "                tags = { "
            + ", ".join(f'"{esc(tag)}"' for tag in entry["tags"])
            + " },"
        )
        lines.append("            },")
    lines.append("        },")

    lines.append("        instances = {},")
    lines.append("        raids = {},")
    lines.append("    },")
    lines.append("}")
    return "\n".join(lines) + "\n"


def render_module(seed: dict) -> str:
    base = render_lua(seed)
    payload = base.split("return ", 1)[1]
    lines = [
        "local _, ns = ...",
        "",
        "-- Generated from client map scan manifest. Keep out of the TOC until reviewed.",
        "ns.Data:RegisterRetailModule(" + payload.rstrip() + ")",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    args = parse_args()
    manifest_path = Path(args.manifest)
    lua_out = Path(args.lua_out)
    json_out = Path(args.json_out)
    module_out = Path(args.module_out) if args.module_out else None

    manifest = load_manifest(manifest_path)
    seed = build_seed(manifest)

    json_out.write_text(json.dumps(seed, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    lua_out.write_text(render_lua(seed), encoding="utf-8")
    if module_out:
        module_out.write_text(render_module(seed), encoding="utf-8")

    print(f"Manifest: {manifest_path}")
    print(f"Generated zones: {len(seed['locations']['zones'])}")
    print(f"Generated subZones: {len(seed['locations']['subZones'])}")
    print(f"Wrote JSON: {json_out}")
    print(f"Wrote Lua: {lua_out}")
    if module_out:
        print(f"Wrote Module: {module_out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
