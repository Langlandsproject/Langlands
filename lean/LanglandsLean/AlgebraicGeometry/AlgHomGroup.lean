import LanglandsLean.AlgebraicGeometry.HopfConvolution
import LanglandsLean.AlgebraicGeometry.HopfObjectBridge

/-!
# Group structure on `A →ₐ[R] B` for Hopf `A` and commutative `B`

For an `R`-Hopf algebra `A` and a commutative `R`-algebra `B`, the set
of `R`-algebra homomorphisms `A →ₐ[R] B` carries a canonical group
structure under convolution.

- Multiplication: `convAlg f g` (from `HopfConvolution`).
- Identity: `(Algebra.ofId R B).comp (Bialgebra.counitAlgHom R A)`.
- Inverse: `algHomCompAntipode` (from `HopfObjectBridge`).

The monoid axioms (`mul_assoc`, `one_mul`, `mul_one`) are transported
from Mathlib's convolution semiring on `WithConv (A →ₗ[R] B)`. The
group axiom (`inv_mul_cancel`) is a direct Sweedler computation using
the Hopf antipode axiom.

## Blueprint

`linear_algebraic_groups.algebra_homs_form_group_under_convolution`

## GitHub issue

Phase B-Y3: <https://github.com/Langlandsproject/Langlands/issues/16>
-/

open Langlands.AlgebraicGeometry.HopfConvolution
open Langlands.AlgebraicGeometry.HopfAntipode
open WithConv LinearMap

namespace Langlands.AlgebraicGeometry.AlgHomGroup

variable {R : Type*} [CommRing R]
variable {A : Type*} [Ring A] [HopfAlgebra R A]
variable {B : Type*} [CommRing B] [Algebra R B]

/-- The convolution identity for `A →ₐ[R] B`: the composition of the
counit `ε : A →ₐ[R] R` with the structure map `R →ₐ[R] B`. -/
noncomputable def convOneAlg : A →ₐ[R] B :=
  (Algebra.ofId R B).comp (Bialgebra.counitAlgHom R A)

@[simp]
lemma convOneAlg_apply (a : A) :
    (convOneAlg (R := R) (A := A) (B := B)) a =
      algebraMap R B (CoalgebraStruct.counit a) := rfl

/-! ### Transport lemmas between AlgHom side and WithConv side -/

/-- `convOneAlg` as a linear map matches the convolution identity in
Mathlib's `WithConv`. -/
lemma convOneAlg_toLinearMap :
    (convOneAlg : A →ₐ[R] B).toLinearMap =
      ((1 : WithConv (A →ₗ[R] B)).ofConv) := by
  ext a; simp [convOneAlg]

/-- The `toConv` packaging of `convOneAlg.toLinearMap` is precisely
`(1 : WithConv …)`. -/
lemma toConv_convOneAlg :
    toConv (convOneAlg : A →ₐ[R] B).toLinearMap =
      (1 : WithConv (A →ₗ[R] B)) := by
  apply WithConv.toConv_injective
  rw [convOneAlg_toLinearMap]

/-- The `toConv` packaging of `(convAlg f g).toLinearMap` is the
convolution product of the wrapped linear maps. -/
lemma convAlg_toConv (f g : A →ₐ[R] B) :
    toConv (convAlg f g).toLinearMap =
      toConv f.toLinearMap * toConv g.toLinearMap := by
  apply WithConv.toConv_injective
  rw [convAlg_toLinearMap]
  rfl

/-! ### Instances -/

/-- Multiplication on `A →ₐ[R] B`: convolution from `HopfConvolution`. -/
noncomputable instance : Mul (A →ₐ[R] B) where
  mul := convAlg

/-- Identity element on `A →ₐ[R] B`: `Algebra.ofId R B ∘ counitAlgHom`. -/
noncomputable instance : One (A →ₐ[R] B) where
  one := convOneAlg

/-- Inverse on `A →ₐ[R] B`: composition with the antipode. -/
noncomputable instance : Inv (A →ₐ[R] B) where
  inv := algHomCompAntipode

@[simp]
lemma mul_def (f g : A →ₐ[R] B) : f * g = convAlg f g := rfl

@[simp]
lemma one_def : (1 : A →ₐ[R] B) = convOneAlg := rfl

@[simp]
lemma inv_def (f : A →ₐ[R] B) : f⁻¹ = algHomCompAntipode f := rfl

/-! ### The four group axioms -/

private lemma alghom_eq_via_toConv {f g : A →ₐ[R] B}
    (h : toConv f.toLinearMap = toConv g.toLinearMap) : f = g := by
  apply AlgHom.ext
  intro a
  have := congr_arg (·.ofConv a) h
  exact this

private lemma alghom_mul_assoc (f g h : A →ₐ[R] B) :
    convAlg (convAlg f g) h = convAlg f (convAlg g h) := by
  apply alghom_eq_via_toConv
  rw [convAlg_toConv, convAlg_toConv, convAlg_toConv, convAlg_toConv, mul_assoc]

private lemma alghom_one_mul (f : A →ₐ[R] B) : convAlg convOneAlg f = f := by
  apply alghom_eq_via_toConv
  rw [convAlg_toConv, toConv_convOneAlg, one_mul]

private lemma alghom_mul_one (f : A →ₐ[R] B) : convAlg f convOneAlg = f := by
  apply alghom_eq_via_toConv
  rw [convAlg_toConv, toConv_convOneAlg, mul_one]

private lemma alghom_inv_mul_cancel (f : A →ₐ[R] B) :
    convAlg (algHomCompAntipode f) f = convOneAlg := by
  -- Linear-map equation:
  --   mul'_B ∘ map (f∘S) f ∘ comul = algebraMap R B ∘ counit
  -- Chain: factor map (f∘S) f = (map f f) ∘ (rTensor S);
  --        AlgHom.comp_mul' swaps mul'_B ∘ map f f = f ∘ mul'_A;
  --        HopfAlgebra antipode axiom collapses mul'_A ∘ rTensor S ∘ comul
  --        to algebraMap R A ∘ counit;
  --        f.commutes finishes.
  apply AlgHom.ext
  intro a
  rw [convOneAlg_apply, convAlg_apply, convLinear_apply]
  have hcomp : (algHomCompAntipode f).toLinearMap =
      f.toLinearMap ∘ₗ HopfAlgebraStruct.antipode (R := R) := by
    ext x; simp [algHomCompAntipode]
  -- Establish: map (f∘S) f ⟨c₁, c₂⟩ = (map f f) ⟨S c₁, c₂⟩ for any pure tensor;
  -- by TensorProduct.ext_iff this lifts to (comul a).
  have key : ∀ x : TensorProduct R A A,
      LinearMap.mul' R B ((TensorProduct.map (algHomCompAntipode f).toLinearMap
        f.toLinearMap) x) =
      f.toLinearMap (LinearMap.mul' R A
        ((LinearMap.rTensor A (HopfAlgebraStruct.antipode R)) x)) := by
    intro x
    induction x with
    | zero => simp
    | tmul x y => simp [hcomp, AlgHom.toLinearMap_apply, map_mul]
    | add x y hx hy => simp [hx, hy, map_add]
  rw [key]
  rw [HopfAlgebra.mul_antipode_rTensor_comul_apply]
  exact f.commutes _

/-- The convolution group structure on `A →ₐ[R] B`. -/
noncomputable instance instGroup : Group (A →ₐ[R] B) where
  mul_assoc := alghom_mul_assoc
  one_mul := alghom_one_mul
  mul_one := alghom_mul_one
  inv_mul_cancel := alghom_inv_mul_cancel

end Langlands.AlgebraicGeometry.AlgHomGroup
