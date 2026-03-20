#!/usr/bin/env python3
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
IN = ROOT / "Repu" / "tools" / "group_backlog.json"
OUT = ROOT / "Repu" / "tools" / "group_backlog_curated.json"

CLASSIFICATION = {
    2159: {
        "class": "already_modeled_header",
        "reason": "Covered by current BfA alliance war campaign model; not a new parent to introduce now.",
    },
    729: {
        "class": "excluded_pvp_root",
        "reason": "PvP/Alterac-style root, intentionally outside the normal local retail runtime model.",
    },
    54: {
        "class": "excluded_folded_city_root",
        "reason": "Folded into the current Dun Morogh/Ironforge homeland model instead of a separate runtime group root.",
    },
    1352: {
        "class": "already_modeled_header",
        "reason": "Covered by current Pandaria faction modeling; no separate parent layer needed now.",
    },
    1708: {
        "class": "already_modeled_header",
        "reason": "Covered by existing legacy content model; not strong enough for a separate runtime parent yet.",
    },
    1242: {
        "class": "already_modeled_header",
        "reason": "Handled by the current Pandaria model; header-level grouping would duplicate existing behavior.",
    },
    911: {
        "class": "already_modeled_header",
        "reason": "Already represented through the Midnight/Silvermoon court cluster in the current model.",
    },
    2156: {
        "class": "already_modeled_header",
        "reason": "Covered by the current Zandalar-side faction model.",
    },
    509: {
        "class": "excluded_pvp_root",
        "reason": "PvP/Arathi-style root, intentionally outside the normal local retail runtime model.",
    },
    1094: {
        "class": "already_modeled_header",
        "reason": "Represented by the Dalaran/Silver Covenant area logic already.",
    },
    1064: {
        "class": "already_modeled_header",
        "reason": "Handled by the current Northrend-side model; not worth a separate parent abstraction yet.",
    },
    922: {
        "class": "excluded_missing_zone_basis",
        "reason": "Ghostlands is not part of the current retail location basis, so this cannot be a runtime group root today.",
    },
    1353: {
        "class": "already_modeled_header",
        "reason": "Covered by current Pandaria faction modeling; no separate parent layer needed now.",
    },
    1050: {
        "class": "already_modeled_header",
        "reason": "Handled by current Northrend alliance expedition logic.",
    },
    1681: {
        "class": "already_modeled_header",
        "reason": "Already covered by the current faction/location model for Horde Ashran-side content.",
    },
    1085: {
        "class": "already_modeled_header",
        "reason": "Handled by the current Northrend Horde expedition logic.",
    },
    2400: {
        "class": "already_modeled_header",
        "reason": "Already represented by the Nazjatar alliance-side model.",
    },
    1682: {
        "class": "already_modeled_header",
        "reason": "Already covered by the current faction/location model for Alliance Ashran-side content.",
    },
    2103: {
        "class": "already_modeled_header",
        "reason": "Covered by the current Zandalar-side faction model.",
    },
}


def main() -> None:
    payload = json.loads(IN.read_text(encoding="utf-8"))
    rows = []
    counts = {}

    for row in payload.get("candidateRoots", []):
        faction_id = row["factionID"]
        classification = CLASSIFICATION.get(
            faction_id,
            {
                "class": "needs_manual_review",
                "reason": "No curated classification set yet.",
            },
        )
        merged = dict(row)
        merged.update(classification)
        rows.append(merged)
        counts[merged["class"]] = counts.get(merged["class"], 0) + 1

    out = {
        "summary": counts,
        "rows": rows,
    }
    OUT.write_text(json.dumps(out, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")
    print(json.dumps(counts, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
