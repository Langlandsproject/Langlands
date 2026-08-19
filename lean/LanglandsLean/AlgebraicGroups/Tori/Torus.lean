import LanglandsLean.AlgebraicGroups.Tori.TwistedGroupAlgebra
import Mathlib.RingTheory.Bialgebra.TensorProduct
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.RingTheory.Finiteness.Defs

/-!
# The torus predicates (statement layer)

This file is the definition layer for "torus" in the Lean library,
per plan G0.C (design decisions D-a algebra-first, D-b finite Galois
level): a **torus split by `E`** is presented by its coordinate Hopf
algebra `A` together with a Hopf-algebra identification of the base
change `E ⊗ₖ A` with the group algebra of a lattice (a finite free
`ℤ`-module). Choosing a basis of the lattice recovers the knowledge
base's `T_{k_s} ≅ 𝔾ₘⁿ`; the lattice form is used so that no `Type 0`
skeleton (`Fin n → ℤ`) is hard-coded into a universe-polymorphic
statement (conventions §7).

The knowledge-base definition (`tori.torus_definition`) is stated
over a separable closure; by `tori.splitting_field` it is equivalent
to being split by *some* finite Galois extension, which is the form
taken here with the extension as a parameter.

Statements below marked "proof: M3/M4" are the statement-first
skeleton; no proofs are attempted here.
-/

open scoped TensorProduct

namespace Langlands.Tori

universe u

variable (k E : Type u) [Field k] [Field E] [Algebra k E]

/-- **Torus split by `E`, algebra form** (D-a, D-b): the coordinate
Hopf algebra becomes the group algebra of a lattice after base
change to `E`.

Blueprint: tori.torus_definition
-/
def IsTorusAlgebra (A : Type u) [CommRing A] [HopfAlgebra k A] : Prop :=
  ∃ (M : Type u) (_ : AddCommGroup M) (_ : Module.Free ℤ M)
    (_ : Module.Finite ℤ M),
    Nonempty ((E ⊗[k] A) ≃ₐc[E] AddMonoidAlgebra E M)

/-- **Split torus, algebra form**: the coordinate Hopf algebra is the
group algebra of a lattice already over `k` — no base change, no
Galois twisting.

Blueprint: tori.split_torus
-/
def IsSplitTorusAlgebra (A : Type u) [CommRing A] [HopfAlgebra k A] : Prop :=
  ∃ (M : Type u) (_ : AddCommGroup M) (_ : Module.Free ℤ M)
    (_ : Module.Finite ℤ M),
    Nonempty (A ≃ₐc[k] AddMonoidAlgebra k M)

/-- **Diagonalizable coordinate algebra**: isomorphic to the group
algebra of some abelian group (not necessarily free — `μ_n` factors
allowed; compare `tori.multiplicative_type_characterization`). -/
def IsDiagonalizableAlgebra (A : Type u) [CommRing A] [HopfAlgebra k A] : Prop :=
  ∃ (M : Type u) (_ : AddCommGroup M),
    Nonempty (A ≃ₐc[k] AddMonoidAlgebra k M)

/-- The group algebra of a lattice is a torus algebra — the split
case (statement; proof: M4, base change of group algebras).

Blueprint: tori.split_torus
-/
theorem isTorusAlgebra_addMonoidAlgebra
    (M : Type u) [AddCommGroup M] [Module.Free ℤ M] [Module.Finite ℤ M] :
    IsTorusAlgebra k E (AddMonoidAlgebra k M) := by
  sorry

/-- A split torus algebra is a torus algebra (statement; proof: M4 —
base change the witnessing isomorphism).

Blueprint: tori.split_torus
-/
theorem IsSplitTorusAlgebra.isTorusAlgebra
    {A : Type u} [CommRing A] [HopfAlgebra k A]
    (h : IsSplitTorusAlgebra k A) : IsTorusAlgebra k E A := by
  sorry

/- The twisted group algebra of a `Gal(E/k)`-lattice is a torus
algebra. BLOCKED (not even statable yet): requires the
`HopfAlgebra k (twistedGroupAlgebra k E M σ)` instance from the
descent of the comultiplication — plan G0.C M3. Recorded here so the
gap is visible at the definition site. -/

end Langlands.Tori
