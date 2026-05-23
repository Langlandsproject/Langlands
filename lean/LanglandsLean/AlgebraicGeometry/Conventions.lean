import Mathlib.AlgebraicGeometry.Over
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.CategoryTheory.Monoidal.Grp_

/-!
# Affine algebraic groups: project conventions

This module records the canonical shape used throughout the Langlands project
for "scheme `G` is a group scheme over base `S`" and the layered property
typeclasses that distinguish *affine* group schemes and *algebraic* groups.

## The convention

For any scheme `G` to be regarded as a group scheme over a base `S`, we
write the following typeclass arguments:

```
(G S : Scheme) [G.Over S] [GrpObj (asOver G S)]
```

That is, we adopt the Mathlib idiom: the scheme `G` is the primary object;
its structure morphism `G ↘ S` is supplied by the typeclass `G.Over S`
(see `Mathlib.AlgebraicGeometry.Over`); and the group object structure
lives on `asOver G S : Over S` via the typeclass `GrpObj` from
`Mathlib.CategoryTheory.Monoidal.Grp_`. We do **not** introduce a bundled
type like `GroupScheme S := Grp (Over S)`; the typeclass form is canonical.

Additional property typeclasses are layered on the structure morphism as
needed:

```
[IsAffineHom (G ↘ S)]            -- affine structure morphism
[LocallyOfFiniteType (G ↘ S)]    -- locally of finite type
[Smooth (G ↘ S)]                 -- smooth (added only where required)
```

Aggregator typeclasses (see `LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup`
once Phase A2 lands) bundle the common combinations:

- `IsAffineGroupScheme G S` = `GrpObj (asOver G S)` + `IsAffineHom (G ↘ S)`
- `IsAlgebraicGroup G S` = the above + `LocallyOfFiniteType (G ↘ S)`

Smoothness is intentionally **not** part of `IsAlgebraicGroup`: `μ_n` and
`α_p` over a field of characteristic `p` are valid algebraic groups but are
not smooth. Smoothness enters as an extra hypothesis where the theory needs
it.

## Base change

`Mathlib.AlgebraicGeometry.Pullbacks` provides
`AlgebraicGeometry.Scheme.GrpObjAsOverPullback`, which preserves the
`GrpObj` instance under base change. Combined with the base-change lemmas
for `IsAffineHom` and `LocallyOfFiniteType`, it lets us conclude that
`IsAlgebraicGroup` is preserved by base change once the aggregator
typeclasses are in place.

## Why no `GroupScheme S` abbrev

Three reasons:

1. Mathlib does not have a packaged `GroupScheme` type in master; the active
   PRs (`#24000`, `#34897`, `#21447`) take incompatible approaches, none
   merged. Aligning with the canonical idiom (typeclass-on-scheme) keeps the
   project compatible with any future Mathlib direction.
2. The Mathlib idiom composes with existing property typeclasses without
   extra wrappers — every lemma that takes `[GrpObj (asOver G S)]` accepts
   our objects directly.
3. The bundled `Grp (Over S)` and the typeclass form
   `(G : Scheme) [G.Over S] [GrpObj (asOver G S)]` are not definitionally
   the same shape; mixing them in lemma signatures creates friction without
   real type-theoretic benefit.

See the design document
`docs/superpowers/specs/2026-05-23-affine-algebraic-group-design.md` for
the full discussion.

## References

- `Mathlib.AlgebraicGeometry.Over` — `Scheme.Over`, `asOver`, `Hom.IsOver`
- `Mathlib.AlgebraicGeometry.Pullbacks` — `Scheme.GrpObjAsOverPullback`
- `Mathlib.AlgebraicGeometry.Group.Smooth` — canonical example of the idiom
- `Mathlib.CategoryTheory.Monoidal.Grp_` — `GrpObj`, `Grp`

## GitHub issue

Phase A1: <https://github.com/Langlandsproject/Langlands/issues/1>.
-/

namespace Langlands.AlgebraicGeometry

/-- Project-internal sanity check: the Mathlib infrastructure we rely on is
in scope after this import. This declaration is intentionally trivial; it
exists so that downstream code can `open` this namespace and have the
expected names available without further imports. -/
example : True := trivial

end Langlands.AlgebraicGeometry
