import LanglandsLean.AlgebraicGeometry.Conventions
import Mathlib.RingTheory.Coalgebra.Basic

/-!
# Comodules over a coalgebra

For a commutative semiring `R` and an `R`-coalgebra `A`, a (right)
`A`-**comodule** is an `R`-module `V` equipped with a coaction
`ρ : V →ₗ[R] V ⊗[R] A` satisfying coassociativity and counit axioms.

This module records the basic structure and morphisms. Examples
(regular comodule, etc.) and the link to representations of affine
group schemes appear in follow-up modules; the blueprint counterpart
is `linear_algebraic_groups.comodule_definition`.

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

end Langlands.AlgebraicGeometry
