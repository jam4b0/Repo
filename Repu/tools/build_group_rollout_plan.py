#!/usr/bin/env python3
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
CURATED = ROOT / "Repu" / "tools" / "group_backlog_curated.json"
OUT = ROOT / "Repu" / "tools" / "group_rollout_plan.json"

IMMEDIATE_CLASSES = set()
DEFERRED_CLASSES = set()
ALREADY_CLASSES = {
    "already_modeled_header",
}
EXCLUDED_CLASSES = {
    "excluded_pvp_root",
    "excluded_folded_city_root",
    "excluded_missing_zone_basis",
}


def main() -> None:
    payload = json.loads(CURATED.read_text(encoding="utf-8"))
    immediate = []
    deferred = []
    already = []
    excluded = []

    for row in payload.get("rows", []):
        row_class = row.get("class")
        if row_class in IMMEDIATE_CLASSES:
            immediate.append(row)
        elif row_class in DEFERRED_CLASSES:
            deferred.append(row)
        elif row_class in ALREADY_CLASSES:
            already.append(row)
        elif row_class in EXCLUDED_CLASSES:
            excluded.append(row)

    out = {
        "summary": {
            "immediateCount": len(immediate),
            "deferredCount": len(deferred),
            "alreadyModeledCount": len(already),
            "excludedCount": len(excluded),
        },
        "immediate": immediate,
        "deferred": deferred,
        "alreadyModeled": already,
        "excluded": excluded,
    }

    OUT.write_text(json.dumps(out, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")
    print(json.dumps(out["summary"], indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
