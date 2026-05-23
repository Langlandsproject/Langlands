# Affine Algebraic Groups in Lean 4: Design Document

**Date:** 2026-05-23 (last revised: Phase A landed + 24 mdblueprint nodes)
**Status:** Phase A done; Phase B partial (B1 algSpec ✓, hopfSpec sorry);
Phase D mathematical content authored as mdblueprint, Lean pending.
**Scope:** Foundational Lean 4 layer for the Langlands project: affine algebraic
groups, basic properties, standard examples, tori, Lie algebras, unipotent /
solvable groups, reductive groups, Borel / parabolic / Levi structure, maximal
tori with root data, isogeny, and the Chevalley classification of split
reductive groups.

**Blueprint system.** This project uses
[mdblueprint](file:///Users/hoxide/mycodes/mdblueprint) (Markdown nodes
under `docs/knowledge/nodes/`), **not** LaTeX / PFR-style Lean Blueprint.
See `AGENTS.md` for the canonical rule. Earlier versions of this spec
referenced a `lean/blueprint/src/*.tex` scaffold; that scaffold was
deleted (commit a3bdc79) and replaced by mdblueprint nodes
(commits ed3a647 and later).

## 1. Context

The Langlands project maintains a mathematical knowledge DAG in
[docs/topics/algebraic-groups.md](../../topics/algebraic-groups.md) (nodes
`AG1–AG4, TU1–TU3, RG1–RG3, RC1–RC6, ...`). An initial Lean scaffold lives in
[lean/LanglandsLean/LinearAlgebraicGroups.lean](../../../lean/LanglandsLean/LinearAlgebraicGroups.lean):
it defines `LinearAlgebraicGroup k` directly as a structure carrying
`GrpObj (Over (Spec k))` + `IsAffineHom` + `LocallyOfFiniteType`, plus a
statement-form `FaithfulLinearRepresentation`.

The scaffold conflates two ideas (affine group scheme over an arbitrary base,
and linear / affine algebraic group over a field) into a single bundled
structure over a field. This design document records the layered redesign that
will replace it and the milestone roadmap up to the Chevalley classification.

Reference books available locally as symlinks under `references/`:

- `Springer-LinearAlgebraicGroups.pdf` — Springer, *Linear Algebraic Groups*.
- `Borel-LinearAlgebraicGroups-2ed.pdf` — Borel, 2nd ed (OCR'd).
- `Humphreys-LinearAlgebraicGroups.pdf` — Humphreys, GTM 21.

## 2. Mathlib state

Relevant existing material:

- `Mathlib.CategoryTheory.Monoidal.Grp_` — `class GrpObj (X : C)` (typeclass
  view) and bundled `structure Grp C` for group objects in a cartesian monoidal
  category, including `forget`, `forget₂Mon`, `mapGrp`, etc.
- `Mathlib.AlgebraicGeometry.Over` — `Scheme.Over X S` (abbrev for
  `OverClass X S`), `asOver X S`, `Hom.IsOver`, `Hom.asOver`. The canonical
  way Mathlib expresses "scheme `M` is over `S`".
- `Mathlib.AlgebraicGeometry.Pullbacks` — `Scheme.GrpObjAsOverPullback`:
  `[GrpObj (asOver M S)]` is preserved by base change. This is the canonical
  base-change lemma we rely on.
- `Mathlib.AlgebraicGeometry.Group.Smooth` — smoothness criterion stated as
  `(f : G ⟶ Spec K) [GrpObj (Over.mk f)] [...]`. Confirms the typeclass-on-
  scheme idiom is canonical Mathlib usage.
- `Mathlib.AlgebraicGeometry.Morphisms.*` — `IsAffineHom`,
  `LocallyOfFiniteType`, `IsClosedImmersion`, `Smooth`, etc.
- `Mathlib.LinearAlgebra.RootSystem.*` — root pairings, Cartan matrices, Weyl
  group, base of a root system. Substantially covers the combinatorial layer of
  Phase J below.
- `Mathlib.GroupTheory.Coxeter.*` — Coxeter systems, length, inversions, Bruhat
  via Matrix.
- `Mathlib.RingTheory.HopfAlgebra` — Hopf algebras (anti-equivalent side of
  affine group schemes).

**Mathlib does not yet have a packaged `GroupScheme` type.** The active drafts
are competing, none merged:

- PR #24000 (closed, not merged) — "correspondence between affine group schemes
  and Hopf algebras". Uses `Grp_ (Over (Spec R))` for `R : CommRingCat` as the
  scheme side; introduces `algSpec`, `hopfSpec`. Filed under
  `Mathlib/AlgebraicGeometry/GroupScheme/`.
- PR #34897 (open, experimental, by Claude) — "Claude defining reductive
  groups". Uses `class AffineAlgGroup` on `[HopfAlgebra k A]` directly with
  `finiteType` + `geomReduced` (smoothness baked in). Filed under
  `Mathlib/Algebra/AlgebraicGroup/`.
- PR #21447 (open) — split algebraic torus, defined as `Scheme` via pullback,
  no `Grp_` packaging.

The Mathlib idiom that **is** merged and stable is the typeclass-on-scheme
pattern: `(M : Scheme) [M.Over S] [GrpObj (asOver M S)]`, with additional
property typeclasses (`IsAffineHom (M ↘ S)`, etc.) layered on. We adopt this
pattern (see Section 3).

Known gaps that affect our milestones:

- No scheme-theoretic `GL(V)` (only `Matrix.GeneralLinearGroup` of R-points).
- No proven Hopf-algebra ↔ affine-group-scheme equivalence in master.
- No proof of the faithful-representation / embedding theorem.

## 3. Type design

### 3.1 No new bundled type

We do **not** introduce `GroupScheme S` as a packaged type (no
`abbrev GroupScheme S := Grp (Over S)`, no `structure GroupScheme`, no subtype).
We follow Mathlib's typeclass-on-scheme idiom directly:

```
A scheme M, with structure morphism to S, with group structure in Over S, with
property typeclasses on the structure morphism.
```

In Lean signatures:

```lean
variable (M S : Scheme) [M.Over S] [GrpObj (asOver M S)]
-- + property typeclasses as needed:
-- [IsAffineHom (M ↘ S)] [LocallyOfFiniteType (M ↘ S)] [Smooth (M ↘ S)] ...
```

The base `S` is an arbitrary scheme — field-specific assumptions `[Field k]`
together with `S = Spec (.of k)` are added at the point of use. This keeps
integral models (`S = Spec O_F`) and Chevalley models over `Spec ℤ` reachable
without later refactoring.

### 3.2 Domain-specific aggregator typeclasses (Level 1 sugar)

To keep theorem signatures readable, we introduce two thin aggregator
typeclasses, definitionally equivalent to stacking the Mathlib typeclasses:

```lean
namespace Langlands.AlgebraicGeometry

/-- `G` is an affine group scheme over `S`: a group object in `Over S` whose
structure morphism is affine. No smoothness or finite-type assumption. -/
class IsAffineGroupScheme (G S : Scheme) [G.Over S]
    extends GrpObj (asOver G S), IsAffineHom (G ↘ S)

/-- `G` is an (affine) algebraic group over `S`: an affine group scheme that
is locally of finite type. Following modern convention (Milne, SGA3), no
smoothness assumed; smoothness is added separately when needed. -/
class IsAlgebraicGroup (G S : Scheme) [G.Over S]
    extends IsAffineGroupScheme G S, LocallyOfFiniteType (G ↘ S)

end Langlands.AlgebraicGeometry
```

Properties of this design:

- **No new objects at type-theory level**: `IsAffineGroupScheme G S` is just a
  named bundle of `GrpObj (asOver G S)` + `IsAffineHom (G ↘ S)`.
- **Mathlib lemmas plug in directly**: any theorem expecting
  `[GrpObj (asOver G S)]` accepts an `IsAffineGroupScheme G S` instance, and
  vice versa, with no explicit unwrapping.
- **Single documentation hub**: the docstring on `IsAlgebraicGroup` is the
  canonical place to record this project's convention.
- **No `AffineAlgebraicGroup k` subtype**: we do **not** introduce a bundled
  `def AffineAlgebraicGroup (k : Type) [Field k] := { G : Scheme // ... }`.
  When working over a field, we write `(G : Scheme) [G.Over (Spec (.of k))]
  [IsAlgebraicGroup G (Spec (.of k))]` directly. A `LinearAlgebraicGroup k`
  abbrev for that exact pattern may be added later if it pulls its weight; not
  in scope for the first goal.

### 3.3 Typeclass-inference risk and mitigation

`extends GrpObj (asOver G S), IsAffineHom (G ↘ S)` mixes a data-carrying class
(`GrpObj`) with a propositional class (`IsAffineHom`). Lean's `extends` should
handle this, but the dependent argument `asOver G S` (which depends on the
`[G.Over S]` instance in scope) can stress typeclass elaboration. The first
Phase A issue treats verification of all the following as an acceptance
criterion:

- From `[IsAffineGroupScheme G S]`, Lean infers `[GrpObj (asOver G S)]` and
  `[IsAffineHom (G ↘ S)]` automatically.
- From `[GrpObj (asOver G S)]` and `[IsAffineHom (G ↘ S)]`, Lean synthesizes
  `[IsAffineGroupScheme G S]` (via the auto-anonymous constructor).
- Likewise for `IsAlgebraicGroup` over its three subordinate classes.
- `Scheme.GrpObjAsOverPullback` continues to fire under base change when
  `[IsAffineGroupScheme G S]` is in scope (i.e., base change preserves the
  aggregator).

If any of these fail, the fallback is to drop the aggregator and write
signatures with the underlying Mathlib typeclasses directly (Level 0).

### 3.4 Conscious omissions

- **Smoothness is not part of the definition.** `μ_n` and `α_p` are valid
  affine algebraic groups in characteristic p but are not smooth. Smoothness
  enters as an additional hypothesis where needed (identity component,
  characteristic-0 freebies).
- **Quotient `G / H` is deferred.** It needs fppf sheafification; we introduce
  it lazily when Phase H requires `P / R_u(P)` and Phase G requires
  `G / Z(G)`. The Phase B operation list intentionally stops at closed
  subgroup, kernel, base change, product, restriction of scalars.
- **Hopf-algebra side is not the primary representation.** We keep
  `GrpObj (Over S)` as the working model. Hopf-algebra correspondence enters
  later for examples (Phase C) and faithful representation (Phase C6).
- **Lie algebra is a dedicated phase (E)**, between examples and
  unipotent/solvable. Tangent space at the identity unlocks weight
  decomposition and root subgroups; placing it as a single coherent phase keeps
  the reductive theory clean.

## 4. Milestone roadmap

Twelve phases (A–L), with the Hopf-algebra correspondence + embedding theorem
inserted as the new **Phase B** between AAG foundations and basic operations
on group schemes. Granularity ~ 1–3 PRs each. Each milestone references the
DAG node in `docs/topics/algebraic-groups.md` and the canonical textbook
chapter.

### Phase A — AAG foundations (adopt Mathlib idiom)
| # | Milestone | DAG | Reference |
|---|---|---|---|
| A1 | Adopt Mathlib `Scheme + [G.Over S] + [GrpObj (asOver G S)]` idiom; project namespace + conventions | AG1 | Springer §2.1 |
| A2 | Aggregator typeclasses `IsAffineGroupScheme` / `IsAlgebraicGroup` (Level 1 sugar) with typeclass-inference acceptance tests | AG1 | Springer §2.1 |
| A3 | Refactor existing `LinearAlgebraicGroups.lean`: drop bundled `structure`, restate everything (incl. `FaithfulLinearRepresentation`) in Mathlib idiom | AG1 | Borel §1 |
| A4 | Points functor `R ↦ ((Spec R).asOver (Spec k)) ⟶ G.asOver _` over a field; sanity checks via `GrpObjAsOverPullback` | AG1 | Springer §1.5 |
| A5 | Smoke tests: trivial group scheme over any `S`, base-change preserves aggregator, end-to-end typeclass inference for `IsAlgebraicGroup G (Spec k)` from underlying Mathlib typeclasses | AG1 | — |

### Phase B — Hopf algebra correspondence + embedding theorem (NEW)
| # | Milestone | DAG | Reference |
|---|---|---|---|
| B1 | `Spec : (R-Hopf Alg)ᵒᵖ ⥤ {affine group schemes over Spec R}` functor (essentially what PR #24000 set up) | AG1 | Waterhouse §3, Springer §2.1 |
| B2 | G-comodule structure ≡ group action on a vector space, finite-dimensional comodule basics | AG1 | Waterhouse §3.5 |
| B3 | Finite-generation lemma: every f.g. comodule has a finite-dim G-stable subspace generating it as algebra | AG1 | Waterhouse §3.3, Springer §2.3 |
| B4 | **Embedding theorem**: every algebraic group over a field admits a closed immersion into some `GL_n`; promotes existing statement-form to a theorem | AG1 | Springer §2.3.7, Borel §1.10 |
| B5 | Corollary API: `IsAlgebraicGroup G k ⟹ exists closed-subgroup embedding into GL_n`; bridge to `FaithfulLinearRepresentation` | AG1 | Humphreys §8.6 |

### Phase C — Basic AAG operations
| # | Milestone | DAG | Reference |
|---|---|---|---|
| C1 | Closed subgroup scheme | AG2 | Springer §2.2 |
| C2 | Kernel of a homomorphism | AG2 | Springer §2.2 |
| C3 | Scheme-theoretic image (smooth case full, general statement-form) | AG2 | Springer §5.5 |
| C4 | Base change (preserves `IsAffineGroupScheme` / `IsAlgebraicGroup` via `GrpObjAsOverPullback`) | AG2 | Springer §11 |
| C5 | Product, restriction of scalars | AG2 | Borel §AG.14 |

### Phase D — Standard examples
| # | Milestone | DAG | Reference |
|---|---|---|---|
| D1 | `𝔾_a` | AG4 | Springer §2.1.5 |
| D2 | `𝔾_m` + first character | AG4 | Springer §2.1.5 |
| D3 | `μ_n`, `α_p` (non-smooth examples) | AG4 | Springer §3.2 |
| D4 | `GL_n`, `SL_n` scheme-theoretic | AG4 | Humphreys §7 |
| D5 | `T_n` (diagonal), `B_n` (upper-triangular), `U_n` (strict upper) | AG4 | Humphreys §17 |
| D6 | Specialize Phase B embedding to give concrete `G ↪ GL_n` witnesses for the standard examples | AG4 | Springer §2.3 |

### Phase E — Tori and character/cocharacter lattices
| # | Milestone | DAG | Reference |
|---|---|---|---|
| E1 | Split torus `𝔾_m^n` | TU1 | Borel §8.2 |
| E2 | `X*(T)`, `X_*(T)` lattices | TU1 | Borel §8.6 |
| E3 | Diagonalizable group ↔ f.g. abelian group anti-equivalence | TU1 | Borel §8.3 |
| E4 | `Hom(T,T') ≅ Hom_ℤ(X*(T'), X*(T))`, pairing `X*(T) × X_*(T) → ℤ` | TU1 | Borel §8.6 |
| E5 | Galois-action framework (trivial action stub; expansion deferred to RF2) | TU1 | Borel §8.11 |

### Phase F — Lie algebras
| # | Milestone | DAG | Reference |
|---|---|---|---|
| F1 | Tangent space at identity, `T_e G = ker(G(k[ε]/ε²) → G(k))` | AG3 | Springer §4.4 |
| F2 | Lie bracket via adjoint action; `Lie G` as a Lie algebra | AG3 | Springer §4.4 |
| F3 | Lie algebras of standard examples (`𝔤𝔩_n`, `𝔱_n`, etc.) | AG3 | Humphreys §10 |
| F4 | Differential functor `dG: Hom(G,H) → Hom(Lie G, Lie H)` | AG3 | Springer §4.4 |

### Phase G — Unipotent / solvable / radicals
| # | Milestone | DAG | Reference |
|---|---|---|---|
| G1 | Unipotent element / unipotent group via GL_n embedding | TU2 | Springer §2.4 |
| G2 | Split unipotent group, `𝔾_a`-filtration; relation to `U_n` | TU2 | Springer §14 |
| G3 | Solvable group, derived series | TU2 | Borel §10 |
| G4 | Lie-Kolchin (over algebraically closed field) | TU2 | Borel §10.5 |
| G5 | Radical `R(G)`, unipotent radical `R_u(G)` | TU2 | Springer §6.4 |

### Phase H — Reductive / semisimple
| # | Milestone | DAG | Reference |
|---|---|---|---|
| H1 | `IsReductive G`, `IsSemisimple G` definitions | RG1 | Springer §6.4 |
| H2 | Derived subgroup `[G,G]` | RG1 | Springer §2.2 |
| H3 | Center `Z(G)`, adjoint quotient `G^ad` (the quotient itself is deferred) | RG1 | Springer §2.2 |
| H4 | Almost simple groups | RG1 | Humphreys §27 |
| H5 | Reductive closed under products / restriction of scalars | RG1 | Borel §13 |

### Phase I — Borel / parabolic / Levi
| # | Milestone | DAG | Reference |
|---|---|---|---|
| I1 | Borel subgroup definition | RG2 | Springer §6.2 |
| I2 | Conjugacy of Borels over algebraically closed fields | RG2 | Springer §6.4 |
| I3 | Parabolic subgroup | RG2 | Springer §6.2 |
| I4 | Levi decomposition `P = L ⋉ R_u(P)` | RG2 | Springer §8.4 |
| I5 | Opposite parabolic, standard Levi | RG2 | Borel §14 |

### Phase J — Maximal torus and (G, T)-roots
| # | Milestone | DAG | Reference |
|---|---|---|---|
| J1 | Maximal torus existence | RG3 | Springer §6.4 |
| J2 | Conjugacy of maximal tori | RG3 | Springer §6.4 |
| J3 | Weight decomposition `Lie G = Lie T ⊕ ⨁ 𝔤_α` | RG3 | Springer §8.1 |
| J4 | Roots `Φ(G,T)` and root subgroups `U_α` | RG3 | Springer §8.1 |
| J5 | Coroots `Φ^∨(G,T)` via `SL_2`-subgroups | RG3 | Springer §8.1 |
| J6 | Weyl group `W(G,T) = N_G(T)/T` acting on `X*(T)` | RG3 | Springer §8.2 |

### Phase K — Abstract combinatorial layer + bridge
| # | Milestone | DAG | Reference |
|---|---|---|---|
| K1 | Survey + bridge to `Mathlib.LinearAlgebra.RootSystem.*` and `GroupTheory.Coxeter.*` | RC1-RC3 | Bourbaki LIE |
| K2 | Root datum `(X, Φ, X^∨, Φ^∨)` on top of Mathlib `RootPairing`; based + reduced versions | RC4 | Springer §1 |
| K3 | Pinning + automorphisms of based root data | RC5 | Springer §1 |
| K4 | `(G, T)` ⟶ root datum functor (split case) | RC6 | Springer §10 |
| K5 | Dual root datum + dual reductive group entry point | DG1 | Borel §8 |

### Phase L — Isogeny and split classification
| # | Milestone | DAG | Reference |
|---|---|---|---|
| L1 | Central isogeny | RG1, RC6 | Springer §9 |
| L2 | Isogeny on root data | RC6 | Springer §10 |
| L3 | Simply connected cover | RC6 | Springer §10 |
| L4 | Adjoint quotient | RC6 | Springer §10 |
| L5 | Chevalley existence (split reductive ↔ root datum) | RC6 | Springer §10 |
| L6 | Chevalley uniqueness modulo central isogeny | RC6 | Springer §10 |

Total: 12 phases, 62 milestones.

## 5. First-goal scope

The user's "first goal" — *define AAG + basic properties + standard examples +
torus entry* — is detailed at the milestone-table level for **A1 through E2**
(23 milestones, comprising all of Phase A's idiom adoption, Phase B's
Hopf+embedding work, Phase C's basic operations, Phase D's examples, and the
first two milestones of Phase E for tori). Phases F through L are sketched at
the interface level only; each will receive its own follow-up spec when it
becomes the active milestone band.

The immediate next action is Phase A. Phase B (Hopf + embedding) starts after
Phase A lands, and is itself a substantial unit; we may produce a separate
detailed sub-spec when Phase A is finishing.

## 6. Decisions log

- **D1.** Base parameter: arbitrary `S : Scheme`. `[Field k]` is added at use.
- **D2.** No new bundled type. We adopt Mathlib's typeclass-on-scheme idiom:
  `(G : Scheme) [G.Over S] [GrpObj (asOver G S)]` plus property typeclasses
  on the structure morphism. We add Level 1 sugar via aggregator typeclasses
  `IsAffineGroupScheme` and `IsAlgebraicGroup`, definitionally equivalent to
  the Mathlib stack.
- **D3.** No `AffineAlgebraicGroup k` subtype, no `LinearAlgebraicGroup k`
  alias. The Milne / Humphreys / Borel convention is recorded in docstrings;
  if signature repetition over a field becomes burdensome, an additional
  aggregator can be added later.
- **D4.** Smoothness is not in the definition. It is an extra hypothesis where
  needed.
- **D5.** Quotients are deferred until Phase H / I demands them.
- **D6.** Lie algebra is a dedicated phase (F).
- **D7.** Standard examples include both smooth (`𝔾_a, 𝔾_m, GL_n, SL_n`) and
  non-smooth (`μ_n, α_p`) cases.
- **D8.** The combinatorial layer (root systems, Cartan matrices, Weyl group,
  Coxeter) is built on top of Mathlib's existing `LinearAlgebra.RootSystem.*`
  and `GroupTheory.Coxeter.*` rather than rebuilt.
- **D9.** Phase B (Hopf + embedding) is a first-class phase, inserted between
  AAG foundations and basic operations. Reason: the embedding theorem is the
  "signature theorem" of affine algebraic groups, and several downstream
  proofs (unipotent characterization, faithful-rep arguments) call back into
  it. Doing it early prevents `sorry`s in later phases.
- **D10.** Blueprint format: mdblueprint (Markdown under
  `docs/knowledge/nodes/`), **not** LaTeX / PFR-style Lean Blueprint.
  Records: see `AGENTS.md`; the LaTeX scaffold under `lean/blueprint/`
  was a misstep and was deleted. Phase A / B / D mathematical content
  lives as `linear_algebraic_groups.*` sub-nodes; each is admitted with
  full natural-language statement and (where applicable) proof.

## 7. Risks and known unknowns

- **Aggregator typeclass inference** (Phase A2): `extends GrpObj (asOver G S),
  IsAffineHom (G ↘ S)` mixes data and Prop classes with a dependent argument.
  Behavior needs to be empirically verified; fallback to Level 0 (drop the
  aggregator) is documented.
- **Scheme-theoretic `GL(V)`** is missing in Mathlib. Phase D4 either
  constructs it or introduces an interface (current scaffold already uses an
  interface, `GeneralLinearGroupSchemeModel`). Phase B4 (embedding theorem)
  also needs this — coordinate plus its product structure.
- **Hopf-algebra ↔ affine-group-scheme equivalence** is not merged in Mathlib
  master (PR #24000 was closed). Phase B1 may need to import work from that
  PR or recreate the essentials.
- **`RootPairing` does not expose root datum with lattice data**; K2 may need
  to add a layer on top.
- **Phase I (Borel conjugacy)** leans on geometric arguments over
  algebraically closed fields. Mathlib's algebraic geometry library may not
  yet have enough infrastructure (proper morphisms, fixed-point theorems,
  complete varieties); K / I ordering may shift in response.

## 8. Status (current snapshot)

### Phase A — DONE
Five GitHub issues (#1–#5) closed. Lean shipped in
`lean/LanglandsLean/AlgebraicGeometry/`:

- `Conventions.lean` — namespace + idiom docstring
- `IsAlgebraicGroup.lean` — aggregator typeclasses (with all 4
  acceptance checks shipped as a `Tests` namespace)
- `FaithfulRepresentation.lean` — statement-form replacement of the old
  scaffold
- `Points.lean` — points functor with `Group` instance (one documented
  `sorry` on naturality)
- `Examples/Trivial.lean` — trivial group + base-change preservation

Lake build: 2456 jobs green.

mdblueprint: 8 admitted sub-nodes under
`docs/knowledge/nodes/linear_algebraic_groups/` linked to Lean
declarations via `lean.modules` / `lean.declarations` and
`verification.alignment: aligned`.

### Phase B — Partial

Mathematical content authored as 10 mdblueprint nodes (statements +
proofs in natural language). Five GitHub issues (#9–#13) open.

Lean: only `algSpec` shipped (`HopfSpec.lean`). `hopfSpec` is a
documented `sorry` blocked on upstream `Functor.Monoidal` instances
(see §7); a viable alternative is an object-level hand-roll, bypassing
`mapGrp`. Comodule infrastructure (B2) is not in Mathlib master but the
notion is light (≤ 30 LoC structure), not a real blocker.

### Phase D early examples — Statement form

Six mdblueprint nodes for `𝔾_a`, `𝔾_m`, `GL_n` and their points
formulas. Three GitHub issues (#6, #7, #8) open. No Lean yet.

### Next moves

1. Define `Comodule R A V` in Lean (Phase B2; small, self-contained).
2. Hand-roll `hopfSpec`-on-objects to close the B1 `sorry` (medium,
   ~200 LoC).
3. Bridge `Phase A3 affine_finite_type_faithful_representation`
   statement to a real theorem via B1 + B2 + B3 + B4.
4. Begin Phase D Lean implementations once B1 is unstuck.
