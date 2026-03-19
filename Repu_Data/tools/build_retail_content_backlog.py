#!/usr/bin/env python3

from __future__ import annotations

import json
import re
from pathlib import Path


REPU_RETAIL_ROOT = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/data/retail")
REPU_DATA_RETAIL_ROOT = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu_Data/content/retail")
OUT = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu_Data/tools/retail_content_backlog.json")

SECTION_RE = re.compile(r"^\s*(zones|subZones|instances|raids)\s*=\s*\{\s*$")
RECORD_START_RE = re.compile(r"^\s*(\[[^\]]+\])\s*=\s*\{\s*$")
NAME_RE = re.compile(r'name\s*=\s*"([^"]+)"')
FACTION_IDS_RE = re.compile(r"factionIDs\s*=\s*\{([^}]*)\}")
FACTIONS_INLINE_RE = re.compile(r"factions\s*=\s*\{([^}]*)\}")
CONTENT_FACTION_RE = re.compile(r"\[(\d+)\]\s*=\s*\{")

SKIP_REPU_FILES = {"core.lua", "retail.lua"}


def collect_core_faction_ids() -> dict[int, dict]:
    faction_data: dict[int, dict] = {}

    for path in sorted(REPU_RETAIL_ROOT.glob("*.lua")):
        if path.name in SKIP_REPU_FILES:
            continue

        lines = path.read_text(encoding="utf-8").splitlines()
        section = None
        i = 0
        while i < len(lines):
            section_match = SECTION_RE.match(lines[i])
            if section_match:
                section = section_match.group(1)
                i += 1
                continue

            record_match = RECORD_START_RE.match(lines[i])
            if section and record_match:
                block_lines = [lines[i]]
                depth = lines[i].count("{") - lines[i].count("}")
                i += 1
                while i < len(lines) and depth > 0:
                    block_lines.append(lines[i])
                    depth += lines[i].count("{") - lines[i].count("}")
                    i += 1
                block = "\n".join(block_lines)
                name_match = NAME_RE.search(block)
                if not name_match:
                    continue

                faction_ids: set[int] = set()
                ids_match = FACTION_IDS_RE.search(block)
                if ids_match:
                    faction_ids.update(int(value) for value in re.findall(r"\d+", ids_match.group(1)))
                inline_match = FACTIONS_INLINE_RE.search(block)
                if inline_match:
                    faction_ids.update(int(value) for value in re.findall(r"factionID\s*=\s*(\d+)", inline_match.group(1)))

                for faction_id in faction_ids:
                    entry = faction_data.setdefault(
                        faction_id,
                        {
                            "factionID": faction_id,
                            "exampleLocations": [],
                            "sourceFiles": set(),
                        },
                    )
                    if len(entry["exampleLocations"]) < 5:
                        entry["exampleLocations"].append(
                            {
                                "name": name_match.group(1),
                                "section": section,
                                "file": path.name,
                            }
                        )
                    entry["sourceFiles"].add(path.name)
                continue

            i += 1

    for entry in faction_data.values():
        entry["sourceFiles"] = sorted(entry["sourceFiles"])

    return faction_data


def collect_content_faction_ids() -> set[int]:
    faction_ids: set[int] = set()
    for path in sorted(REPU_DATA_RETAIL_ROOT.glob("*.lua")):
        text = path.read_text(encoding="utf-8")
        faction_ids.update(int(value) for value in CONTENT_FACTION_RE.findall(text))
    return faction_ids


def main() -> int:
    core_factions = collect_core_faction_ids()
    content_factions = collect_content_faction_ids()

    missing = []
    covered = []

    for faction_id, entry in sorted(core_factions.items()):
        row = {
            "factionID": faction_id,
            "exampleLocations": entry["exampleLocations"],
            "sourceFiles": entry["sourceFiles"],
        }
        if faction_id in content_factions:
            covered.append(row)
        else:
            missing.append(row)

    report = {
        "meta": {
            "coreFactionCount": len(core_factions),
            "contentFactionCount": len(content_factions),
            "coveredCount": len(covered),
            "missingCount": len(missing),
        },
        "covered": covered,
        "missing": missing,
    }

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print("Retail core factions:", report["meta"]["coreFactionCount"])
    print("Retail content factions:", report["meta"]["contentFactionCount"])
    print("Covered:", report["meta"]["coveredCount"])
    print("Missing:", report["meta"]["missingCount"])
    print(f"Wrote report: {OUT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
