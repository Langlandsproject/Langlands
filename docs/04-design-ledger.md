# Design ledger (settled decisions — owner sign-off required to change)

Every contested design surface gets one row: the definitional form,
the working carrier, the bridge, and the names. A review that
touches a settled row **amends this ledger first** (with owner
approval), then the code — never the reverse. This file exists
because the X^* stack was redesigned three times in one day
(2026-08-19), each rotation satisfying only the newest constraint;
the ledger forces every change to be checked against the whole
constraint set at once.

Constraint set (all binding, conventions §4/§6/§7/§8): textbook
transcription; hierarchy transcribed; one object one name; reuse
before define; no invented pseudo-standard names — working carriers
are Mathlib objects under Mathlib names, licensed by a KB bridge
node, never masquerading as definitions; no structure-∃; `Type*`;
node-driven file placement; fixes replace, never layer; dual pairs
same shape.

## The X^* / X_* stack (settled 2026-08-19)

| Surface | Decision |
|---|---|
| Definition of X^*(G) | `CharacterGroup G := G ⟶ 𝔾ₘ R` — Hom of algebraic groups, `G : Grp (Over (Spec R))` the subject |
| Definition of X_*(G) | `CocharacterGroup G := 𝔾ₘ R ⟶ G` — same shape, one arrow flipped |
| 𝔾ₘ | Three levels, all in `AlgebraicGeometry/Gm.lean` (the key construction's home): `Gm R : Scheme`, `multiplicativeGroup R : Over (Spec R)`, and **`𝔾ₘ R : Grp (Over (Spec R))`** — the algebraic-group level, defined once; definitions reference `𝔾ₘ R`, never inline `Grp.mk` plumbing. `O(𝔾ₘ)` is `LaurentPolynomial R`, never raw `AddMonoidAlgebra R ℤ` |
| Working carrier of X^* | Mathlib's `GroupLike R A` (its `CommGroup` is Mathlib's, proven). `CharLattice R A := Additive (GroupLike R A)` — the literature's additive lattice; the one mult/add point |
| License for the carrier | KB node `tori.characters_as_group_like_elements` + the (M0) bridge statement `CharacterGroup (Grp.mk (specObjOver R A)) ≃ GroupLike R A`-form. The carrier never appears as a *definition* of characters |
| Working carrier of X_* | spelled inline, Mathlib names only: `WithConv ((E ⊗[k] A) →ₐc[E] LaurentPolynomial E)` (`CocharLattice`); no alias name for the intermediate |
| Intermediate Hopf-hom character type | **no repo name** (`HopfCharacterGroup` deleted; "character group of a Hopf algebra" means something else in the literature). Convolution-layer lemmas state the `WithConv (… →ₐc …)` type directly |
| Galois action on X^* | on the `GroupLike` carrier via `γ ⊗ 1` (`galAlgAut`), `charRep : Representation ℤ Gal(E/k) (CharLattice E (E ⊗[k] A))`; well-definedness by `isGroupLikeElem_galAlgAut` (proved, `sqBaseChange` engine) |
| Functoriality of X^* | `charLatticeMap` along `Bialgebra.TensorProduct.map (BialgHom.id) f` on the carrier |
| Pairing | `charPairing` = image of the group-like under the cocharacter, integer by `diagGroupLikeEquiv` (group-like rigidity) |

## The torus stack (settled 2026-08-19)

| Surface | Decision |
|---|---|
| Diagonalizable | `IsDiagonalizableAlgebra R A : Prop`, class; canonical decomposition `A ≅ R[X(A)]`: `Bijective (charLift R A)` where `charLift : MonoidAlgebra R (GroupLike R A) →ₐc[R] A`, `e^χ ↦ χ` (carrier per the bridge; docstring cites the node) |
| Torus | `class IsTorusAlgebra k E A`: fields `diagonalizable : IsDiagonalizableAlgebra E (E ⊗[k] A)`, `free`/`finite : Module.Free/Finite ℤ (CharLattice E (E ⊗[k] A))` — torus = special diagonalizable |
| Split torus | `IsSplitTorusAlgebra k A`, same shape over `k` |
| `𝔾ₘⁿ` form | interop theorem `isTorusAlgebra_iff_gm_pow`, never the definition |
| Classification | `toriClassification : (TorusCat k E)ᵒᵖ ≌ LatticeCat Gal(E/k)` via `charLatticeFunctor` + Full/Faithful/EssSurj |

## Infrastructure (settled 2026-08-19)

| Surface | Decision |
|---|---|
| hopfSpec machinery | MIGRATE to Mathlib `AlgebraicGeometry/Group/Affine.lean` (`hopfSpec`, Full/Faithful proved) — TODO item; repo Yoneda chain retires |
| File map | conventions §4 node-driven placement table; 1000-line cap |
| Universe style | `Type*`; named universes only at scheme/bundled-category pins |
