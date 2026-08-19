# Agent Workflow

The 4-step pipeline for any new mathematical content. Moved from
`AGENTS.md` (which is a map, not a manual).


For any new mathematical content (a sub-module, a cluster of related
theorems, a new phase milestone), follow this 4-step pipeline:

### 1. Identify

Read the spec (`docs/superpowers/specs/`) or roadmap. Pick a coherent
unit: one definition + its immediate properties, one theorem + its
required lemmas, etc. Do not interleave unrelated topics.

**Mathlib survey (mandatory).** Before drafting blueprint nodes, run a
short discovery pass to learn what Mathlib actually has. The cheap
tools to use through Archon/Lean LSP MCP, in order:

1. `lean_local_search` — verify whether a suspected declaration or
   namespace exists locally before guessing.
2. `lean_leansearch` — natural-language semantic search across Mathlib
   (e.g., "antipode anti-multiplicative", "convolution algebra hom",
   "Yoneda from group object to representable presheaf").
3. `lean_loogle` — type-pattern search when you have a target signature
   in mind.
4. Targeted `grep` against `lean/.lake/packages/mathlib/Mathlib/` for
   directory hierarchies and namespace conventions.

The survey should produce a one-paragraph "Mathlib state" entry for the
unit being scoped, listing:

- existing lemmas/definitions to depend on;
- categorical alternatives (e.g., `CategoryTheory.HopfObj.mul_antipode`
  lives at the abstract level even when the ring-theoretic version
  isn't packaged);
- genuine gaps that should be tracked as their own issues, separate
  from the main work.

This step catches cases where the gap is engineering (a missing
bridge instance) rather than mathematics (a missing theorem). The two
demand very different issue scoping and effort estimates.

### 2. Blueprint

Write mdblueprint nodes under
`docs/knowledge/nodes/<topic>/<node-id>.md` for every definition,
theorem, lemma, example, or proof-plan in the unit. Each node has:

- complete YAML frontmatter (id, title, kind, status, primary_topic,
  topics, uses, verification, generality, tags) — `kind` must be one of
  `topic | concept | definition | lemma | proposition | theorem | example | proof-plan | external-theorem | task`;
- precise statement in KaTeX with `\(...\)` / `\[...\]` delimiters;
- for theorems / lemmas with substantive math, a real natural-language
  proof in the body — not "see Lean";
- correct `uses:` list (forms an acyclic DAG);
- `lean:` field left empty at this stage (it gets filled when the Lean
  implementation lands).

Run `uv run python -m tools.knowledge.check docs/knowledge` (from
`~/mycodes/mdblueprint`) until it reports `0 error(s)`. Run
`uv run python -m tools.knowledge.publish` to materialize the site, and
visually skim the rendered dep graph if practical.

### 3. Issue

For each blueprint node (or a tightly coupled cluster), create one
GitHub issue:

- title: `[Phase X] <Implement Lean for ...>` or `<formalize node-id>`;
- body: link the blueprint node id; restate acceptance criteria;
  "Blocked by #N" lines mirroring the blueprint `uses` graph;
- labels: `phase:X` + `area:algebraic-geometry` (or other area label);
- milestone: the phase's milestone (create one if not present).

Use `gh issue create` with bodies authored as files in `/tmp/`.

### 4. Execute

Implement in Lean following the DAG order from the blueprint. Per issue:

- statement pass: use Lean LSP MCP directly as the formalization
  interface; **proof pass: invoke the `lean-sorry-crusher` skill**
  (from cameronfreer/lean4-skills, `~/.claude/skills/`) — see the
  "Lean skills" table in `AGENTS.md`;
- write the Lean code; aim for minimal stubs over speculative
  refactors; `sorry` only with a documented gap;
- after each focused edit, run `lean_diagnostic_messages` on the touched
  file; use `lean_goal`, `lean_hover_info`, and `lean_multi_attempt` for
  proof states and tactic experiments;
- update the corresponding blueprint node:
  `lean.modules`, `lean.declarations`, and
  `verification.alignment: aligned`;
- re-run mdblueprint check (green); run shell `lake build` only when the
  user explicitly asks for a full checkpoint/CI-style verification;
- commit with a body that names the blueprint node and the issue;
- close the issue with a comment naming the commit.

### Why this pipeline

Two reasons, learned the hard way:

1. **Blueprint-first prevents over-commitment in Lean.** Writing the
   natural-language proof first forces honesty about what's actually
   provable and identifies the right Mathlib hooks (or gaps) before
   investing in code that may need to be rewritten.
2. **Issues-from-blueprint keeps the formalization tractable.** Each
   issue is one node; "Blocked by" mirrors a mathematical dependency,
   not an engineering preference. The PR-per-node granularity matches
   what a single focused session can finish.

