---
id: linear_algebraic_groups.general_linear_group_scheme
title: General Linear Group Scheme GL_n
kind: definition
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- linear_algebraic_groups.algebraic_group_definition
- linear_algebraic_groups.coordinate_hopf_algebra_of_group_scheme
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Examples.GLn
  declarations:
    - Langlands.AlgebraicGeometry.Examples.GLn.universalMatrix
    - Langlands.AlgebraicGeometry.Examples.GLn.det
    - Langlands.AlgebraicGeometry.Examples.GLn.coordRing
    - Langlands.AlgebraicGeometry.Examples.GLn.over
verification:
  definition: accepted
  proof: not_applicable
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the construction stated over an arbitrary base scheme \\(S\\) and arbitrary positive integer \\(n\\)?"
  verdict: "Yes. \\(S\\) is any scheme; \\(n\\) is any positive integer (or any nonempty finite index set)."
tags:
- example
- definition
- general-linear-group
- linear-algebraic-groups
---

# General Linear Group Scheme \(\operatorname{GL}_n\)

Let \(n\) be a positive integer and \(S\) a scheme. The **general
linear group scheme of rank \(n\) over \(S\)**, denoted
\(\operatorname{GL}_{n,S}\), is defined by base change:

\[
\operatorname{GL}_{n,S} \;=\; S \,\times_{\operatorname{Spec} \mathbb{Z}}\, \operatorname{Spec} \mathbb{Z}[x_{ij}\colon 1 \le i,j \le n]\bigl[\det(x_{ij})^{-1}\bigr],
\]

where \(\mathbb{Z}[x_{ij}]\) is the polynomial ring in the \(n^2\)
indeterminates \(x_{ij}\) and the localization inverts the determinant
of the formal \(n \times n\) matrix \((x_{ij})\). Its coordinate Hopf
algebra is generated over the base by the entries \(x_{ij}\) and by
\(\det^{-1}\), with the **matrix-multiplication Hopf structure**:

\[
\Delta(x_{ij}) \;=\; \sum_{k=1}^{n} x_{ik} \otimes x_{kj}, \qquad
\varepsilon(x_{ij}) \;=\; \delta_{ij}, \qquad
S(x_{ij}) \;=\; (\det)^{-1} \cdot C_{ji},
\]

where \(C_{ji}\) is the \((j, i)\)-cofactor of \((x_{ij})\) (so that
\((S(x_{ij}))\) is the formal matrix inverse of \((x_{ij})\)).

The structure morphism \(\operatorname{GL}_{n,S} \to S\) is affine and
locally of finite type. Hence \(\operatorname{GL}_{n,S}\) is an
[[node:linear_algebraic_groups.algebraic_group_definition|algebraic group]]
over \(S\); it is smooth of relative dimension \(n^2\) and is, for
\(n \ge 2\), non-commutative. Its functor of points is identified by
[[node:linear_algebraic_groups.general_linear_group_scheme_points|the GL_n points formula]].

The group scheme \(\operatorname{GL}_n\) is the target of the
[[node:linear_algebraic_groups.embedding_theorem|embedding theorem]]:
every algebraic group over a field is a closed subgroup of some
\(\operatorname{GL}_n\). The closed subgroup
[[node:linear_algebraic_groups.basic_examples|\(\operatorname{SL}_n = \ker(\det)\)]],
together with subgroups of \(\operatorname{GL}_n\) cut out by symmetry
conditions, gives rise to the classical group schemes.
