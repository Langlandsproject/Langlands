import LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup

/-!
# Trivial group scheme and base-change preservation

Phase A5 smoke tests for the Path 4 + Level 1 design.

## Main declarations

* `schemeOverSelf S` — every scheme is canonically over itself via the
  identity morphism.
* `trivialGrpObj S` — the trivial group object structure on
  `Scheme.asOver S S` (transported from the unit of the Cartesian
  monoidal structure on `Over S`).
* `instIsAlgebraicGroupTrivial S` — the trivial group scheme is an
  algebraic group, derived automatically from the aggregator forwarders.

## Base change

The end-of-file example confirms that base change of an
`IsAlgebraicGroup` instance is automatic — the `GrpObj` part comes from
`Scheme.GrpObjAsOverPullback`; the `IsAffineHom` and `LocallyOfFiniteType`
parts come from Mathlib's base-change lemmas; and the aggregator forwarder
from Phase A2 packages them as `IsAlgebraicGroup`.

## GitHub issue

Phase A5: <https://github.com/Langlandsproject/Langlands/issues/5>.
-/

open AlgebraicGeometry CategoryTheory Scheme MonoidalCategory

namespace Langlands.AlgebraicGeometry

/-- Every scheme `S` is canonically over itself via the identity morphism. -/
instance schemeOverSelf (S : Scheme) : S.Over S := ⟨𝟙 S⟩

/-- The trivial group object structure on `Scheme.asOver S S`, inherited
from the unit object of the Cartesian monoidal structure on `Over S`. -/
noncomputable instance trivialGrpObj (S : Scheme) :
    GrpObj (Scheme.asOver S S) :=
  inferInstanceAs (GrpObj (𝟙_ (Over S)))

/-- The structure morphism of the self-over instance is the identity. -/
@[simp]
lemma schemeOverSelf_hom (S : Scheme) : S ↘ S = 𝟙 S := rfl

/-- The identity structure morphism is affine. -/
instance trivialIsAffineHom (S : Scheme) : IsAffineHom (S ↘ S) := by
  rw [schemeOverSelf_hom]; infer_instance

/-- The identity structure morphism is locally of finite type. -/
instance trivialLocallyOfFiniteType (S : Scheme) :
    LocallyOfFiniteType (S ↘ S) := by
  rw [schemeOverSelf_hom]; infer_instance

/-- The trivial group scheme over `S` is an algebraic group: its structure
morphism is the identity, which is affine and locally of finite type, and
the `GrpObj` instance is the trivial one above. -/
noncomputable example (S : Scheme) : IsAlgebraicGroup S S := inferInstance

/-- End-to-end inference smoke test: starting from an `IsAlgebraicGroup`
hypothesis, Lean can immediately feed it to a Mathlib lemma whose
signature wants `[GrpObj (Scheme.asOver _ _)]`. No manual unwrapping. -/
noncomputable example {M S T : Scheme} [M.Over S] {f : T ⟶ S}
    [IsAlgebraicGroup M S] :
    GrpObj (Scheme.asOver (Limits.pullback (M ↘ S) f) T) :=
  inferInstance

/-- Base change of `IsAffineHom` along a pullback: stated as a local
helper because Mathlib only provides the `MorphismProperty` form. -/
private lemma isAffineHom_pullback_snd
    {X Y S : Scheme} (f : X ⟶ S) (g : Y ⟶ S) [IsAffineHom f] :
    IsAffineHom (Limits.pullback.snd f g) :=
  MorphismProperty.pullback_snd _ _ inferInstance

/-- Base-change preservation for the full aggregator: with
`[IsAlgebraicGroup M S]` and `f : T ⟶ S`, the pullback `M ×_S T` is an
algebraic group over `T`.

The `GrpObj` part is automatic (`Scheme.GrpObjAsOverPullback`), the
`LocallyOfFiniteType` part is automatic (Mathlib's pullback instance),
and the `IsAffineHom` part needs a one-line invocation of the
`MorphismProperty.IsStableUnderBaseChange` evidence. -/
noncomputable def isAlgebraicGroup_pullback
    {M S T : Scheme} [M.Over S] (f : T ⟶ S)
    [IsAlgebraicGroup M S] :
    IsAlgebraicGroup (Limits.pullback (M ↘ S) f) T := by
  haveI : IsAffineHom ((Limits.pullback (M ↘ S) f) ↘ T) :=
    isAffineHom_pullback_snd (M ↘ S) f
  haveI : LocallyOfFiniteType ((Limits.pullback (M ↘ S) f) ↘ T) :=
    inferInstanceAs (LocallyOfFiniteType (Limits.pullback.snd (M ↘ S) f))
  infer_instance

end Langlands.AlgebraicGeometry
