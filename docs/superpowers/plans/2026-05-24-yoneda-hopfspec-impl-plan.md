# Lean Implementation Plan: Yoneda hopfSpec Chain

**Date:** 2026-05-24
**Scope:** Close GitHub issues #16 (Group instance on `A →ₐ[R] B`) and #17
(HopfSpec sorry) via the Yoneda construction. Depends on issues #14 (algHomConv,
DONE), #15 (convAlg, DONE), #18/#19 (antipode chain, sorrys in place).
**Driven by blueprint:** the Hopf cluster
(`hopf_spec_grpobj_via_yoneda` + `hopf_spec_functor` +
`hopf_spec_fully_faithful` + `hopf_spec_essential_image_affine`,
revised in commit `34c88c1` per Option B) plus the new
`spec_representability_via_global_sections`.
**Output of this plan:** a file-by-file enumeration of declarations,
their types, and the Mathlib API calls they require, so that the
implementation can proceed without further design decisions.

## File map

```
lean/LanglandsLean/AlgebraicGeometry/
├── HopfConvolution.lean         (done: convLinear, convAlg)
├── HopfObjectBridge.lean        (done: algHomCompAntipode; sorry in
│                                       antipode_anti_multiplicativity)
├── AlgHomGroup.lean             (done shape; 4 sorrys on Group axioms)
├── AlgHomPointsPresheaf.lean    (NEW — Step 2 below)
├── HopfSpec.lean                (replace existing sorry — Step 4 below)
```

Total new code: ~150–200 LoC across one new file and one edit.

---

## Step 1 — Close `AlgHomGroup` sorrys

**Blueprint node:** `algebra_homs_form_group_under_convolution`
**File:** `lean/LanglandsLean/AlgebraicGeometry/AlgHomGroup.lean`
**Status:** data instances done; 4 axioms `sorry`-stubbed.

### Goals

| Axiom | Mathlib lemma to invoke |
|---|---|
| `mul_assoc` | `Coalgebra.coassoc` (associativity of `Δ`) + `mul_assoc` of `B` |
| `one_mul` | `Coalgebra.rTensor_counit_comul` (`Σ ε(a_{(1)}) ⊗ a_{(2)} ↦ a`) |
| `mul_one` | `Coalgebra.lTensor_counit_comul` |
| `inv_mul_cancel` | `HopfAlgebra.mul_antipode_rTensor_comul` |

### Proof shape

Each axiom unfolds the `convAlg` definition (which is itself a composition
`mul' ∘ map ∘ Δ`), applies one Hopf/coalgebra identity, simplifies. The
Sweedler-style manipulation is bookkeeping; expect ~15–30 LoC per axiom.

### Risk

The `convAlg` is built on top of `WithConv` from Mathlib's
`RingTheory.Coalgebra.Convolution`; the `convSemiring` instance there
already proves `one_mul` and `mul_one` *at the level of linear maps*. We
should be able to **transport these proofs** via `convAlg_toLinearMap`
rather than re-do them. If so, axioms collapse to ~5 LoC each.

### Acceptance

- [ ] `lake build` green, no `sorry` in `AlgHomGroup.lean`.
- [ ] Blueprint `algebra_homs_form_group_under_convolution` advances to
  `alignment: aligned`.
- [ ] GitHub issue #16 closes.

---

## Step 2 — Build the group-valued points presheaf

**Blueprint node:** `hopf_spec_grpobj_via_yoneda` Step 1
**File (NEW):** `lean/LanglandsLean/AlgebraicGeometry/AlgHomPointsPresheaf.lean`

### Goals

For an `R`-Hopf algebra `A`, construct

```lean
F (A) : (Over (Spec R))ᵒᵖ ⥤ GrpCat
F (A) |>.obj (op T) = GrpCat.of (A →ₐ[R] Γ(T, 𝒪_T))   -- with Group from Step 1
F (A) |>.map (op (g : T' ⟶ T)) = post-composition by g.app on global sections
```

### Mathlib hooks

| Need | Mathlib provides |
|---|---|
| `Γ : Scheme ⥤ CommRingCat` (global sections) | `AlgebraicGeometry.Scheme.Γ` |
| `R`-algebra structure on `Γ(T)` for `T ∈ Over (Spec R)` | derived from `T ↘ Spec R` and `Scheme.ΓSpecIso` |
| Pre-composition gives a group hom | naturality of convolution; need a lemma `algHomConv_postcomp` |

### Declarations

```lean
namespace Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

variable {R : CommRingCat} {A : Type*} [CommRing A] [HopfAlgebra R A]

/-- The R-algebra structure on global sections of T over Spec R. -/
noncomputable def gammaAlgebra (T : Over (Scheme.Spec.obj (op R))) :
    Algebra R (Γ(T.left, ⊤)) := ...
   -- via T.hom and Scheme.ΓSpecIso

/-- The group-valued points presheaf B ↦ A →ₐ[R] B for B = Γ(T). -/
noncomputable def pointsPresheaf :
    (Over (Scheme.Spec.obj (op R)))ᵒᵖ ⥤ GrpCat := {
  obj := fun T => letI := gammaAlgebra T.unop
                  GrpCat.of (A →ₐ[R] Γ(T.unop.left, ⊤))
  map := fun {T T'} g => ...  -- post-compose by g.unop.left.app
  ...
}

end Langlands.AlgebraicGeometry.AlgHomPointsPresheaf
```

### Risk

Functoriality (map_id, map_comp) requires that post-composition by a
scheme morphism preserves the convolution group structure. This is true
because the convolution depends only on `Δ_A` and on the target's
multiplication, both preserved by ring homs. Expect ~30 LoC.

### Acceptance

- [ ] `pointsPresheaf` defined, `lake build` green.
- [ ] Functoriality lemmas hold (no sorry beyond what's inherited from
  Step 1's sorrys if any remain).

---

## Step 3 — Representability witness

**Blueprint node:** `spec_representability_via_global_sections`
**File:** same as Step 2

### Goals

```lean
/-- Hom(T, Spec A) ≃ Hom_{R-Alg}(A, Γ(T)) for any T over Spec R. -/
noncomputable def specRepresentability :
    (pointsPresheaf (R := R) (A := A) ⋙ forget GrpCat).RepresentableBy
      (specObjOver R A)
```

where `specObjOver R A : Over (Scheme.Spec.obj (op R))` is `Spec A`
viewed as an `Over (Spec R)` object (= `algSpec.obj (op A)` we already
ship).

### Mathlib hooks

| Need | Mathlib provides |
|---|---|
| Spec ⊣ Γ adjunction | `AlgebraicGeometry.ΓSpec.adjunction` (or `Spec.adjunction`) |
| Over-category version | derive from the above by passing to slice |

### Risk

The over-category version of the adjunction may need a bit of plumbing.
If `RepresentableBy` is too rigid a shape, fall back to constructing a
`Functor.Iso` between `pointsPresheaf ⋙ forget` and `yoneda.obj
(specObjOver R A)` and use `RepresentableBy.ofIso` or similar.

### Acceptance

- [ ] Witness defined, builds.
- [ ] No `sorry` in this part (it's pure Mathlib glue).

---

## Step 4 — Yoneda application + close HopfSpec

**Blueprint nodes:** `hopf_spec_grpobj_via_yoneda` Step 3 + `hopf_spec_functor`
**File:** `lean/LanglandsLean/AlgebraicGeometry/HopfSpec.lean` (edit)

### Goals

```lean
-- Object level: each Hopf algebra A gives a GrpObj instance on Spec A.
noncomputable instance hopfSpecGrpObj {R A} [CommRing A] [HopfAlgebra R A] :
    GrpObj (Scheme.asOver (specObjOver R A).left (Spec R)) :=
  GrpObj.ofRepresentableBy
    (AlgHomPointsPresheaf.pointsPresheaf (R := R) (A := A))
    (AlgHomPointsPresheaf.specRepresentability ...)

-- Functor level: package object + naturality.
noncomputable def hopfSpec (R : CommRingCat) :
    Grp ((CommAlgCat R)ᵒᵖ) ⥤ Grp (Over (Scheme.Spec.obj (op R))) where
  obj A := { X := algSpec R |>.obj A
             grpObj := hopfSpecGrpObj (A := A.unop.unop) }
  map {A A'} f := ...  -- algSpec.map f, packaged as Grp morphism
  map_id := ...        -- from algSpec.map_id
  map_comp := ...      -- from algSpec.map_comp
```

### Mathlib hooks

| Need | Mathlib provides |
|---|---|
| `GrpObj.ofRepresentableBy` | `CategoryTheory.Monoidal.Cartesian.Grp_` line 33 |
| `CartesianMonoidalCategory (Over S)` | `Over.cartesianMonoidalCategory` (from `Pullbacks.lean`) |
| Packaging a morphism as Grp morphism | direct from `Grp.mk'` or `Grp.Hom.mk'` |

### Risk

Naturality of `algSpec.map f` as a group object morphism: needs that the
Yoneda-determined GrpObj on `Spec A` is preserved by `algSpec.map f`.
This holds because both source and target GrpObj are defined by the
convolution group on algebra homs, and `f : A → A'` is itself a group
hom on convolution (since it preserves Hopf structure). Expect ~30 LoC.

### Acceptance

- [ ] `hopfSpec` definition compiles, **no `sorry`** in `HopfSpec.lean`.
- [ ] `lake build` green.
- [ ] Blueprint `hopf_spec_functor` advances to `alignment: aligned`.
- [ ] GitHub issue #17 closes.

---

## Step 5 — (Optional) Fully faithful and essential image

**Blueprint nodes:** `hopf_spec_fully_faithful`,
`hopf_spec_essential_image_affine`
**Files:** extend `HopfSpec.lean` or new `HopfSpecEquivalence.lean`

### Goals

```lean
theorem hopfSpec_fullyFaithful : (hopfSpec R).FullyFaithful := ...
theorem hopfSpec_essImage : (hopfSpec R).essImage = ... := ...
```

### Mathlib hooks

| Need | Mathlib provides |
|---|---|
| `algSpec.fullyFaithful` | `Langlands.AlgebraicGeometry.algSpec.fullyFaithful` (already shipped in our `HopfSpec.lean`) |
| Lifting FF from algSpec to hopfSpec | from Yoneda determination + algSpec FF |

### Risk

Low. These are derived from `algSpec` properties.

### Acceptance

- [ ] Both theorems proved.
- [ ] Corresponding blueprint nodes go `alignment: aligned`.

---

## Dependency graph

```
Step 1 (Group on A →ₐ B)
   ├─ depends on: HopfConvolution.convAlg (DONE)
   ├─ depends on: HopfObjectBridge.algHomCompAntipode (DONE, modulo
   │              antipode_anti_multiplicativity sorry)
   └─ depends on: Mathlib Coalgebra/HopfAlgebra identities

Step 2 (points presheaf)
   ├─ depends on: Step 1
   └─ depends on: Mathlib Scheme.Γ + naturality

Step 3 (representability)
   ├─ depends on: Step 2
   └─ depends on: Mathlib Spec ⊣ Γ adjunction

Step 4 (HopfSpec close)
   ├─ depends on: Step 2, Step 3
   ├─ depends on: GrpObj.ofRepresentableBy (Mathlib)
   └─ closes: HopfSpec.lean::hopfSpec sorry  ⟹ #17

Step 5 (optional FF + ess image)
   └─ depends on: Step 4
```

## Risks and external blockers

1. **antipode_anti_multiplicativity** (in `HopfObjectBridge.lean`) is
   still `sorry`. It's used transitively by Step 1 (via `algHomCompAntipode`).
   - Closing it requires a Sweedler-level convolution-uniqueness proof.
   - **Workaround for Steps 2–4**: they don't directly use the antipode
     theorem; they use `inv_mul_cancel` of the Group, which in turn uses
     the antipode theorem. Steps 2–4 can be implemented assuming the
     Group instance exists; the inv axiom's sorry transitively makes
     `inv` operations on `A →ₐ B` partially undetermined, but the
     functor construction at Step 4 doesn't actually evaluate inv.
   - Closing `antipode_anti_multiplicativity` is an orthogonal task.

2. **`gammaAlgebra` for general T over Spec R**: needs the structure
   morphism to give an `Algebra R (Γ(T))` instance. Mathlib has the
   pieces (`Scheme.ΓSpecIso`), but assembly may require ~10 LoC.

## Estimate

| Step | LoC | Risk |
|---|---|---|
| 1 (Group axioms) | 40–80 | low (Sweedler bookkeeping) |
| 2 (points presheaf) | 50–80 | medium (gammaAlgebra setup) |
| 3 (representability) | 30–50 | medium (over-cat adjunction) |
| 4 (hopfSpec functor + close #17) | 50–80 | low (Yoneda + bookkeeping) |
| 5 (FF + ess image, optional) | 40–60 | low |
| **Total Steps 1–4** | **~170–290** | medium |

A single focused session should fit Steps 2 + 3 + 4 (if Step 1 already
done). All four together is multi-session.

## Recommended ordering

1. Steps 1 in one session (depends on already-shipped infrastructure).
2. Steps 2 + 3 + 4 in one session (Yoneda construction, closes #17).
3. Step 5 (optional) in a follow-up.

Cross-cutting: `antipode_anti_multiplicativity` closure is its own task,
independent of the Yoneda chain except for finalizing `inv` semantics
in Step 1's Group instance.

## Mathlib lemmas to ensure are in scope

Final survey list (use during implementation):

- `AlgebraicGeometry.Scheme.Spec` — `CommRingCatᵒᵖ ⥤ Scheme`
- `AlgebraicGeometry.Scheme.Γ` — global sections functor
- `AlgebraicGeometry.ΓSpec.adjunction` — Spec ⊣ Γ
- `AlgebraicGeometry.Scheme.ΓSpecIso` — `Γ(Spec R) ≃ R`
- `Coalgebra.coassoc`, `Coalgebra.rTensor_counit_comul`,
  `Coalgebra.lTensor_counit_comul`
- `HopfAlgebra.mul_antipode_rTensor_comul`,
  `HopfAlgebra.mul_antipode_lTensor_comul`
- `Bialgebra.comulAlgHom`, `Bialgebra.counitAlgHom`,
  `Bialgebra.comul_one`, `Bialgebra.counit_one`
- `CategoryTheory.GrpObj.ofRepresentableBy`
- `CategoryTheory.Functor.RepresentableBy`
- `Over.cartesianMonoidalCategory`
- `Mathlib.RingTheory.Coalgebra.Convolution.WithConv` — `convSemiring`,
  `convRing` instances (for transporting axiom proofs in Step 1).
- `Mathlib.RingTheory.TensorProduct.Maps.Algebra.TensorProduct.lmul'`
  (for `convAlg` already; not re-used).
