import LanglandsLean.AlgebraicGroups.Tori.DiagGroup
import Mathlib.RingTheory.HopfAlgebra.GroupLike
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.RingTheory.HopfAlgebra.Convolution

/-!
# Character and cocharacter groups; Cartier duality for split tori

## The definitions, faithfully

For an affine group scheme `G = Spec A` over `R`, the knowledge base
(node `tori.character_and_cocharacter_lattices`) defines

* `X^*(G) = Hom_grp(G, 𝔾ₘ)` — characters,
* `X_*(G) = Hom_grp(𝔾ₘ, G)` — cocharacters,

with the group law of pointwise multiplication in `𝔾ₘ`. The faithful
contravariant translation to coordinate Hopf algebras, with
`O(𝔾ₘ) = R[ℤ]`:

* `characterGroup R A := WithConv (R[ℤ] →ₐc[R] A)`,
* `cocharacterGroup R A := WithConv (A →ₐc[R] R[ℤ])`,

where `WithConv` is Mathlib's carrier for "this hom-set with the
convolution product" — under `Spec`, convolution *is* pointwise
multiplication of characters. Computed descriptions (group-like
elements, lattice identifications) are **theorems below, never
definitions**.

## Conversion glossary

Every type wrapper in this file and its justification:

* `WithConv X` — the official Mathlib marker for the convolution
  monoid on a hom-set; part of the faithful statement of the group
  law, not an encoding trick.
* `Multiplicative M` — the lattice is additive, characters multiply;
  Mathlib's canonical additive↔multiplicative bridge, used only in
  statements identifying a character group with a lattice.
* `Additive` / `toAdd` / `ofAdd` — inverses of the above, confined to
  proof terms.

The convolution *group* structure (inversion via the antipode of
`𝔾ₘ`) is tracked as plan G0.C M5; the `CommMonoid` instance is
Mathlib's and suffices for every statement in this file.

## Blueprint

`tori.character_and_cocharacter_lattices`,
`reductive_groups.diagonalizable_groups_antiequivalence`.
-/

open Bialgebra Coalgebra HopfAlgebra WithConv

namespace Langlands.Tori

universe u v

variable (R : Type u) [CommRing R]

/-! ### The faithful definitions -/

/-- **The character group** `X^*(Spec A) = Hom_grp(Spec A, 𝔾ₘ)`:
Hopf-algebra homomorphisms `O(𝔾ₘ) = R[ℤ] → A` with the convolution
product — under `Spec`, pointwise multiplication of characters.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev characterGroup (A : Type v) [CommSemiring A] [Bialgebra R A] : Type _ :=
  WithConv ((AddMonoidAlgebra R ℤ) →ₐc[R] A)

/-- **The cocharacter group** `X_*(Spec A) = Hom_grp(𝔾ₘ, Spec A)`:
Hopf-algebra homomorphisms `A → R[ℤ]` with convolution. The
convolution structure requires `A` cocommutative — faithfully so:
`X_*(G)` is a group precisely because `G` is commutative.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev cocharacterGroup (A : Type v) [Semiring A] [Bialgebra R A] : Type _ :=
  WithConv (A →ₐc[R] (AddMonoidAlgebra R ℤ))

variable (M N : Type v) [AddCommGroup M] [AddCommGroup N]

/-- `zmultiplesHom` upgraded to an additive equivalence
`M ≃+ (ℤ →+ M)`, `m ↦ (n ↦ n • m)`. -/
noncomputable def zmultiplesAddEquiv : M ≃+ (ℤ →+ M) :=
  { zmultiplesHom M with
    map_add' := fun x y => by
      ext n
      simp [zsmul_add] }

/-! ### Cartier duality for split tori (T1a), over a domain -/

variable [IsDomain R]

/-- **Cartier duality, object level** (split case): the character
group of `D(M)` is exactly the lattice `M`. The character attached to
`m : M` is the Hopf map `R[ℤ] → R[M]` induced by `1 ↦ m` on
exponents; the identification of lattice addition with convolution is
Mathlib's `mapDomainBialgHomAddEquiv`.

Blueprint: tori.character_and_cocharacter_lattices, reductive_groups.diagonalizable_groups_antiequivalence, tori.f_tori_galois_module_classification
-/
noncomputable def diagCharEquiv :
    Multiplicative M ≃* characterGroup R (AddMonoidAlgebra R M) :=
  AddEquiv.toMultiplicativeLeft
    ((zmultiplesAddEquiv M).trans
      (AddMonoidAlgebra.mapDomainBialgHomAddEquiv (R := R)))

/-- **Cartier duality, hom level**: Hopf-algebra homomorphisms
`R[M] → R[N]` correspond to lattice homomorphisms `M → N` — full
faithfulness of `D` on the split category.

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence
-/
noncomputable def diagHomEquiv :
    (M →+ N) ≃ (AddMonoidAlgebra R M →ₐc[R] AddMonoidAlgebra R N) :=
  AddMonoidAlgebra.mapDomainBialgHomEquiv

/-- **Cartier duality, cocharacter level**: the cocharacters of
`D(M)` form the dual lattice `Hom(M, ℤ)`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def diagCocharEquiv :
    (M →+ ℤ) ≃ cocharacterGroup R (AddMonoidAlgebra R M) :=
  (AddMonoidAlgebra.mapDomainBialgHomEquiv).trans (WithConv.equiv _).symm

/-- **Split classification theorem** (isomorphism level of Cartier
duality): two split diagonalizable groups are isomorphic over a
domain iff their lattices are.

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence, tori.f_tori_galois_module_classification
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

/-! ### The computed description: characters as group-like elements

The knowledge base records (as a theorem, not a definition) that
characters of `Spec A` correspond to group-like elements of `A`. For
`A = R[M]` over a domain, the group-like elements are exactly the
lattice, which combined with `diagCharEquiv` is that correspondence
in the split case. The bridge for general `A` is plan G0.C M5. -/

/-- The canonical map from the lattice to the group-like elements of
the group algebra: `m ↦ e^m`. -/
@[simps]
noncomputable def diagGroupLikeChar [Nontrivial R] :
    Multiplicative M →* GroupLike R (AddMonoidAlgebra R M) where
  toFun m :=
    ⟨AddMonoidAlgebra.single m.toAdd 1,
      AddMonoidAlgebra.isGroupLikeElem_single_one _⟩
  map_one' := by
    ext
    simp [AddMonoidAlgebra.one_def]
  map_mul' a b := by
    ext
    simp [AddMonoidAlgebra.single_mul_single]

/-- **Group-like rigidity** (computed description of the characters,
split case): over a domain, the group-like elements of `R[M]` are
exactly the lattice elements `e^m`. -/
noncomputable def diagGroupLikeEquiv :
    Multiplicative M ≃* GroupLike R (AddMonoidAlgebra R M) :=
  MulEquiv.ofBijective (diagGroupLikeChar R M) <| by
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

/-! ### Examples -/

section Examples

/-- Characters of `𝔾ₘ = D(ℤ)`: the lattice `ℤ`. -/
noncomputable example : Multiplicative ℤ ≃* characterGroup R (AddMonoidAlgebra R ℤ) :=
  diagCharEquiv R ℤ

/-- Endomorphisms of `𝔾ₘ` as a group scheme: `ℤ`, acting by
`t ↦ tⁿ`. -/
noncomputable example :
    (ℤ →+ ℤ) ≃ (AddMonoidAlgebra R ℤ →ₐc[R] AddMonoidAlgebra R ℤ) :=
  diagHomEquiv R ℤ ℤ

end Examples

end Langlands.Tori
