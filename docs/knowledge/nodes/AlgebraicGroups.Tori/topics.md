# Algebraic Tori

This catalog lists nodes under the `tori` mathematical category. It is for human planning and does not create DAG edges.

## Topic Nodes

- [[node:tori.algebraic_tori|Algebraic Tori]]
- [[node:tori.character_and_cocharacter_lattices|Character and Cocharacter Lattices]]

## Definitions

- [[node:tori.torus_definition|Algebraic Torus]]
- [[node:tori.split_torus|Split Torus]]
- [[node:tori.anisotropic_torus|Anisotropic Torus]]
- [[node:tori.induced_tori|Induced Tori]]
- [[node:tori.unramified_torus|Unramified Torus]]
- [[node:tori.tamely_ramified_torus|Tamely Ramified Torus]]
- [[node:tori.weakly_induced_torus|Weakly Induced Torus]]

## Theorems

- [[node:tori.multiplicative_type_characterization|Tori among Groups of Multiplicative Type]]
- [[node:tori.f_tori_galois_module_classification|F-Tori Are Classified by Galois Modules]]
- [[node:tori.splitting_field|The Minimal Splitting Field of a Torus]]
- [[node:tori.subtori_and_quotients|Subtori and Quotients via the Character Lattice]]
- [[node:tori.split_anisotropic_decomposition|Split-Anisotropic Decomposition of a Torus]]
- [[node:tori.weil_restriction_of_tori|Weil Restriction of Tori]]
- [[node:tori.rank_one_classification|Classification of Rank-One Tori]]

## Examples

- [[node:tori.norm_one_torus|Norm-One Torus of a Separable Extension]]

## Lean coverage (LanglandsLean/Tori/)

- `Diagonalizable` — D(M) = Spec R[M] with group-object and algebraic-group instances.
- `SplitTorus` — D(Z^n).
- `CharacterGroup` — X^*, X_*; Cartier duality for split tori proved at object, hom, cocharacter, and isomorphism level (aligned with [[node:reductive_groups.diagonalizable_groups_antiequivalence]]).
- `GaloisDescent` — semilinear action, twisted group algebra (the general torus's coordinate algebra).
- `Speiser` — semilinear Galois descent proved in-repo (see [[node:forms.galois_descent_for_vector_spaces]]).

## Planned (G0 roadmap, docs/TODO.md)

- Galois cohomology of tori (G0.5).
- The Kottwitz homomorphism for tori, the subgroups T(k)_0 and T(k)_1, the valuation homomorphism (G0.6).
- The building of a torus, the interface consumed by buildings_and_parahorics (G0.7).
- Integral models: standard model, Neron tower, filtrations (G0.8).
- Dual torus, L-group, local Langlands for tori (G0.9).
- Lean: Hopf structure on the twisted group algebra; independence half of descent; trivial-action computation (single remaining sorry).
