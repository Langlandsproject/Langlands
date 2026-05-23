#!/usr/bin/env python3
"""Walk a Lean source tree and emit a JSON map of declaration name -> file:line.

Output schema:
  {
    "decls": {
      "FullyQualified.Name": {"file": "lean/LanglandsLean/X.lean", "line": 42},
      "ShortName": {"file": "...", "line": 42}
    }
  }

Short-name aliases are added only when unambiguous (multiple decls sharing a
short name are dropped from the aliases). This lets blueprint authors write
\\lean{ShortName} when there is no collision.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

# Lean 4 declaration keywords we want to index.
DECL_KEYWORDS = (
    "theorem",
    "lemma",
    "def",
    "abbrev",
    "instance",
    "inductive",
    "structure",
    "class",
    "opaque",
    "axiom",
)

# Matches a declaration with optional modifiers / attributes.
DECL_RE = re.compile(
    r"""^\s*
        (?:(?:@\[[^\]]*\])\s*)?               # optional attribute
        (?:private\s+|protected\s+|noncomputable\s+|public\s+)*
        (?:""" + "|".join(DECL_KEYWORDS) + r""")\s+
        (?P<name>[\wÀ-￿\.]+)        # decl name (allow unicode)
    """,
    re.VERBOSE,
)

NAMESPACE_OPEN_RE = re.compile(r"^\s*namespace\s+(?P<name>[\w\.]+)\s*$")
NAMESPACE_CLOSE_RE = re.compile(r"^\s*end(?:\s+(?P<name>[\w\.]+))?\s*$")
SECTION_OPEN_RE = re.compile(r"^\s*section(?:\s+[\w\.]+)?\s*$")


def parse_file(path: Path, repo_root: Path) -> list[tuple[str, str, int]]:
    """Return a list of (fully_qualified_name, relative_path, line)."""
    namespace_stack: list[str] = []
    out: list[tuple[str, str, int]] = []

    try:
        text = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        return []

    rel_path = str(path.resolve().relative_to(repo_root.resolve()))

    for idx, line in enumerate(text.splitlines(), start=1):
        # Track namespace open/close.
        m = NAMESPACE_OPEN_RE.match(line)
        if m:
            namespace_stack.append(m.group("name"))
            continue
        m = NAMESPACE_CLOSE_RE.match(line)
        if m:
            closed = m.group("name")
            if closed:
                # `end X.Y` — pop matching count from the top, robustly.
                parts = closed.split(".")
                # Find a suffix of the stack that joins (with '.') to `closed`.
                # Try from the deepest possible match.
                joined = ".".join(namespace_stack)
                if joined.endswith(closed):
                    # Pop `len(parts)` from the right.
                    for _ in range(len(parts)):
                        if namespace_stack:
                            namespace_stack.pop()
            else:
                if namespace_stack:
                    namespace_stack.pop()
            continue
        # Skip section open/close (don't affect namespace).
        if SECTION_OPEN_RE.match(line):
            continue
        # Declaration?
        m = DECL_RE.match(line)
        if m:
            short = m.group("name")
            ns = ".".join(namespace_stack)
            fq = f"{ns}.{short}" if ns else short
            out.append((fq, rel_path, idx))
    return out


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", required=True,
                        help="Lean source root, e.g. lean/LanglandsLean")
    parser.add_argument("--repo-root", default=".",
                        help="Repo root for relative paths in output (default .)")
    parser.add_argument("--out", required=True,
                        help="Output JSON path")
    args = parser.parse_args()

    root = Path(args.root).resolve()
    repo_root = Path(args.repo_root).resolve()
    if not root.exists():
        print(f"error: root does not exist: {root}", file=sys.stderr)
        return 2

    decls: dict[str, dict] = {}
    short_seen: dict[str, list[str]] = {}

    for lean_file in sorted(root.rglob("*.lean")):
        for fq, rel, line in parse_file(lean_file, repo_root):
            decls[fq] = {"file": rel, "line": line}
            short = fq.rsplit(".", 1)[-1]
            short_seen.setdefault(short, []).append(fq)

    # Add unambiguous short-name aliases.
    for short, fqs in short_seen.items():
        if len(fqs) == 1 and short not in decls:
            decls[short] = decls[fqs[0]]

    out_path = Path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps({"decls": decls}, indent=2, ensure_ascii=False))
    print(f"Wrote {len(decls)} entries to {out_path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
