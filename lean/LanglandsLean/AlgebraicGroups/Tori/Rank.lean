import LanglandsLean.AlgebraicGroups.Tori.Duality
import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.Dimension.Finrank

/-!
# Rank and split rank of a torus (plan G0.C M5)

`tori.split_rank`: the **rank** of a torus is the `ℤ`-rank of its
character lattice; the **split rank** (`k`-rank) is the rank of the
Galois invariants. The KB node proves the invariant-rank formula
agrees with the cocharacter-side one (`rk X_*(T)^Θ`) and with the
rank of the maximal split subtorus; the Lean layer transcribes the
character-side formula and states the comparisons.

Statements tagged "proof: M5/M6" are `sorry`; each carries its route.
-/

open scoped TensorProduct

namespace Langlands.Tori


variable (k E : Type*) [Field k] [Field E] [Algebra k E]
variable (A : Type*) [CommRing A] [HopfAlgebra k A]

/-- **The rank of a torus**: the `ℤ`-rank of its character lattice.

Blueprint: tori.split_rank
-/
noncomputable def torusRank : ℕ :=
  Module.finrank ℤ (CharLattice E (E ⊗[k] A))

/-- **The split rank** (`k`-rank) of a torus: the rank of the Galois
invariants of the character lattice. The KB node proves this equals
the rank of the maximal split subtorus and the rank of `X_*(T)^Θ`
(the two invariant-rank formulas agree by the averaging argument
over `ℚ`).

Blueprint: tori.split_rank
-/
noncomputable def torusSplitRank : ℕ :=
  Module.finrank ℤ (charRep k E A).invariants

/-- Split rank is at most rank.

Blueprint: tori.split_rank
-/
theorem torusSplitRank_le_torusRank [IsTorusAlgebra k E A] :
    torusSplitRank k E A ≤ torusRank k E A :=
  Submodule.finrank_le _

/-- A torus is split iff its split rank equals its rank (statement;
proof: M6 — finite-order actions with full-rank invariants are
trivial).

Blueprint: tori.split_rank
-/
theorem torusSplitRank_eq_torusRank_iff
    [FiniteDimensional k E] [IsGalois k E] [IsTorusAlgebra k E A] :
    torusSplitRank k E A = torusRank k E A ↔ IsSplitTorusAlgebra k A := by
  sorry

/-- A torus is anisotropic iff its split rank is zero (statement;
proof: M6 — the KB equivalence `X_*(T)^Θ = 0 ↔ X^*(T)^Θ = 0` by the
averaging argument).

Blueprint: tori.split_rank, tori.anisotropic_torus
-/
theorem torusSplitRank_eq_zero_iff
    [FiniteDimensional k E] [IsGalois k E] [IsTorusAlgebra k E A] :
    torusSplitRank k E A = 0 ↔ IsAnisotropicAlgebra k E A := by
  sorry

end Langlands.Tori
