#!/usr/bin/env python3
"""Design linter: mechanizes the review rules that burned us.

Each check corresponds to an owner-caught defect class from
2026-08-19 (see docs/01-design-conventions.md and AGENTS.md).
Exit code 1 on any finding. Run from the repo root:

    python3 scripts/lint_design.py
"""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LEAN = ROOT / "lean" / "LanglandsLean"
NODES = ROOT / "docs" / "knowledge" / "nodes"

findings = []


def flag(path: Path, line_no: int, rule: str, text: str) -> None:
    findings.append(f"{path.relative_to(ROOT)}:{line_no}: [{rule}] {text.strip()}")


# 1. Re-spelling denylist: named objects must be referenced by name.
RESPELLINGS = [
    (re.compile(r"AddMonoidAlgebra\s+(\w+)\s+ℤ"),
     "O(𝔾ₘ) is LaurentPolynomial _, not raw AddMonoidAlgebra _ ℤ"),
    (re.compile(r"Grp\.mk\s+\(multiplicativeGroup"),
     "the algebraic-group level of 𝔾ₘ is `𝔾ₘ R` (Gm.lean), not inline Grp.mk"),
]
RESPELL_ALLOW = {"Gm.lean"}  # the defining file may spell the identification

# 2. Structure-quantifying existentials.
STRUCT_EXISTS = re.compile(r"∃[^,\n]*\(_\s*:\s*[A-Z]\w*(\s|\.)")

# 3. Type-ascribed type formers.
TYPE_ASCRIPTION = re.compile(r":\s*Type\s*(_|\w+)?\s*:=")

# 4. universe declarations outside pinned files.
UNIVERSE_ALLOW_MARKERS = ("CommRingCat.{", "Rep.{", "CommHopfAlgCat.{", "Scheme.{")

# 5. Module-level Blueprint sections (stamp every decl — banned).
MODULE_BLUEPRINT = re.compile(r"^## Blueprint\s*$")

# 6. Blueprint placement: a definition's first-listed node must live in
#    the file's topic directory (checked for files under AlgebraicGroups/<Topic>/).
DECL_KIND = re.compile(
    r"^\s*(noncomputable\s+)?(abbrev|def|structure|class|instance|theorem|lemma)\s")
BLUEPRINT_LINE = re.compile(r"^\s*Blueprint:\s*([a-z_0-9.]+)")


def node_primary_topic():
    table = {}
    for md in NODES.glob("*/*.md"):
        text = md.read_text(encoding="utf-8")
        mid = re.search(r"^id:\s*(\S+)", text, re.M)
        mtop = re.search(r"^primary_topic:\s*(\S+)", text, re.M)
        if mid and mtop:
            table[mid.group(1)] = mtop.group(1)
    return table


PRIMARY = node_primary_topic()


def file_topic(path):
    parts = path.relative_to(LEAN).parts
    if len(parts) >= 2 and parts[0] == "AlgebraicGroups":
        return f"AlgebraicGroups.{Path(parts[1]).stem}" if len(parts) == 2 \
            else f"AlgebraicGroups.{parts[1]}"
    return None


for lf in sorted(LEAN.rglob("*.lean")):
    lines = lf.read_text(encoding="utf-8").split("\n")
    topic = file_topic(lf)
    pending_node = None
    uses_pin = any(m in "\n".join(lines) for m in UNIVERSE_ALLOW_MARKERS)
    for i, ln in enumerate(lines, 1):
        if lf.name not in RESPELL_ALLOW:
            for rx, msg in RESPELLINGS:
                if rx.search(ln) and "--" not in ln.split(str(rx.pattern))[0][:2]:
                    flag(lf, i, "respelling", f"{msg}: {ln}")
        if STRUCT_EXISTS.search(ln):
            flag(lf, i, "structure-exists", ln)
        if TYPE_ASCRIPTION.search(ln):
            flag(lf, i, "type-ascription", ln)
        if ln.strip().startswith("universe") and not uses_pin:
            flag(lf, i, "universe", "universe declaration without a pin "
                 "(CommRingCat.{u}/Rep.{u}/…) in this file")
        if MODULE_BLUEPRINT.match(ln):
            flag(lf, i, "module-blueprint", "module-level '## Blueprint' stamps "
                 "every declaration; use '## Knowledge base'")
        m = BLUEPRINT_LINE.match(ln)
        if m:
            pending_node = m.group(1)
            continue
        if pending_node and DECL_KIND.match(ln):
            kind = DECL_KIND.match(ln).group(2)
            if kind in ("abbrev", "def", "structure", "class") and topic:
                home = PRIMARY.get(pending_node)
                if home and home != topic:
                    flag(lf, i, "placement",
                         f"definition's home node {pending_node} has "
                         f"primary_topic {home}, file topic is {topic}")
            pending_node = None

if findings:
    print(f"{len(findings)} design-lint finding(s):")
    for f in findings:
        print("  " + f)
    sys.exit(1)
print("design lint clean")
