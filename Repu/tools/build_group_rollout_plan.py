#!/usr/bin/env python3
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path("/root/Repo")
CURATED = ROOT / "Repu" / "tools" / "group_backlog_curated.json"
OUT = ROOT / "Repu" / "tools" / "group_rollout_plan.json"

IMMEDIATE_CLASSES = set()
DEFERRED_CLASSES = {
    "future_bg_or_legacy_root",
    "future_city_root",
    "future_zone_root",
}
ALREADY_CLASSES = {
    "already_modeled_header",
}


def main() -> None:
    payload = json.loads(CURATED.read_text(encoding="utf-8"))
    immediate = []
    deferred = []
    already = []

    for row in payload.get("rows", []):
        row_class = row.get("class")
        if row_class in IMMEDIATE_CLASSES:
            immediate.append(row)
        elif row_class in DEFERRED_CLASSES:
            deferred.append(row)
        elif row_class in ALREADY_CLASSES:
            already.append(row)

    out = {
        "summary": {
            "immediateCount": len(immediate),
            "deferredCount": len(deferred),
            "alreadyModeledCount": len(already),
        },
        "immediate": immediate,
        "deferred": deferred,
        "alreadyModeled": already,
    }

    OUT.write_text(json.dumps(out, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")
    print(json.dumps(out["summary"], indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
