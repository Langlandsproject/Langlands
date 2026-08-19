import LanglandsLean.Tori.Diagonalizable
import Mathlib.RingTheory.HopfAlgebra.GroupLike
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra

/-!
# Character and cocharacter groups; Cartier duality for split tori

For an affine group scheme `G = Spec A` over `R` presented by its
coordinate Hopf algebra `A`, characters `G → 𝔾ₘ` correspond to
**group-like units** of `A`, and cocharacters `𝔾ₘ → G` to bialgebra
homomorphisms `A → R[ℤ]`. We take these algebraic descriptions as the
working definitions (the comparison with scheme-level group-object
homomorphisms through `hopfSpec` is deferred; see the TODO below).

The main content is **Cartier duality for split tori / diagonalizable
groups** (knowledge-base node
`reductive_structure.diagonalizable_groups_antiequivalence`, the split
half T1a of the classification of tori), stated over a domain `R` at
three levels:

* **objects** — `diagCharEquiv : Multiplicative M ≃* X^*(D(M))`:
  the characters of `D(M)` are exactly `M`;
* **homs** — `diagHomEquiv : (M →+ N) ≃ (R[M] →ₐc[R] R[N])`:
  the functor `D` is fully faithful (contravariance appears on the
  scheme side);
* **isos** — `diag_bialgEquiv_iff_addEquiv`:
  `D(M) ≅ D(N)` iff `M ≅ N`, the split classification theorem.

Together with `diagCocharEquiv : (M →+ ℤ) ≃ X_*(D(M))` these realise
the lattice dictionary of the knowledge-base node
`tori.character_and_cocharacter_lattices` in the split case.

## The general classification (statement target)

The classification theorem for `k`-tori — the anti-equivalence
`T ↦ X^*(T)` between `k`-tori and finite-rank torsion-free continuous
`Gal(k_s/k)`-lattices (knowledge-base node
`tori.f_tori_galois_module_classification`) — is T1a above composed
with Galois descent (T1b). Mathlib has no étale/Galois descent for
Hopf algebras yet; per the project decision we will build the needed
special case ourselves: for a finite Galois extension `E/k` and a
`Gal(E/k)`-lattice `M`, the fixed-point Hopf algebra
`(E[M])^{Gal(E/k)}` under the semilinear action. This is the next
module (`Tori/GaloisDescent.lean`, TODO); no general descent machinery
is required for the construction direction.

## Knowledge base

`tori.character_and_cocharacter_lattices`,
`reductive_structure.diagonalizable_groups_antiequivalence`,
`tori.split_torus`.
-/

open Bialgebra Coalgebra HopfAlgebra

namespace Langlands.Tori

universe u v

variable (R : Type u) [CommRing R]

/-! ### Definitions -/

/-- The **character group** `X^*(G)` of the affine group scheme
`G = Spec A`, presented by its coordinate Hopf algebra `A`: the
group-like elements of `A`. A character `G → 𝔾ₘ` corresponds to a
group-like unit of `A`; group-likes in a Hopf algebra are
automatically units, and Mathlib's `GroupLike R A` carries the
(commutative) group structure.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev characterGroup (A : Type v) [Ring A] [HopfAlgebra R A] : Type v :=
  GroupLike R A

/-- The **cocharacter homomorphisms** `X_*(G)` of `G = Spec A`:
bialgebra homomorphisms `A →ₐc[R] R[ℤ]` from the coordinate Hopf
algebra to the coordinate ring of `𝔾ₘ` (a cocharacter `𝔾ₘ → G`
corresponds contravariantly to such a map). The group structure (by
convolution) is transported from `M →+ ℤ` in the diagonalizable case
below.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev cocharacterHom (A : Type v) [Ring A] [HopfAlgebra R A] : Type _ :=
  A →ₐc[R] AddMonoidAlgebra R ℤ

variable (M N : Type v) [AddCommGroup M] [AddCommGroup N]

/-- The canonical character attached to a lattice element: `m : M`
gives the group-like element `e^m = single m 1` of `R[M]`, i.e. the
character of `D(M)` with weight `m`. -/
@[simps]
noncomputable def diagChar [Nontrivial R] :
    Multiplicative M →* characterGroup R (AddMonoidAlgebra R M) where
  toFun m :=
    ⟨AddMonoidAlgebra.single m.toAdd 1,
      AddMonoidAlgebra.isGroupLikeElem_single_one _⟩
  map_one' := by
    ext
    simp [AddMonoidAlgebra.one_def]
  map_mul' a b := by
    ext
    simp [AddMonoidAlgebra.single_mul_single]

/-! ### Cartier duality for split tori (T1a), over a domain -/

variable [IsDomain R]

/-- **Cartier duality, object level**: the character group of the
diagonalizable group `D(M)` is exactly `M`. Group-like elements of
`R[M]` over a domain are precisely the basis elements `e^m`.

Blueprint: tori.character_and_cocharacter_lattices, reductive_structure.diagonalizable_groups_antiequivalence, tori.f_tori_galois_module_classification
-/
noncomputable def diagCharEquiv :
    Multiplicative M ≃* characterGroup R (AddMonoidAlgebra R M) :=
  MulEquiv.ofBijective (diagChar R M) <| by
    constructor
    · intro a b hab
      have h2 : (AddMonoidAlgebra.single a.toAdd 1 : AddMonoidAlgebra R M)
          = AddMonoidAlgebra.single b.toAdd 1 := congrArg GroupLike.val hab
      exact Multiplicative.toAdd.injective
        (AddMonoidAlgebra.single_left_injective one_ne_zero h2)
    · rintro ⟨x, hx⟩
      obtain ⟨m, rfl⟩ :=
        AddMonoidAlgebra.isGroupLikeElem_iff_mem_range_single_one.mp hx
      exact ⟨Multiplicative.ofAdd m, rfl⟩

/-- **Cartier duality, hom level**: bialgebra homomorphisms
`R[M] → R[N]` correspond to additive homomorphisms `M → N`. This is
full faithfulness of `D` on the split category (contravariance
appears when passing to schemes).

Blueprint: reductive_structure.diagonalizable_groups_antiequivalence
-/
noncomputable def diagHomEquiv :
    (M →+ N) ≃ (AddMonoidAlgebra R M →ₐc[R] AddMonoidAlgebra R N) :=
  AddMonoidAlgebra.mapDomainBialgHomEquiv

/-- **Cartier duality, cocharacter level**: the cocharacters of
`D(M)` form the dual lattice `Hom(M, ℤ)`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def diagCocharEquiv :
    (M →+ ℤ) ≃ cocharacterHom R (AddMonoidAlgebra R M) :=
  AddMonoidAlgebra.mapDomainBialgHomEquiv

/-- **Split classification theorem** (iso level of Cartier duality):
two diagonalizable groups — in particular two split tori — are
isomorphic over a domain `R` if and only if their lattices are
isomorphic.

Blueprint: reductive_structure.diagonalizable_groups_antiequivalence, tori.f_tori_galois_module_classification
-/
theorem diag_bialgEquiv_iff_addEquiv :
    Nonempty (AddMonoidAlgebra R M ≃ₐc[R] AddMonoidAlgebra R N) ↔
      Nonempty (M ≃+ N) := by
  constructor
  · rintro ⟨φ⟩
    refine ⟨AddMonoidHom.toAddEquiv
      (AddMonoidAlgebra.mapDomainOfBialgHom
        (φ : AddMonoidAlgebra R M →ₐc[R] AddMonoidAlgebra R N))
      (AddMonoidAlgebra.mapDomainOfBialgHom
        (φ.symm : AddMonoidAlgebra R N →ₐc[R] AddMonoidAlgebra R M))
      ?_ ?_⟩
    · ext m
      refine AddMonoidAlgebra.single_left_injective (r := (1 : R))
        one_ne_zero ?_
      simp [AddMonoidAlgebra.single_mapDomainOfBialgHom]
    · ext n
      refine AddMonoidAlgebra.single_left_injective (r := (1 : R))
        one_ne_zero ?_
      simp [AddMonoidAlgebra.single_mapDomainOfBialgHom]
  · rintro ⟨e⟩
    exact ⟨AddMonoidAlgebra.domCongrBialgEquiv R R e⟩

section SmokeTests

/-- Characters of `𝔾ₘ = D(ℤ)`: the lattice `ℤ`. -/
noncomputable example : Multiplicative ℤ ≃* characterGroup R (AddMonoidAlgebra R ℤ) :=
  diagCharEquiv R ℤ

/-- Endomorphisms of `𝔾ₘ` as a group scheme: `ℤ`. -/
noncomputable example :
    (ℤ →+ ℤ) ≃ (AddMonoidAlgebra R ℤ →ₐc[R] AddMonoidAlgebra R ℤ) :=
  diagHomEquiv R ℤ ℤ

end SmokeTests

end Langlands.Tori
