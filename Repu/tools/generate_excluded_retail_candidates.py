#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


EXCLUDED_ZONE_IDS = set()

EXCLUDED_SUBZONE_IDS = {
    407, 447, 452, 487, 488, 571, 623, 624, 725, 726, 824, 877, 907, 908, 921,
    922, 923, 924, 925, 926, 927, 928, 929, 930, 931, 932, 939, 1156, 1157,
    128, 1474, 1479, 1656, 169, 206, 2085, 2088, 2089, 2090, 2091, 2092, 2176,
    2431, 274, 407, 450, 452, 624, 843, 904, 938, 981,
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a manifest of explicitly excluded retail candidates."
    )
    parser.add_argument(
        "--out",
        default="/mnt/d/Battlenet/World of Warcraft/_retail_/Interface/AddOns/Repu/tools/excluded_retail_candidates.json",
        help="Where to write the exclusion manifest.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    payload = {
        "zones": sorted(EXCLUDED_ZONE_IDS),
        "subZones": sorted(EXCLUDED_SUBZONE_IDS),
    }
    Path(args.out).write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Excluded zones: {len(payload['zones'])}")
    print(f"Excluded subZones: {len(payload['subZones'])}")
    print(f"Wrote manifest: {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
