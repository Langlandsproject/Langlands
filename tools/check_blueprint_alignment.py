#!/usr/bin/env python3
"""Verify that every \\lean{X} reference in blueprint sources resolves to a real
Lean declaration listed in the lean_decls.json produced by extract_lean_decls.py.

Exit code 0 if all references resolve (or --strict not set and only warnings).
Exit code 1 if --strict is passed and any reference fails to resolve.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

LEAN_REF_RE = re.compile(r"\\lean\{([^}]+)\}")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--blueprint", required=True,
                        help="Path to blueprint src/ directory")
    parser.add_argument("--decls", required=True,
                        help="Path to lean_decls.json produced by extract_lean_decls.py")
    parser.add_argument("--strict", action="store_true",
                        help="Exit 1 on any unresolved reference")
    args = parser.parse_args()

    decls_path = Path(args.decls)
    if not decls_path.exists():
        print(f"error: decls JSON not found: {decls_path}", file=sys.stderr)
        return 2
    data = json.loads(decls_path.read_text())
    known = set(data.get("decls", {}).keys())

    blueprint_dir = Path(args.blueprint)
    if not blueprint_dir.exists():
        print(f"error: blueprint dir not found: {blueprint_dir}", file=sys.stderr)
        return 2

    total = 0
    unresolved: list[tuple[Path, int, str]] = []

    for tex_file in sorted(blueprint_dir.rglob("*.tex")):
        for line_no, line in enumerate(tex_file.read_text().splitlines(), start=1):
            for m in LEAN_REF_RE.finditer(line):
                # \lean{a, b, c} — split on commas.
                names = [n.strip() for n in m.group(1).split(",") if n.strip()]
                for name in names:
                    total += 1
                    if name not in known:
                        unresolved.append((tex_file, line_no, name))

    if not unresolved:
        print(f"OK: all {total} \\lean{{}} references resolve.")
        return 0

    print(f"FAIL: {len(unresolved)} of {total} \\lean{{}} references unresolved:",
          file=sys.stderr)
    for path, line_no, name in unresolved:
        print(f"  {path}:{line_no}: '{name}'", file=sys.stderr)
    return 1 if args.strict else 0


if __name__ == "__main__":
    sys.exit(main())
