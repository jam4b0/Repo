#!/usr/bin/env python3
from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path("/root/Repo")
CORE_FACTIONS = ROOT / "Repu" / "core" / "factions.lua"
RETAIL_CONTENT_ROOT = ROOT / "Repu_Data" / "content" / "retail"
OUT = ROOT / "Repu" / "tools" / "grouped_faction_audit.json"

PARENT_BLOCK_RE = re.compile(
    r"local\s+(KNOWN_RETAIL_PARENT_FACTIONS|KNOWN_VIRTUAL_PARENT_FACTIONS)\s*=\s*\{(.*?)^\}",
    re.S | re.M,
)
TOP_LEVEL_PARENT_RE = re.compile(r"\[(\d+)\]\s*=\s*\{")
CHILD_RE = re.compile(r"\[(\d+)\]\s*=\s*\{\s*name\s*=\s*\"([^\"]+)\"")
PARENT_NAME_RE = re.compile(r"name\s*=\s*\"([^\"]+)\"")
FACTION_KEY_RE = re.compile(r"\[(\d+)\]\s*=\s*\{")


def extract_table_block(source: str, table_name: str) -> str:
    anchor = source.find(f"local {table_name} = {{")
    if anchor < 0:
        return ""
    start = source.find("{", anchor)
    depth = 0
    for idx in range(start, len(source)):
        ch = source[idx]
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return source[start + 1 : idx]
    return ""


def parse_group_table(block: str, virtual: bool) -> list[dict]:
    groups: list[dict] = []
    pos = 0
    while True:
        m = TOP_LEVEL_PARENT_RE.search(block, pos)
        if not m:
            break
        faction_id = int(m.group(1))
        obj_start = block.find("{", m.end() - 1)
        depth = 0
        end = obj_start
        for idx in range(obj_start, len(block)):
            ch = block[idx]
            if ch == "{":
                depth += 1
            elif ch == "}":
                depth -= 1
                if depth == 0:
                    end = idx
                    break
        obj = block[obj_start + 1 : end]
        groups.append(
            {
                "parentFactionID": faction_id,
                "type": "virtual" if virtual else "retail_parent",
                "name": PARENT_NAME_RE.search(obj).group(1) if virtual and PARENT_NAME_RE.search(obj) else None,
                "children": [
                    {"factionID": int(child_id), "name": child_name}
                    for child_id, child_name in CHILD_RE.findall(obj)
                ],
            }
        )
        pos = end + 1
    return groups


def find_content_files_by_faction() -> dict[int, list[str]]:
    mapping: dict[int, list[str]] = {}
    for path in sorted(RETAIL_CONTENT_ROOT.rglob("*.lua")):
        rel = path.relative_to(ROOT).as_posix()
        text = path.read_text(encoding="utf-8")
        for faction_id in {int(x) for x in FACTION_KEY_RE.findall(text)}:
            mapping.setdefault(faction_id, []).append(rel)
    return mapping


def main() -> None:
    source = CORE_FACTIONS.read_text(encoding="utf-8")
    retail_groups = parse_group_table(extract_table_block(source, "KNOWN_RETAIL_PARENT_FACTIONS"), virtual=False)
    virtual_groups = parse_group_table(extract_table_block(source, "KNOWN_VIRTUAL_PARENT_FACTIONS"), virtual=True)
    content_files = find_content_files_by_faction()

    groups = retail_groups + virtual_groups
    for group in groups:
        parent_id = group["parentFactionID"]
        group["contentFiles"] = content_files.get(parent_id, [])
        for child in group["children"]:
            child["contentFiles"] = content_files.get(child["factionID"], [])

    payload = {
        "summary": {
            "groupCount": len(groups),
            "explicitRetailParents": len(retail_groups),
            "explicitVirtualParents": len(virtual_groups),
            "childCount": sum(len(group["children"]) for group in groups),
        },
        "groups": groups,
    }

    OUT.write_text(json.dumps(payload, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")
    print(json.dumps(payload["summary"], indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
