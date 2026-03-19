#!/usr/bin/env python3

from __future__ import annotations

import base64
import json
import os
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path


REPO_ROOT = Path("/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns")
REPU_RETAIL_ROOT = REPO_ROOT / "Repu" / "data" / "retail"
REPU_DATA_RETAIL_ROOT = REPO_ROOT / "Repu_Data" / "content" / "retail"
REPU_CORE_FACTIONS = REPO_ROOT / "Repu" / "core" / "factions.lua"
OUT = REPO_ROOT / "Repu" / "tools" / "blizzard_retail_faction_audit.json"

REGION = os.environ.get("BLIZZARD_REGION", "eu")
LOCALE = os.environ.get("BLIZZARD_LOCALE", "en_US")

SECTION_RE = re.compile(r"^\s*(zones|subZones|instances|raids)\s*=\s*\{\s*$")
RECORD_START_RE = re.compile(r"^\s*(\[[^\]]+\])\s*=\s*\{\s*$")
NAME_RE = re.compile(r'name\s*=\s*"([^"]+)"')
FACTION_IDS_RE = re.compile(r"factionIDs\s*=\s*\{([^}]*)\}")
CONTENT_FACTION_RE = re.compile(r"\[(\d+)\]\s*=\s*\{")

SKIP_REPU_FILES = {"core.lua", "retail.lua"}
KNOWN_CHILD_TABLE_RE = re.compile(r"local\s+KNOWN_RETAIL_CHILD_TO_PARENT\s*=\s*\{(.*?)\n\}", re.S)
GENERIC_HEADER_NAMES = {
    "alliance",
    "alliance forces",
    "battle for azeroth",
    "burning crusade",
    "cataclysm",
    "classic",
    "dragonflight",
    "guild",
    "horde",
    "horde forces",
    "legion",
    "midnight",
    "mists of pandaria",
    "shadowlands",
    "the burning crusade",
    "the war within",
    "warlords of draenor",
    "wrath of the lich king",
}


def slug(value: str) -> str:
    return re.sub(r"\s+", " ", value.strip().lower())


def read_env_file(path: Path) -> dict[str, str]:
    data: dict[str, str] = {}
    if not path.exists():
        return data
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        data[key] = value
    return data


def http_json(url: str, *, headers: dict[str, str] | None = None, data: bytes | None = None) -> dict:
    last_error = None
    for attempt in range(4):
        try:
            req = urllib.request.Request(url, headers=headers or {}, data=data)
            with urllib.request.urlopen(req, timeout=30) as response:
                return json.loads(response.read().decode("utf-8"))
        except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError) as exc:
            last_error = exc
            status = getattr(exc, "code", None)
            if status is not None and status < 500 and status != 429:
                raise
            if attempt >= 3:
                raise
            time.sleep(1 + attempt)
    raise last_error


def get_access_token(client_id: str, client_secret: str) -> str:
    auth = base64.b64encode(f"{client_id}:{client_secret}".encode("utf-8")).decode("ascii")
    payload = urllib.parse.urlencode({"grant_type": "client_credentials"}).encode("utf-8")
    data = http_json(
        "https://oauth.battle.net/token",
        headers={
            "Authorization": f"Basic {auth}",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        data=payload,
    )
    token = data.get("access_token")
    if not token:
        raise RuntimeError("Could not obtain Blizzard access token")
    return token


def fetch_index(token: str) -> dict:
    return http_json(
        f"https://{REGION}.api.blizzard.com/data/wow/reputation-faction/index?namespace=static-{REGION}&locale={LOCALE}",
        headers={"Authorization": f"Bearer {token}"},
    )


def fetch_faction_detail(token: str, faction_id: int) -> dict:
    return http_json(
        f"https://{REGION}.api.blizzard.com/data/wow/reputation-faction/{faction_id}?namespace=static-{REGION}&locale={LOCALE}",
        headers={"Authorization": f"Bearer {token}"},
    )


def collect_core_faction_ids() -> dict[int, dict]:
    faction_data: dict[int, dict] = {}

    for path in sorted(REPU_RETAIL_ROOT.rglob("*.lua")):
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
                faction_ids.update(int(value) for value in re.findall(r"factionID\s*=\s*(\d+)", block))

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

    if REPU_CORE_FACTIONS.exists():
        text = REPU_CORE_FACTIONS.read_text(encoding="utf-8")
        match = KNOWN_CHILD_TABLE_RE.search(text)
        if match:
            for value in re.findall(r"\[(\d+)\]\s*=", match.group(1)):
                faction_id = int(value)
                if faction_id >= 8000000:
                    continue
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
                            "name": "Known retail child faction",
                            "section": "core-family",
                            "file": "factions.lua",
                        }
                    )
                entry["sourceFiles"].add("factions.lua")

    for entry in faction_data.values():
        entry["sourceFiles"] = sorted(entry["sourceFiles"])

    return faction_data


def collect_content_faction_ids() -> set[int]:
    faction_ids: set[int] = set()
    for path in sorted(REPU_DATA_RETAIL_ROOT.rglob("*.lua")):
        text = path.read_text(encoding="utf-8")
        faction_ids.update(int(value) for value in CONTENT_FACTION_RE.findall(text))
    return faction_ids


def classify_blizzard_faction(detail: dict, root_ids: set[int]) -> str:
    faction_id = detail["id"]
    name_key = slug(detail.get("name", ""))
    if faction_id in root_ids or name_key in GENERIC_HEADER_NAMES:
        return "generic_header"
    if detail.get("is_header") and detail.get("is_renown"):
        return "major_header"
    if detail.get("is_header"):
        return "header"
    if detail.get("is_renown"):
        return "renown"
    if detail.get("player_faction"):
        return "faction_header"
    return "leaf"


def main() -> int:
    env = read_env_file(Path("/root/.env"))
    client_id = env.get("BLIZZARD_CLIENT_ID")
    client_secret = env.get("BLIZZARD_CLIENT_SECRET")
    if not client_id or not client_secret:
        raise SystemExit("Missing BLIZZARD_CLIENT_ID / BLIZZARD_CLIENT_SECRET in /root/.env")

    token = get_access_token(client_id, client_secret)
    index = fetch_index(token)

    index_factions = index.get("factions", [])
    root_factions = index.get("root_factions", [])
    root_ids = {item["id"] for item in root_factions}

    details: dict[int, dict] = {}
    for item in index_factions:
        faction_id = item["id"]
        detail = fetch_faction_detail(token, faction_id)
        details[faction_id] = {
            "id": faction_id,
            "name": detail.get("name", item.get("name")),
            "is_header": bool(detail.get("is_header")),
            "is_renown": bool(detail.get("is_renown")),
            "can_paragon": bool(detail.get("can_paragon")),
            "player_faction": detail.get("player_faction", {}),
            "children": [child.get("id") for child in detail.get("factions", []) if child.get("id")],
        }
        details[faction_id]["classification"] = classify_blizzard_faction(details[faction_id], root_ids)

    core_factions = collect_core_faction_ids()
    content_faction_ids = collect_content_faction_ids()

    blizzard_ids = set(details)
    core_ids = set(core_factions)
    content_ids = set(content_faction_ids)

    blizzard_minus_core = sorted(blizzard_ids - core_ids)
    core_minus_blizzard = sorted(core_ids - blizzard_ids)
    core_minus_content = sorted(core_ids - content_ids)
    content_minus_core = sorted(content_ids - core_ids)

    def rows_for(ids: list[int]) -> list[dict]:
        rows = []
        for faction_id in ids:
            detail = details.get(faction_id)
            core = core_factions.get(faction_id)
            rows.append(
                {
                    "factionID": faction_id,
                    "name": detail.get("name") if detail else None,
                    "classification": detail.get("classification") if detail else "addon_only",
                    "isHeader": detail.get("is_header") if detail else None,
                    "isRenown": detail.get("is_renown") if detail else None,
                    "sourceFiles": core.get("sourceFiles", []) if core else [],
                    "exampleLocations": core.get("exampleLocations", []) if core else [],
                }
            )
        return rows

    report = {
        "meta": {
            "region": REGION,
            "locale": LOCALE,
            "blizzardFactionCount": len(blizzard_ids),
            "blizzardRootCount": len(root_ids),
            "addonCoreFactionCount": len(core_ids),
            "addonContentFactionCount": len(content_ids),
            "coreCoveredByContentCount": len(core_ids & content_ids),
            "coreMissingContentCount": len(core_minus_content),
            "blizzardMissingInCoreCount": len(blizzard_minus_core),
            "contentOnlyCount": len(content_minus_core),
        },
        "classificationCounts": {
            key: sum(1 for detail in details.values() if detail["classification"] == key)
            for key in sorted({detail["classification"] for detail in details.values()})
        },
        "blizzardMissingInCore": rows_for(blizzard_minus_core),
        "coreMissingInContent": rows_for(core_minus_content),
        "contentOnly": rows_for(content_minus_core),
        "coreOnlyNotInBlizzard": rows_for(core_minus_blizzard),
    }

    OUT.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print("Blizzard factions:", report["meta"]["blizzardFactionCount"])
    print("Blizzard root factions:", report["meta"]["blizzardRootCount"])
    print("Addon core factions:", report["meta"]["addonCoreFactionCount"])
    print("Addon content factions:", report["meta"]["addonContentFactionCount"])
    print("Core covered by content:", report["meta"]["coreCoveredByContentCount"])
    print("Core missing content:", report["meta"]["coreMissingContentCount"])
    print("Blizzard missing in core:", report["meta"]["blizzardMissingInCoreCount"])
    print("Content only:", report["meta"]["contentOnlyCount"])
    print(f"Wrote report: {OUT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
