#!/usr/bin/env bash
# Convenience wrapper: extract lean decls + run blueprint alignment check.
# Run from repo root.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

LEAN_ROOT="lean/LanglandsLean"
BLUEPRINT_SRC="lean/blueprint/src"
DECLS_JSON="lean/blueprint/src/lean_decls.json"

python3 tools/extract_lean_decls.py \
  --root "$LEAN_ROOT" \
  --repo-root . \
  --out "$DECLS_JSON"

python3 tools/check_blueprint_alignment.py \
  --blueprint "$BLUEPRINT_SRC" \
  --decls "$DECLS_JSON" \
  "$@"
