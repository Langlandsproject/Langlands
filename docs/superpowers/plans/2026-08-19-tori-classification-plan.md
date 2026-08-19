# Plan: Classification Theory of Tori (G0.C)

**Date:** 2026-08-19
**Scope:** Execute `docs/TODO.md` § G0.C to completion: the
classification of tori with KB proof structure closed and the Lean
theorem sorry-free.
**Driven by blueprint:** `tori.f_tori_galois_module_classification`
and the nodes M1 creates below.
**Output of this plan:** node-by-node KB statements and file-by-file
Lean declarations with types and required API, so execution sessions
transcribe rather than design.

## 0. Fixed design decisions (from TODO G0.C; do not relitigate)

- **(D-a) Algebra-first.** The classification lives at the level of
  commutative Hopf algebras over `k`; schemes enter only through the
  existing `specObjOver`/`hopfSpecGrpObj` machinery, as corollaries.
- **(D-b) Finite level.** All Lean statements are parameterized by a
  fixed finite Galois extension `E/k` with `Γ = (E ≃ₐ[k] E)`:
  {tori split by `E`} ≃ {`Γ`-lattices}. The continuous
  `Gal(k_s/k)` version exists only in the KB
  (`tori.splitting_field` supplies the equivalence).
- **(D-c, REVISED 2026-08-19)** The final Lean statement **is** a
  genuine `CategoryTheory.Equivalence`: with `Γ = Gal(E/k)`,
  `(ToriCat k E)ᵒᵖ ≌ LatticeCat Γ`, built via
  `Equivalence.ofFullyFaithfullyEssSurj` from the three working
  theorems (which remain the M2–M6 content). Rationale for the
  reversal (owner review): "three separate theorems" understates the
  theorem — the KB node claims an anti-equivalence of categories, and
  a faithful Lean statement must exhibit it. Mathlib v4.33 provides
  `CommHopfAlgCat k`, so the carrier categories are cheap:
  `ToriCat k E := FullSubcategory (IsTorusAlgebra k E ∘ ...)` of
  `(CommHopfAlgCat k)ᵒᵖ`, and `LatticeCat Γ := FullSubcategory`
  (finite free ℤ-module) of `Rep ℤ Γ`.
- **(D-d, new) No abstract "Hopf algebra with semilinear action"
  typeclass in Lean.** Everything is proved for the concrete
  `twistedGroupAlgebra k E M σ`. The abstract statement lives in the
  KB node `forms.hopf_descent`; Lean abstracts only when a second
  instance actually appears. Rationale: the semilinear-compatibility
  bookkeeping (`ε` into `E` is itself semilinear) is a large design
  surface with exactly one client today.

## 1. M1 — KB nodes (create in this order)

All in `status: admitted` with sources; run the three gates and
publish at the end of M1.

### 1.1 `forms.hopf_descent` [theorem] — the bridge

- **uses:** `forms.galois_descent_for_vector_spaces`,
  `foundations.hopf_algebras`.
- **Statement.** `E/k` finite Galois, `Γ = Gal(E/k)`. Let `A` be a
  commutative `E`-Hopf algebra with a semilinear `Γ`-action by ring
  automorphisms compatible with the Hopf structure:
  `Δ∘γ = (γ⊗γ)∘Δ`, `ε(γa) = γ(ε a)`, `S∘γ = γ∘S`. Then
  `B := A^Γ` is a `k`-Hopf algebra under the restricted structure
  maps, the natural map `E ⊗_k B → A` is an isomorphism of `E`-Hopf
  algebras, and `A ↦ A^Γ`, `B ↦ E ⊗_k B` are quasi-inverse
  equivalences of categories — in particular
  `Hom_{k-Hopf}(B, B') ≅ Hom_{Γ,E-Hopf}(A, A')`.
- **Proof route.** Linear descent gives `E ⊗_k B ≅ A` and, applied to
  `A ⊗_E A` with the diagonal semilinear action,
  `(A ⊗_E A)^Γ ≅ B ⊗_k B` (spanning + independence). `Δ, ε, S` are
  `Γ`-equivariant, hence restrict to fixed points; axioms restrict.
  Hom bijection: a `Γ`-equivariant `E`-Hopf map preserves fixed
  points; conversely base-change a `k`-Hopf map.
- **Source.** Add `waterhouse-affine-group-schemes` (W. C.
  Waterhouse, *Introduction to Affine Group Schemes*, GTM 66) to the
  `mdblueprint.yml` library; spans: Ch. 17 (forms and Galois descent).

### 1.2 `tori.twisted_form_of_lattice` [definition+theorem]

- **uses:** `forms.hopf_descent`,
  `affine_group_schemes.group_algebra_scheme`,
  `tori.torus_definition`, `tori.split_torus`.
- **Statement.** For a f.g. torsion-free `Γ`-lattice `(M, σ)`, the
  semilinear action `γ·(a e^m) = γ(a) e^{σ_γ m}` on `E[M]` is
  Hopf-compatible; define
  `T(M,σ) := Spec (E[M])^Γ`. Then: (1) `(E[M])^Γ` is a `k`-Hopf
  algebra with `E ⊗_k (E[M])^Γ ≅ E[M]`; (2) `T(M,σ)` is a torus
  split by `E`; (3) `X^*(T(M,σ)) ≅ (M,σ)` as `Γ`-lattices;
  (4) trivial `σ` gives the split torus `D(M)`.
- **Proof route.** (1) `hopf_descent` applies since `σ` permutes the
  group-like basis. (2) base change + Cartier. (3) group-likes of
  `E ⊗ (E[M])^Γ ≅ E[M]` are `{e^m}`; track the `Γ`-action through
  the isomorphism. (4) is the trivial-action computation.

### 1.3 `tori.classification_hom_level` [theorem]

- **uses:** `reductive_groups.diagonalizable_groups_antiequivalence`,
  `forms.hopf_descent`, `tori.character_and_cocharacter_lattices`.
- **Statement.** For tori `T, T'` over `k` split by `E`:
  `Hom_{k-grp}(T, T') ≅ Hom_{Γ-lattice}(X^*(T'), X^*(T))`,
  contravariantly and functorially.
- **Proof route.** `Hom_k = (Hom_E)^Γ` (the Hom part of
  `hopf_descent`); over `E` both tori are split and Cartier's
  hom-level equivalence applies; `Γ`-invariant algebra maps
  correspond to `Γ`-equivariant lattice maps.

### 1.4 Rewrite the proof of `tori.f_tori_galois_module_classification`

Structure: well-definedness (`splitting_field` +
`character_and_cocharacter_lattices`) → full faithfulness
(`classification_hom_level`) → essential surjectivity
(`twisted_form_of_lattice`) → the four corollary bullets each point
to their nodes. No prose steps without a node behind them.

### 1.5 `tori.classification_by_cocycles` [theorem]

- **uses:** `tori.f_tori_galois_module_classification`,
  `tori.splitting_field`, `forms.nonabelian_h1`.
- **Statement.** Isomorphism classes of rank-`n` tori over `k`
  correspond to `H¹(Θ, GL_n(ℤ)) = Hom_cont(Θ, GL_n(ℤ))/conj`
  (trivial `Θ`-action on `GL_n(ℤ)`); tori split by a fixed `E`
  correspond to `Hom(Gal(E/k), GL_n(ℤ))/conj`.

### 1.6 `tori.real_tori_classification` [example]

Every `ℝ`-torus is uniquely
`𝔾_m^a × (S¹)^b × (Res_{ℂ/ℝ} 𝔾_m)^c`, from the classification of
`ℤ[C₂]`-lattices into the three indecomposables `ℤ(triv)`,
`ℤ(sgn)`, `ℤ[C₂]` (source: Curtis–Reiner; add library entry
`curtis-reiner-methods` if absent).

### 1.7 `tori.tori_over_finite_fields` [example]

Rank-`n` tori over `𝔽_q` ↔ conjugacy classes of finite-order
elements of `GL_n(ℤ)` (image of Frobenius; continuity forces finite
order). Note the Deligne–Lusztig connection.

### 1.8 `tori.finiteness_per_rank` [theorem, statement-only]

Jordan–Zassenhaus: `GL_n(ℤ)` has finitely many conjugacy classes of
finite subgroups; hence finitely many `Γ`-lattice types per rank.
No proof section (statement + source only — kind `theorem` with
`verification.statement: accepted` and no proof block; do NOT use
`external-theorem`, which mandates Lean refs we don't have).

### 1.9 `tori.split_rank` [definition]

- **uses:** `tori.torus_definition`,
  `tori.split_anisotropic_decomposition`,
  `tori.character_and_cocharacter_lattices`.
- **Statement.** The **rank** of `T` is `rk_ℤ X^*(T)`
  (already in `tori.torus_definition`); the **split rank** (or
  `k`-rank) is `rk_ℤ X_*(T)^Θ` = the rank of the maximal split
  subtorus `T_d`. Facts: `0 ≤ split rank ≤ rank`; split rank `= rank`
  ⟺ split; `= 0` ⟺ anisotropic. Downstream: the split rank is the
  dimension of the Bruhat–Tits apartment.

### 1.10 `tori.isogeny_classification` [theorem]

Tori up to isogeny ↔ `ℚ`-representations of finite quotients of `Θ`
(semisimple by Maschke); `X^* ⊗ ℚ` is a complete isogeny invariant.
**uses:** `f_tori...`, `tori.split_anisotropic_decomposition`.

## 2. M2 — Lean: complete linear descent

File: `lean/LanglandsLean/AlgebraicGroups/Tori/Speiser.lean` (extend).

```lean
-- setting as in span_fixedPoints_eq_top: ρ, hone, hmul, hsemi
theorem linearIndependent_fixedPoints
    {ι : Type*} (v : ι → V) (hv : ∀ i γ, ρ γ (v i) = v i)
    (h : LinearIndependent k v) : LinearIndependent E v
```

Route: minimal-relation argument (KB node proof of
`galois_descent_for_vector_spaces`, independence half) or mirror
`FixedPoints.linearIndependent_smul_of_linearIndependent`
(FieldTheory/Fixed.lean) — Finset induction on the support of a
relation. Needs `E^Γ = k`: from `IsGalois` via
`IsGalois.mem_range_algebraMap_iff_fixed` (already used in
`twistedGroupAlgebra_trivial`). NOTE: this theorem, unlike the span,
genuinely requires `[IsGalois k E]`.

```lean
-- packaging; fixedSubmodule ρ : Submodule k V := {v | ∀ γ, ρ γ v = v}
noncomputable def descentLinearEquiv :
    E ⊗[k] (fixedSubmodule ρ) ≃ₗ[E] V
```

Route: the natural map is `TensorProduct.lift` of scalar action;
surjective by `span_fixedPoints_eq_top`, injective by
`linearIndependent_fixedPoints` applied to a `k`-basis of the fixed
submodule (`Basis.ofVectorSpace k`).

## 3. M3 — Lean: Hopf descent for the twisted algebra ★

File: new `lean/LanglandsLean/AlgebraicGroups/Tori/TwistedHopf.lean`.
Per (D-d): concrete `A := twistedGroupAlgebra k E M σ` only.

Target declarations, in dependency order:

```lean
-- 3.1 the comultiplication is Γ-equivariant (basis computation)
lemma comul_semilinearAut (γ) (f) :
    Coalgebra.comul (R := E) (semilinearAut k E M σ γ f)
      = (TensorProduct.map (semilinearAut ... γ) (semilinearAut ... γ)) ... (comul f)
-- (exact form fixed at implementation; stated via the E-semilinear
--  tensor-square action on E[M] ⊗[E] E[M])

-- 3.2 tensor-square descent (THE hard lemma)
noncomputable def tensorSquareDescent :
    (fixedSubmodule (tensor-square action)) ≃ₗ[k] A ⊗[k] A
-- Fallback (documented): prove only the containment Δ(A) ⊆ image of
-- A ⊗[k] A and injectivity of A ⊗[k] A → E[M] ⊗[E] E[M] via
-- linearIndependent_fixedPoints on the e^m basis — enough for 3.3.

-- 3.3 the instances
noncomputable instance : Bialgebra k A
noncomputable instance : HopfAlgebra k A   -- antipode: S is Γ-equivariant

-- 3.4 form property, Hopf level
noncomputable def twistedBaseChange :
    (E ⊗[k] A) ≃ₐc[E] AddMonoidAlgebra E M   -- BialgEquiv over E
```

API: `Algebra.TensorProduct`, `Bialgebra` structure fields,
`descentLinearEquiv` from M2. Risk is concentrated in 3.2; the
fallback path avoids it entirely at the cost of a less quotable
statement, and is acceptable for M4–M6.

## 4. M4 — Lean: the torus object

File: new `Tori/TwistedTorus.lean` + edits to `SplitTorus.lean`.

```lean
noncomputable def twistedTorusOver :
    Over (Scheme.Spec.obj (op (CommRingCat.of k))) :=
  specObjOver (CommRingCat.of k) A
noncomputable instance : GrpObj (twistedTorusOver ...) := hopfSpecGrpObj ..
abbrev TwistedTorus : Scheme := (twistedTorusOver ...).left

/-- algebra-level torus predicate (D-a, D-b) -/
def IsTorusAlgebra (k A) [CommRing k] [CommRing A] [HopfAlgebra k A] : Prop :=
  ∃ (n : ℕ), Nonempty ((E ⊗[k] A) ≃ₐc[E] AddMonoidAlgebra E (ULift (Fin n → ℤ)))
  -- E existential vs parameter: PARAMETER (split-by-E form), per D-b.

theorem isTorusAlgebra_twisted : IsTorusAlgebra k E A   -- from twistedBaseChange + lattice ≅ ℤⁿ
def IsDiagonalizable ... := ∃ M, Nonempty (A ≃ₐc[k] AddMonoidAlgebra k M)
noncomputable def splitTorusOneIsoGm : splitTorusOver R 1 ≅ Gm-over  -- Over-iso, smoke test
```

Universe rule: touch `specObjOver`'s universes only if `ULift`
actually blocks; else leave.

## 5. M5 — Lean: character lattice with Galois action

File: extend `CharacterGroup.lean` or new `CharLattice.lean`.

```lean
/-- X^*(A) for A split by E: group-likes of the base change. -/
noncomputable def charLattice := GroupLike E (E ⊗[k] A)
noncomputable def charLatticeGalAction :
    (E ≃ₐ[k] E) →* MulAut (charLattice k E A)   -- from γ ⊗ id semilinearity
theorem charLattice_twisted :
    (charLattice k E A) ≃* Multiplicative M      -- Γ-equivariantly, via twistedBaseChange
-- also: the E-independence statement stays KB-level (D-b).

/-- carried over from the 2026-08-19 faithfulness refactor of
    CharacterGroup.lean:
    (i) convolution Group instance on characterGroup (inverse =
        precomposition with the antipode of R[ℤ]);
    (ii) the general bridge characterGroup R A ≃* GroupLike R A
        (split case done: diagGroupLikeEquiv);
    (iii) upgrade diagGroupPointsEquiv to a group isomorphism
        (points group law = pointwise multiplication). -/

/-- cocharacter lattice, pairing, anisotropy (KB:
    tori.character_and_cocharacter_lattices, tori.anisotropic_torus) -/
noncomputable def cocharLattice := (Additive (charLattice k E A)) →+ ℤ   -- dual lattice, Γ-action by precomposition
noncomputable def charPairing : Additive (charLattice ...) →+ cocharLattice ... →+ ℤ  -- evaluation; perfectness stated
def IsAnisotropic (A) : Prop := ∀ l : cocharLattice ..., Γ-invariant l → l = 0
   -- spelled via fixed points of the dual action; KB working definition X_*(T)^Θ = 0

/-- rank and split rank (KB: tori.torus_definition, tori.split_rank) -/
noncomputable def torusRank (A) : ℕ :=
  Module.finrank ℤ (Additive (charLattice k E A))
noncomputable def torusSplitRank (A) : ℕ :=
  Module.finrank ℤ (fixed points of charLatticeGalAction)
theorem splitRank_le_rank ... ; theorem splitRank_eq_zero_iff_anisotropic ...
```

## 6. M6 — Lean: assemble

```lean
theorem homEquiv_split_by_E :
    (A →ₐc[k] B) ≃ {φ : (E⊗A →ₐc[E] E⊗B) // Γ-equivariant}   -- descent of homs
theorem classification_essSurj : ∀ (M σ), IsTorusAlgebra ... (twistedGroupAlgebra σ) ∧ charLattice ... ≃ M
theorem classification_fullyFaithful :
    (A →ₐc[k] B) ≃ (Γ-equivariant lattice homs charLattice B →+ charLattice A)

-- (D-c revised) the categorical statement — THE theorem:
def ToriCat (k E) := ObjectProperty.FullSubcategory
  (fun A : (CommHopfAlgCat k)ᵒᵖ => IsTorusAlgebra k E A.unop)  -- exact spelling at impl
def LatticeCat (Γ) := FullSubcategory (finite free) (Rep ℤ Γ)   -- or ModuleCat (MonoidAlgebra ℤ Γ)
noncomputable def charLatticeFunctor : (ToriCat k E)ᵒᵖ ⥤ LatticeCat Γ
instance : charLatticeFunctor.Full        -- = fullyFaithful, surj half
instance : charLatticeFunctor.Faithful    -- = fullyFaithful, inj half
instance : charLatticeFunctor.EssSurj     -- = essSurj (twisted form)
noncomputable def toriClassification : (ToriCat k E)ᵒᵖ ≌ LatticeCat Γ :=
  Equivalence.ofFullyFaithfullyEssSurj? (exact constructor name at impl)
```

Exact packaging of "Γ-equivariant lattice hom" fixed at
implementation (subtype of `→+` with commuting condition). The KB
node `tori.f_tori_galois_module_classification` gets its `lean:`
block ONLY when `toriClassification` exists — per the linking rule,
the three working theorems alone do not witness the node.

## 7. M7 — Corollaries (Lean)

`classification_by_cocycles` (bijection with `Hom(Γ, GL)/conj` at
finite level); split ⟺ trivial action; anisotropic ⟺ split rank 0;
**`normOneTorus E k` := twistedTorus of the sign lattice of a
quadratic `E/k`** (the running example, needed by rank-one);
**`inducedTorus`** := twistedTorus of a permutation lattice
(lattice-side definition — no Weil-restriction-of-schemes machinery,
see Non-goals); rank-one classification: every 1-dimensional torus
is `𝔾_m` or `normOneTorus` of a quadratic extension.
`ℝ`/`𝔽_q` lists: stretch.

## 7b. M8 — Lean structure theorems (after M6; completes "the theory")

The classification equivalence transports structure theory to the
lattice side; these become lattice computations:

```lean
theorem subtorusEquiv : (sub-Hopf quotients of A) ≃ (Γ-stable saturated sublattices)
   -- KB: tori.subtori_and_quotients
theorem splitAnisotropicDecomposition :
   -- maximal split subtorus + maximal anisotropic subtorus, product
   -- map is an isogeny; KB: tori.split_anisotropic_decomposition
def IsIsogeny (f : A →ₐc[k] B) : Prop := (lattice map has finite cokernel & is injective)
theorem isogenyClassification :  -- KB: tori.isogeny_classification (Lean: stretch)
```

Exact statements fixed when M6 lands (they consume `toriClassification`
to move to the lattice side; proving them scheme-side first would be
strictly harder).

## 9. Non-goals of G0.C (explicit, with reasons)

- **The continuous `Gal(k_s/k)` statement** — permanently KB-level by
  (D-b); `tori.splitting_field` records the equivalence with the
  finite-level version.
- **Smoothness/connectedness trichotomy for `D(M)`**
  (`tori.multiplicative_type_characterization`) — scheme-topological
  (idempotents of `R[M]` vs `π₀`); independent of the classification;
  future goal of its own.
- **Weil restriction as a scheme/Hopf functor** — induced tori are
  obtained lattice-side instead; `Res_{E/k}` machinery is a separate
  infrastructure project.
- **Jordan–Zassenhaus in Lean** — KB statement-only (§1.8).
- **Arithmetic classes** (unramified / tamely ramified / weakly
  induced, `T(k)_0/T(k)_1`, integral models) — those are goals
  G0.5–G0.8, not classification.
- **KB structure theorems already admitted** (`subtori_and_quotients`,
  `split_anisotropic_decomposition`) get Lean counterparts only in M8,
  transported through the equivalence.

## 8. Risk register

| Risk | Where | Mitigation |
|---|---|---|
| tensor-square descent balloons | 3.2 | documented fallback (containment + injectivity on basis) |
| semilinear-Hopf axiomatization creep | M3–M5 | (D-d): concrete `twistedGroupAlgebra` only |
| `ULift`/universe friction | M4 | widen `specObjOver` only on actual blockage |
| `GroupLike` of a tensor product API gaps | M5 | transport through `twistedBaseChange` first, compute on `E[M]` |
| KB `external-theorem` kind demands Lean refs | 1.8 | use `theorem` statement-only |

## 9. Session schedule & acceptance

S1: §1.1–1.4 (KB core) · S2: §1.5–1.10 (KB corollaries) ·
S3: M2 · S4–S5: M3 · S6: M4 · S7: M5 · S8: M6 (incl. the categorical
statement) · S9: M7 · S10: M8.
Every session ends with: `tools.knowledge.check` 0 errors,
`lean_reverse_check` 0 cross-mismatch, `lake build` green (no new
sorry), links updated, site published, commit pushed.
