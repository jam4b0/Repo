#!/usr/bin/env python3

from __future__ import annotations

import json
from pathlib import Path


BACKLOG = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu_Data/tools/retail_content_backlog.json")
OUT = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu_Data/content/retail/summary/generated.lua")


def unique_names(example_locations: list[dict]) -> list[str]:
    seen = set()
    names = []
    for row in example_locations:
        name = (row.get("name") or "").strip()
        if not name or name in seen:
            continue
        seen.add(name)
        names.append(name)
    return names


def build_summary(example_locations: list[dict]) -> str:
    names = unique_names(example_locations)
    if names:
        if len(names) == 1:
            places = names[0]
        elif len(names) == 2:
            places = f"{names[0]} und {names[1]}"
        else:
            places = ", ".join(names[:3])
    else:
        places = "dem aktuell gemappten Retail-Ortskontext"

    return (
        "Startdatensatz für diese im Retail-Core lokal verankerte Fraktion. "
        f"Der Kernbezug liegt aktuell vor allem bei {places}. "
        "Spezifische Rüstmeister- und Aktivitätsdaten können später präzisiert werden."
    )


def main() -> int:
    report = json.loads(BACKLOG.read_text(encoding="utf-8"))
    rows = report.get("missing", [])

    lines = [
        "local api = _G.RepuAPI",
        "",
        "if not api or not api.RegisterRetailContentModule then",
        "    return",
        "end",
        "",
        "api.RegisterRetailContentModule({",
        "    factions = {",
    ]

    for row in rows:
        faction_id = int(row["factionID"])
        summary = build_summary(row.get("exampleLocations", []))
        lines.extend(
            [
                f"        [{faction_id}] = {{",
                f'            summary = "{summary}",',
                '            source = "seed",',
                '            confidence = "low",',
                "        },",
            ]
        )

    lines.extend(
        [
            "    },",
            "})",
            "",
        ]
    )

    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"Generated {len(rows)} faction summaries -> {OUT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
