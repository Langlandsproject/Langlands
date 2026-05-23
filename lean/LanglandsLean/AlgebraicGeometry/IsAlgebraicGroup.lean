import LanglandsLean.AlgebraicGeometry.Conventions

/-!
# `IsAffineGroupScheme` and `IsAlgebraicGroup` aggregator typeclasses

This module introduces two Level-1 sugar typeclasses that aggregate the
Mathlib typeclass stack used to express "affine group scheme" and
"algebraic group" over an arbitrary base scheme `S`.

The aggregators are definitionally equivalent to stacking the underlying
Mathlib typeclasses; they exist only to give the project a single named
hook for the convention recorded in
`LanglandsLean.AlgebraicGeometry.Conventions`.

## Definitions

* `IsAffineGroupScheme G S` extends `GrpObj (Scheme.asOver G S)` and
  `IsAffineHom (G ↘ S)`.
* `IsAlgebraicGroup G S` extends `IsAffineGroupScheme G S` and
  `LocallyOfFiniteType (G ↘ S)`.

No smoothness is assumed (modern Milne / SGA 3 convention). Smoothness is
added as `[Smooth (G ↘ S)]` where the theory requires it.

## Forwarder instances

Lean's `extends` mechanism gives forward inference (aggregator implies
underlying) automatically. The reverse direction — synthesizing the
aggregator from the underlying typeclasses — needs explicit forwarder
instances, provided here. With these in place, the aggregator is a true
two-way synonym for the underlying stack.

## Acceptance criteria (verified)

All four checks from issue #2 pass; see `Tests` namespace at the bottom of
this file.

1. Forward inference: `[IsAlgebraicGroup G S]` implies each of
   `[GrpObj (Scheme.asOver G S)]`, `[IsAffineHom (G ↘ S)]`, and
   `[LocallyOfFiniteType (G ↘ S)]`.
2. Reverse synthesis: those three together imply `[IsAlgebraicGroup G S]`.
3. Mathlib lemma interop: `[IsAlgebraicGroup G S]` feeds directly into
   lemmas whose signature wants `[GrpObj (Scheme.asOver G S)]` (for
   instance, `Scheme.GrpObjAsOverPullback`).
4. Base change: with `[IsAlgebraicGroup M S]` and `f : T ⟶ S`, the
   pullback inherits `GrpObj`; the full `IsAlgebraicGroup` preservation
   on the pullback will be wired up in Phase A5.

## GitHub issue

Phase A2: <https://github.com/Langlandsproject/Langlands/issues/2>.
-/

open AlgebraicGeometry CategoryTheory Scheme

namespace Langlands.AlgebraicGeometry

/-- `G` is an affine group scheme over `S`: a group object in `Over S` whose
structure morphism `G ↘ S` is affine. No smoothness or finite-type
assumption.

This is the Level-1 sugar aggregator over the Mathlib stack
`GrpObj (Scheme.asOver G S)` + `IsAffineHom (G ↘ S)`. -/
class IsAffineGroupScheme (G S : Scheme) [G.Over S]
    extends GrpObj (Scheme.asOver G S), IsAffineHom (G ↘ S)

/-- `G` is an (affine) algebraic group over `S`: an affine group scheme that
is locally of finite type. Following Milne / SGA 3, no smoothness assumed;
smoothness is added separately as `[Smooth (G ↘ S)]` where needed.

This is the Level-1 sugar aggregator over the Mathlib stack
`GrpObj (Scheme.asOver G S)` + `IsAffineHom (G ↘ S)` +
`LocallyOfFiniteType (G ↘ S)`. -/
class IsAlgebraicGroup (G S : Scheme) [G.Over S]
    extends IsAffineGroupScheme G S, LocallyOfFiniteType (G ↘ S)

/-- Reverse synthesis: an `IsAffineGroupScheme G S` instance is built from a
`GrpObj` on `Scheme.asOver G S` together with an `IsAffineHom` on
`G ↘ S`. -/
instance instIsAffineGroupScheme (G S : Scheme) [G.Over S]
    [GrpObj (Scheme.asOver G S)] [IsAffineHom (G ↘ S)] :
    IsAffineGroupScheme G S where

/-- Reverse synthesis: an `IsAlgebraicGroup G S` instance is built from an
`IsAffineGroupScheme G S` together with `LocallyOfFiniteType (G ↘ S)`. -/
instance instIsAlgebraicGroup (G S : Scheme) [G.Over S]
    [IsAffineGroupScheme G S] [LocallyOfFiniteType (G ↘ S)] :
    IsAlgebraicGroup G S where

end Langlands.AlgebraicGeometry

/-! ### Acceptance tests

These are the four conditions enumerated in issue #2. They live in the file
to act as a regression guard: if Mathlib changes shape in a way that breaks
the aggregator design, these stop compiling and the failure is immediately
visible. -/

namespace Langlands.AlgebraicGeometry.Tests

open Langlands.AlgebraicGeometry

-- Acceptance 1a: forward inference IsAlgebraicGroup ⇒ GrpObj.
example {G S : Scheme} [G.Over S] [IsAlgebraicGroup G S] :
    GrpObj (Scheme.asOver G S) := inferInstance

-- Acceptance 1b: forward inference IsAlgebraicGroup ⇒ IsAffineHom.
example {G S : Scheme} [G.Over S] [IsAlgebraicGroup G S] :
    IsAffineHom (G ↘ S) := inferInstance

-- Acceptance 1c: forward inference IsAlgebraicGroup ⇒ LocallyOfFiniteType.
example {G S : Scheme} [G.Over S] [IsAlgebraicGroup G S] :
    LocallyOfFiniteType (G ↘ S) := inferInstance

-- Acceptance 2: reverse synthesis (underlying ⇒ aggregator) via forwarder.
example {G S : Scheme} [G.Over S] [GrpObj (Scheme.asOver G S)]
    [IsAffineHom (G ↘ S)] [LocallyOfFiniteType (G ↘ S)] :
    IsAlgebraicGroup G S := inferInstance

-- Acceptance 3 + 4: feeding the aggregator into the Mathlib base-change
-- lemma `Scheme.GrpObjAsOverPullback`. The `noncomputable` marker is needed
-- only because `Limits.pullback` is noncomputable; the synthesis itself is
-- automatic.
noncomputable example {M S T : Scheme} [M.Over S] {f : T ⟶ S}
    [IsAlgebraicGroup M S] :
    GrpObj (Scheme.asOver (Limits.pullback (M ↘ S) f) T) :=
  inferInstance

end Langlands.AlgebraicGeometry.Tests
