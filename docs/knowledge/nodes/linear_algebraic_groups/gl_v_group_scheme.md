---
id: linear_algebraic_groups.gl_v_group_scheme
title: General Linear Group Scheme GL(V)
kind: definition
status: formalized
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- affine_group_schemes.general_linear_group_scheme
lean:
  declarations:
  - Langlands.AlgebraicGeometry.Examples.GLV
  - Langlands.AlgebraicGeometry.Examples.GLVSch
  modules:
  - LanglandsLean.AlgebraicGeometry.Examples.GLV
verification:
  definition: accepted
  proof: not_applicable
tags:
- algebraic-groups
- gl-v
- group-scheme
---

# General Linear Group Scheme GL(V)

For a finite free \(R\)-module \(V\), the **general linear group scheme** \(\mathrm{GL}(V)\)
is the affine group scheme representing the functor
\[
S \;\mapsto\; \mathrm{GL}_{R}(V \otimes_R \mathcal{O}_S).
\]

When \(V = R^n\), this recovers \(\mathrm{GL}_n\) as a special case. The coordinate
ring perspective: \(\mathcal{O}(\mathrm{GL}(V)) = \mathrm{Sym}(V \otimes_R V^*)[\det^{-1}]\).

## Lean Formalization

The Lean 4 formalization provides:
- `GLV`: the group scheme object
- `GLVSch`: the scheme underlying `GL(V)`

as elements of `Langlands.AlgebraicGeometry.Examples`.

## References

- SGA 3, Exposé I–III.
- Demazure–Gabriel, *Groupes algébriques* (1970).
