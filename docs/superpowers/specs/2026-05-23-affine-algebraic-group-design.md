# Affine Algebraic Groups in Lean 4: Design Document

**Date:** 2026-05-23
**Status:** Brainstorm complete, awaiting user review
**Scope:** Foundational Lean 4 layer for the Langlands project: affine algebraic
groups, basic properties, standard examples, tori, Lie algebras, unipotent /
solvable groups, reductive groups, Borel / parabolic / Levi structure, maximal
tori with root data, isogeny, and the Chevalley classification of split
reductive groups.

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
- `Mathlib.AlgebraicGeometry.Group.Smooth` — smoothness criterion for
  `GrpObj (Over.mk f)`. **No** packaged `GroupScheme` / `AffineGroupScheme`
  type exists yet.
- `Mathlib.AlgebraicGeometry.Morphisms.*` — `IsAffineHom`,
  `LocallyOfFiniteType`, `IsClosedImmersion`, `Smooth`, etc.
- `Mathlib.LinearAlgebra.RootSystem.*` — root pairings, Cartan matrices, Weyl
  group, base of a root system. Substantially covers the combinatorial layer of
  Phase J below.
- `Mathlib.GroupTheory.Coxeter.*` — Coxeter systems, length, inversions, Bruhat
  via Matrix.
- `Mathlib.RingTheory.HopfAlgebra` — Hopf algebras (anti-equivalent side of
  affine group schemes; not used as primary type, but referenced for examples).

Known gaps that affect our milestones:

- No bundled `AffineGroupScheme` / `GroupScheme` type.
- No scheme-theoretic `GL(V)` (only `Matrix.GeneralLinearGroup` of R-points).
- No proven Hopf-algebra ↔ affine-group-scheme equivalence.
- No proof of the faithful-representation theorem.

## 3. Type design

### 3.1 Layered definition

```
GroupScheme S            -- group object in Over S, any scheme S
  ↑ IsAffineGroupScheme  -- + affine structure morphism
  ↑ IsAlgebraicGroup     -- + locally of finite type
AffineAlgebraicGroup k   -- specialization to S = Spec k for a field k
LinearAlgebraicGroup k   -- alias for AffineAlgebraicGroup k (modern convention)
```

The base parameter is a general scheme `S : Scheme`. Field-specific assumptions
`[Field k]` are added at the point of use, not baked into the core type. This
makes integral models (`S = Spec O_F` for parahoric / Bruhat-Tits) and
Chevalley models over `Spec ℤ` reachable without later refactoring.

### 3.2 Concrete shape

```lean
abbrev GroupScheme (S : Scheme) : Type _ := Grp (Over S)

class IsAffineGroupScheme {S : Scheme} (G : GroupScheme S) : Prop where
  isAffineHom : IsAffineHom G.X.hom

class IsAlgebraicGroup {S : Scheme} (G : GroupScheme S) : Prop
    extends IsAffineGroupScheme G where
  locallyOfFiniteType : LocallyOfFiniteType G.X.hom
```

For `S = Spec (.of k)` with `[Field k]`:

```lean
abbrev AffineAlgebraicGroup (k : Type u) [Field k] : Type _ :=
  { G : GroupScheme (Spec (.of k)) // IsAlgebraicGroup G }

abbrev LinearAlgebraicGroup (k : Type u) [Field k] := AffineAlgebraicGroup k
```

The typeclass form `(G : GroupScheme S) [IsAlgebraicGroup G]` is the canonical
shape for theorem statements, matching the Mathlib idiom in
`Mathlib/AlgebraicGeometry/Group/Smooth.lean`. The `AffineAlgebraicGroup k`
subtype is provided only as a named entry point for callers who want a bundled
object (it should not appear in core theorem signatures).

### 3.3 Conscious omissions

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

Eleven phases (A–K), forty-six milestones, granularity ~ 1–3 PRs each. Each
milestone references the DAG node in `docs/topics/algebraic-groups.md` and the
canonical textbook chapter.

### Phase A — AAG foundations
| # | Milestone | DAG | Reference |
|---|---|---|---|
| A1 | `GroupScheme S` skeleton + inherited hom/iso | AG1 | Springer §2.1 |
| A2 | `IsAffineGroupScheme` + `IsAlgebraicGroup` typeclasses | AG1 | Springer §2.1 |
| A3 | `AffineAlgebraicGroup k` entry point + refactor existing scaffold | AG1 | Borel §1 |
| A4 | Points functor `G(R)` for `S = Spec k`, Yoneda packaging | AG1 | Springer §1.5 |

### Phase B — Basic AAG operations
| # | Milestone | DAG | Reference |
|---|---|---|---|
| B1 | Closed subgroup scheme | AG2 | Springer §2.2 |
| B2 | Kernel of a homomorphism | AG2 | Springer §2.2 |
| B3 | Scheme-theoretic image (smooth case full, general statement-form) | AG2 | Springer §5.5 |
| B4 | Base change | AG2 | Springer §11 |
| B5 | Product, restriction of scalars | AG2 | Borel §AG.14 |

### Phase C — Standard examples
| # | Milestone | DAG | Reference |
|---|---|---|---|
| C1 | `𝔾_a` | AG4 | Springer §2.1.5 |
| C2 | `𝔾_m` + first character | AG4 | Springer §2.1.5 |
| C3 | `μ_n`, `α_p` (non-smooth examples) | AG4 | Springer §3.2 |
| C4 | `GL_n`, `SL_n` scheme-theoretic | AG4 | Humphreys §7 |
| C5 | `T_n` (diagonal), `B_n` (upper-triangular), `U_n` (strict upper) | AG4 | Humphreys §17 |
| C6 | Connect existing `FaithfulLinearRepresentation.generalLinear` to C4 | AG4 | Springer §2.3 |

### Phase D — Tori and character/cocharacter lattices
| # | Milestone | DAG | Reference |
|---|---|---|---|
| D1 | Split torus `𝔾_m^n` | TU1 | Borel §8.2 |
| D2 | `X*(T)`, `X_*(T)` lattices | TU1 | Borel §8.6 |
| D3 | Diagonalizable group ↔ f.g. abelian group anti-equivalence | TU1 | Borel §8.3 |
| D4 | `Hom(T,T') ≅ Hom_ℤ(X*(T'), X*(T))`, pairing `X*(T) × X_*(T) → ℤ` | TU1 | Borel §8.6 |
| D5 | Galois-action framework (trivial action stub; expansion deferred to RF2) | TU1 | Borel §8.11 |

### Phase E — Lie algebras
| # | Milestone | DAG | Reference |
|---|---|---|---|
| E1 | Tangent space at identity, `T_e G = ker(G(k[ε]/ε²) → G(k))` | AG3 | Springer §4.4 |
| E2 | Lie bracket via adjoint action; `Lie G` as a Lie algebra | AG3 | Springer §4.4 |
| E3 | Lie algebras of standard examples (`𝔤𝔩_n`, `𝔱_n`, etc.) | AG3 | Humphreys §10 |
| E4 | Differential functor `dG: Hom(G,H) → Hom(Lie G, Lie H)` | AG3 | Springer §4.4 |

### Phase F — Unipotent / solvable / radicals
| # | Milestone | DAG | Reference |
|---|---|---|---|
| F1 | Unipotent element / unipotent group via GL_n embedding | TU2 | Springer §2.4 |
| F2 | Split unipotent group, `𝔾_a`-filtration; relation to `U_n` | TU2 | Springer §14 |
| F3 | Solvable group, derived series | TU2 | Borel §10 |
| F4 | Lie-Kolchin (over algebraically closed field) | TU2 | Borel §10.5 |
| F5 | Radical `R(G)`, unipotent radical `R_u(G)` | TU2 | Springer §6.4 |

### Phase G — Reductive / semisimple
| # | Milestone | DAG | Reference |
|---|---|---|---|
| G1 | `IsReductive G`, `IsSemisimple G` definitions | RG1 | Springer §6.4 |
| G2 | Derived subgroup `[G,G]` | RG1 | Springer §2.2 |
| G3 | Center `Z(G)`, adjoint quotient `G^ad` (the quotient itself is deferred) | RG1 | Springer §2.2 |
| G4 | Almost simple groups | RG1 | Humphreys §27 |
| G5 | Reductive closed under products / restriction of scalars | RG1 | Borel §13 |

### Phase H — Borel / parabolic / Levi
| # | Milestone | DAG | Reference |
|---|---|---|---|
| H1 | Borel subgroup definition | RG2 | Springer §6.2 |
| H2 | Conjugacy of Borels over algebraically closed fields | RG2 | Springer §6.4 |
| H3 | Parabolic subgroup | RG2 | Springer §6.2 |
| H4 | Levi decomposition `P = L ⋉ R_u(P)` | RG2 | Springer §8.4 |
| H5 | Opposite parabolic, standard Levi | RG2 | Borel §14 |

### Phase I — Maximal torus and (G, T)-roots
| # | Milestone | DAG | Reference |
|---|---|---|---|
| I1 | Maximal torus existence | RG3 | Springer §6.4 |
| I2 | Conjugacy of maximal tori | RG3 | Springer §6.4 |
| I3 | Weight decomposition `Lie G = Lie T ⊕ ⨁ 𝔤_α` | RG3 | Springer §8.1 |
| I4 | Roots `Φ(G,T)` and root subgroups `U_α` | RG3 | Springer §8.1 |
| I5 | Coroots `Φ^∨(G,T)` via `SL_2`-subgroups | RG3 | Springer §8.1 |
| I6 | Weyl group `W(G,T) = N_G(T)/T` acting on `X*(T)` | RG3 | Springer §8.2 |

### Phase J — Abstract combinatorial layer + bridge
| # | Milestone | DAG | Reference |
|---|---|---|---|
| J1 | Survey + bridge to `Mathlib.LinearAlgebra.RootSystem.*` and `GroupTheory.Coxeter.*` | RC1-RC3 | Bourbaki LIE |
| J2 | Root datum `(X, Φ, X^∨, Φ^∨)` on top of Mathlib `RootPairing`; based + reduced versions | RC4 | Springer §1 |
| J3 | Pinning + automorphisms of based root data | RC5 | Springer §1 |
| J4 | `(G, T)` ⟶ root datum functor (split case) | RC6 | Springer §10 |
| J5 | Dual root datum + dual reductive group entry point | DG1 | Borel §8 |

### Phase K — Isogeny and split classification
| # | Milestone | DAG | Reference |
|---|---|---|---|
| K1 | Central isogeny | RG1, RC6 | Springer §9 |
| K2 | Isogeny on root data | RC6 | Springer §10 |
| K3 | Simply connected cover | RC6 | Springer §10 |
| K4 | Adjoint quotient | RC6 | Springer §10 |
| K5 | Chevalley existence (split reductive ↔ root datum) | RC6 | Springer §10 |
| K6 | Chevalley uniqueness modulo central isogeny | RC6 | Springer §10 |

## 5. First-goal scope

The user's "first goal" — *define AAG + basic properties + standard examples +
torus entry* — is detailed in this spec at the milestone-table level for
**A1 through D2** (16 milestones). Phases E through K are sketched at the
interface level only; each will receive its own follow-up spec when it becomes
the active milestone band.

## 6. Decisions log

- **D1.** Base parameter: arbitrary `S : Scheme`. `[Field k]` is added at use.
- **D2.** Bundled type: `abbrev GroupScheme S := Grp (Over S)`. Properties
  ride as typeclasses, not as structure fields, following the Mathlib
  `IsAffineHom` / `LocallyOfFiniteType` pattern.
- **D3.** `LinearAlgebraicGroup k` is an alias for `AffineAlgebraicGroup k`
  (Milne / Humphreys / Borel modern convention).
- **D4.** Smoothness is not in the definition. It is an extra hypothesis where
  needed.
- **D5.** Quotients are deferred until Phase G / H demands them.
- **D6.** Lie algebra is a dedicated phase (E).
- **D7.** Standard examples include both smooth (`𝔾_a, 𝔾_m, GL_n, SL_n`) and
  non-smooth (`μ_n, α_p`) cases.
- **D8.** The combinatorial layer (root systems, Cartan matrices, Weyl group,
  Coxeter) is built on top of Mathlib's existing `LinearAlgebra.RootSystem.*`
  and `GroupTheory.Coxeter.*` rather than rebuilt.

## 7. Risks and known unknowns

- Scheme-theoretic `GL(V)` is missing in Mathlib. C4 either constructs it or
  introduces an interface (current scaffold already uses an interface,
  `GeneralLinearGroupSchemeModel`).
- The faithful-representation theorem (linear ⇔ affine) is recorded as a
  statement only. Promoting it to a theorem requires the regular representation
  argument for Hopf algebras and is a separate milestone band (not part of the
  first goal).
- `RootPairing` in Mathlib does not yet expose a notion of root datum with
  full lattice data; J2 may need to add a layer on top.
- Phase H (Borel conjugacy) leans on geometric arguments over algebraically
  closed fields. Mathlib's algebraic geometry library may not yet have enough
  infrastructure (proper morphisms, fixed-point theorems, complete varieties);
  J/H ordering may shift in response.

## 8. Next step

Hand off to the `writing-plans` skill to produce a concrete implementation
plan for milestones **A1–D2**, with file-level structure and per-milestone
test / verification gates.
