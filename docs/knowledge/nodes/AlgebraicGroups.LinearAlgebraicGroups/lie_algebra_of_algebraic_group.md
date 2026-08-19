---
id: linear_algebraic_groups.lie_algebra_of_algebraic_group
title: Lie Algebra of an Algebraic Group
kind: definition
status: admitted
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- affine_group_schemes.algebraic_group_definition
- linear_algebraic_groups.smoothness_tangent_spaces_lie_algebras
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 4.4"
    format: section
    note: "Section 4.4: the Lie algebra as tangent space at the identity and its functoriality."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does this construction use the tangent space at the identity rather than left-invariant vector fields as the primary definition?"
  verdict: "Yes. The tangent space at the identity is the primary object, with the bracket induced by invariant derivations."
tags:
- springer
- lie-algebra
- tangent-space
- definition
- linear-algebraic-groups
---

# Lie Algebra of an Algebraic Group

Let \(G\) be a linear algebraic group over a field \(k\). Its **Lie
algebra** is the tangent space at the identity:
\[
\operatorname{Lie}(G)=T_eG.
\]
Equivalently, if \(A=k[G]\) and \(\mathfrak m_e\subset A\) is the maximal
ideal of the identity point, then
\[
\operatorname{Lie}(G)\simeq
\operatorname{Hom}_k(\mathfrak m_e/\mathfrak m_e^2,k).
\]

The group law identifies this tangent space with the space of left-invariant
derivations of \(k[G]\). The commutator of derivations gives
\(\operatorname{Lie}(G)\) the structure of a Lie algebra over \(k\).

Every homomorphism \(f:G\to H\) induces a Lie algebra homomorphism
\[
df_e:\operatorname{Lie}(G)\to \operatorname{Lie}(H),
\]
and the assignment \(G\mapsto \operatorname{Lie}(G)\) is functorial.
