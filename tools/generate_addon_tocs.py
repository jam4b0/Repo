#!/usr/bin/env python3
from __future__ import annotations

import json
from pathlib import Path


ROOT = Path("/root/Repo")


def render_toc(manifest: dict) -> str:
    lines: list[str] = []

    for key, value in manifest["metadata"].items():
        lines.append(f"## {key}: {value}")

    lines.append("")

    for section in manifest["sections"]:
        title = section.get("title")
        if title:
            lines.append(f"## {title}")
        for entry in section["files"]:
            lines.append(entry)
        lines.append("")

    while lines and lines[-1] == "":
        lines.pop()

    return "\n".join(lines) + "\n"


def main() -> None:
    manifests = [
        ROOT / "Repu" / "toc_manifest.json",
        ROOT / "Repu_Data" / "toc_manifest.json",
        ROOT / "Repu_Map" / "toc_manifest.json",
    ]

    for manifest_path in manifests:
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        toc_path = manifest_path.parent / manifest["output"]
        toc_path.write_text(render_toc(manifest), encoding="utf-8")
        print(f"Wrote {toc_path}")


if __name__ == "__main__":
    main()
