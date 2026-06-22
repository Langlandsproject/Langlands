import LanglandsLean.AlgebraicGeometry.Examples.GLn
import Mathlib.LinearAlgebra.Dimension.Finrank

/-!
# The general linear group scheme `GL(V)` of a finite free module

For a commutative ring `R` and a finitely-generated free `R`-module `V`
of rank `n`, the **general linear group scheme of `V`** is the affine
group scheme

\[
\operatorname{GL}(V)_R \;\cong\; \operatorname{GL}_{n,R}
\]

where the isomorphism depends on a choice of basis of `V` (the
abstract `GL(V)` is canonically isomorphic to `GL_n` once a basis is
fixed, and intrinsic without basis choice as the automorphism group
scheme of the rank-`n` free module).

## Scope

This file defines `GLV R V` as `GLn R (Module.finrank R V)` — i.e., as
`GL_n` for the rank of `V`. This is the **basis-dependent** definition.
A basis-free, intrinsically defined `GL(V)` would require constructing
the automorphism group scheme of `V` directly (via the functor
`B ↦ (V ⊗_R B)ˣ` and a representability theorem); see the blueprint
node `linear_algebraic_groups.general_linear_group_of_module` for the
mathematical statement.

## Main declarations

* `GLV R V` — the general linear group scheme of `V`, defined as
  `GLn R (Module.finrank R V)`.
* `GLVSch R V` — the underlying scheme.
* Inherited instances: `IsAffineHom`, `LocallyOfFiniteType` (via the
  `GLn` instances).

## GitHub issue

Phase D4: <https://github.com/Langlandsproject/Langlands/issues/8>.
-/

open AlgebraicGeometry CategoryTheory Opposite

namespace Langlands.AlgebraicGeometry.Examples

universe u v

variable (R : CommRingCat.{u}) (V : Type v) [AddCommGroup V] [Module R V]

/-- The general linear group scheme of `V` over `Spec R`, defined as
`GL_n` for `n := Module.finrank R V`. Basis-dependent definition. -/
noncomputable def GLV : Over (Scheme.Spec.obj (op R)) :=
  GLn.over R (Module.finrank R V)

/-- The underlying scheme of `GLV R V`. -/
noncomputable abbrev GLVSch : Scheme.{u} := (GLV R V).left

end Langlands.AlgebraicGeometry.Examples
