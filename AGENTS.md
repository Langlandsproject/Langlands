# AGENTS.md

Standing instructions for any AI coding agent (Claude Code, Codex, etc.)
working in this repository.

## Project at a glance

This is the **Langlands** project: a mathematical knowledge base for the
Langlands program plus a Lean 4 formalization layer.

- Knowledge base: Markdown nodes under `docs/knowledge/nodes/`, organized
  by topic directories.
- Lean library: `lean/LanglandsLean/` (Lean 4, Mathlib v4.28.0).
- Design docs and specs: `docs/superpowers/specs/`.

## The one rule you must follow

**Use mdblueprint, not LaTeX / plasTeX / PFR-style Lean Blueprint.**

The blueprint system in this project is
[`mdblueprint`](file:///Users/hoxide/mycodes/mdblueprint), a Markdown-based
knowledge pipeline. Every mathematical node is a `.md` file under
`docs/knowledge/nodes/<topic>/<node-id>.md` with YAML frontmatter, KaTeX
math (`\(...\)` inline, `\[...\]` display), and `[[node:id|label]]`
cross-references.

**Do not** set up `lean/blueprint/src/*.tex`, `plastex.cfg`,
`leanblueprint` packaging, or anything derived from the PFR
`lean-blueprint` skill. That is a different system, and using it here
forks the source of truth.

If a `lean/blueprint/` directory exists in this repo, treat it as
deprecated scaffolding from a misstep and either ignore it or delete it
(check with the user first).

## Where the existing nodes live

- `docs/knowledge/mdblueprint.yml` — project config (site title, math
  macros, references library, topic catalog).
- `docs/knowledge/nodes/<topic>/<node-id>.md` — admitted knowledge nodes.
- `docs/knowledge/nodes/<topic>/topics.md` — human catalog per topic
  (does **not** create DAG edges).
- `docs/knowledge/staged/`, `reviews/`, `requests/`, `sources/` —
  pipeline working dirs (only `nodes/` is durable truth).

The 11 topic-level stubs under `docs/knowledge/nodes/linear_algebraic_groups/`
are intentionally broad; sub-nodes (definitions, theorems, lemmas,
constructions, examples) belong under the same topic directory and depend
on the topic-level node via `uses:`.

## Where the rules live (map, not content)

| Concern | Authoritative file |
|---|---|
| Project purpose, themes | `docs/00-project-outline.md` |
| **Design constraints** (topic naming, node-id freeze, Lean↔KB linking, gates) | `docs/01-design-conventions.md` |
| Roadmap and per-goal design decisions | `docs/TODO.md` |
| Standard 4-step workflow | `docs/02-agent-workflow.md` |
| Node format, statuses, admission pipeline | `~/mycodes/mdblueprint/docs/node-format.md` |
| Topic model | `~/mycodes/mdblueprint/docs/topic-model.md` |
| Math authoring (delimiters, macros) | `~/mycodes/mdblueprint/docs/math-authoring.md` |
| Per-topic mathematical conventions | the topic entry node (e.g. `tori.algebraic_tori`) |
| Publishing | `docs/publishing.md`, `scripts/publish_md.py` |

Read `docs/01-design-conventions.md` before creating, renaming, or
linking anything.

## Build and check commands

mdblueprint tools live in `~/mycodes/mdblueprint`. From this repo:

```bash
# Static structural + math preflight check
cd ~/mycodes/mdblueprint
uv run python -m tools.knowledge.check \
  /Users/hoxide/mydoc/Langlands/docs/knowledge

# Publish static site
uv run python -m tools.knowledge.publish \
  /Users/hoxide/mydoc/Langlands/docs/knowledge \
  /tmp/langlands-mdblueprint-site

# Browser render verification (requires chromium)
uv run --extra browser python -m tools.knowledge.render_check \
  /tmp/langlands-mdblueprint-site
```

Lean side is **not** normally checked with `lake build` during ordinary
formalization. Use the `lean4` skill plus Archon/Lean LSP MCP for local,
interactive feedback. `lake build` is reserved for explicit checkpoint,
CI-parity, or release-style validation, because it is too heavy for normal
proof iteration.

Preferred Lean MCP calls:

```text
# File-level compiler diagnostics after editing a Lean file.
lean_diagnostic_messages(file_path := "lean/LanglandsLean/...")

# Inspect a proof state at a line/column before changing tactics.
lean_goal(file_path := "lean/LanglandsLean/...", line := <line>, column := <col>)

# Try several candidate tactics without editing the file.
lean_multi_attempt(
  file_path := "lean/LanglandsLean/...",
  line := <line>,
  column := <col>,
  snippets := ["simp", "rw [...]", "exact ..."]
)

# Search declarations before guessing names.
lean_local_search(query := "HopfAlgebra.antipode")
lean_leansearch(query := "antipode anti-multiplicative")
lean_loogle(query := "_ * _")
```

Use `lean_hover_info` to check exact types and docs. Use `lean_build` MCP
only when a new import or module graph change requires an LSP rebuild. Do
not use shell `lake build` as the default way to discover proof errors.

Full Lean build, only when explicitly needed:

```bash
cd lean && lake build
```

## Design conventions

All in `docs/01-design-conventions.md`. Lean-specific idioms
(group-scheme typeclass pattern, no bundled `GroupScheme`) are its §6;
the affine-algebraic-group spec is
`docs/superpowers/specs/2026-05-23-affine-algebraic-group-design.md`.
GitHub: issues per phase (`phase:A` ...), repo `Langlandsproject/Langlands`.

## Standard workflow

See `docs/02-agent-workflow.md` for the 4-step pipeline
(Identify → Blueprint → Formalize → Link). Mathlib survey before
drafting is mandatory; LSP diagnostics over shell `lake build` for
the inner loop.

## Things that have burned us before

- **Setting up a parallel PFR-style TeX blueprint** when this project
  uses mdblueprint. Cost: one full chat session of wasted scaffolding
  in `lean/blueprint/`. Do not repeat.
- **Declaring Phase B work "blocked on Mathlib"** prematurely.
  The Mathlib gap on packaged `Comodule` is shallow — a 15-line
  structure definition closes it. `hopfSpec` does not strictly require
  `Functor.Monoidal`; an object-level hand-roll works. Investigate
  before declaring blocked.
- **Using shell `lake build` as the main Lean feedback loop**. It is too
  heavy and can trigger large dependency builds. Use Archon/Lean LSP MCP
  diagnostics and goals for ordinary formalization; reserve full builds
  for explicit checkpoint or CI-parity runs.
- **Adding `GroupScheme S := Grp (Over S)` abbrev**: Mathlib does not
  package group schemes this way; the canonical idiom is the
  typeclass-on-scheme pattern above. See spec §3 and the existing
  `Conventions.lean`.
