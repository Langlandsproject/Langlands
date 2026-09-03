import LanglandsLean.AlgebraicGroups.Forms.GaloisDescent

/-!
# Galois descent for vector spaces: statement layer (G0.C M2)

Statement-first skeleton kept separate from the proved theorems of
`GaloisDescent.lean` so that sorry-tracking stays per-file honest.
-/

open scoped TensorProduct

namespace Langlands.Forms

universe u v

variable {k E : Type u} [Field k] [Field E] [Algebra k E] [FiniteDimensional k E]

/-! ### The descent isomorphism (statements; proofs: G0.C M2)

The spanning half is proved above; the independence half and the
packaged base-change isomorphism are stated here. -/

section DescentStatements

variable {V : Type v} [AddCommGroup V] [Module E V]
variable [Module k V] [IsScalarTower k E V]
variable (ρ : (E ≃ₐ[k] E) → V ≃+ V)

/-- The fixed points of a semilinear action, as a `k`-submodule.
The `k`-scalar closure uses that the action is semilinear and that
`Gal(E/k)` fixes `k`. -/
def fixedSubmodule
    (hsemi : ∀ γ (c : E) v, ρ γ (c • v) = γ c • ρ γ v) :
    Submodule k V where
  carrier := {v | ∀ γ, ρ γ v = v}
  add_mem' hu hv γ := by rw [map_add, hu γ, hv γ]
  zero_mem' γ := map_zero _
  smul_mem' c v hv γ := by
    rw [← algebraMap_smul E c v, hsemi, AlgEquiv.commutes, hv γ]

/-- The canonical base-change map `E ⊗ₖ V^Γ → V`,
`c ⊗ v ↦ c • v`. -/
noncomputable def descentMap
    (hsemi : ∀ γ (c : E) v, ρ γ (c • v) = γ c • ρ γ v) :
    E ⊗[k] (fixedSubmodule (k := k) (E := E) ρ hsemi) →ₗ[E] V :=
  LinearMap.liftBaseChange E
    ((fixedSubmodule (k := k) (E := E) ρ hsemi).subtype)

/-- **Independence half of Galois descent** (statement; proof: M2):
`k`-linearly independent fixed vectors remain `E`-linearly
independent. Unlike the spanning half, this uses that `E/k` is
Galois (via `E^Γ = k`).

Blueprint: forms.galois_descent_for_vector_spaces
-/
theorem linearIndependent_fixedPoints
    [IsGalois k E] [FiniteDimensional k E]
    (hone : ∀ v, ρ 1 v = v)
    (hmul : ∀ γ δ v, ρ (γ * δ) v = ρ γ (ρ δ v))
    (hsemi : ∀ γ (c : E) v, ρ γ (c • v) = γ c • ρ γ v)
    {ι : Type*} (v : ι → V) (hv : ∀ i γ, ρ γ (v i) = v i)
    (h : LinearIndependent k v) : LinearIndependent E v := by
  sorry

/-- **Galois descent for vector spaces, packaged** (statement;
proof: M2): the base-change map from the fixed points is an
isomorphism — surjectivity is the spanning half
(`span_fixedPoints_eq_top`), injectivity the independence half.

Blueprint: forms.galois_descent_for_vector_spaces
-/
theorem descentMap_bijective
    [IsGalois k E] [FiniteDimensional k E]
    (hone : ∀ v, ρ 1 v = v)
    (hmul : ∀ γ δ v, ρ (γ * δ) v = ρ γ (ρ δ v))
    (hsemi : ∀ γ (c : E) v, ρ γ (c • v) = γ c • ρ γ v) :
    Function.Bijective (descentMap (k := k) (E := E) ρ hsemi) := by
  sorry

end DescentStatements

end Langlands.Forms
