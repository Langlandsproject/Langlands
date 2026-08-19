# AGENTS.md

Standing instructions for any AI coding agent (Claude Code, Codex, etc.)
working in this repository.

## Project at a glance

This is the **Langlands** project: a mathematical knowledge base for the
Langlands program plus a Lean 4 formalization layer.

- Knowledge base: Markdown nodes under `docs/knowledge/nodes/`, organized
  by topic directories.
- Lean library: `lean/LanglandsLean/` (Lean 4, Mathlib v4.33.0).
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

## The second rule: definitions are transcriptions, not translations

Every owner review of 2026-08-19 caught the same failure: a Lean
definition built from whatever object was *available or convenient*
(group-like elements, Hopf-hom tricks, dual lattices, `Additive`
stacks, structure-quantifying `∃`) instead of the **normal
mathematical definition**. The procedure that prevents it:

1. **Write the textbook sentence first.** Before any Lean definition,
   copy the definiens from the KB node / standard reference into the
   docstring draft: "X^*(T) := Hom(T, 𝔾ₘ)", "diagonalizable :=
   isomorphic to k[M]", "cocharacter := hom 𝔾ₘ → T".
2. **Transcribe token-by-token.** Every object in the Lean definition
   must correspond to a word in that sentence. `Hom(T, 𝔾ₘ)` →
   homomorphisms of algebraic groups (`CharacterGroup`). If the Lean
   spelling contains an object the sentence does not mention
   (`GroupLike`, a dual, an existential over carriers), the
   definition is wrong — *by default, before any argument*.
3. **The name test.** If the API name mentions the avatar
   (`groupLikeLift`), the design is already wrong; correct names fall
   out of correct definitions (`charLift`).
4. **Awkwardness never changes the definition.** If the transcription
   is hard to work with, the convenient object enters as a *bridge
   theorem* (with its KB node), and proofs go through the bridge.
   Bridge nodes license identifications **in proofs — never as
   definitions**.
5. **Reuse before define — one object, one name.** Before any object
   appears in a statement, find its existing name (repo first, then
   Mathlib: `lean_local_search`, grep). Re-spelling an existing
   object inline (`AddMonoidAlgebra R ℤ` where `O(𝔾ₘ) =
   LaurentPolynomial R` is meant) and re-defining it (a hand-rolled
   second `𝔾ₘ` when `multiplicativeGroup` exists) are both banned.
   "Hom of algebraic groups" means the categorical hom that already
   exists (morphisms of `Grp (Over (Spec R))`), never a re-encoded
   carrier (`WithConv` of Hopf homs) — encodings live on the bridge
   side, under their own names (`HopfCharacterGroup`).
6. **`Examples/` holds only illustrations.** Anything referenced by
   a definition elsewhere is a construction, not an example, and is
   promoted out of `Examples/` (burned: `Gm`).
7. **Fixes replace, never layer.** When a review corrects a
   definition, the old form is *replaced* — not kept under its old
   name beside the new one, and the concept's name is never handed
   to a convenience composite over the real definition. Dual pairs
   (`X^*`/`X_*`) are defined in the same shape, differing only where
   the mathematics differs (one arrow direction). Burned:
   `CharacterGroup` briefly became a `CommRingCat.of` composite over
   `SchemeCharacterGroup` while `CocharacterGroup` was a raw hom —
   two styles for dual concepts (2026-08-19).
8. **Plans do not override conventions.** A plan line that encodes a
   convenient-form definition (it happened: plan M5 said
   "charLattice := GroupLike…") is a bug in the plan; conventions
   §6 wins and the plan line gets annotated, not executed.

Full text and the day's case log: `docs/01-design-conventions.md` §6.

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
| **Pre-commit review checklist (binding)** | `docs/03-review-checklist.md` |
| Reusable review prompts (plan verification etc.) | `docs/superpowers/prompts/` |

Read `docs/01-design-conventions.md` before creating, renaming, or
linking anything. **No commit touching KB or Lean without walking
`docs/03-review-checklist.md`** — the rules exist because they were
each violated once; the checklist is what makes them fire at the
right moment. **After every change-set, audit it against the rules
in this file and record the audit outcome (including findings that
exceed the change-set, e.g. discovered duplication) in the commit
message** (owner directive, 2026-08-19).

## Build and check commands

mdblueprint tools live in `~/mycodes/mdblueprint`. From this repo:

```bash
# Design lint (mechanized review rules — run before every commit)
python3 scripts/lint_design.py

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
formalization. Use the lean4-skills below plus Lean LSP MCP for local,
interactive feedback. `lake build` is reserved for explicit checkpoint,
CI-parity, or release-style validation, because it is too heavy for normal
proof iteration.

## Lean skills (installed — invoke by these exact names)

From [cameronfreer/lean4-skills](https://github.com/cameronfreer/lean4-skills),
installed at `~/.claude/skills/`. There is **no** skill named `lean4`;
these are the real names:

| Skill | When to invoke |
|---|---|
| `lean-sorry-crusher` | **Mandatory for every proof pass** — any session whose goal is filling `sorry`s in a Lean file. Plan/prover/review loop with state files. |
| `lean-blueprint` | **Do not use for scaffolding here** (this repo uses mdblueprint, see "The one rule"). Reference only, for its Lean↔prose alignment conventions. |

Statement-first passes (definitions + sorry'd statements) use the Lean
LSP MCP calls below directly; the crusher takes over when proofs start.

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

All in `docs/01-design-conventions.md`. The ones broken most often —
full text and examples are in that file (§6–§8):

1. **Faithful formalization**: Lean definitions mirror the KB
   statement's form; computed/equivalent descriptions are theorems,
   never definitions.
2. **Justified conversions**: every wrapper (`Multiplicative`,
   `WithConv`, `ULift`, ...) in a public statement needs a
   conversion-glossary entry in the module docstring.
3. **No smoke tests**: examples go in `Examples` sections/files;
   instance checks live in real downstream uses.
4. **No universe hacking** (full rule: conventions §7): never write
   `ULift`/universe shims into public statements, and do not add
   `universe`/`Type*` gymnastics beyond what Mathlib's own signatures
   force. A universe mismatch means a `Type 0` skeleton
   (`Fin n → ℤ`) was hard-coded where the definition should be
   parameterized over a carrier with typeclasses
   (`[Module.Free ℤ M] [Module.Finite ℤ M]`). Skeletons belong in
   `Type 0` examples only.
5. **File contents are node-driven** (full rule: conventions §4):
   a Lean file = the definitions of one node cluster in one topic;
   the file's directory = that topic; the namespace matches. Before
   adding a definition to a file, check the primary topic of its
   Blueprint node — different topic means different file. Quick
   audit: `grep -o 'Blueprint: [a-z_.,\ ]*' <file> | sort -u` — the
   first-listed nodes of definitions must all live in the file's
   topic. Burned: diagonalizable-group definitions in `Tori/Torus.lean`;
   Speiser in `Tori/`.
6. **Mathlib naming, binding** (full rules: conventions §8): types
   and predicates UpperCamel (`IsTorusAlgebra`); data terms lowerCamel
   (`descentMap`); theorems snake_case named by conclusion with
   Mathlib patterns (`_eq_top`, `foo_one`, no typeclass hypotheses in
   names); no ad-hoc abbreviations. Lean-specific idioms
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

- **Avatar-based definitions, three relapses in one day**
  (2026-08-19): X^* as group-likes (twice at definition sites, once
  more as `CharLattice := Additive (GroupLike …)`), diagonalizability
  as `groupLikeLift` bijectivity with the avatar in the API name.
  Each time the fix was the same: define via `Hom(−, 𝔾ₘ)`
  (`CharacterGroup`), demote the avatar to a bridge theorem. See
  "The second rule" above.
- **Structure-quantifying existentials and inverted hierarchies**
  (2026-08-19, owner-caught): `IsTorusAlgebra := ∃ M
  (_ : AddCommGroup M), …` and torus defined without reference to
  diagonalizable. Rules: conventions §6 ("transcribe the hierarchy")
  and §7 ("no structure quantification in propositions"). Root
  cause both times: mechanically pattern-matching a fresh rule /
  goal-fixation instead of design reasoning.
- **Availability-driven definitions** (three review rounds on
  2026-08-19): defining X^* as group-likes / Hopf homs because Mathlib
  made them cheap, when the KB definiens is group-scheme homs. Root
  cause and the two rules that prevent it (statement-driven
  transcription; bridge identifications need KB nodes first):
  `docs/01-design-conventions.md` §6.

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
