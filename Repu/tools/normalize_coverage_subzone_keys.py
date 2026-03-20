#!/usr/bin/env python3

from __future__ import annotations

import argparse
import re
from pathlib import Path

from coverage_key_utils import esc_lua, normalized_subzone_key


KEY_RE = re.compile(r'^(?P<indent>\s*)\["(?P<mapid>\d+):(?P<name>[^"\n]+)"\]\s*=\s*\{$')
MAPIDS_RE = re.compile(r"^(?P<indent>\s*)mapIDs\s*=\s*\{[^}]+\},\s*$")
SUBZONE_KEYS_RE = re.compile(r"^\s*subZoneKeys\s*=\s*\{")


def normalize_file(path: Path) -> bool:
    lines = path.read_text(encoding="utf-8").splitlines()
    output: list[str] = []
    changed = False
    i = 0
    while i < len(lines):
        line = lines[i]
        match = KEY_RE.match(line)
        if not match:
            output.append(line)
            i += 1
            continue

        map_id = int(match.group("mapid"))
        name = match.group("name")
        normalized_key = normalized_subzone_key(map_id, name)
        new_line = f'{match.group("indent")}["{normalized_key}"] = {{'
        if new_line != line:
            changed = True
        output.append(new_line)
        i += 1

        inserted_subzone_keys = False
        while i < len(lines):
            inner = lines[i]
            output.append(inner)
            if MAPIDS_RE.match(inner):
                next_line = lines[i + 1] if i + 1 < len(lines) else ""
                if not SUBZONE_KEYS_RE.match(next_line):
                    indent = MAPIDS_RE.match(inner).group("indent")
                    output.append(f'{indent}subZoneKeys = {{ "{esc_lua(name)}" }},')
                    changed = True
                    inserted_subzone_keys = True
            if inner.strip() == "},":
                break
            i += 1

        i += 1

    if changed:
        path.write_text("\n".join(output) + "\n", encoding="utf-8")
    return changed


def main() -> int:
    parser = argparse.ArgumentParser(description="Normalize retail coverage subzone keys to slug form.")
    parser.add_argument("paths", nargs="+", help="Coverage Lua files or directories to normalize.")
    args = parser.parse_args()

    targets: list[Path] = []
    for raw in args.paths:
        path = Path(raw)
        if path.is_dir():
            targets.extend(sorted(path.rglob("*.lua")))
        else:
            targets.append(path)

    changed = 0
    for target in targets:
        if normalize_file(target):
            changed += 1
            print(f"normalized {target}")
    print(f"changed_files={changed}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
