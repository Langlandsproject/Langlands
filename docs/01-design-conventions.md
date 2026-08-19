# Design Conventions

Authoritative design constraints for the knowledge base and the Lean
library. `AGENTS.md` is only a map; this file is the contract. Changes
to this file are project-level decisions.

## 1. The two-layer principle: identity vs classification

The knowledge base is built to grow to Stacks-Project scale. The
central structural lesson from that scale is that **identity and
classification must be separated**:

- **Identity** (node ids) is what everything hangs on — cross
  references, `uses:` edges, Lean `Blueprint:` markers, site URLs,
  and eventually citations from papers. Identity must be permanent.
- **Classification** (topics) is navigation. It is *guaranteed* to be
  reorganized repeatedly as the library expands across the outline's
  fourteen themes (`docs/00-project-outline.md`). Classification must
  stay cheap to change.

Embedding classification in identity converts every future
reorganization into an identity migration; the layers are therefore
kept in different fields, with different casing, under different
change policies.

## 2. Topic layer (classification — reorganizable)

- Topic ids are **hierarchical UpperCamel**: `Foundations`,
  `AlgebraicGroups.Tori`, `AlgebraicGroups.ReductiveGroups`. Top-level
  segments are areas aligned with the outline themes.
- Every topic is registered in `docs/knowledge/mdblueprint.yml` under
  `topics:` (id + human title). `scripts/publish_md.py` keeps the
  expected root-area list.
- **Grammatical number**: a topic names a *class* of objects and is
  plural (`Tori`, `ReductiveGroups`, `Buildings`); a definition node or
  Lean declaration names a *concept or object* and is singular
  (`torus_definition` "Algebraic Torus", `split_torus`, `IsTorus`).
- **Names are standard mathematical nouns.** Filler words are banned:
  no `structure`, `inputs`, `basic`, `misc`, `data` unless the
  mathematical term itself contains them (`RootData` is the standard
  term; `KottwitzStructures` was not).
- A topic directory under `docs/knowledge/nodes/` is named **exactly
  by its topic id, dots included**: `nodes/AlgebraicGroups.Tori/`.
  (The checker maps one first-level directory to one canonical topic,
  so the hierarchy lives in the directory *name*, not in nesting.)
- Node membership is declared in frontmatter: `primary_topic` (home,
  determines directory) and `topics` (all views; must contain the
  home topic). Reorganizing topics touches only these fields and
  directory names — never ids.
- Topic reorganizations are planned global migrations, not one-topic
  exceptions.

## 3. Node id layer (identity — frozen)

- Node ids are `<namespace>.<name>`, all **snake_case**.
- The namespace is a **timeless mathematical noun chosen at node
  creation** — it is *not* a topic pointer and does not follow topic
  reorganizations. Current namespaces: `foundations`,
  `affine_group_schemes`, `linear_algebraic_groups`, `tori`,
  `reductive_groups`, `root_data`,
  `classical_and_exceptional_groups`, `conjugacy_classes`, `forms`,
  `covers`, `buildings`, `kottwitz`. New areas introduce new
  namespaces with the same rule.
- **Ids are frozen.** The one-time cleanup of 2026-08-19 (done while
  the KB had zero external citations) renamed:
  `foundational_inputs→foundations`,
  `reductive_structure→reductive_groups`, `descent_and_forms→forms`,
  `bd_covers→covers`, `buildings_and_parahorics→buildings`,
  `kottwitz_structures→kottwitz`, `root_data_and_duality→root_data`,
  and (same window, singular/plural repair) `tori.induced_tori→tori.induced_torus`.
  From now on, renaming an id requires an alias/redirect mechanism in
  the tooling plus a project-level decision. Session-level renames are
  forbidden.

## 4. Lean ↔ KB linking

- **Lean module tree mirrors the topic tree**: topic
  `AlgebraicGroups.Tori` ↔ modules `LanglandsLean.AlgebraicGroups.Tori.*`
  with an umbrella module per topic and per area. Lean *namespaces*
  stay short (`Langlands.Tori`) — namespaces are not paths, following
  Mathlib practice. (Legacy exception: `LanglandsLean/AlgebraicGeometry/`
  serves `AlgebraicGroups.AffineGroupSchemes` and predates the rule.)
- **Node → Lean**: an admitted node lists witnesses under `lean:`
  (`modules` + `declarations`), `verification.alignment: pending`
  until reviewed. Never link a node to a declaration that only covers
  a special case of its statement — leave it unlinked and record the
  gap.
- **Lean → node**: every principal declaration carries a `Blueprint:`
  line in its docstring naming exactly the node ids whose
  `lean.declarations` list it. The marker must **start a docstring
  line**; markers glued to sentence ends are silently ignored. Helper
  lemmas need no marker. Never use module-level `## Blueprint`
  sections (they stamp every declaration in the file identically);
  use `## Knowledge base` for prose pointers.
- **Gates** before any commit touching either side:
  `tools.knowledge.check` — 0 errors;
  `tools.knowledge.lean_reverse_check` — 0 cross-mismatch;
  `lake build` — green. All three run inside `scripts/publish_md.py`.

## 5. Mathematical conventions

Working mathematical conventions (base fields, which lattice is
primary, forbidden terminology, etc.) live in the **topic entry
node** of each topic — e.g. `tori.algebraic_tori` fixes `k_s` over
`\bar k`, the cocharacter lattice as the working lattice, and bans
"quasi-split torus". Design decisions that cut across topics (the
κ-primitive order, Tier A/B layering) are recorded in `docs/TODO.md`
goal preambles at decision time.

## 6. Faithfulness of formalization

- **A Lean definition must mirror the KB statement's mathematical
  form.** Equivalent or computed descriptions are theorems, never the
  definition. Example of the rule applied: `X^*(Spec A)` is *defined*
  as Hopf-algebra homomorphisms `R[ℤ] →ₐc[R] A` with convolution
  (the literal translation of `Hom_grp(G, 𝔾ₘ)`); the group-like
  description is the theorem `diagGroupLikeEquiv`. Simplifying
  substitutions in definitions are review-blockers, even when
  provably equivalent.
- **Every type conversion must be justified.** Wrappers
  (`Multiplicative`, `Additive`, `WithConv`, `ULift`, ...) appearing
  in public statements require a "conversion glossary" entry in the
  module docstring explaining why each is there; unexplained coercion
  chains are review-blockers. Conversions confined to proof terms
  need no entry.
- **No smoke-test grab-bags.** Mathematical examples live in an
  `Examples` section (or the `Examples/` directory) with docstrings;
  instance-wiring checks belong to real downstream uses, not
  anonymous `example := inferInstance` piles.

### Why unfaithful definitions kept appearing (2026-08-19 root cause)

Three reviews in one day found the same failure shape (X^* defined as
group-likes, then as Hopf homs, when the KB says group-scheme homs;
missing group structures; unexplained wrappers). The root cause is a
workflow bug, not a knowledge bug:

1. **Availability-driven instead of statement-driven formalization.**
   The Lean author reached for whatever Mathlib made cheap (GroupLike
   was bundled → it became "the definition"; WithConv had instances →
   it became the carrier) instead of transcribing the KB definiens
   and paying for the bridge. Rule: **transcribe the definiens; if an
   equivalent form is cheaper to compute with, the identification
   becomes a bridge theorem — and a KB bridge node — never the
   definition.**
2. **Bridge identifications had no KB nodes**, so nothing existed to
   align against and the mechanical gates passed. The KB states
   endpoints (definitions, main theorems) but the identifications
   between presentations (group-scheme homs ≃ Hopf homs ≃ group-like
   elements; convolution = pointwise multiplication; hom-groups of
   commutative group objects) were never nodes. Rule: **every
   identification used by a Lean definition or computation must have
   a KB node before the Lean lands.** A missing bridge is a stop —
   add the node first.
3. **`verification.alignment` was treated as a formality.** For a
   definition node, the alignment review question is precisely: does
   the Lean definiens mirror the node's definiens (not merely
   "does a related declaration exist")? This question is now part of
   the linking discipline in §4.

## 7. Lean idioms

- "Group scheme over `S`" is the Mathlib typeclass-on-scheme pattern
  `(G : Scheme) [G.Over S] [GrpObj (Scheme.asOver G S)]` plus property
  typeclasses on `(G ↘ S)`. **Never** introduce bundled types like
  `GroupScheme S := Grp (Over S)`. Aggregators (`IsAffineGroupScheme`,
  `IsAlgebraicGroup`) live in
  `lean/LanglandsLean/AlgebraicGeometry/IsAlgebraicGroup.lean`; full
  discussion in `lean/LanglandsLean/AlgebraicGeometry/Conventions.lean`.
- Inner loop: Lean LSP MCP diagnostics/goals; full `lake build` only at
  checkpoints.
- **No `ULift` (or any universe shim) in public statements.** A
  universe mismatch means the design hard-codes a `Type 0` skeleton
  (`Fin n → ℤ`, `ℤ`, `ℚ`) into a universe-polymorphic definition. The
  fix is Mathlib's: parameterize over a carrier in the ambient
  universe with the right typeclasses (`[Module.Free ℤ M]`
  `[Module.Finite ℤ M]` for a lattice) and let the skeleton appear
  only in `Type 0` examples, where `max u 0 = u` makes it typecheck
  without lifting. Burned once: `splitTorusOver R n :=
  diagGroupOver R (ULift (Fin n → ℤ))` plus a transfer instance —
  both deleted when the definition was re-parameterized by `M`
  (2026-08-19).

## 8. Lean naming (Mathlib conventions, binding)

Follow the Mathlib naming conventions; the recurring cases:

- **Types, type formers, structures, classes, `Prop`-valued
  predicates**: `UpperCamelCase` — `CharacterGroup`, `IsTorusAlgebra`,
  `WithConv`. (2026-08-19 repair: `characterGroup`/`cocharacterGroup`
  were lowerCamel type formers — renamed.)
- **Data-valued terms** (functions, homs, equivs, category objects):
  `lowerCamelCase` — `descentMap`, `diagCharEquiv`, `gmGrp`,
  `fixedSubmodule`.
- **Theorems/lemmas**: `snake_case`, named by the **conclusion**, head
  symbol first, with Mathlib's connective patterns: `_eq_top`,
  `_iff_`, `_of_`, `_apply`, argument-based suffixes (`foo_one` for
  the statement about `1`, not `foo_trivial`). Typeclass hypotheses
  do not go into the name (`comul_comp_antipode`, not
  `comul_comp_antipode_of_isCocomm`; compare Mathlib's
  `antipode_mul_distrib`/`antidistrib`).
- **No ad-hoc abbreviations** in names, and no abbreviation defs that
  hide an honest type (`freeLattice := Fin n → ℤ` removed — write the
  type).
- **As short as clarity allows.** Every name component must carry
  meaning; qualifier mashes are review-blockers (2026-08-19 example:
  `diagGroupLikeChar` → `groupLikeSingle` — "the group-like element
  made from `single`", each word doing work). A name needing four or
  more components usually means the declaration wants a namespace or
  wants splitting.
- **Carve-out** (repo precedent, Mathlib's atomic-object exception):
  named geometric objects as terms of `Scheme` are UpperCamel —
  `Gm`, `MuN`, `SplitTorus`, `DiagGroup`; their `Over`-object
  companions stay lowerCamel with the `Over` suffix
  (`diagGroupOver`).
- **Category-theory statements**: prefer Mathlib's structured forms
  over raw `Prop`s in final form — `Functor.FullyFaithful (hopfSpec R)`
  rather than `hopfSpec_map_bijective`; the `Prop` form is acceptable
  only in statement-first skeletons and must carry a note.
- Interim disambiguation prefixes that encode a *presentation level*
  (`SchemeCharacterGroup` vs `CharacterGroup`) are tolerated only
  while the bridge between the presentations is unproved; once the
  bridge lands, one form is primary and the other becomes a derived
  equivalence, and the prefix is removed.
