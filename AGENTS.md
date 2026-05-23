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

## Node format (short reference)

See `~/mycodes/mdblueprint/docs/node-format.md` and
`~/mycodes/mdblueprint/docs/math-authoring.md` for the full contract.
Minimal shape:

```markdown
---
id: <full dotted id, e.g. linear_algebraic_groups.affine_group_scheme_definition>
title: <display title>
kind: definition | theorem | lemma | corollary | example | construction | topic
status: admitted
primary_topic: <topic_id>
topics:
  - <topic_id>
uses:
  - <other_node_id>
lean:
  modules:
    - <Lean module name>
  declarations:
    - <fully-qualified Lean decl>
verification:
  statement: accepted | pending
  proof: accepted | pending | not_applicable
  alignment: pending
generality:
  reviewed: true
  prompt: "..."
  verdict: "..."
tags:
  - <tag>
---

# <title>

Statement in natural language with inline math \(f : X \to Y\) and
display math:
\[
\Delta(x) = x \otimes 1 + 1 \otimes x.
\]

*Proof.*  
Natural-language proof, with [[node:other_node|label]] for
cross-references. Do **not** use LaTeX `\begin{theorem}` /
`\begin{proof}` environments — node `kind` and the publisher provide
styling.
```

Math conventions:

- Inline: `\(...\)` (preferred) or `$...$`.
- Display: `\[...\]` (preferred) or `$$...$$`.
- Project-wide macros live in `docs/knowledge/mdblueprint.yml` under
  `math.macros`; declare without leading slash, use with leading slash.
- `[[node:id]]` cross-refs must live outside math delimiters.

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

Lean side:

```bash
cd lean && lake build
```

## Design conventions (high-level pointers)

- Affine algebraic groups: see
  `docs/superpowers/specs/2026-05-23-affine-algebraic-group-design.md`.
- Lean idiom for "group scheme over `S`": follow Mathlib's
  typeclass-on-scheme pattern
  `(G : Scheme) [G.Over S] [GrpObj (Scheme.asOver G S)]` plus property
  typeclasses on the structure morphism `(G ↘ S)`. **Do not** introduce
  bundled types like `GroupScheme S := Grp (Over S)`. Project-specific
  aggregator typeclasses (`IsAffineGroupScheme`, `IsAlgebraicGroup`) live
  in `lean/LanglandsLean/AlgebraicGeometry/IsAlgebraicGroup.lean`; the
  full convention is documented in
  `lean/LanglandsLean/AlgebraicGeometry/Conventions.lean`.
- GitHub: issues track milestones grouped by phase (`phase:A`,
  `phase:B`, `phase:D`, ...). Issue body acceptance criteria are
  binding; the dependency relation is encoded in the "Blocked by"
  section. Repo: `Langlandsproject/Langlands`.

## Things that have burned us before

- **Setting up a parallel PFR-style TeX blueprint** when this project
  uses mdblueprint. Cost: one full chat session of wasted scaffolding
  in `lean/blueprint/`. Do not repeat.
- **Declaring Phase B work "blocked on Mathlib"** prematurely.
  The Mathlib gap on packaged `Comodule` is shallow — a 15-line
  structure definition closes it. `hopfSpec` does not strictly require
  `Functor.Monoidal`; an object-level hand-roll works. Investigate
  before declaring blocked.
- **Adding `GroupScheme S := Grp (Over S)` abbrev**: Mathlib does not
  package group schemes this way; the canonical idiom is the
  typeclass-on-scheme pattern above. See spec §3 and the existing
  `Conventions.lean`.
