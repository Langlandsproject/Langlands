import LanglandsLean.AlgebraicGeometry.DiagGroup
import LanglandsLean.AlgebraicGeometry.HopfSpecFunctor
import LanglandsLean.AlgebraicGeometry.Gm
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

* `WithConv (LaurentPolynomial R →ₐc[R] A) := WithConv (R[ℤ] →ₐc[R] A)`,
* `WithConv (A →ₐc[R] LaurentPolynomial R) := WithConv (A →ₐc[R] R[ℤ])`,

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

## Knowledge base

`tori.character_and_cocharacter_lattices`,
`reductive_groups.diagonalizable_groups_antiequivalence`.
-/

open Bialgebra Coalgebra HopfAlgebra WithConv
open AlgebraicGeometry CategoryTheory Opposite
open Langlands.AlgebraicGeometry
open Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

namespace Langlands.Tori

universe u v

variable (R : Type*) [CommRing R]


/-! ### The definition: characters are homomorphisms of algebraic groups

`X^*(G) = Hom_grp(G, 𝔾ₘ)` and `X_*(G) = Hom_grp(𝔾ₘ, G)` — morphisms
in the category `Grp (Over (Spec R))` of algebraic groups
(`affine_group_schemes.group_scheme_homomorphism`: group-scheme
homomorphisms *are* the categorical homs), into/out of the key
construction `multiplicativeGroup` (`AlgebraicGeometry/Gm.lean`).
Nothing is re-encoded and nothing is re-defined here. -/

section SchemeLevel

variable (R : CommRingCat.{u})

/-- **The character group** `X^*(G) := Hom_grp(G, 𝔾ₘ)`: morphisms
of algebraic groups into the multiplicative group — the textbook
definition, verbatim, with the algebraic group `G` as the subject
and `𝔾ₘ R` the algebraic-group level of the key construction.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def CharacterGroup
    (G : Grp (Over (Scheme.Spec.obj (op R)))) :=
  G ⟶ 𝔾ₘ R

/-- **The cocharacter group** `X_*(G) := Hom_grp(𝔾ₘ, G)` —
symmetric to `CharacterGroup`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def CocharacterGroup
    (G : Grp (Over (Scheme.Spec.obj (op R)))) :=
  𝔾ₘ R ⟶ G

/-- **Bridge, stage 1** (statement; proof: M0 pass): `hopfSpec` is
fully faithful — algebraic-group homs between spectra correspond to
group-object morphisms on the algebra side.

Blueprint: affine_group_schemes.hopf_spec_fully_faithful
-/
theorem hopfSpec_map_bijective
    (A B : Grp ((CommAlgCat R)ᵒᵖ)) :
    Function.Bijective
      (fun f : A ⟶ B => (Langlands.AlgebraicGeometry.hopfSpec R).map f) := by
  sorry

/-- **Scheme-level Cartier duality for `D(M)`** (statement; proof: M0
pass, via the two bridge stages): algebraic-group homomorphisms
`D(M) → 𝔾ₘ` correspond to lattice elements.

Blueprint: tori.characters_as_group_like_elements
-/
theorem characterGroup_diag_equiv (M : Type u) [AddCommGroup M]
    [IsDomain R] :
    Nonempty (CharacterGroup R (Grp.mk (diagGroupOver R M)) ≃ Multiplicative M) := by
  sorry

end SchemeLevel

variable (R : Type*) [CommRing R]

/-! ### The coordinate presentation (working form) -/



variable (M N : Type*) [AddCommGroup M] [AddCommGroup N]

/-- `zmultiplesHom` upgraded to an additive equivalence
`M ≃+ (ℤ →+ M)`, `m ↦ (n ↦ n • m)`. -/
noncomputable def zmultiplesAddEquiv : M ≃+ (ℤ →+ M) :=
  { zmultiplesHom M with
    map_add' := fun x y => by
      ext n
      simp [zsmul_add] }

/-! ### Cartier duality for split tori (T1a), over a domain -/

section Domain

variable [IsDomain R]

/-- **Cartier duality, cocharacter level**: the cocharacters of
`D(M)` form the dual lattice `Hom(M, ℤ)`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def diagCocharEquiv :
    (M →+ ℤ) ≃ WithConv (AddMonoidAlgebra R M →ₐc[R] LaurentPolynomial R) :=
  (AddMonoidAlgebra.mapDomainBialgHomEquiv).trans (WithConv.equiv _).symm

/-! ### The computed description: characters as group-like elements

The knowledge base records (as a theorem, not a definition) that
characters of `Spec A` correspond to group-like elements of `A`. For
`A = R[M]` over a domain, the group-like elements are exactly the
lattice, which combined with `diagCharEquiv` is that correspondence
in the split case. The bridge for general `A` is plan G0.C M5. -/

/-- The canonical map from the lattice to the group-like elements of
the group algebra: `m ↦ e^m`. -/
@[simps]
noncomputable def groupLikeSingle [Nontrivial R] :
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
exactly the lattice elements `e^m`.

Blueprint: tori.character_and_cocharacter_lattices, tori.characters_as_group_like_elements
-/
noncomputable def diagGroupLikeEquiv :
    Multiplicative M ≃* GroupLike R (AddMonoidAlgebra R M) :=
  MulEquiv.ofBijective (groupLikeSingle R M) <| by
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


end Domain

/-! ### Inversion of characters via the antipode (statements)

The convolution `CommMonoid` on the coordinate characters is Mathlib's; the
group law needs inversion by the antipode. Definitions are given
here; the group axioms are the M0 proof pass. -/

section Inversion

variable {R}

/-- The antipode of `O(𝔾ₘ) = R[ℤ]` as a Hopf-algebra homomorphism:
induced by negation on the exponent lattice. -/
noncomputable def gmAntipodeBialgHom :
    (LaurentPolynomial R) →ₐc[R] (LaurentPolynomial R) :=
  AddMonoidAlgebra.mapDomainBialgHom R (AddMonoidHom.mk' Neg.neg neg_add)

/-- Inversion of a character: precompose with the antipode of `𝔾ₘ`.
Under `Spec`, this is `χ ↦ χ⁻¹` pointwise. -/
noncomputable instance (A : Type*) [CommSemiring A] [Bialgebra R A] :
    Inv (WithConv (LaurentPolynomial R →ₐc[R] A)) :=
  ⟨fun φ => toConv (φ.ofConv.comp gmAntipodeBialgHom)⟩

/-- The repo's `𝔾ₘ`-antipode agrees with Mathlib's antipode of the
group algebra, as algebra maps. -/
lemma gmAntipodeBialgHom_toAlgHom :
    (gmAntipodeBialgHom (R := R)).toAlgHom =
      HopfAlgebra.antipodeAlgHom R (LaurentPolynomial R) := by
  refine AddMonoidAlgebra.algHom_ext (fun n => ?_) (Subsingleton.elim _ _)
  show AddMonoidAlgebra.mapDomainBialgHom R (AddMonoidHom.mk' Neg.neg neg_add)
      (AddMonoidAlgebra.single n (1 : R)) =
    HopfAlgebra.antipode R (AddMonoidAlgebra.single n (1 : R))
  rw [AddMonoidAlgebra.antipode_single]
  show AddMonoidAlgebra.mapDomain (Neg.neg : ℤ → ℤ)
      (AddMonoidAlgebra.single n (1 : R)) =
    AddMonoidAlgebra.single (-n) (1 : R)
  rw [AddMonoidAlgebra.mapDomain_single]

/-- The group axiom for characters, by injective transfer along
`toAlgHom` into Mathlib's convolution group of algebra
homomorphisms. -/
theorem characterGroup_inv_mul_cancel
    (A : Type*) [CommSemiring A] [Bialgebra R A]
    (φ : WithConv (LaurentPolynomial R →ₐc[R] A)) : φ⁻¹ * φ = 1 := by
  have hΨ : Function.Injective
      (fun f : WithConv (LaurentPolynomial R →ₐc[R] A) => toConv f.ofConv.toAlgHom) := by
    intro f g h
    have h' : f.ofConv.toAlgHom = g.ofConv.toAlgHom :=
      WithConv.toConv_injective h
    refine WithConv.ofConv_injective (BialgHom.ext fun x => ?_)
    exact DFunLike.congr_fun h' x
  apply hΨ
  show toConv ((φ⁻¹ * φ).ofConv.toAlgHom) = toConv ((1 : WithConv (LaurentPolynomial R →ₐc[R] A)).ofConv.toAlgHom)
  rw [BialgHom.toAlgHom_convMul, BialgHom.toAlgHom_convOne]
  have hinv : toConv ((φ⁻¹ : WithConv (LaurentPolynomial R →ₐc[R] A)).ofConv.toAlgHom) =
      (toConv φ.ofConv.toAlgHom)⁻¹ := by
    show toConv ((φ.ofConv.comp gmAntipodeBialgHom).toAlgHom) = _
    have : (φ.ofConv.comp gmAntipodeBialgHom).toAlgHom =
        φ.ofConv.toAlgHom.comp (HopfAlgebra.antipodeAlgHom R _) := by
      rw [← gmAntipodeBialgHom_toAlgHom]; rfl
    rw [this]
    rfl
  rw [hinv, inv_mul_cancel]

/-- **The character group is a group**: convolution product, inverse
by the antipode of `𝔾ₘ` (`characterGroup_inv_mul_cancel` carries the
knowledge-base link). -/
noncomputable instance (A : Type*) [CommSemiring A] [Bialgebra R A] :
    CommGroup (WithConv (LaurentPolynomial R →ₐc[R] A)) where
  __ := (inferInstance : CommMonoid (WithConv (LaurentPolynomial R →ₐc[R] A)))
  inv := Inv.inv
  inv_mul_cancel := characterGroup_inv_mul_cancel A

/-- Convolution of Hopf-algebra homomorphisms, evaluated at a
group-like element, is pointwise multiplication — the Lean form of
the identification of the convolution product with pointwise
multiplication of characters.

Blueprint: tori.convolution_is_pointwise_multiplication
-/
theorem convMul_apply_of_isGroupLikeElem
    {C A : Type*} [Semiring C] [CommSemiring A] [Bialgebra R C]
    [Bialgebra R A] [Coalgebra.IsCocomm R C]
    (f g : WithConv (C →ₐc[R] A)) {c : C} (hc : IsGroupLikeElem R c) :
    (f * g).ofConv c = f.ofConv c * g.ofConv c := by
  rw [BialgHom.convMul_def]
  show Bialgebra.mulBialgHom R A
      ((Bialgebra.TensorProduct.map f.ofConv g.ofConv) (Coalgebra.comul c)) = _
  rw [hc.comul_eq_tmul_self]
  simp [Bialgebra.TensorProduct.map_tmul]

/-- Composition with a Hopf-algebra isomorphism of coordinate rings
is an isomorphism of character groups — functoriality of `X^*` in
isomorphisms. -/
noncomputable def charGroupCongr {A₁ : Type*} {A₂ : Type*}
    [CommSemiring A₁] [Bialgebra R A₁] [CommSemiring A₂] [Bialgebra R A₂]
    (e : A₁ ≃ₐc[R] A₂) : WithConv (LaurentPolynomial R →ₐc[R] A₁) ≃* WithConv (LaurentPolynomial R →ₐc[R] A₂) where
  toFun χ := toConv ((e : A₁ →ₐc[R] A₂).comp χ.ofConv)
  invFun χ := toConv ((e.symm : A₂ →ₐc[R] A₁).comp χ.ofConv)
  left_inv χ := by
    refine WithConv.ofConv_injective (BialgHom.ext fun x => ?_)
    simp
  right_inv χ := by
    refine WithConv.ofConv_injective (BialgHom.ext fun x => ?_)
    simp
  map_mul' χ ψ := by
    refine WithConv.ofConv_injective (BialgHom.ext fun x => ?_)
    sorry -- proof: M5 (post-composition distributes over convolution)

/-- The comultiplication commutes with the antipode on a
cocommutative Hopf algebra (statement; proof: M0 pass — this is the
lemma Mathlib lacks; `counit_antipode` is the counit-side
counterpart). -/
theorem comul_comp_antipode
    (A : Type*) [CommRing A] [HopfAlgebra R A] [Coalgebra.IsCocomm R A] :
    (Coalgebra.comul (R := R) (A := A)) ∘ₗ (HopfAlgebra.antipode R) =
      (TensorProduct.map (HopfAlgebra.antipode R) (HopfAlgebra.antipode R))
        ∘ₗ Coalgebra.comul := by
  sorry

end Inversion

section Bridge

variable (R : CommRingCat.{u})

/-- **The bridge** (statement; proof: M0 pass, from
`hopfSpec_map_bijective` and group-like rigidity): characters of
`Spec A` are the group-like elements of `A` — the license for the
working carrier of the lattice layer
(`docs/04-design-ledger.md`, X^* stack).

Blueprint: tori.characters_as_group_like_elements
-/
theorem nonempty_characterGroup_equiv_groupLike
    (A : Type u) [CommRing A] [HopfAlgebra R A] :
    Nonempty (CharacterGroup R (Grp.mk (specObjOver R A)) ≃ GroupLike R A) := by
  sorry

end Bridge

end Langlands.Tori
