# Langlands

A Stacks-Project-style mathematical knowledge base for the Langlands
program, paired with a Lean 4 formalization layer that hooks into the
same node identifiers.

## Goal

Build the **Stacks Project for the Langlands program** — but not the
way Stacks was built. The intended division of labour, applied
uniformly to **both** the knowledge graph and the Lean library, is:

- **AI writes** the bulk of the content: blueprint nodes,
  natural-language proofs, Lean definitions and proofs, and alignment
  back to the graph.
- **Humans review**: mathematical correctness, taste, scope, naming,
  source provenance, the architecture of the DAG itself, and Lean-side
  decisions (Mathlib idioms, naming, instance design, smoothness vs.
  property typeclass placement, etc.).

The Lean library is not exempt from this; it follows the same
AI-writes / human-reviews discipline, with the human review bar set by
the standards a Mathlib reviewer would apply.

On top of that knowledge layer, the second goal is to grow a **shared
Lean foundational library** that is the right base for formalizing
Langlands-program research papers — the definitions, structural
theorems, and conventions that individual paper formalizations can
all build on without re-deriving the same scaffolding. The knowledge
graph dictates *what* belongs in that base; the Lean library realizes
it; the issue-per-node workflow keeps the two synchronized.

The project therefore has two coupled deliverables:

1. A directed acyclic graph of mathematical nodes (definitions, lemmas,
   theorems, examples, proof plans) written in Markdown + KaTeX and
   published as a static knowledge site.
2. A Lean 4 library (on Mathlib `v4.28.0`) that formalizes selected
   nodes and reports its alignment back into the knowledge graph, and
   is structured so that paper-specific formalizations can sit cleanly
   on top.

The mathematical database is the source of truth and is independent of
the Lean side; the Lean side cites stable node IDs but does not dictate
the organization of the mathematics.

## Scope

Top-level themes are catalogued in
[`docs/00-project-outline.md`](docs/00-project-outline.md). The current
working surface is **Algebraic Groups and Homogeneous Spaces**:
Borel–Tits–Bruhat–Tits theory, root data and Coxeter combinatorics,
rational forms and dual groups, Brylinski–Deligne covers, homogeneous
and spherical spaces, buildings, and the Kottwitz / Kaletha structures
needed downstream.

The *relative* Langlands viewpoint is part of the organizing
philosophy: classical group cases are treated as special cases of
spaces with group action.

## Repository layout

```
docs/
  00-project-outline.md         Editorial principles and theme catalog
  publishing.md                 How to build and deploy the site
  knowledge/
    mdblueprint.yml             Site config (title, macros, references)
    nodes/<topic>/<id>.md       The DAG — every node lives here
    nodes/<topic>/topics.md     Human catalog (not a DAG edge)
    references/, sources/       Bibliography and source extracts
    staged/, reviews/, requests/  Pipeline working dirs (non-durable)
  superpowers/specs/            Design specs for project decisions
lean/
  lakefile.lean                 Mathlib v4.28.0
  LanglandsLean/                Lean library, mirroring topic layout
references/                     PDF references (Borel, Humphreys, Springer)
scripts/publish_md.py           Build + verify + sync entry point
```

The knowledge graph currently has on the order of 200 admitted nodes
under `docs/knowledge/nodes/`, with the heaviest concentration in
`linear_algebraic_groups/`.

## How development works

The same four-step pipeline runs for every coherent unit of work
(one definition + its immediate properties, one theorem + its lemmas,
one phase milestone, …). The longer-form version with rationale lives
in [`AGENTS.md`](AGENTS.md).

### 1. Identify

Pick the unit from a spec under `docs/superpowers/specs/` or from the
phase roadmap. Before drafting anything, run a **Mathlib survey** via
the Lean LSP MCP tools (`lean_local_search`, `lean_leansearch`,
`lean_loogle`, plus targeted `grep` against
`lean/.lake/packages/mathlib/Mathlib/`) and write a one-paragraph
"Mathlib state" entry: what already exists, what alternatives the
category-theoretic library packages, and what counts as a real gap.
This distinguishes engineering gaps from mathematical gaps.

### 2. Blueprint

Write Markdown nodes under `docs/knowledge/nodes/<topic>/<id>.md`.
Every node has YAML frontmatter (`id`, `title`, `kind`,
`primary_topic`, `uses`, `verification`, `generality`, `tags`),
KaTeX statements (`\(...\)`, `\[...\]`), a real natural-language
proof in the body for theorems and lemmas, and a `uses:` list that
keeps the DAG acyclic. The `lean:` field is left empty here and gets
filled in step 4.

Run the structural check until it reports `0 error(s)`:

```bash
cd ~/mycodes/mdblueprint
uv run python -m tools.knowledge.check \
  /Users/hoxide/mydoc/Langlands/docs/knowledge
```

### 3. Issue

For each node (or tightly coupled cluster), open one GitHub issue on
`Langlandsproject/Langlands` with title
`[Phase X] <task>`, body linking the node id, acceptance criteria, and
`Blocked by #N` lines that mirror the blueprint `uses` graph. Labels:
`phase:X` + an `area:*` label. Phase milestones group issues.

### 4. Execute

Implement in Lean in DAG order. The primary interface for
formalization is the **Lean LSP MCP** (`lean_diagnostic_messages`,
`lean_goal`, `lean_hover_info`, `lean_multi_attempt`), **not** a shell
`lake build`. After each focused edit run
`lean_diagnostic_messages` on the file; use `lean_multi_attempt` to
explore tactics without editing.

When the Lean lands, update the corresponding blueprint node's
`lean.modules`, `lean.declarations`, and
`verification.alignment: aligned`, re-run the mdblueprint check,
commit with the node id and issue number in the message, and close
the issue with a comment naming the commit.

Why this order? Writing the natural-language proof first forces
honesty about what is actually provable and surfaces the right
Mathlib hooks before any Lean is written. Issues-per-node keeps the
formalization tractable — one PR = one node.

## Publishing

`scripts/publish_md.py` is the standard entry point. It runs the
mdblueprint check, gates on `lean_reverse_check` (so Markdown
`lean.declarations` and Lean `Blueprint:` markers cannot drift apart),
builds a temporary static site, verifies graph artifacts, runs browser
render checks, and syncs the result to the local Pages checkout.

```bash
# Local dry run
python3 scripts/publish_md.py

# Publish to GitHub Pages
python3 scripts/publish_md.py --commit-pages --push-pages
```

Useful options: `--skip-reverse-check`, `--strict-reverse-links`,
`--skip-render-check`, `--render-page <name>`,
`--build-dir <path>`. Environment overrides: `MDBLUEPRINT_ROOT`,
`PAGES_ROOT`. See [`docs/publishing.md`](docs/publishing.md).

## Lean library

```bash
# Full build — only when explicitly checkpointing
cd lean && lake build
```

For day-to-day proof iteration use the Lean LSP MCP, not shell builds.
`lake build` is reserved for explicit checkpoint, CI parity, or release
validation; it is too heavy for ordinary work.

### Key conventions

- **Group scheme over `S`.** Use Mathlib's typeclass-on-scheme idiom:

  ```lean
  (G S : Scheme) [G.Over S] [GrpObj (Scheme.asOver G S)]
  ```

  Property typeclasses (`IsAffineHom`, `LocallyOfFiniteType`, …) sit
  on the structure morphism `G ↘ S`. Do **not** introduce bundled
  abbreviations like `GroupScheme S := Grp (Over S)`; they do not
  match what Mathlib lemmas consume.

- **Project aggregator typeclasses.**
  [`lean/LanglandsLean/AlgebraicGeometry/IsAlgebraicGroup.lean`](lean/LanglandsLean/AlgebraicGeometry/IsAlgebraicGroup.lean)
  defines

  ```lean
  IsAffineGroupScheme G S = GrpObj (asOver G S) + IsAffineHom (G ↘ S)
  IsAlgebraicGroup    G S = IsAffineGroupScheme G S + LocallyOfFiniteType (G ↘ S)
  ```

  with forwarder instances so the aggregator and the underlying
  Mathlib stack are two-way synonyms. **Smoothness is not part of
  `IsAlgebraicGroup`** — `μ_n` and `α_p` in characteristic `p` are
  algebraic but not smooth. Smoothness enters as
  `[Smooth (G ↘ S)]` where the theory requires it.

- **Full discussion.**
  [`docs/superpowers/specs/2026-05-23-affine-algebraic-group-design.md`](docs/superpowers/specs/2026-05-23-affine-algebraic-group-design.md)
  and
  [`lean/LanglandsLean/AlgebraicGeometry/Conventions.lean`](lean/LanglandsLean/AlgebraicGeometry/Conventions.lean).

## Blueprint system

This project uses [**mdblueprint**](file:///Users/hoxide/mycodes/mdblueprint),
a Markdown-based knowledge pipeline. mdblueprint is **hand-rolled and
provisional** — it is the system we use today, not a long-term
commitment.

The source of truth is intentionally kept thin and portable: per-node
Markdown files with YAML frontmatter, KaTeX math, and `[[node:id]]`
cross-references. The DAG lives in `uses:` fields, not in any
tool-specific format. If a better blueprint system appears later
(richer Lean cross-linking, better graph UI, mainline tooling, etc.),
**migration cost is expected to be low** — a mechanical rewrite of
frontmatter and link syntax, not a re-authoring of the mathematics.
Keep this in mind when extending mdblueprint: don't entangle node
content with mdblueprint-specific features that wouldn't survive a
migration.

It does **not** use PFR-style `lean-blueprint`, plasTeX, or any
`lean/blueprint/src/*.tex` setup. If a `lean/blueprint/` directory
appears here it is deprecated scaffolding from an earlier misstep —
ignore or delete it after confirming with the maintainer.

Node format reference: `~/mycodes/mdblueprint/docs/node-format.md`,
`~/mycodes/mdblueprint/docs/math-authoring.md`. KaTeX delimiters
(`\(...\)`, `\[...\]`) are preferred over `$...$`; project-wide math
macros live under `math.macros` in `docs/knowledge/mdblueprint.yml`;
`[[node:id|label]]` cross-references must live outside math
delimiters.

## Pointers

- Project outline and theme catalog:
  [`docs/00-project-outline.md`](docs/00-project-outline.md)
- Standing agent instructions (read before editing): [`AGENTS.md`](AGENTS.md)
- Publishing details: [`docs/publishing.md`](docs/publishing.md)
- Affine group scheme design spec:
  [`docs/superpowers/specs/2026-05-23-affine-algebraic-group-design.md`](docs/superpowers/specs/2026-05-23-affine-algebraic-group-design.md)
- GitHub: `Langlandsproject/Langlands` (issues labelled `phase:A`,
  `phase:B`, `phase:D`, …)
