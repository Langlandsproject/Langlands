import LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.CommAlgCat.Monoidal

/-!
# `algSpec` and `hopfSpec` — Spec on `R`-algebras and `R`-Hopf algebras

## Status

* `algSpec R` (the Spec functor on `R`-algebras) **is implemented** as a
  one-line composition of equivalences and `Over.post Scheme.Spec`.
* `hopfSpec R` (the lift to Hopf algebras and group objects) **is not
  yet implementable in Mathlib master**: it needs `Functor.Monoidal`
  instances on the equivalences `(commAlgCatEquivUnder R).op` and
  `(Over.opEquivOpUnder R).inverse`, which are unmerged upstream
  (closed mathlib PR [#24000](https://github.com/leanprover-community/mathlib4/pull/24000)
  set them up but was not merged). A working `hopfSpec` is declared
  below with an explicit `sorry`, pinned to the precise upstream gap.

## Plan once `hopfSpec` is unblocked

Composing `(algSpec R).mapGrp` gives `hopfSpec R`. The fully-faithful
and essential-image lemmas (Theorems
\\ref{thm:hopf-spec-fully-faithful} and \\ref{thm:hopf-spec-ess-image} in
the blueprint) then follow from `mapGrp` preserving full-faithfulness
of equivalences plus the affine-scheme essential image of
`(Over.post Scheme.Spec).essImage` on objects coming from finite-type
algebras.

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

This is morally `(algSpec R).mapGrp`. To actually obtain a
`Functor.mapGrp` instance, Lean needs a `Functor.Monoidal` instance on
`algSpec R`, which currently fails to synthesize because:

- `MonoidalCategory (Under R)ᵒᵖ` is missing in Mathlib master.
- `MonoidalCategory (Over (op R))` is missing.
- `Over.post Scheme.Spec` is not marked `Monoidal` (would follow from
  `Scheme.Spec` preserving products as a right adjoint).

The TODO is closed by porting the relevant pieces of mathlib PR
[#24000](https://github.com/leanprover-community/mathlib4/pull/24000)
(or waiting for an updated version to merge). Once those instances are
in scope, the body of `hopfSpec` becomes `(algSpec R).mapGrp`.

For now the declaration exists as a `sorry`-stub so downstream code can
refer to it. -/
noncomputable def hopfSpec (R : CommRingCat) :
    Grp ((CommAlgCat R)ᵒᵖ) ⥤ Grp (Over (Scheme.Spec.obj (op R))) := by
  sorry
  -- TODO(#9): replace `sorry` with `(algSpec R).mapGrp` once
  -- `MonoidalCategory (Under R)ᵒᵖ`, `MonoidalCategory (Over (op R))`,
  -- and `(Over.post Scheme.Spec).Monoidal` instances land upstream
  -- (mathlib4#24000 follow-up).

end Langlands.AlgebraicGeometry
