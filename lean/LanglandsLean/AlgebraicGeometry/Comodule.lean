import LanglandsLean.AlgebraicGeometry.Conventions
import Mathlib.RingTheory.Bialgebra.Basic
import Mathlib.RingTheory.Coalgebra.Basic

/-!
# Comodules over a coalgebra

For a commutative semiring `R` and an `R`-coalgebra `A`, a (right)
`A`-**comodule** is an `R`-module `V` equipped with a coaction
`ρ : V →ₗ[R] V ⊗[R] A` satisfying coassociativity and counit axioms.

This module records the basic structure and morphisms. Examples
(regular comodule, etc.) and the link to representations of affine
group schemes appear in follow-up modules; the blueprint counterpart
is `affine_group_schemes.comodule_definition`.

## GitHub issue

Phase B2: <https://github.com/Langlandsproject/Langlands/issues/10>.
-/

open TensorProduct LinearMap

universe u v w

namespace Langlands.AlgebraicGeometry

variable (R : Type u) [CommSemiring R]
variable (A : Type v) [AddCommMonoid A] [Module R A] [Coalgebra R A]

/-- A right `A`-comodule structure on an `R`-module `V`: a coaction
`ρ : V → V ⊗ A` satisfying coassociativity and counit axioms. -/
structure Comodule (V : Type w) [AddCommMonoid V] [Module R V] where
  /-- The coaction map `V →ₗ[R] V ⊗[R] A`. -/
  coaction : V →ₗ[R] V ⊗[R] A
  /-- Coassociativity: applying the coaction once and then to the first
  tensor factor agrees, up to associator, with applying the coaction
  once and then comultiplying the second factor. -/
  coassoc :
    LinearMap.rTensor A coaction ∘ₗ coaction =
      (TensorProduct.assoc R V A A).symm.toLinearMap ∘ₗ
        LinearMap.lTensor V CoalgebraStruct.comul ∘ₗ coaction
  /-- Counit: applying the coaction and then the counit on the second
  tensor factor recovers the identity (via the right unitor of the
  tensor product). -/
  counit :
    (TensorProduct.rid R V).toLinearMap ∘ₗ
        LinearMap.lTensor V CoalgebraStruct.counit ∘ₗ coaction =
      LinearMap.id

namespace Comodule

variable {R A}
variable {V W : Type*}
variable [AddCommMonoid V] [Module R V]
variable [AddCommMonoid W] [Module R W]

/-- A morphism of `A`-comodules: an `R`-linear map commuting with the
coactions. -/
@[ext]
structure Hom (ρ : Comodule R A V) (σ : Comodule R A W) where
  /-- The underlying `R`-linear map. -/
  toLinearMap : V →ₗ[R] W
  /-- Compatibility with the coactions: applying the underlying linear
  map and then `σ`'s coaction agrees with applying `ρ`'s coaction and
  then extending the underlying linear map. -/
  commute :
    σ.coaction ∘ₗ toLinearMap = LinearMap.rTensor A toLinearMap ∘ₗ ρ.coaction

end Comodule

section Trivial

variable (B : Type*) [Semiring B] [Bialgebra R B]
variable (V : Type*) [AddCommMonoid V] [Module R V]

/-- The coaction of the **trivial comodule**: `v ↦ v ⊗ 1`. -/
def trivialCoaction : V →ₗ[R] V ⊗[R] B :=
  (TensorProduct.mk R V B).flip 1

@[simp]
theorem trivialCoaction_apply (v : V) :
    trivialCoaction R B V v = v ⊗ₜ[R] (1 : B) := rfl

/-- The **trivial comodule** on any `R`-module `V` over a bialgebra `B`.

When `B` is the coordinate Hopf algebra of an affine group scheme `G`,
this is the representation on which every point of `G` acts by the
identity. -/
def trivialComodule : Comodule R B V where
  coaction := trivialCoaction R B V
  coassoc := by
    ext v
    simp [trivialCoaction, Algebra.TensorProduct.one_def]
  counit := by
    ext v
    simp [trivialCoaction]

end Trivial

/-- The **regular comodule**: for any `R`-coalgebra `A`, the underlying
module `A` carries an `A`-comodule structure with coaction equal to the
comultiplication `Δ : A → A ⊗ A`.

Geometrically (when `A = O(G)` is the coordinate Hopf algebra of an
affine group scheme `G`), this is the action of `G` on its own
coordinate ring; see the blueprint node
`affine_group_schemes.regular_representation_example`. -/
def regularComodule : Comodule R A A where
  coaction := CoalgebraStruct.comul
  coassoc := by
    ext a
    have h := congr($(Coalgebra.coassoc (R := R) (A := A)) a)
    simp only [LinearMap.coe_comp, Function.comp_apply, LinearEquiv.coe_coe] at *
    rw [← h]
    simp
  counit := by
    ext a
    have h := Coalgebra.lTensor_counit_comul (R := R) (A := A) a
    simp only [LinearMap.coe_comp, Function.comp_apply,
      LinearEquiv.coe_coe, LinearMap.id_coe, id_eq]
    rw [h]
    simp [TensorProduct.rid_tmul]

end Langlands.AlgebraicGeometry
