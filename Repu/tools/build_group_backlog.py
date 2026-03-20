#!/usr/bin/env python3
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path("/root/Repo")
GROUP_AUDIT = ROOT / "Repu" / "tools" / "grouped_faction_audit.json"
BLIZZARD_AUDIT = ROOT / "Repu" / "tools" / "blizzard_retail_faction_audit.json"
SUPERSEDED = ROOT / "Repu" / "tools" / "audit" / "blizzard_retail_gaps" / "superseded_by_current_model.json"
OUT = ROOT / "Repu" / "tools" / "group_backlog.json"

OPTIONAL_SKIP = {
    "The Defilers",
    "Stormpike Guard",
    "Silverwing Sentinels",
    "Warsong Outriders",
    "Brawl'gar Arena",
    "Bizmo's Brawlpub",
    "Aeda Brightdawn",
    "Delvar Ironfist",
    "Defender Illona",
    "Vivianne",
}


def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> None:
    grouped = load_json(GROUP_AUDIT)
    blizzard = load_json(BLIZZARD_AUDIT)
    superseded = load_json(SUPERSEDED)

    explicit_groups = grouped.get("groups", [])
    explicit_parent_ids = {row["parentFactionID"] for row in explicit_groups}

    candidates = []
    seen = set()

    for row in blizzard.get("blizzardMissingInCore", []):
        name = row.get("name")
        classification = row.get("classification")
        if classification != "faction_header":
            continue
        if not name or name in OPTIONAL_SKIP or "(Season " in name:
            continue
        if row["factionID"] in explicit_parent_ids:
            continue
        if name in seen:
            continue
        seen.add(name)
        candidates.append(
            {
                "factionID": row["factionID"],
                "name": name,
                "source": "blizzard_missing_header",
                "classification": classification,
            }
        )

    superseded_candidates = []
    for row in superseded.get("rows", []):
        if row.get("classification") != "faction_header":
            continue
        name = row.get("name")
        if not name or name in OPTIONAL_SKIP or "(Season " in name:
            continue
        superseded_candidates.append(
            {
                "factionID": row["factionID"],
                "name": name,
                "source": "superseded_by_current_model",
                "classification": row.get("classification"),
            }
        )

    payload = {
        "summary": {
            "explicitGroupCount": len(explicit_groups),
            "explicitChildCount": sum(len(group.get("children", [])) for group in explicit_groups),
            "candidateRootCount": len(candidates),
            "supersededHeaderCount": len(superseded_candidates),
        },
        "explicitGroups": explicit_groups,
        "candidateRoots": sorted(candidates, key=lambda row: row["name"]),
        "supersededHeaders": sorted(superseded_candidates, key=lambda row: row["name"]),
    }

    OUT.write_text(json.dumps(payload, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")
    print(json.dumps(payload["summary"], indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
