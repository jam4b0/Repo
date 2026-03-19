#!/usr/bin/env python3

from __future__ import annotations

import json
import re
from collections import Counter, defaultdict
from pathlib import Path


ROOT = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail")
OUT = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/tools/retail_faction_backlog.json")

SECTION_RE = re.compile(r"^\s*(zones|subZones|instances|raids)\s*=\s*\{\s*$")
RECORD_START_RE = re.compile(r"^\s*(\[[^\]]+\])\s*=\s*\{\s*$")
NAME_RE = re.compile(r'name\s*=\s*"([^"]+)"')
NOTES_RE = re.compile(r'notes\s*=\s*"([^"]+)"')
MAP_IDS_RE = re.compile(r"mapIDs\s*=\s*\{([^}]*)\}")
TAG_RE = re.compile(r'tags\s*=\s*\{([^}]*)\}')

SKIP_FILES = {"core.lua", "retail.lua"}
RESOLVED_STATUSES = {"mapped", "no_local_reputation", "variant_only"}


def parse_tags(block: str) -> list[str]:
    match = TAG_RE.search(block)
    if not match:
        return []
    return re.findall(r'"([^"]+)"', match.group(1))


def parse_map_ids(block: str) -> list[int]:
    match = MAP_IDS_RE.search(block)
    if not match:
        return []
    return [int(value) for value in re.findall(r"\d+", match.group(1))]


def normalize_name(value: str) -> str:
    return re.sub(r"\s+", " ", value.strip().lower())


def identity_keys(record: dict) -> list[tuple]:
    keys = [("name", record["section"], normalize_name(record["name"]))]
    if record["mapIDs"]:
        keys.append(("maps", record["section"], tuple(sorted(record["mapIDs"]))))
    return keys


def parse_records(path: Path) -> list[dict]:
    lines = path.read_text(encoding="utf-8").splitlines()
    records: list[dict] = []
    section: str | None = None
    i = 0

    while i < len(lines):
        line = lines[i]
        section_match = SECTION_RE.match(line)
        if section_match:
            section = section_match.group(1)
            i += 1
            continue

        record_match = RECORD_START_RE.match(line)
        if section and record_match:
            key = record_match.group(1)
            block_lines = [line]
            brace_depth = line.count("{") - line.count("}")
            i += 1
            while i < len(lines) and brace_depth > 0:
                block_lines.append(lines[i])
                brace_depth += lines[i].count("{") - lines[i].count("}")
                i += 1
            block = "\n".join(block_lines)

            name_match = NAME_RE.search(block)
            if not name_match:
                continue

            tags = parse_tags(block)
            has_mapping = "factionIDs" in block or "factions = {" in block
            no_local = "no-local-reputation" in tags
            variant = any(
                tag in tags
                for tag in (
                    "variant",
                    "variant-catalog",
                    "variant-separated",
                    "world-phasing-variant",
                    "warfront-variant",
                    "assault-variant",
                    "story-phase-variant",
                    "legion-world-state",
                )
            )
            coverage_only = "coverage-only" in tags

            is_secondary_generated = path.name.startswith("coverage_")

            if has_mapping:
                status = "mapped"
            elif no_local:
                status = "no_local_reputation"
            elif variant:
                status = "variant_only"
            elif is_secondary_generated:
                status = "generated_secondary"
            elif coverage_only:
                status = "needs_manual_review"
            else:
                status = "unclassified"

            notes_match = NOTES_RE.search(block)
            records.append(
                {
                    "file": path.name,
                    "section": section,
                    "key": key,
                    "name": name_match.group(1),
                    "status": status,
                    "hasMapping": has_mapping,
                    "coverageOnly": coverage_only,
                    "noLocalReputation": no_local,
                    "variant": variant,
                    "tags": tags,
                    "mapIDs": parse_map_ids(block),
                    "notes": notes_match.group(1) if notes_match else "",
                    "secondaryGenerated": is_secondary_generated,
                }
            )
            continue

        i += 1

    return records


def build_report() -> dict:
    records: list[dict] = []
    for path in sorted(ROOT.glob("*.lua")):
        if path.name in SKIP_FILES:
            continue
        records.extend(parse_records(path))

    counter = Counter(record["status"] for record in records)
    section_counter = Counter((record["section"], record["status"]) for record in records)

    by_identity: dict[tuple, list[dict]] = defaultdict(list)
    for record in records:
        for identity in identity_keys(record):
            by_identity[identity].append(record)

    manual = [
        record
        for record in records
        if record["status"] in {"needs_manual_review", "unclassified"}
    ]
    filtered_manual: list[dict] = []
    for record in manual:
        shadowed = False
        for identity in identity_keys(record):
            peers = by_identity[identity]
            if any(peer["status"] in RESOLVED_STATUSES for peer in peers if peer is not record):
                shadowed = True
                break
        if not shadowed:
            filtered_manual.append(record)

    filtered_manual.sort(key=lambda row: (row["section"], row["file"], row["name"].lower(), row["key"]))

    priority = []
    for record in filtered_manual:
        if record["section"] == "zones":
            score = 100
        elif record["section"] == "subZones":
            score = 60
        else:
            score = 20

        if record["secondaryGenerated"]:
            score -= 40
        if "primary" in record["tags"] or "hub" in record["tags"]:
            score += 10
        if "generated-variant" in record["tags"]:
            score -= 10

        row = dict(record)
        row["priorityScore"] = score
        priority.append(row)

    priority.sort(key=lambda row: (-row["priorityScore"], row["section"], row["name"].lower(), row["file"]))

    report = {
        "meta": {
            "recordCount": len(records),
            "statusCounts": dict(counter),
            "manualReviewCount": len(filtered_manual),
            "sectionStatusCounts": {
                f"{section}:{status}": count
                for (section, status), count in sorted(section_counter.items())
            },
        },
        "manualReview": filtered_manual,
        "priorityReview": priority,
    }
    return report


def main() -> int:
    report = build_report()
    OUT.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print("Retail record count:", report["meta"]["recordCount"])
    print("Status counts:")
    for key, value in sorted(report["meta"]["statusCounts"].items()):
        print(f"  {key}: {value}")

    print("\nPriority review:")
    for row in report["priorityReview"][:40]:
        print(
            f"  {row['section']} {row['name']} ({row['file']} {row['key']}) -> {row['status']} score={row['priorityScore']}"
        )

    print(f"\nWrote report: {OUT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
