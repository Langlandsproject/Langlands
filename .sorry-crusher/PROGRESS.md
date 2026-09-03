# Sorry-crusher: CharLattice.lean (session 1, 2026-08-19)

Target: `lean/LanglandsLean/AlgebraicGroups/Tori/CharLattice.lean`
Scope: the 16 M5-tagged sorries. OUT OF SCOPE (M6 tags): lines 181
(`torusSplitRank_eq_torusRank_iff`), 281 (`torusSplitRank_eq_zero_iff`),
332 (`existsUnique_bialgHom_of_equivariant`).
Ground truth at start: 19 `sorry` tokens (grep), 16 in scope.

## Mathlib state (survey done)

- `Bialgebra.TensorProduct.map (f : A →ₐc[S] C) (g : B →ₐc[R] D)` EXISTS
  → kills the charLatticeMap membership sorry by redefinition.
- `Algebra.TensorProduct.congr_refl / congr_trans / congr_symm` EXIST
  (RingTheory/TensorProduct/Maps.lean:638+) → charGalAct fields.
- `comul_eq_algHom_toLinearMap` (base-change comul) is `rfl`:
  comul_{E⊗A} = TTTC ∘ map comulE comulA. TTTC tmul lemmas exist.
- `Algebra.TensorProduct.lid : R ⊗[R] A ≃ₐ[R] A` (Maps.lean:252).
- NO `GroupLike.congr` in Mathlib → write helper `groupLikeCongr`.
- NO general `IsCocomm R (AddMonoidAlgebra R M)` (only A[X], A[ℤ]) →
  helper instance + transport along the splitting BialgEquiv via
  `CoalgHomClass.map_comp_comul` + comm naturality.
- `Module.Free.of_equiv'`, `Module.Finite.equiv`,
  `Submodule.finrank_le [Module.Finite]` exist.
- Repo assets: `diagGroupLikeEquiv` (proved), `diagCocharEquiv`
  (proved), `groupLikeSingle` (proved).

## Objectives (ordered)

E1. Helper `groupLikeCongr (e : A ≃ₐc[R] B) : GroupLike R A ≃* GroupLike R B`
    via `isGroupLikeElem_map_equiv` / `IsGroupLikeElem.map`.
E2. charGalAct.map_one'/map_mul' (105/107): congr_refl + congr_trans;
    galAlgAut is congr γ refl; Aut mult γ*δ = δ.trans γ — check direction.
E3. charRep.map_one'/map_mul' (118/120): LinearMap.ext transport of E2.
U1. nonempty_charLattice_mulEquiv (142): ⟨(groupLikeCongr e).trans
    (diagGroupLikeEquiv E M).symm⟩.
U2. charLattice_free (127) / charLattice_finite (133): U1 + toAdditive +
    AddEquiv.toIntLinearEquiv + Free.of_equiv' / Finite.equiv;
    hA supplies [Module.Free ℤ M] [Module.Finite ℤ M].
U3. torusSplitRank_le_torusRank (170): have := charLattice_finite;
    Submodule.finrank_le.
U4. charLatticeMap membership (298): redefine via
    Bialgebra.TensorProduct.map (BialgHom.id E E) f; membership :=
    x.2.map _; recheck map_one'/map_mul' still close.
U5. charLatticeMap_galAct (317): GroupLike ext + TensorProduct.induction_on
    (both sides k-linear, agree on pure tensors).
H1. isGroupLikeElem_galAlgAut (86) — THE key lemma. Route:
    Θ := TTTC.symm.trans (congr (Algebra.TensorProduct.lid E E) refl)
      : (E⊗A)⊗[E](E⊗A) ≃ₐ[E→k?] E⊗[k](A⊗[k]A)
    galSqAut γ := Θ.symm ∘ galAlgAut (A := A⊗A) γ ∘ Θ  (k-alg equiv)
    L1: comulAlgHom ∘ galAlgAut γ = galSqAut γ ∘ comulAlgHom
        (Algebra.TensorProduct.ext on e⊗1, 1⊗a; comul def is rfl-level)
    L2: galSqAut γ (u ⊗ₜ v) = galAlgAut γ u ⊗ₜ galAlgAut γ v
        (double TensorProduct.induction_on; pure case via TTTC/lid tmul)
    L3 (counit): counit ∘ galAlgAut γ = γ ∘ counit (ext).
    Main: comul((γ⊗1)x) = galSqAut(x⊗ₜx) = (γ⊗1)x ⊗ₜ (γ⊗1)x; counit via L3.
H2. IsTorusAlgebra.isCocomm (213): helper instance
    IsCocomm E (AddMonoidAlgebra E M) (basis computation on comul_single)
    + transport along e.symm via map_comp_comul + comm naturality.
H3. charPairing_mul_left (221): val_mul + map_mul + MulEquiv.symm map_mul
    + toAdd_mul.
H4. charPairing_mul_right (232): toAlgHom_convMul + convMul_apply (AlgHom
    level) + comul_eq_tmul_self of x.2 → (l*m) x = l x * m x.
H5. charPairing_left_injective (252) / charPairing_perfect (245):
    transport cochars along e (composition equiv) + diagCocharEquiv +
    pairing computation on the split side charPairing(single m, φ) = φ m.
    Hardest; attempt last; if >90min mark IN_PROGRESS with partials.

## Dead ends known

(none yet — first session)
