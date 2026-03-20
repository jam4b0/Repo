#!/usr/bin/env python3
from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path("/root/Repo")
OUT = ROOT / "Repu" / "tools" / "i18n_audit.json"

SCAN_DIRS = [
    ROOT / "Repu",
    ROOT / "Repu_Data",
    ROOT / "Repu_Map",
]

SKIP_PARTS = {
    "coverage",
    "tests",
    "tools",
}

GERMAN_MARKERS = [
    "blutritter",
    "weltenwanderer",
    "schemen der gasse",
    "die sha'tar",
    "die aldor",
    "die seher",
    "unteres viertel",
    "himmelswache der sha'tari",
    "offensive der zerschmetterten sonne",
    "sengende schlucht",
    "sturmwind",
    "eisenschmiede",
    "donnerfels",
    "unterstadt",
    "schattenmondtal",
    "zangarmarschen",
    "cenarionszuflucht",
    "kriegsspeer",
    "sturmschild",
    "tanaan-dschungel",
    "noch kein",
    "kein rufeintrag",
]

STRING_RE = re.compile(r'"([^"\n]*[A-Za-zÄÖÜäöüß][^"\n]*)"')


def should_scan(path: Path) -> bool:
    if path.suffix != ".lua":
        return False
    if any(part in SKIP_PARTS for part in path.parts):
        return False
    return True


def classify(path: Path) -> str:
    text = str(path)
    if "/Repu/locales/" in text or "/Repu_Map/locales/" in text:
        return "locale_ui_domain"
    if "/Repu_Data/locales/" in text:
        return "locale_content_domain"
    if "/Repu_Data/content/" in text:
        return "content_data_strings"
    if "/Repu/data/" in text:
        return "mapping_and_coverage_data"
    if "/Repu_Map/core/" in text:
        return "map_runtime_strings"
    return "core_runtime_strings"


def find_markers(value: str) -> list[str]:
    lowered = value.lower()
    hits = []
    for marker in GERMAN_MARKERS:
        if marker in lowered:
            hits.append(marker)
    if any(ord(ch) > 127 for ch in value):
        hits.append("non_ascii")
    return hits


def main() -> None:
    entries: list[dict] = []
    counts: dict[str, int] = {}

    for base in SCAN_DIRS:
        for path in sorted(base.rglob("*.lua")):
            if not should_scan(path):
                continue
            rel = path.relative_to(ROOT)
            category = classify(path)
            counts[category] = counts.get(category, 0) + 1

            matches = []
            for line_no, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
                for match in STRING_RE.finditer(line):
                    value = match.group(1)
                    markers = find_markers(value)
                    if not markers:
                        continue
                    matches.append(
                        {
                            "line": line_no,
                            "value": value,
                            "markers": markers,
                        }
                    )

            if matches:
                entries.append(
                    {
                        "path": str(rel),
                        "category": category,
                        "matchCount": len(matches),
                        "matches": matches[:25],
                    }
                )

    payload = {
        "summary": {
            "scannedFileCount": sum(counts.values()),
            "filesWithLocaleSensitiveMarkers": len(entries),
            "categories": counts,
        },
        "categories": {
            "locale_ui_domain": "Expected UI locale files.",
            "locale_content_domain": "Expected content locale overlay files.",
            "content_data_strings": "Structured content text data; candidates for future text-key refactor.",
            "mapping_and_coverage_data": "Location/mapping strings; expected data layer, but locale-sensitive by design.",
            "core_runtime_strings": "Runtime strings in addon logic; strongest i18n cleanup candidates.",
            "map_runtime_strings": "Runtime strings in Repu_Map; should stay on map_ui domain.",
        },
        "files": entries,
    }

    OUT.write_text(json.dumps(payload, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")
    print(json.dumps(payload["summary"], indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
