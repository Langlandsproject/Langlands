import LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
import LanglandsLean.AlgebraicGeometry.AlgHomPointsPresheaf
import LanglandsLean.AlgebraicGeometry.HopfSpecFunctor
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.CommAlgCat.Monoidal

/-!
# `algSpec` and `hopfSpec` — Spec on `R`-algebras and `R`-Hopf algebras

## Status

* `algSpec R` (the Spec functor on `R`-algebras) **is implemented** as a
  one-line composition of equivalences and `Over.post Scheme.Spec`.
* `hopfSpecGrpObj` (the **object-level** Yoneda construction): for a
  concrete commutative `R`-Hopf algebra `A`, the affine scheme
  `Spec A` becomes a group object in `Over (Spec R)`. This is
  shipped via `Langlands.AlgebraicGeometry.AlgHomPointsPresheaf.hopfSpecGrpObj`.
* `hopfSpec R` (the **functor-level** lift): still requires a
  `GrpObj (A : (CommAlgCat R)ᵒᵖ) → HopfAlgebra R A.unop` bridge to
  package the Yoneda construction functorially. The original
  Mathlib-PR-blocker (`(algSpec R).mapGrp` needing `Functor.Monoidal`)
  is now sidestepped by the Yoneda path; the new blocker is the
  Hopf/GrpObj bridge.

## Plan to close the functor-level construction

The Yoneda path replaces `(algSpec R).mapGrp`:
- For each `A : Grp ((CommAlgCat R)ᵒᵖ)`, `hopfSpecGrpObj` produces a
  `GrpObj` on `algSpec.obj A`, *provided* we can install
  `HopfAlgebra R A.X.unop` from the `GrpObj` data of `A`. This is the
  GrpObj↔HopfAlgebra equivalence that the blueprint
  `linear_algebraic_groups.commutative_hopf_iff_grp_object` claims.
- Functoriality on morphisms: a morphism `f : A → A'` of group objects in
  `(CommAlgCat R)ᵒᵖ` (i.e., a Hopf algebra map under the bridge) post-composes
  on convolution to give a group hom on points, hence a `GrpObj`-morphism
  on the Spec side by `RepresentableBy` naturality.

The fully-faithful and essential-image lemmas then follow from the
analogous statements at the `algSpec` level (already shipped here).

## GitHub issue

Phase B1: <https://github.com/Langlandsproject/Langlands/issues/9>.
-/

open AlgebraicGeometry CategoryTheory Opposite

namespace Langlands.AlgebraicGeometry

universe v

/-- The Spec functor on commutative `R`-algebras: an `R`-algebra `A` is
sent to `Spec A`, viewed as a scheme over `Spec R` via the structure
morphism induced by the `R`-algebra map.

This is the one-line composition

```
(commAlgCatEquivUnder R).op.functor ⋙
  (Over.opEquivOpUnder R).inverse ⋙
  Over.post Scheme.Spec
```

and works in Mathlib master without further infrastructure. -/
noncomputable def algSpec (R : CommRingCat) :
    (CommAlgCat R)ᵒᵖ ⥤ Over (Scheme.Spec.obj (op R)) :=
  (commAlgCatEquivUnder R).op.functor ⋙
  (Over.opEquivOpUnder R).inverse ⋙
  Over.post Scheme.Spec

/-- The Spec functor lifted to commutative `R`-Hopf algebras and group
schemes over `Spec R`.

Two construction paths:

1. **Direct `mapGrp` (still blocked)**: would require `MonoidalCategory
   (Under R)ᵒᵖ` and `(Over.post Scheme.Spec).Monoidal` instances. See
   closed mathlib PR
   [#24000](https://github.com/leanprover-community/mathlib4/pull/24000).

2. **Yoneda (preferred, partially shipped)**: for each Hopf-algebra A,
   `Langlands.AlgebraicGeometry.AlgHomPointsPresheaf.hopfSpecGrpObj`
   gives the `GrpObj` on `Spec A` via Yoneda. The remaining gap is the
   `Grp ((CommAlgCat R)ᵒᵖ) ↔ {comm R-Hopf-algebras}` bridge, which
   would allow lifting `hopfSpecGrpObj` to a functor.

For now `hopfSpec` is declared as a `sorry`-stub, with the substantive
object-level content shipped in `hopfSpecGrpObj`. -/
noncomputable def hopfSpec (R : CommRingCat) :
    Grp ((CommAlgCat R)ᵒᵖ) ⥤ Grp (Over (Scheme.Spec.obj (op R))) :=
  HopfSpecFunctor.hopfSpec R

end Langlands.AlgebraicGeometry
