#!/usr/bin/env python3
import glob
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONTENT_FILES = sorted(
    glob.glob(str(ROOT / "../Repu_Data/content/retail/expansions/*.lua"))
    + glob.glob(str(ROOT / "../Repu_Data/content/retail/legacy/*.lua"))
)
OUT_PATH = ROOT / "tools/daily_weekly_questgiver_audit.json"


def extract_block(text: str, start_idx: int):
    i = start_idx
    while i < len(text) and text[i] != "{":
        i += 1
    if i >= len(text):
        return None, i
    depth = 1
    j = i + 1
    while j < len(text) and depth:
        if text[j] == "{":
            depth += 1
        elif text[j] == "}":
            depth -= 1
        j += 1
    return text[i:j], j


def iter_activity_entries(block: str):
    act_m = re.search(r"activities\s*=\s*\{", block)
    if not act_m:
        return

    act_block, _ = extract_block(block, act_m.end() - 1)
    i = 0
    while True:
        m = re.search(r"\{", act_block[i:])
        if not m:
            break
        entry, ni = extract_block(act_block, i + m.start())
        i = ni
        if entry and "kind" in entry:
            yield entry


def get_string(entry: str, key: str):
    m = re.search(rf"{re.escape(key)}\s*=\s*\"([^\"]+)\"", entry)
    return m.group(1) if m else None


def has_xy(entry: str):
    return bool(re.search(r"\bx\s*=\s*[0-9.]+", entry) and re.search(r"\by\s*=\s*[0-9.]+", entry))


def build():
    rows = []
    for path in CONTENT_FILES:
        text = Path(path).read_text(encoding="utf-8")
        pos = 0
        while True:
            m = re.search(r"\[(\d+)\]\s*=\s*\{", text[pos:])
            if not m:
                break
            faction_id = int(m.group(1))
            block, end = extract_block(text, pos + m.end() - 1)
            pos = end
            if not block:
                continue

            idx = 0
            for activity in iter_activity_entries(block):
                kind = get_string(activity, "kind")
                if kind not in ("Daily", "Weekly"):
                    continue
                idx += 1
                rows.append(
                    {
                        "factionID": faction_id,
                        "file": Path(path).name,
                        "activityIndex": idx,
                        "kind": kind,
                        "title": get_string(activity, "title"),
                        "titleKey": get_string(activity, "titleKey"),
                        "hasActivityXY": has_xy(activity),
                        "questgiverName": get_string(activity, "questgiverName"),
                        "questgiverNameKey": get_string(activity, "questgiverNameKey"),
                        "questgiverLabel": get_string(activity, "questgiverLabel"),
                        "questgiverLabelKey": get_string(activity, "questgiverLabelKey"),
                        "hasQuestgiverLocationXY": bool(
                            re.search(r"questgiverLocation\s*=\s*\{[^}]*\bx\s*=\s*[0-9.]+", activity, re.S)
                            and re.search(r"questgiverLocation\s*=\s*\{[^}]*\by\s*=\s*[0-9.]+", activity, re.S)
                        ),
                    }
                )

    total = len(rows)
    with_qg = sum(1 for row in rows if row["questgiverName"] or row["questgiverNameKey"])
    with_qg_xy = sum(1 for row in rows if (row["questgiverName"] or row["questgiverNameKey"]) and row["hasQuestgiverLocationXY"])
    without_qg = [row for row in rows if not (row["questgiverName"] or row["questgiverNameKey"])]

    payload = {
        "summary": {
            "totalDailyWeeklyActivities": total,
            "withQuestgiver": with_qg,
            "withQuestgiverAndXY": with_qg_xy,
            "withoutQuestgiver": len(without_qg),
        },
        "withoutQuestgiver": without_qg,
        "rows": rows,
    }

    OUT_PATH.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    print(payload["summary"])


if __name__ == "__main__":
    build()
