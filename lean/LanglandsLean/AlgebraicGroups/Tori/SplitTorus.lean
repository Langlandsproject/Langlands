import LanglandsLean.AlgebraicGeometry.DiagGroup
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.LinearAlgebra.FreeModule.Basic

/-!
# Split tori `D(M) = Spec R[M]` for a lattice `M`

The **split torus** over `Spec R` presented by a lattice `M` (a
finite free `ℤ`-module) is the diagonalizable group scheme

\[
D(M) \;=\; \operatorname{Spec} R[M],
\]

whose coordinate ring is the Laurent polynomial ring in
`Module.finrank ℤ M` variables once a basis is chosen. For `M = ℤ`
this recovers `G_m` (`AlgebraicGeometry/Gm.lean`, where the coordinate ring is
presented as `LaurentPolynomial R`).

The definition is parameterized by the lattice, not by a rank `n`
with the hard-coded skeleton `Fin n → ℤ`: the skeleton lives in
`Type 0` while `R` is universe-polymorphic, and baking it in forces
`ULift` into every statement. Universe bookkeeping stays out of the
public API; concrete `Fin n → ℤ` instantiations belong in examples
over `Type 0`, where they typecheck as-is. (Design rule: conventions
§7.)

In the knowledge base, a torus over a field is a form of a split
torus (`tori.torus_definition`), and `tori.split_torus` is the case
where no Galois twisting occurs. The general torus enters
lattice-first (a Galois lattice, with `D` applied after base change),
as recorded in the G0 roadmap.

## Main declarations

* `splitTorusOver R M` — `D(M)` as an object of `Over (Spec R)`, with
  its group-object structure inherited from `diagGroupOver`.
* `SplitTorus R M` — the underlying scheme.

## Knowledge base

`tori.split_torus`.
-/

open AlgebraicGeometry CategoryTheory Opposite
open Langlands.AlgebraicGeometry
open Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

namespace Langlands.Tori

universe u

/-- A `ℤ`-finite module is additively finitely generated. This lets
the finite-type instances of `diagGroupOver` (keyed on
`[AddMonoid.FG M]`) fire for a lattice given as
`[Module.Finite ℤ M]`. Scoped: Mathlib's global instance
`AddMonoid.FG.to_moduleFinite_int` goes the other way, and a global
converse would set up a typeclass cycle. -/
scoped instance (M : Type*) [AddCommGroup M] [Module.Finite ℤ M] :
    AddMonoid.FG M :=
  AddGroup.fg_iff_addMonoid_fg.mp (Module.Finite.iff_addGroup_fg.mp ‹_›)

variable (R : CommRingCat.{u}) (M : Type u)
variable [AddCommGroup M] [Module.Free ℤ M] [Module.Finite ℤ M]

/-- The split torus over `Spec R` presented by the lattice `M`: the
diagonalizable group scheme `D(M)` of a finite free abelian group.
Its rank is `Module.finrank ℤ M`. Being an `abbrev`, it inherits
every instance of `diagGroupOver` — group object, affine group
scheme, algebraic group.

Blueprint: tori.split_torus
-/
noncomputable abbrev splitTorusOver : Over (Scheme.Spec.obj (op R)) :=
  diagGroupOver R M

/-- The underlying scheme of the split torus of the lattice `M`.

Blueprint: tori.split_torus
-/
noncomputable abbrev SplitTorus : Scheme.{u} := (splitTorusOver R M).left

/- Instance availability (GrpObj, IsAffineGroupScheme, IsAlgebraicGroup)
is inherited from `diagGroupOver` since `splitTorusOver` is an
`abbrev`; downstream uses exercise it. -/

end Langlands.Tori
