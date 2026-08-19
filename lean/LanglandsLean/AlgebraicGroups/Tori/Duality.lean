import LanglandsLean.AlgebraicGroups.Tori.Torus
import LanglandsLean.AlgebraicGroups.Tori.CharacterGroup

/-!
# Cocharacters and the character–cocharacter duality (plan G0.C M5)

* `CocharLattice k E A` — the cocharacter lattice `X_*(T_E)` in its
  faithful form: Hopf-algebra homomorphisms `O(T_E) → O(𝔾ₘ)`, i.e.
  cocharacters `𝔾ₘ → T_E` (`CocharacterGroup E (E ⊗[k] A)`), with
  the convolution group structure (`WithConv`; under `Spec`,
  pointwise multiplication —
  `tori.convolution_is_pointwise_multiplication`). The lattice
  structure is *derived*, through the perfect pairing — the KB
  defines `X_*` as `Hom(𝔾ₘ, T_E)`, not as the dual of `X^*`.
* `charPairing` — the pairing `⟨χ, λ⟩ : X^* × X_* → ℤ`: the
  composite `χ ∘ λ` is an endomorphism `z ↦ zⁿ` of `𝔾ₘ`, extracted
  by Cartier duality for `𝔾ₘ`. Perfectness (`charPairing_perfect`) and
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
open Langlands.ReductiveGroups

namespace Langlands.Tori

universe u

variable (k E : Type u) [Field k] [Field E] [Algebra k E]
variable (A : Type u) [CommRing A] [HopfAlgebra k A]

/-- Computation of the character lattice from a splitting
isomorphism: `X^*` of a torus split as `E[M]` is `M`, by composing
with the isomorphism (`charGroupCongr`) and Cartier duality on the
split side (`diagCharEquiv`). -/
theorem nonempty_charLattice_addEquiv (M : Type u) [AddCommGroup M]
    (e : (E ⊗[k] A) ≃ₐc[E] AddMonoidAlgebra E M) :
    Nonempty (CharLattice E (E ⊗[k] A) ≃+ M) :=
  ⟨(MulEquiv.toAdditive
      ((charGroupCongr e).trans (diagCharEquiv E M).symm)).trans
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
abbrev CocharLattice : Type u := CocharacterGroup E (E ⊗[k] A)

/-- **The character–cocharacter pairing** `⟨χ, λ⟩`: the composite
`χ ∘ λ : 𝔾ₘ → 𝔾ₘ` is `z ↦ z^n` for a unique integer `n` — extracted
by Cartier duality for `𝔾ₘ` itself (`diagCharEquiv` at `M = ℤ`). On
coordinate rings the composite is `λ^* ∘ χ^* : O(𝔾ₘ) → O(𝔾ₘ)`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def charPairing
    (x : CharLattice E (E ⊗[k] A)) (l : CocharLattice k E A) : ℤ :=
  Multiplicative.toAdd <|
    (diagCharEquiv E ℤ).symm (toConv (l.ofConv.comp x.toMul.ofConv))

/-- Additivity of the pairing in the character (statement;
proof: M5 — precomposition with a fixed cocharacter is multiplicative
for convolution, and `diagCharEquiv` is multiplicative). -/
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
