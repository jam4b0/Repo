#!/usr/bin/env python3

import json
import sys
from pathlib import Path


def lua_quote(value: str) -> str:
    escaped = value.replace("\\", "\\\\").replace('"', '\\"')
    return f'"{escaped}"'


def lua_value(value, indent=0):
    if value is None:
        return "nil"
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return repr(value)
    if isinstance(value, str):
        return lua_quote(value)
    if isinstance(value, list):
        if not value:
            return "{}"
        inner = []
        pad = " " * (indent + 4)
        for item in value:
            inner.append(f"{pad}{lua_value(item, indent + 4)},")
        return "{\n" + "\n".join(inner) + "\n" + (" " * indent) + "}"
    if isinstance(value, dict):
        if not value:
            return "{}"
        inner = []
        pad = " " * (indent + 4)
        for key, item in value.items():
            if isinstance(key, int) or (isinstance(key, str) and key.isdigit()):
                lua_key = f"[{key}]"
            elif isinstance(key, str) and key.isidentifier():
                lua_key = key
            else:
                lua_key = f"[{lua_quote(str(key))}]"
            inner.append(f"{pad}{lua_key} = {lua_value(item, indent + 4)},")
        return "{\n" + "\n".join(inner) + "\n" + (" " * indent) + "}"
    raise TypeError(f"Unsupported type: {type(value)!r}")


def build_module(data: dict) -> str:
    return (
        'local _, ns = ...\n\n'
        'ns.Content:RegisterRetailContentModule('
        + lua_value(data, 0)
        + ')\n'
    )


def main(argv: list[str]) -> int:
    if len(argv) != 3:
        print("usage: generate_content_module.py <input.json> <output.lua>", file=sys.stderr)
        return 1

    input_path = Path(argv[1])
    output_path = Path(argv[2])

    payload = json.loads(input_path.read_text(encoding="utf-8"))
    output_path.write_text(build_module(payload), encoding="utf-8")
    print(f"Wrote {output_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
