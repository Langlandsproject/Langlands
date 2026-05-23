import LanglandsLean.AlgebraicGeometry.AlgHomGroup
import Mathlib.AlgebraicGeometry.GammaSpecAdjunction
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Over
import Mathlib.Algebra.Category.Grp.Basic

/-!
# Group-valued points presheaf of a Hopf algebra

For a commutative `R`-Hopf algebra `A` and a scheme `T` over `Spec R`,
the set of `R`-algebra homomorphisms `A →ₐ[R] Γ(T, ⊤)` carries the
convolution group structure (from `AlgHomGroup.instGroup`).  Bundling
this into a presheaf

```
pointsPresheaf A : (Over (Spec R))ᵒᵖ ⥤ GrpCat
```

is the **Step 2** of the Yoneda construction of `hopfSpec`: combined
with representability (Step 3), `GrpObj.ofRepresentableBy` then yields
the group object structure on `Spec A` (Step 4).

## Blueprint

`linear_algebraic_groups.hopf_spec_grpobj_via_yoneda` (Step 1).

## GitHub issue

Phase B-Y4: <https://github.com/Langlandsproject/Langlands/issues/17>
(the Yoneda chain closes the `hopfSpec` sorry).
-/

open AlgebraicGeometry CategoryTheory Opposite TopologicalSpace
open Langlands.AlgebraicGeometry.AlgHomGroup

namespace Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

universe u

variable (R : CommRingCat.{u})
variable (A : Type u) [CommRing A] [HopfAlgebra R A]

/-- For `T` a scheme over `Spec R`, the structure morphism
`T.hom : T.left ⟶ Spec R` induces a ring map `R ⟶ Γ(T.left, ⊤)` by
`Γ ∘ Spec`-adjunction (concretely, by composing the inverse of the
`ΓSpec` iso with the application on global sections). -/
noncomputable def overGammaMap (T : Over (Scheme.Spec.obj (op R))) :
    R ⟶ CommRingCat.of (Γ(T.left, ⊤)) :=
  (Scheme.ΓSpecIso R).inv ≫ T.hom.appTop

/-- `T : Over (Spec R)` makes `Γ(T.left, ⊤)` into an `R`-algebra via
`overGammaMap`. -/
noncomputable def gammaAlgebra (T : Over (Scheme.Spec.obj (op R))) :
    Algebra R (Γ(T.left, ⊤)) :=
  (overGammaMap R T).hom.toAlgebra

/-- The object component of the points presheaf: send a scheme `T` over
`Spec R` to the convolution group `A →ₐ[R] Γ(T.left, ⊤)`. -/
noncomputable def pointsObj (T : Over (Scheme.Spec.obj (op R))) : GrpCat.{u} :=
  letI : Algebra R (Γ(T.left, ⊤)) := gammaAlgebra R T
  letI : Group (A →ₐ[R] Γ(T.left, ⊤)) :=
    Langlands.AlgebraicGeometry.AlgHomGroup.instGroup
  GrpCat.of (A →ₐ[R] Γ(T.left, ⊤))

/-! ### Functoriality of the points presheaf

The presheaf assignment `T ↦ A →ₐ[R] Γ(T.left, ⊤)` extends to a
contravariant functor on `Over (Spec R)`: a morphism `g : T' ⟶ T` in
`Over (Spec R)` is sent to the post-composition map sending `f : A → Γ(T.left)`
to `g.left.appTop ∘ f : A → Γ(T'.left)`.

The fact that `g.left.appTop` is an `R`-algebra hom (with respect to
the `gammaAlgebra` structures) follows from `g.w : g.left ≫ T.hom = T'.hom`,
which translates under `Γ` to compatibility of the structure maps.
-/

end Langlands.AlgebraicGeometry.AlgHomPointsPresheaf
