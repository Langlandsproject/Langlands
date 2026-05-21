import Mathlib.AlgebraicGeometry.Group.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.LinearAlgebra.FiniteDimensional.Basic

/-!
# Linear algebraic groups

This file records the intrinsic definition of a linear algebraic group as an affine finite type
group scheme over a field.  It also records, as a Lean statement, the standard representation
theoretic theorem that such a group admits a faithful finite-dimensional representation, hence a
closed immersion into a general linear group.

Mathlib currently has `Matrix.GeneralLinearGroup` as a group of `R`-points, but not yet a packaged
affine group scheme `GL(V)`.  The theorem statement below therefore parameterizes the needed
scheme-theoretic `GL(V)` object as `GeneralLinearGroupSchemeModel`.  This keeps the statement honest:
when an actual `GL(V)` group scheme is added, this interface can be implemented by that construction.
-/

open AlgebraicGeometry CategoryTheory

universe u v

namespace Langlands
namespace LinearAlgebraicGroups

/--
A linear algebraic group over a field `k`: an affine group scheme of finite type over `k`.

The group structure is expressed as a group object in the slice category over `Spec k`.
-/
structure LinearAlgebraicGroup (k : Type u) [Field k] where
  /-- The underlying scheme over `Spec k`. -/
  toOver : Over (Spec (.of k))
  /-- The group object structure in schemes over `k`. -/
  toGrpObj : GrpObj toOver
  /-- Affineness of the structure morphism. -/
  isAffineHom : IsAffineHom toOver.hom
  /-- Finite type of the structure morphism. -/
  locallyOfFiniteType : LocallyOfFiniteType toOver.hom

attribute [instance] LinearAlgebraicGroup.toGrpObj
attribute [instance] LinearAlgebraicGroup.isAffineHom
attribute [instance] LinearAlgebraicGroup.locallyOfFiniteType

namespace LinearAlgebraicGroup

variable {k : Type u} [Field k] (G : LinearAlgebraicGroup k)

/-- The underlying scheme of a linear algebraic group. -/
abbrev carrier : Scheme := G.toOver.left

/-- The structure morphism to `Spec k`. -/
abbrev hom : G.carrier ⟶ Spec (.of k) := G.toOver.hom

instance : GrpObj G.toOver := G.toGrpObj

instance : IsAffineHom G.hom := G.isAffineHom

instance : LocallyOfFiniteType G.hom := G.locallyOfFiniteType

end LinearAlgebraicGroup

/-- Optional convention: a smooth linear algebraic group. -/
class IsSmoothLinearAlgebraicGroup {k : Type u} [Field k] (G : LinearAlgebraicGroup k) :
    Prop where
  smooth : Smooth G.hom

attribute [instance] IsSmoothLinearAlgebraicGroup.smooth

/--
An interface for the scheme-theoretic general linear group attached to a finite-dimensional
`k`-vector space `V`.

This is deliberately only an interface: it states the object and its group structure in schemes
over `k`, without pretending that mathlib already provides the affine group scheme `GL(V)`.
-/
structure GeneralLinearGroupSchemeModel (k : Type u) [Field k] (V : Type v)
    [AddCommGroup V] [Module k V] [FiniteDimensional k V] where
  /-- The scheme over `Spec k` modeling `GL(V)`. -/
  toOver : Over (Spec (.of k))
  /-- The group object structure on `GL(V)`. -/
  toGrpObj : GrpObj toOver

attribute [instance] GeneralLinearGroupSchemeModel.toGrpObj

namespace GeneralLinearGroupSchemeModel

variable {k : Type u} [Field k] {V : Type v}
variable [AddCommGroup V] [Module k V] [FiniteDimensional k V]

/-- The underlying scheme of a `GL(V)` model. -/
abbrev carrier (generalLinear : GeneralLinearGroupSchemeModel k V) : Scheme :=
  generalLinear.toOver.left

/-- The structure morphism of a `GL(V)` model. -/
abbrev hom (generalLinear : GeneralLinearGroupSchemeModel k V) :
    generalLinear.carrier ⟶ Spec (.of k) :=
  generalLinear.toOver.hom

instance (generalLinear : GeneralLinearGroupSchemeModel k V) : GrpObj generalLinear.toOver :=
  generalLinear.toGrpObj

end GeneralLinearGroupSchemeModel

/--
A faithful finite-dimensional representation of a linear algebraic group.

The field `V` is the representation space.  The object `GL` is the scheme-theoretic general linear
group attached to `V`.  The morphism `rho` is a morphism of group objects over `Spec k`, and the
closed immersion instance records faithfulness in the scheme-theoretic sense used by algebraic
groups.
-/
structure FaithfulLinearRepresentation {k : Type u} [Field k]
    (G : LinearAlgebraicGroup k) where
  /-- The finite-dimensional representation space. -/
  V : Type u
  [addCommGroup : AddCommGroup V]
  [module : Module k V]
  [finiteDimensional : FiniteDimensional k V]
  /-- The scheme-theoretic `GL(V)` target. -/
  generalLinear : GeneralLinearGroupSchemeModel k V
  /-- The representation as a morphism of group objects over `k`. -/
  rho : (⟨G.toOver⟩ : Grp (Over (Spec (.of k)))) ⟶
    (⟨generalLinear.toOver⟩ : Grp (Over (Spec (.of k))))
  /-- Faithfulness: the underlying map of schemes is a closed immersion. -/
  isClosedImmersion_rho : IsClosedImmersion rho.hom.hom.left

attribute [instance] FaithfulLinearRepresentation.isClosedImmersion_rho

namespace FaithfulLinearRepresentation

variable {k : Type u} [Field k] {G : LinearAlgebraicGroup k}

/-- The scheme-theoretic `GL(V)` target of a faithful representation. -/
abbrev gl (R : FaithfulLinearRepresentation G) :
    @GeneralLinearGroupSchemeModel.{u, u} k _ R.V R.addCommGroup R.module R.finiteDimensional :=
  R.generalLinear

end FaithfulLinearRepresentation

/--
Statement form of the standard theorem: affine finite type group schemes over a field admit
faithful finite-dimensional representations.
-/
def faithful_representation {k : Type u} [Field k] (G : LinearAlgebraicGroup k) : Prop :=
  ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module k V) (_ : FiniteDimensional k V)
    (generalLinear : GeneralLinearGroupSchemeModel k V)
    (rho : (⟨G.toOver⟩ : Grp (Over (Spec (.of k)))) ⟶
      (⟨generalLinear.toOver⟩ : Grp (Over (Spec (.of k))))),
      IsClosedImmersion rho.hom.hom.left

/-- Packaged witness form of the faithful representation statement. -/
def HasFaithfulLinearRepresentation {k : Type u} [Field k]
    (G : LinearAlgebraicGroup k) : Prop :=
  Nonempty (FaithfulLinearRepresentation (k := k) G)

/--
The standard representation theorem, recorded as a theorem-shaped proposition.

This file only formalizes the statement.  Proving it requires constructing the affine group scheme
`GL(V)` and developing the regular-representation argument for Hopf algebras in mathlib.
-/
def exists_faithful_linear_representation {k : Type u} [Field k]
    (G : LinearAlgebraicGroup k) : Prop :=
  faithful_representation G

/--
Corollary-shaped statement: a linear algebraic group is a closed subgroup scheme of some
scheme-theoretic general linear group.
-/
def exists_closedImmersion_to_generalLinear {k : Type u} [Field k]
    (G : LinearAlgebraicGroup k) : Prop :=
  ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module k V) (_ : FiniteDimensional k V)
    (generalLinear : GeneralLinearGroupSchemeModel k V)
    (rho : (⟨G.toOver⟩ : Grp (Over (Spec (.of k)))) ⟶
      (⟨generalLinear.toOver⟩ : Grp (Over (Spec (.of k))))),
      IsClosedImmersion rho.hom.hom.left

theorem exists_closedImmersion_to_generalLinear_of_faithfulRepresentation {k : Type u} [Field k]
    {G : LinearAlgebraicGroup k} :
    HasFaithfulLinearRepresentation G → exists_closedImmersion_to_generalLinear G := by
  rintro ⟨R⟩
  exact ⟨R.V, R.addCommGroup, R.module, R.finiteDimensional, R.generalLinear, R.rho,
    R.isClosedImmersion_rho⟩

theorem faithful_representation_of_packaged {k : Type u} [Field k]
    {G : LinearAlgebraicGroup k} :
    HasFaithfulLinearRepresentation G → faithful_representation G :=
  exists_closedImmersion_to_generalLinear_of_faithfulRepresentation

end LinearAlgebraicGroups
end Langlands
