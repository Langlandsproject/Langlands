import LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.LinearAlgebra.FiniteDimensional.Basic

/-!
# Faithful linear representations of algebraic groups (statement form)

Statement-form definitions for the embedding theorem of affine algebraic
groups: every algebraic group over a field admits a closed immersion into
some general linear group. The actual proof lives in Phase B (Hopf algebra
correspondence + comodule theory + regular representation argument).

This file replaces the previous bundled scaffold. The new shape uses the
project convention `(G : Scheme) [G.Over S] [IsAlgebraicGroup G S]`.

## Main declarations

* `GeneralLinearGroupSchemeModel k V`: interface for a scheme-theoretic
  `GL(V)`, as a `Scheme` carrying the relevant typeclass instances.
* `FaithfulLinearRepresentation G`: a faithful finite-dimensional
  representation of `G`, as a morphism of group schemes to a `GL(V)`
  model that is also a closed immersion.
* `HasFaithfulLinearRepresentation G`: existence of such a representation,
  stated as a `Prop`.
* `exists_closedImmersion_to_generalLinear G`: corollary form — `G` is a
  closed subgroup scheme of some `GL_n`.

## GitHub issue

Phase A3: <https://github.com/Langlandsproject/Langlands/issues/3>.
-/

open AlgebraicGeometry CategoryTheory Scheme

universe u v

namespace Langlands.AlgebraicGeometry

/-!
### Scheme-theoretic `GL(V)` interface

Mathlib does not yet have a packaged `GL(V)` group scheme attached to a
finite-dimensional vector space. We expose it as a small interface here,
to be implemented by Phase D4 with a concrete `Spec ℤ[x_{ij}, det⁻¹]`
construction.
-/

/-- Interface for the scheme-theoretic general linear group attached to a
finite-dimensional `k`-vector space `V`. -/
structure GeneralLinearGroupSchemeModel (k : Type u) [Field k] (V : Type v)
    [AddCommGroup V] [Module k V] [FiniteDimensional k V] where
  /-- The scheme modelling `GL(V)`. -/
  carrier : Scheme.{u}
  /-- The structure morphism to `Spec k`. -/
  over : carrier.Over (Spec (.of k))
  /-- The group object structure on `GL(V)`. -/
  grpObj : GrpObj (Scheme.asOver carrier (Spec (.of k)))

attribute [instance] GeneralLinearGroupSchemeModel.over
attribute [instance] GeneralLinearGroupSchemeModel.grpObj

/-!
### Faithful linear representations
-/

/-- A faithful finite-dimensional representation of an algebraic group `G`
over a field `k`: a finite-dimensional `k`-vector space `V`, a model
`generalLinear` of `GL(V)`, a morphism of schemes `rho : G ⟶ generalLinear.carrier`
that is compatible with the structure morphisms to `Spec k`, that is a
group homomorphism, and that is a closed immersion. -/
structure FaithfulLinearRepresentation
    {k : Type u} [Field k] (G : Scheme.{u})
    [G.Over (Spec (.of k))]
    [IsAlgebraicGroup G (Spec (.of k))] where
  /-- The representation space. -/
  V : Type u
  [addCommGroup : AddCommGroup V]
  [module : Module k V]
  [finiteDimensional : FiniteDimensional k V]
  /-- The scheme-theoretic `GL(V)` target. -/
  generalLinear : GeneralLinearGroupSchemeModel k V
  /-- The representation morphism. -/
  rho : G ⟶ generalLinear.carrier
  /-- The morphism is over `Spec k`. -/
  rhoIsOver : rho.IsOver (Spec (.of k))
  /-- The morphism is a homomorphism of group objects in `Over (Spec k)`.

  The `IsMonObj`/`MonObj` instances come from the `GrpObj` structures on
  `G` (via `IsAlgebraicGroup`) and on `generalLinear.carrier`. -/
  rhoIsMonHom : letI := rhoIsOver; IsMonHom (rho.asOver (Spec (.of k)))
  /-- Faithfulness: the underlying morphism of schemes is a closed immersion. -/
  isClosedImmersion_rho : IsClosedImmersion rho

attribute [instance] FaithfulLinearRepresentation.addCommGroup
attribute [instance] FaithfulLinearRepresentation.module
attribute [instance] FaithfulLinearRepresentation.finiteDimensional
attribute [instance] FaithfulLinearRepresentation.rhoIsOver
attribute [instance] FaithfulLinearRepresentation.rhoIsMonHom
attribute [instance] FaithfulLinearRepresentation.isClosedImmersion_rho

/-!
### Statement form of the embedding theorem

The theorem itself (`exists_faithful_linear_representation`) is stated as
a `Prop` and left unproved in this file. The proof is the goal of Phase B4
(`Phase B — Hopf algebra correspondence + embedding theorem`).
-/

/-- Existence of a faithful finite-dimensional representation, as a `Prop`.

`k` is taken as an explicit argument: in the typeclass-on-scheme idiom,
`G : Scheme` does not pin down the base field, so callers must supply it. -/
def HasFaithfulLinearRepresentation (k : Type u) [Field k] (G : Scheme.{u})
    [G.Over (Spec (.of k))]
    [IsAlgebraicGroup G (Spec (.of k))] : Prop :=
  Nonempty (FaithfulLinearRepresentation (k := k) G)

/-- Corollary form: `G` is a closed subgroup scheme of some scheme-theoretic
`GL_n` over `Spec k`. -/
def existsClosedImmersionToGeneralLinear (k : Type u) [Field k] (G : Scheme.{u})
    [G.Over (Spec (.of k))]
    [IsAlgebraicGroup G (Spec (.of k))] : Prop :=
  ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module k V) (_ : FiniteDimensional k V)
    (generalLinear : GeneralLinearGroupSchemeModel k V)
    (rho : G ⟶ generalLinear.carrier),
      IsClosedImmersion rho

/-- The corollary form follows from a faithful representation by forgetting
the group-homomorphism structure. -/
theorem existsClosedImmersionToGeneralLinear_of_hasFaithfulLinearRepresentation
    (k : Type u) [Field k] (G : Scheme.{u})
    [G.Over (Spec (.of k))]
    [IsAlgebraicGroup G (Spec (.of k))] :
    HasFaithfulLinearRepresentation k G →
      existsClosedImmersionToGeneralLinear k G := by
  rintro ⟨R⟩
  exact ⟨R.V, R.addCommGroup, R.module, R.finiteDimensional,
    R.generalLinear, R.rho, R.isClosedImmersion_rho⟩

end Langlands.AlgebraicGeometry
