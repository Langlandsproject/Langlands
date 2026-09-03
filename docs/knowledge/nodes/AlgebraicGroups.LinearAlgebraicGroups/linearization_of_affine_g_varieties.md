---
id: linear_algebraic_groups.linearization_of_affine_g_varieties
title: Affine G-Varieties Embed Equivariantly in Representations
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- linear_algebraic_groups.algebraic_group_action_orbits_stabilizers
- linear_algebraic_groups.embedding_theorem
- affine_group_schemes.representation_equals_comodule
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.3"
    format: section
    note: "Propositions 2.3.6 and 2.3.9: equivariant embeddings of affine G-varieties."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the theorem limited to affine varieties?"
  verdict: "Yes. The finite-dimensional embedding is for affine G-varieties; projective or quasi-projective variants require linearized line bundles."
tags:
- springer
- representation
- equivariant-embedding
- affine-variety
- theorem
- linear-algebraic-groups
---

# Affine G-Varieties Embed Equivariantly in Representations

Let \(G\) be a linear algebraic group acting regularly on an affine variety
\(X\). Then there exists a finite-dimensional rational representation \(V\)
of \(G\) and a \(G\)-equivariant closed immersion
\[
X \hookrightarrow V.
\]

In particular, affine \(G\)-varieties can be studied through finite-dimensional
linear representations of \(G\).

*Proof.*  
Write \(X=\operatorname{Spec} A\). The action of \(G\) on \(X\) is
equivalent to a coaction \(A\to A\otimes k[G]\), so \(A\) is a rational
\(G\)-module. Choose finitely many algebra generators of \(A\). The
finite-subcomodule argument used in the
[[node:linear_algebraic_groups.embedding_theorem|embedding theorem]] puts
these generators inside a finite-dimensional \(G\)-stable subspace
\(W\subseteq A\).

The inclusion \(W\subseteq A\) gives a surjective algebra map
\(\operatorname{Sym}(W)\to A\), hence a closed immersion
\(X\hookrightarrow W^\vee\). Since \(W\) is \(G\)-stable, the dual space
\(W^\vee\) is a finite-dimensional representation and the immersion is
\(G\)-equivariant.
