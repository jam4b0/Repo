#!/usr/bin/env python3

from __future__ import annotations

import base64
import json
import os
import time
import urllib.parse
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
ENV_PATH = Path.home() / ".env"
BACKLOG_PATH = ROOT / "Repu_Data" / "tools" / "retail_content_backlog.json"
OUT_PATH = ROOT / "Repu_Data" / "tools" / "retail_faction_descriptions_enUS.lua"
REGION = "eu"
LOCALE = "en_US"


def load_env() -> dict[str, str]:
    values: dict[str, str] = {}
    for raw_line in ENV_PATH.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        values[key.strip()] = value.strip()
    return values


def fetch_token(client_id: str, client_secret: str) -> str:
    payload = urllib.parse.urlencode({"grant_type": "client_credentials"}).encode()
    auth = base64.b64encode(f"{client_id}:{client_secret}".encode()).decode()
    request = urllib.request.Request(
        "https://oauth.battle.net/token",
        data=payload,
        headers={"Authorization": f"Basic {auth}"},
    )
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.load(response)["access_token"]


def fetch_faction(token: str, faction_id: int) -> dict:
    url = (
        f"https://{REGION}.api.blizzard.com/data/wow/reputation-faction/{faction_id}"
        f"?namespace=static-{REGION}&locale={LOCALE}"
    )
    request = urllib.request.Request(url, headers={"Authorization": f"Bearer {token}"})
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.load(response)


def main() -> int:
    env = load_env()
    token = fetch_token(env["BLIZZARD_CLIENT_ID"], env["BLIZZARD_CLIENT_SECRET"])

    backlog = json.loads(BACKLOG_PATH.read_text(encoding="utf-8"))
    faction_ids = sorted({row["factionID"] for row in backlog.get("covered", [])})

    descriptions: dict[str, dict[str, str]] = {}
    missing: list[int] = []

    for faction_id in faction_ids:
        try:
            data = fetch_faction(token, faction_id)
        except Exception:
            missing.append(faction_id)
            continue

        description = (data.get("description") or "").strip()
        if not description:
            missing.append(faction_id)
            continue

        descriptions[str(faction_id)] = {
            "name": data.get("name", ""),
            "description": description,
        }
        time.sleep(0.05)

    payload = {
        "meta": {
            "region": REGION,
            "locale": LOCALE,
            "requestedFactionCount": len(faction_ids),
            "describedFactionCount": len(descriptions),
            "missingDescriptionCount": len(missing),
        },
        "factions": descriptions,
        "missing": missing,
    }

    lua_lines = ["return {"]
    lua_lines.append("    meta = {")
    for key, value in payload["meta"].items():
        if isinstance(value, str):
            lua_lines.append(f'        {key} = "{value}",')
        else:
            lua_lines.append(f"        {key} = {value},")
    lua_lines.append("    },")
    lua_lines.append("    factions = {")
    for faction_id in sorted(descriptions, key=lambda x: int(x)):
        row = descriptions[faction_id]
        name = row["name"].replace("\\", "\\\\").replace('"', '\\"')
        desc = row["description"].replace("\\", "\\\\").replace('"', '\\"')
        lua_lines.append(f'        ["{faction_id}"] = {{ name = "{name}", description = "{desc}" }},')
    lua_lines.append("    },")
    lua_lines.append("    missing = {")
    for faction_id in missing:
        lua_lines.append(f"        {faction_id},")
    lua_lines.append("    },")
    lua_lines.append("}")

    OUT_PATH.write_text("\n".join(lua_lines) + "\n", encoding="utf-8")

    print("Requested:", len(faction_ids))
    print("Descriptions:", len(descriptions))
    print("Missing descriptions:", len(missing))
    print(f"Wrote report: {OUT_PATH}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
