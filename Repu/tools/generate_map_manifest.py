#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path


NODE_PATTERN = re.compile(
    r'\["(?P<id>\d+)"\]\s*=\s*\{.*?\["mapType"\]\s*=\s*(?P<mapType>\d+),.*?\["mapID"\]\s*=\s*(?P<mapID>\d+),.*?\["name"\]\s*=\s*"(?P<name>[^"]*)".*?\["childCount"\]\s*=\s*(?P<childCount>\d+),.*?\["parentMapID"\]\s*=\s*(?P<parent>\d+),',
    re.S,
)
ROOTS_PATTERN = re.compile(r'\["roots"\]\s*=\s*\{(?P<body>.*?)\}', re.S)
SCANNED_AT_PATTERN = re.compile(r'\["scannedAt"\]\s*=\s*"(?P<value>[^"]+)"')

TYPE_BUCKETS = {
    0: "cosmic",
    1: "world",
    2: "continents",
    3: "zones",
    4: "instances",
    5: "micro",
    6: "hubs",
}

KEEP_BUCKETS = ("continents", "zones", "hubs")

VARIANT_MARKERS = (
    "scenario",
    "szenario",
    "event",
    "vision",
    "visions",
    "test",
    "intro",
    "phase",
    "phasing",
    "micro",
    "brawl",
    "arena",
    "skirmish",
)

SPECIAL_MARKERS = (
    "disabled",
    "deaktiviert",
    "angriff auf",
    "attack on",
    "schlacht",
    "brawl",
    "prüfung",
    "test",
)

PVP_MARKERS = (
    "alteractal",
    "arathibecken",
    "arena",
    "kriegshymnenschlucht",
    "warsong",
    "tol'viron",
    "tiefenwindschlucht",
    "seething shore",
    "kochendes küstenland",
    "auge des sturms",
    "eye of the storm",
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build a reviewable manifest from RepuDB.debug.mapScan."
    )
    parser.add_argument(
        "--savedvars",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/WTF/Account/120661425#1/SavedVariables/Repu.lua",
        help="Path to Repu SavedVariables file.",
    )
    parser.add_argument(
        "--json-out",
        default="/tmp/repu_mapscan_manifest.json",
        help="Where to write the JSON manifest.",
    )
    parser.add_argument(
        "--lua-out",
        default="/tmp/repu_mapscan_manifest.lua",
        help="Where to write the Lua manifest.",
    )
    return parser.parse_args()


def normalize_name(value: str) -> str:
    value = value.strip().lower()
    value = re.sub(r"\s+", " ", value)
    return value


def parse_mapscan(savedvars_text: str) -> tuple[list[dict], list[int], str | None]:
    start = savedvars_text.find('["mapScan"]')
    if start == -1:
        raise RuntimeError("mapScan not found in SavedVariables")

    end = savedvars_text.find('["runtime"]', start)
    blob = savedvars_text[start : end if end != -1 else None]

    nodes = []
    for match in NODE_PATTERN.finditer(blob):
        nodes.append(
            {
                "mapID": int(match.group("mapID")),
                "mapType": int(match.group("mapType")),
                "name": match.group("name"),
                "childCount": int(match.group("childCount")),
                "parentMapID": int(match.group("parent")),
            }
        )

    roots_match = ROOTS_PATTERN.search(blob)
    roots = (
        [int(value) for value in re.findall(r"\b(\d+)\b", roots_match.group("body"))]
        if roots_match
        else []
    )

    scanned_at_match = SCANNED_AT_PATTERN.search(blob)
    scanned_at = scanned_at_match.group("value") if scanned_at_match else None

    return nodes, roots, scanned_at


def parent_name_lookup(nodes: list[dict]) -> dict[int, str]:
    return {node["mapID"]: node["name"] for node in nodes}


def compute_name_groups(nodes: list[dict]) -> dict[str, list[dict]]:
    groups: dict[str, list[dict]] = defaultdict(list)
    for node in nodes:
        if TYPE_BUCKETS.get(node["mapType"]) not in KEEP_BUCKETS:
            continue
        groups[normalize_name(node["name"])].append(node)
    return groups


def is_variant_candidate(node: dict, name_group_size: int) -> bool:
    name_key = normalize_name(node["name"])
    if name_group_size > 1:
        return True
    lowered = name_key
    if any(marker in lowered for marker in VARIANT_MARKERS):
        return True
    return False


def get_review_reasons(node: dict, name_group_size: int) -> list[str]:
    reasons: list[str] = []
    lowered = normalize_name(node["name"])

    if name_group_size > 1:
        reasons.append("duplicate_name")

    if any(marker in lowered for marker in VARIANT_MARKERS):
        reasons.append("variant_marker")

    if any(marker in lowered for marker in SPECIAL_MARKERS):
        reasons.append("special_marker")

    if any(marker in lowered for marker in PVP_MARKERS):
        reasons.append("pvp_marker")

    if re.match(r"^\d+\.\d+\s*-\s*", lowered):
        reasons.append("build_prefix")

    if node["parentMapID"] == 0 and node["mapType"] not in (0, 1):
        reasons.append("unexpected_root")

    deduped: list[str] = []
    for reason in reasons:
        if reason not in deduped:
            deduped.append(reason)
    return deduped


def choose_candidate_class(node: dict, review_reasons: list[str]) -> str:
    if "pvp_marker" in review_reasons:
        return "pvp_or_event"
    if "special_marker" in review_reasons or "build_prefix" in review_reasons:
        return "special"
    if "duplicate_name" in review_reasons or "variant_marker" in review_reasons:
        return "variant"
    if node["mapType"] == 2:
        return "continent"
    if node["mapType"] == 3:
        return "zone"
    if node["mapType"] == 6:
        return "hub"
    return "other"


def build_manifest(nodes: list[dict], roots: list[int], scanned_at: str | None) -> dict:
    parents = parent_name_lookup(nodes)
    raw_counts = Counter(TYPE_BUCKETS.get(node["mapType"], "other") for node in nodes)
    name_groups = compute_name_groups(nodes)

    buckets: dict[str, list[dict]] = {bucket: [] for bucket in KEEP_BUCKETS}
    for node in sorted(nodes, key=lambda item: (item["mapType"], item["name"].lower(), item["mapID"])):
        bucket = TYPE_BUCKETS.get(node["mapType"])
        if bucket not in KEEP_BUCKETS:
            continue

        name_key = normalize_name(node["name"])
        group = name_groups.get(name_key, [])
        review_reasons = get_review_reasons(node, len(group))
        entry = {
            "mapID": node["mapID"],
            "name": node["name"],
            "nameKey": name_key,
            "mapType": node["mapType"],
            "parentMapID": node["parentMapID"],
            "parentName": parents.get(node["parentMapID"]),
            "childCount": node["childCount"],
            "duplicateName": len(group) > 1,
            "nameVariantCount": len(group),
            "variantCandidate": is_variant_candidate(node, len(group)),
            "reviewReasons": review_reasons,
            "needsReview": bool(review_reasons),
            "candidateClass": choose_candidate_class(node, review_reasons),
            "mapBasisEligible": not any(
                reason in {"special_marker", "build_prefix", "pvp_marker"}
                for reason in review_reasons
            ),
            "source": "client_scan",
        }
        buckets[bucket].append(entry)

    bucket_counts = {bucket: len(entries) for bucket, entries in buckets.items()}
    duplicate_names = sum(1 for entries in name_groups.values() if len(entries) > 1)
    review_count = sum(
        1 for entries in buckets.values() for entry in entries if entry["needsReview"]
    )
    variant_count = sum(
        1 for entries in buckets.values() for entry in entries if entry["variantCandidate"]
    )
    class_counts = Counter(
        entry["candidateClass"] for entries in buckets.values() for entry in entries
    )
    eligible_count = sum(
        1 for entries in buckets.values() for entry in entries if entry["mapBasisEligible"]
    )

    manifest = {
        "meta": {
            "generatedAt": datetime.now(timezone.utc).replace(microsecond=0).isoformat(),
            "scannedAt": scanned_at,
            "roots": roots,
            "rawNodeCount": len(nodes),
            "rawTypeCounts": dict(raw_counts),
            "bucketCounts": bucket_counts,
            "duplicateNameGroups": duplicate_names,
            "variantCandidates": variant_count,
            "reviewCandidates": review_count,
            "candidateClassCounts": dict(class_counts),
            "mapBasisEligible": eligible_count,
        },
        "buckets": buckets,
    }
    return manifest


def to_lua(value, indent: int = 0) -> str:
    prefix = " " * indent
    if isinstance(value, dict):
        lines = ["{"]
        for key, item in value.items():
            safe_key = key if re.match(r"^[A-Za-z_][A-Za-z0-9_]*$", key) else f'["{key}"]'
            lines.append(f"{prefix}    {safe_key} = {to_lua(item, indent + 4)},")
        lines.append(f"{prefix}}}")
        return "\n".join(lines)
    if isinstance(value, list):
        lines = ["{"]
        for item in value:
            lines.append(f"{prefix}    {to_lua(item, indent + 4)},")
        lines.append(f"{prefix}}}")
        return "\n".join(lines)
    if isinstance(value, str):
        escaped = value.replace("\\", "\\\\").replace('"', '\\"')
        return f'"{escaped}"'
    if value is True:
        return "true"
    if value is False:
        return "false"
    if value is None:
        return "nil"
    return str(value)


def main() -> int:
    args = parse_args()
    savedvars_path = Path(args.savedvars)
    json_out = Path(args.json_out)
    lua_out = Path(args.lua_out)

    text = savedvars_path.read_text(encoding="utf-8", errors="ignore")
    nodes, roots, scanned_at = parse_mapscan(text)
    manifest = build_manifest(nodes, roots, scanned_at)

    json_out.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    lua_out.write_text("-- Generated from RepuDB.debug.mapScan\nreturn " + to_lua(manifest) + "\n", encoding="utf-8")

    print(f"SavedVariables: {savedvars_path}")
    print(f"Raw nodes: {manifest['meta']['rawNodeCount']}")
    print(f"Continents: {manifest['meta']['bucketCounts']['continents']}")
    print(f"Zones: {manifest['meta']['bucketCounts']['zones']}")
    print(f"Hubs: {manifest['meta']['bucketCounts']['hubs']}")
    print(f"Duplicate name groups: {manifest['meta']['duplicateNameGroups']}")
    print(f"Variant candidates: {manifest['meta']['variantCandidates']}")
    print(f"Review candidates: {manifest['meta']['reviewCandidates']}")
    print(f"Map-basis eligible: {manifest['meta']['mapBasisEligible']}")
    print(f"Wrote JSON: {json_out}")
    print(f"Wrote Lua: {lua_out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
