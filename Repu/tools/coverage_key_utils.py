#!/usr/bin/env python3

from __future__ import annotations

import re


_TRANSLATION = str.maketrans(
    {
        "ä": "ae",
        "ö": "oe",
        "ü": "ue",
        "ß": "ss",
        "Ä": "Ae",
        "Ö": "Oe",
        "Ü": "Ue",
    }
)


def esc_lua(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"')


def slugify(value: str) -> str:
    text = value.translate(_TRANSLATION).lower()
    text = re.sub(r"[^a-z0-9]+", "-", text)
    text = re.sub(r"-{2,}", "-", text).strip("-")
    return text or "unnamed"


def normalized_subzone_key(map_id: int, name: str) -> str:
    return f"{map_id}:{slugify(name)}"

