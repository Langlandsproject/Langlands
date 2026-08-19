import LanglandsLean.AlgebraicGroups.Tori.Torus
import LanglandsLean.AlgebraicGroups.Tori.CharacterGroup

/-!
# Cocharacters and the character–cocharacter duality (plan G0.C M5)

* `CocharLattice k E A` — the **coordinate presentation** of the
  cocharacter lattice `X_*(T_E)`: Hopf-algebra homomorphisms
  `O(T_E) → O(𝔾ₘ) = E[T;T⁻¹]` with the convolution group structure,
  spelled with Mathlib names only (`WithConv`; under `Spec`,
  pointwise multiplication —
  `tori.convolution_is_pointwise_multiplication`). The definition of
  a cocharacter is `CocharacterGroup` (a homomorphism of algebraic
  groups, `CharacterGroup.lean`); the lattice structure of `X_*` is
  *derived*, through the perfect pairing — never the dual of `X^*`
  by definition.
* `charPairing` — the pairing `⟨χ, λ⟩ : X^* × X_* → ℤ`: the
  composite `χ ∘ λ` is an endomorphism `z ↦ zⁿ` of `𝔾ₘ`, extracted
  by group-like rigidity. Perfectness (`charPairing_perfect`) and
  nondegeneracy are the duality statements of
  `tori.character_and_cocharacter_lattices`.
* `IsGalFixedCochar`, `IsAnisotropicAlgebra` — cocharacters defined
  over `k`, and anisotropy as the KB's working definition
  `X_*(T)^Θ = 0` (`tori.anisotropic_torus`).
* `IsTorusAlgebra.isCocomm` — tori are commutative group schemes, so
  their coordinate algebras are cocommutative after base change;
  this is what makes the cocharacters a convolution group.

Statements tagged "proof: M5" are `sorry`; each carries its route.
-/

open scoped TensorProduct
open Bialgebra Coalgebra HopfAlgebra WithConv

namespace Langlands.Tori


variable (k E : Type*) [Field k] [Field E] [Algebra k E]
variable (A : Type*) [CommRing A] [HopfAlgebra k A]

/-- Computation of the character lattice from a splitting
isomorphism: `X^*` of a torus split as `E[M]` is `M`, via group-like
rigidity (`diagGroupLikeEquiv`) transported along the isomorphism. -/
theorem nonempty_charLattice_addEquiv (M : Type*) [AddCommGroup M]
    (e : (E ⊗[k] A) ≃ₐc[E] AddMonoidAlgebra E M) :
    Nonempty (CharLattice E (E ⊗[k] A) ≃+ M) :=
  ⟨(MulEquiv.toAdditive
      ((groupLikeCongr e).trans (diagGroupLikeEquiv E M).symm)).trans
    (AddEquiv.additiveMultiplicative M)⟩

/-- A torus algebra is cocommutative after base change — tori are
commutative group schemes (statement; proof: M5, transport along
`BialgEquiv.ofBijective (charLift …)` from the group algebra,
whose cocommutativity is Mathlib's `MonoidAlgebra` instance). -/
theorem IsTorusAlgebra.isCocomm [IsTorusAlgebra k E A] :
    Coalgebra.IsCocomm E (E ⊗[k] A) := by
  sorry

/-! ### The cocharacter lattice and the pairing -/

/-- **The cocharacter lattice** `X_*(T_E)` in its faithful form:
Hopf-algebra homomorphisms `O(T_E) → O(𝔾ₘ)`, i.e. cocharacters
`𝔾ₘ → T_E`, with the convolution group structure.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev CocharLattice := WithConv ((E ⊗[k] A) →ₐc[E] LaurentPolynomial E)

/-- **The character–cocharacter pairing** `⟨χ, λ⟩`: composing a
cocharacter with a character gives an endomorphism of `𝔾ₘ`, i.e. an
integer — extracted by group-like rigidity (`diagGroupLikeEquiv`):
`λ` maps the group-like `χ` to the group-like `e^{⟨χ,λ⟩}` of `E[ℤ]`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def charPairing
    (x : CharLattice E (E ⊗[k] A)) (l : CocharLattice k E A) : ℤ :=
  Multiplicative.toAdd <|
    (diagGroupLikeEquiv E ℤ).symm
      ⟨l.ofConv x.toMul.val, x.toMul.isGroupLikeElem_val.map l.ofConv⟩

/-- Additivity of the pairing in the character (statement;
proof: M5 — `l.ofConv` is an algebra homomorphism and
`diagGroupLikeEquiv` is multiplicative). -/
theorem charPairing_add_left (x y : CharLattice E (E ⊗[k] A))
    (l : CocharLattice k E A) :
    charPairing k E A (x + y) l =
      charPairing k E A x l + charPairing k E A y l := by
  sorry

/-- Additivity of the pairing in the cocharacter (statement;
proof: M5 — convolution evaluated at a group-like is pointwise
multiplication). The cocommutativity hypothesis makes the
convolution product exist; every torus algebra satisfies it
(`IsTorusAlgebra.isCocomm`). -/
theorem charPairing_mul_right [Coalgebra.IsCocomm E (E ⊗[k] A)]
    (x : CharLattice E (E ⊗[k] A))
    (l m : CocharLattice k E A) :
    charPairing k E A x (l * m) =
      charPairing k E A x l + charPairing k E A x m := by
  sorry

/-- **Perfectness of the pairing**, cocharacter side: every additive
functional on the character lattice is pairing against a unique
cocharacter — `X_*(T) ≅ Hom(X^*(T), ℤ)` (statement; proof: M5 via
`nonempty_charLattice_addEquiv` and `diagCocharEquiv` on the split
side).

Blueprint: tori.character_and_cocharacter_lattices
-/
theorem charPairing_perfect [IsTorusAlgebra k E A]
    (f : CharLattice E (E ⊗[k] A) →+ ℤ) :
    ∃! l : CocharLattice k E A,
      ∀ x : CharLattice E (E ⊗[k] A),
        charPairing k E A x l = f x := by
  sorry

/-- Nondegeneracy of the pairing, character side (statement;
proof: M5). -/
theorem charPairing_left_injective [IsTorusAlgebra k E A]
    {x y : CharLattice E (E ⊗[k] A)}
    (h : ∀ l, charPairing k E A x l = charPairing k E A y l) : x = y := by
  sorry

/-! ### Galois-fixed cocharacters and anisotropy -/

/-- A cocharacter is **Galois-fixed** if it commutes with the
semilinear Galois actions on source and target: `λ ∘ (γ ⊗ 1) =
γ_* ∘ λ`, where `γ_*` is the coefficientwise action on
`O(𝔾ₘ) = E[ℤ]`. These are the cocharacters defined over `k`. -/
def IsGalFixedCochar (l : CocharLattice k E A) : Prop :=
  ∀ (γ : E ≃ₐ[k] E) (x : E ⊗[k] A),
    l.ofConv (galAlgAut k E A γ x) =
      AddMonoidAlgebra.mapAlgEquiv k ℤ γ (l.ofConv x)

/-- **Anisotropy** (working definition of the KB:
`X_*(T)^Θ = 0`): the only Galois-fixed cocharacter is the trivial
one (the convolution unit `η ∘ ε`, i.e. the constant cocharacter).

Blueprint: tori.anisotropic_torus
-/
def IsAnisotropicAlgebra : Prop :=
  ∀ l : CocharLattice k E A, IsGalFixedCochar k E A l → l = 1

end Langlands.Tori
