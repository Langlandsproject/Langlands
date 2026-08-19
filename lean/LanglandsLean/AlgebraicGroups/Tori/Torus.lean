import LanglandsLean.AlgebraicGroups.Tori.TwistedGroupAlgebra
import LanglandsLean.AlgebraicGroups.Tori.CharLattice
import LanglandsLean.AlgebraicGroups.ReductiveGroups.Diagonalizable
import Mathlib.RingTheory.Bialgebra.MonoidAlgebra
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.RingTheory.Finiteness.Defs

/-!
# The torus predicates (plan G0.C, definition layer)

The definition hierarchy mirrors the knowledge base: **diagonalizable
groups first, tori as the special case** (a torus is a diagonalizable
group whose character group is a lattice —
`reductive_groups.diagonalizable_groups_antiequivalence`: "groups with
free abelian character group of finite rank are exactly the split
tori").

* `IsTorusAlgebra k E A` — **a torus split by `E` is a special
  diagonalizable group**: the base change `E ⊗[k] A` is
  diagonalizable (`IsDiagonalizableAlgebra`, imported from
  `ReductiveGroups/Diagonalizable.lean` — its own topic, per the
  file-placement rule) and its character lattice
  `CharLattice E (E ⊗[k] A)` is a lattice: free of finite rank.
* `IsSplitTorusAlgebra k A` — the same over `k` itself: no Galois
  twisting (`tori.split_torus`).

All three are classes (`Module.Free` pattern): downstream statements
take them as instance hypotheses and the lattice-structure instances
flow automatically.

The `T_E ≅ 𝔾ₘⁿ` form of the knowledge base's `tori.torus_definition`
is the interop theorem `isTorusAlgebra_iff_gm_pow` (choose a basis of
the lattice); it is a consequence, not the definition, so that no
`Type 0` skeleton or structure-quantifying existential enters the
definition layer (conventions §7).
-/

open scoped TensorProduct

open Langlands.ReductiveGroups

namespace Langlands.Tori

universe u



/-! ### Tori -/

section Torus

variable (k E : Type u) [Field k] [Field E] [Algebra k E]
variable (A : Type u) [CommRing A] [HopfAlgebra k A]

/-- **Torus split by `E`** (D-a algebra form, D-b finite level): a
torus is a **special diagonalizable group** — the base change
`E ⊗[k] A` is diagonalizable and its character lattice
`X^*(T_E) = CharLattice E (E ⊗[k] A)` is a lattice: free of finite
rank.

Blueprint: tori.torus_definition
-/
class IsTorusAlgebra : Prop where
  diagonalizable : IsDiagonalizableAlgebra E (E ⊗[k] A)
  free : Module.Free ℤ (CharLattice E (E ⊗[k] A))
  finite : Module.Finite ℤ (CharLattice E (E ⊗[k] A))

/-- **Split torus**: diagonalizable over `k` itself with lattice
character group — no base change, no Galois twisting.

Blueprint: tori.split_torus
-/
class IsSplitTorusAlgebra : Prop where
  diagonalizable : IsDiagonalizableAlgebra k A
  free : Module.Free ℤ (CharLattice k A)
  finite : Module.Finite ℤ (CharLattice k A)

instance [IsTorusAlgebra k E A] : IsDiagonalizableAlgebra E (E ⊗[k] A) :=
  ‹IsTorusAlgebra k E A›.diagonalizable

instance [IsSplitTorusAlgebra k A] : IsDiagonalizableAlgebra k A :=
  ‹IsSplitTorusAlgebra k A›.diagonalizable

/-- The character lattice of a torus is free — the class field,
exposed as an instance. -/
instance charLattice_free [IsTorusAlgebra k E A] :
    Module.Free ℤ (CharLattice E (E ⊗[k] A)) :=
  IsTorusAlgebra.free (k := k)

/-- The character lattice of a torus is finitely generated — the
class field, exposed as an instance. -/
instance charLattice_finite [IsTorusAlgebra k E A] :
    Module.Finite ℤ (CharLattice E (E ⊗[k] A)) :=
  IsTorusAlgebra.finite (k := k)

/-- The group algebra of a lattice is a split torus algebra
(statement; proof: M4 — group-like rigidity gives bijectivity of the
canonical evaluation).

Blueprint: tori.split_torus
-/
theorem isSplitTorusAlgebra_addMonoidAlgebra
    (M : Type u) [AddCommGroup M] [Module.Free ℤ M] [Module.Finite ℤ M] :
    IsSplitTorusAlgebra k (AddMonoidAlgebra k M) := by
  sorry

/-- The group algebra of a lattice is a torus algebra — the split
case (statement; proof: M4, base change of group algebras).

Blueprint: tori.split_torus
-/
theorem isTorusAlgebra_addMonoidAlgebra
    (M : Type u) [AddCommGroup M] [Module.Free ℤ M] [Module.Finite ℤ M] :
    IsTorusAlgebra k E (AddMonoidAlgebra k M) := by
  sorry

/-- A split torus algebra is a torus algebra (statement; proof: M4 —
base change the canonical decomposition).

Blueprint: tori.split_torus
-/
theorem IsSplitTorusAlgebra.isTorusAlgebra
    {A : Type u} [CommRing A] [HopfAlgebra k A]
    [IsSplitTorusAlgebra k A] : IsTorusAlgebra k E A := by
  sorry

/-- Interop with the knowledge base's `T_E ≅ 𝔾ₘⁿ` form
(`tori.torus_definition`): a torus algebra is one whose base change
is the group algebra of `ℤⁿ` (statement; proof: M4/M5 — choose a
`ℤ`-basis of the character lattice).

Blueprint: tori.torus_definition
-/
theorem isTorusAlgebra_iff_gm_pow :
    IsTorusAlgebra k E A ↔
      ∃ n : ℕ, Nonempty ((E ⊗[k] A) ≃ₐc[E] AddMonoidAlgebra E (Fin n → ℤ)) := by
  sorry

/- The twisted group algebra of a `Gal(E/k)`-lattice is a torus
algebra. BLOCKED (not even statable yet): requires the
`HopfAlgebra k (twistedGroupAlgebra k E M σ)` instance from the
descent of the comultiplication — plan G0.C M3. Recorded here so the
gap is visible at the definition site. -/

end Torus

end Langlands.Tori
