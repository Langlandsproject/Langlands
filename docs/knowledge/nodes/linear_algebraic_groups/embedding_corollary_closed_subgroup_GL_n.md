---
id: linear_algebraic_groups.embedding_corollary_closed_subgroup_GL_n
title: Algebraic Groups Are Closed Subgroups of GL_n
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.embedding_theorem
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the corollary stated for arbitrary fields and arbitrary algebraic groups?"
  verdict: "Yes. The corollary is purely a packaging of the embedding theorem."
tags:
- embedding-theorem
- corollary
- linear-algebraic-groups
---

# Algebraic Groups Are Closed Subgroups of GL_n

Let \(k\) be a field and \(G\) an
[[node:linear_algebraic_groups.algebraic_group_definition|algebraic group]]
over \(\operatorname{Spec} k\). There exist a positive integer \(n\) and
a closed immersion of group schemes

\[
G \;\hookrightarrow\; \operatorname{GL}_n
\]

over \(\operatorname{Spec} k\).

*Proof.*  
Apply [[node:linear_algebraic_groups.embedding_theorem|the embedding theorem]]
to obtain a faithful finite-dimensional representation
\((W, \rho)\) of \(G\). Choose a basis of \(W\); the choice induces a
group scheme isomorphism \(\operatorname{GL}(W) \simeq \operatorname{GL}_n\)
where \(n = \dim_k W\). Composing \(\rho\) with this isomorphism gives
the required closed immersion.  
\(\square\)

This corollary is the historically classical form of the theorem
(Borel, *Linear Algebraic Groups*, §1.10) and motivates the term
*linear algebraic group* as a synonym for *algebraic group over a
field*.
