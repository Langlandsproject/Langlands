import LanglandsLean.AlgebraicGeometry.HopfSpec
import LanglandsLean.AlgebraicGeometry.AlgHomPointsPresheaf
import LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.HopfAlgebra.TensorProduct
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.RingTheory.FiniteType

/-!
# The additive group scheme `G_a`

For a commutative ring `R`, the additive group scheme
\(\mathbb{G}_{a,R} = \operatorname{Spec} R[X]\) is constructed by
installing the **primitive** Hopf algebra structure on the polynomial
ring `R[X]`:

- comultiplication `Δ(X) = X ⊗ 1 + 1 ⊗ X` (extended as algebra hom)
- counit `ε(X) = 0`
- antipode `S(X) = -X`

Mathlib provides the Hopf structure on `R[T;T⁻¹]` (group-like), but
**not** on `R[X]` (primitive). This file constructs that structure from
scratch using `Polynomial.aeval`, then feeds it through `hopfSpec` to
get `G_a` as an `IsAlgebraicGroup`.

## Main declarations

* `Polynomial.gaComul`, `Polynomial.gaCounit`, `Polynomial.gaAntipode` —
  the structure maps as algebra homs.
* `Polynomial.instBialgebra`, `Polynomial.instHopfAlgebra` —
  the Hopf algebra structure.
* `additiveGroup R` — `Spec R[X]` as a scheme over `Spec R`.
* `additiveGroup.instGrpObj R` — the group-object structure.
* `Ga R` — the underlying scheme; comes with `IsAlgebraicGroup` instance.

## Blueprint

`linear_algebraic_groups.additive_group_scheme`.

## GitHub issue

Phase D1: <https://github.com/Langlandsproject/Langlands/issues/23>.
-/

open AlgebraicGeometry CategoryTheory Opposite Polynomial
open Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

namespace Polynomial

universe u

variable (R : Type u) [CommRing R]

/-- The comultiplication on `Polynomial R`: extends `X ↦ X ⊗ 1 + 1 ⊗ X`
to an algebra hom. Primitive element structure. -/
noncomputable def gaComul :
    Polynomial R →ₐ[R] TensorProduct R (Polynomial R) (Polynomial R) :=
  aeval (R := R) (A := TensorProduct R (Polynomial R) (Polynomial R))
    ((X : Polynomial R) ⊗ₜ[R] (1 : Polynomial R) +
      (1 : Polynomial R) ⊗ₜ[R] (X : Polynomial R))

/-- The counit on `R[X]`: extends `X ↦ 0` to an algebra hom
`R[X] →ₐ[R] R`. -/
noncomputable def gaCounit : R[X] →ₐ[R] R :=
  aeval (R := R) (A := R) (0 : R)

/-- The antipode on `R[X]`: extends `X ↦ -X` to an algebra hom
`R[X] →ₐ[R] R[X]`. -/
noncomputable def gaAntipode : R[X] →ₐ[R] R[X] :=
  aeval (R := R) (A := R[X]) (-(X : R[X]))

@[simp] lemma gaComul_X :
    gaComul R (X : Polynomial R) =
      (X : Polynomial R) ⊗ₜ[R] (1 : Polynomial R) +
        (1 : Polynomial R) ⊗ₜ[R] (X : Polynomial R) := by
  simp [gaComul]

@[simp] lemma gaCounit_X : gaCounit R (X : R[X]) = 0 := by simp [gaCounit]

@[simp] lemma gaAntipode_X : gaAntipode R (X : R[X]) = -(X : R[X]) := by
  simp [gaAntipode]

/-- The bialgebra structure on `R[X]` with primitive `X`. -/
noncomputable instance instBialgebra : Bialgebra R R[X] :=
  Bialgebra.ofAlgHom (gaComul R) (gaCounit R)
    (by  -- coassoc: assoc ∘ (comul ⊗ id) ∘ comul = (id ⊗ comul) ∘ comul
      apply Polynomial.algHom_ext
      show (Algebra.TensorProduct.assoc R R R (Polynomial R) (Polynomial R)
              (Polynomial R)).toAlgHom
          ((Algebra.TensorProduct.map (gaComul R) (.id R (Polynomial R)))
            (gaComul R X)) =
        (Algebra.TensorProduct.map (.id R (Polynomial R)) (gaComul R))
          (gaComul R X)
      -- Rewrite both occurrences of gaComul R X.
      simp only [gaComul_X, map_add, Algebra.TensorProduct.map_tmul,
        map_one, AlgHom.coe_id, id_eq]
      -- Now: assoc ((X⊗1 + 1⊗X) ⊗ 1) + assoc (1 ⊗ X) =
      --       X⊗1 + 1⊗(X⊗1 + 1⊗X)
      simp only [TensorProduct.add_tmul, map_add,
        AlgEquiv.toAlgHom_eq_coe, TensorProduct.tmul_add]
      abel)
    (by  -- left counit: (counit ⊗ id) ∘ comul = (lid R[X]).symm
      apply Polynomial.algHom_ext
      show (Algebra.TensorProduct.map (gaCounit R) (.id R (Polynomial R)))
          (gaComul R X) =
        (Algebra.TensorProduct.lid R (Polynomial R)).symm.toAlgHom X
      rw [gaComul_X]
      simp only [map_add, Algebra.TensorProduct.map_tmul, map_one,
        AlgHom.coe_id, id_eq, gaCounit_X]
      -- Now: (0 ⊗ X) + (1 ⊗ X) = (lid R R[X]).symm.toAlgHom X = 1 ⊗ X
      rw [TensorProduct.zero_tmul, zero_add]
      rfl)
    (by  -- right counit: (id ⊗ counit) ∘ comul = (rid R R[X]).symm
      apply Polynomial.algHom_ext
      show (Algebra.TensorProduct.map (.id R (Polynomial R)) (gaCounit R))
          (gaComul R X) =
        (Algebra.TensorProduct.rid R R (Polynomial R)).symm.toAlgHom X
      rw [gaComul_X]
      simp only [map_add, Algebra.TensorProduct.map_tmul, map_one,
        AlgHom.coe_id, id_eq, gaCounit_X]
      -- Now: (X ⊗ 1) + (X ⊗ 0) = (rid R R R[X]).symm.toAlgHom X = X ⊗ 1
      rw [TensorProduct.tmul_zero, add_zero]
      rfl)

/-- The Hopf algebra structure on `R[X]` with antipode `X ↦ -X`. -/
noncomputable instance instHopfAlgebra : HopfAlgebra R R[X] :=
  HopfAlgebra.ofAlgHom (gaAntipode R)
    (by  -- mul_antipode_rTensor: lift (antipode, id) ∘ comul = Algebra.ofId ∘ counit
      apply Polynomial.algHom_ext
      show (Algebra.TensorProduct.lift (gaAntipode R) (.id R (Polynomial R))
              (fun _ _ ↦ .all _ _)).comp (Bialgebra.comulAlgHom R (Polynomial R))
            X = ((Algebra.ofId R (Polynomial R)).comp
              (Bialgebra.counitAlgHom R (Polynomial R))) X
      simp only [AlgHom.coe_comp, Function.comp_apply,
        Bialgebra.comulAlgHom_apply, Bialgebra.counitAlgHom_apply]
      -- CoalgebraStruct.comul X = gaComul R X (since Bialgebra was constructed
      -- with gaComul). Same for counit.
      show (Algebra.TensorProduct.lift (gaAntipode R) (.id R (Polynomial R))
              (fun _ _ ↦ .all _ _)) (gaComul R X) =
        (Algebra.ofId R (Polynomial R)) (gaCounit R X)
      rw [gaComul_X, gaCounit_X]
      simp only [map_add, Algebra.TensorProduct.lift_tmul, gaAntipode_X,
        map_one, AlgHom.coe_id, id_eq, mul_one, one_mul, map_zero]
      ring)
    (by  -- mul_antipode_lTensor: lift (id, antipode) ∘ comul = Algebra.ofId ∘ counit
      apply Polynomial.algHom_ext
      show (Algebra.TensorProduct.lift (.id R (Polynomial R)) (gaAntipode R)
              (fun _ _ ↦ .all _ _)).comp (Bialgebra.comulAlgHom R (Polynomial R))
            X = ((Algebra.ofId R (Polynomial R)).comp
              (Bialgebra.counitAlgHom R (Polynomial R))) X
      simp only [AlgHom.coe_comp, Function.comp_apply,
        Bialgebra.comulAlgHom_apply, Bialgebra.counitAlgHom_apply]
      show (Algebra.TensorProduct.lift (.id R (Polynomial R)) (gaAntipode R)
              (fun _ _ ↦ .all _ _)) (gaComul R X) =
        (Algebra.ofId R (Polynomial R)) (gaCounit R X)
      rw [gaComul_X, gaCounit_X]
      simp only [map_add, Algebra.TensorProduct.lift_tmul, gaAntipode_X,
        map_one, AlgHom.coe_id, id_eq, mul_one, one_mul, map_zero]
      ring)

end Polynomial

namespace Langlands.AlgebraicGeometry.Examples

universe u

variable (R : CommRingCat.{u})

/-- The additive group scheme `G_{a,R} = Spec R[X]` over `Spec R`. -/
noncomputable def additiveGroup :
    Over (Scheme.Spec.obj (op R)) :=
  specObjOver R (Polynomial R)

/-- The group-object structure on `additiveGroup R`, inherited from the
primitive Hopf algebra structure on `R[X]`. -/
noncomputable instance additiveGroup.instGrpObj :
    GrpObj (additiveGroup R) :=
  hopfSpecGrpObj R (Polynomial R)

/-- The underlying scheme of `additiveGroup R`: `Spec R[X]`. -/
noncomputable abbrev Ga : Scheme.{u} := (additiveGroup R).left

/-- `Ga R` is canonically a scheme over `Spec R`. -/
noncomputable instance : (Ga R).Over (Scheme.Spec.obj (op R)) :=
  ⟨(additiveGroup R).hom⟩

/-- The `GrpObj` on `Scheme.asOver (Ga R) (Spec R)` agrees with the one
shipped on `additiveGroup R`. -/
noncomputable instance : GrpObj (Scheme.asOver (Ga R) (Scheme.Spec.obj (op R))) :=
  additiveGroup.instGrpObj R

/-- The structure morphism is affine (it's `Spec.map` of a ring hom). -/
noncomputable instance : IsAffineHom ((Ga R) ↘ Scheme.Spec.obj (op R)) := by
  show IsAffineHom (Scheme.Spec.map _)
  infer_instance

/-- `Ga R` is an affine group scheme. -/
noncomputable instance : IsAffineGroupScheme (Ga R) (Scheme.Spec.obj (op R)) :=
  inferInstance

/-- The structure morphism is locally of finite type: `R[X]` is
finitely-generated (by `X`). -/
noncomputable instance :
    LocallyOfFiniteType ((Ga R) ↘ Scheme.Spec.obj (op R)) := by
  show LocallyOfFiniteType (Spec.map _)
  rw [HasRingHomProperty.Spec_iff (P := @LocallyOfFiniteType)]
  show RingHom.FiniteType (algebraMap R (Polynomial R))
  rw [RingHom.finiteType_algebraMap]
  -- Polynomial R is the free R-algebra on one generator
  infer_instance

/-- `Ga R` is an **algebraic group** over `Spec R`. -/
noncomputable instance : IsAlgebraicGroup (Ga R) (Scheme.Spec.obj (op R)) :=
  inferInstance

end Langlands.AlgebraicGeometry.Examples
