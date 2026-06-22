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
* `hopfSpec R` (the **functor-level** lift): implemented in
  `Langlands.AlgebraicGeometry.HopfSpecFunctor.hopfSpec`, using the
  Yoneda construction at the level of group objects in
  `(CommAlgCat R)ᵒᵖ`.

## Functor-level construction

The Yoneda path replaces `(algSpec R).mapGrp`. For each
`A : Grp ((CommAlgCat R)ᵒᵖ)`, `HopfSpecFunctor.hopfSpecGrpObjFromGrp`
produces the `GrpObj` on the underlying affine scheme using the
group-valued points presheaf represented by `Spec A`. Functoriality on
morphisms is transported through the representability witness.

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

The object-level Hopf-algebra construction remains available as
`Langlands.AlgebraicGeometry.AlgHomPointsPresheaf.hopfSpecGrpObj`. -/
noncomputable def hopfSpec (R : CommRingCat) :
    Grp ((CommAlgCat R)ᵒᵖ) ⥤ Grp (Over (Scheme.Spec.obj (op R))) :=
  HopfSpecFunctor.hopfSpec R

end Langlands.AlgebraicGeometry
