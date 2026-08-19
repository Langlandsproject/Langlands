import LanglandsLean.AlgebraicGroups.Tori.TwistedGroupAlgebra
import Mathlib.RingTheory.Bialgebra.TensorProduct

/-!
# The torus predicates (statement layer)

This file is the definition layer for "torus" in the Lean library,
per plan G0.C (design decisions D-a algebra-first, D-b finite Galois
level): a **torus split by `E`** is presented by its coordinate Hopf
algebra `A` together with a Hopf-algebra identification of the base
change `E ⊗ₖ A` with the group algebra of a finite free lattice.

The knowledge-base definition (`tori.torus_definition`) is stated
over a separable closure; by `tori.splitting_field` it is equivalent
to being split by *some* finite Galois extension, which is the form
taken here with the extension as a parameter. The KB node recording
this finite-level equivalence as the working form arrives with plan
M1; until then these predicates deliberately carry **no** `lean:`
link from `tori.torus_definition` (linking rule: no special-case
witnesses).

Statements below marked "proof: M3/M4" are the statement-first
skeleton; no proofs are attempted here.
-/

open scoped TensorProduct

namespace Langlands.Tori

universe u

variable (k E : Type u) [Field k] [Field E] [Algebra k E]

/-- **Torus split by `E`, algebra form** (D-a, D-b): the coordinate
Hopf algebra becomes the group algebra of a finite free lattice after
base change to `E`. -/
def IsTorusAlgebra (A : Type u) [CommRing A] [HopfAlgebra k A] : Prop :=
  ∃ n : ℕ, Nonempty
    ((E ⊗[k] A) ≃ₐc[E] AddMonoidAlgebra E (Fin n → ℤ))

/-- **Diagonalizable coordinate algebra**: isomorphic to the group
algebra of some abelian group (not necessarily free — `μ_n` factors
allowed; compare `tori.multiplicative_type_characterization`). -/
def IsDiagonalizableAlgebra (A : Type u) [CommRing A] [HopfAlgebra k A] : Prop :=
  ∃ (M : Type u) (_ : AddCommGroup M),
    Nonempty (A ≃ₐc[k] AddMonoidAlgebra k M)

/-- The group algebra of a finite free lattice is a torus algebra —
the split case (statement; proof: M4, base change of group algebras).

Blueprint: tori.split_torus
-/
theorem isTorusAlgebra_groupAlgebra (n : ℕ) :
    IsTorusAlgebra k E (AddMonoidAlgebra k (Fin n → ℤ)) := by
  sorry

/- The twisted group algebra of a `Gal(E/k)`-lattice is a torus
algebra. BLOCKED (not even statable yet): requires the
`HopfAlgebra k (twistedGroupAlgebra k E M σ)` instance from the
descent of the comultiplication — plan G0.C M3. Recorded here so the
gap is visible at the definition site. -/

end Langlands.Tori
