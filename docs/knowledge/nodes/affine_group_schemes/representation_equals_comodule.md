---
id: affine_group_schemes.representation_equals_comodule
title: G-Representations Are A-Comodules
kind: theorem
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- affine_group_schemes.comodule_definition
- affine_group_schemes.points_functor_definition
- affine_group_schemes.coordinate_hopf_algebra_of_group_scheme
verification:
  statement: accepted
generality:
  reviewed: true
  prompt: "Is the equivalence stated for arbitrary \\(V\\), not only finite-dimensional?"
  verdict: "Yes. The equivalence holds for arbitrary \\(k\\)-vector spaces \\(V\\); the finite-dimensional case is the special instance used by the embedding theorem."
tags:
- representation
- comodule
- theorem
- linear-algebraic-groups
---

# G-Representations Are A-Comodules

Let \(k\) be a field, \(G\) an
[[node:affine_group_schemes.affine_group_scheme_definition|affine group scheme]]
over \(\operatorname{Spec} k\) with
[[node:affine_group_schemes.coordinate_hopf_algebra_of_group_scheme|coordinate Hopf algebra]]
\(A = \mathcal{O}(G)\), and \(V\) a \(k\)-vector space. The following
data are naturally equivalent:

1. an [[node:affine_group_schemes.comodule_definition|$A$-comodule]]
   structure on \(V\) (a coaction
   \(\rho : V \to V \otimes_k A\) satisfying coassociativity and counit);
2. a natural action of the functor of points
   [[node:affine_group_schemes.points_functor_definition|\(G(-)\)]] on
   the functor \(R \mapsto V \otimes_k R\) — that is, for each
   \(k\)-algebra \(R\) a group homomorphism
   \(G(R) \to \operatorname{GL}_R(V \otimes_k R)\), natural in \(R\);
3. when \(V\) is finite-dimensional, a morphism of group schemes
   \(\rho^\sharp : G \to \operatorname{GL}(V)\) over \(\operatorname{Spec} k\).

*Proof sketch.*  
From a coaction \(\rho : V \to V \otimes_k A\) and a \(k\)-algebra map
\(g : A \to R\), define the endomorphism
\(\rho_g : V \otimes_k R \to V \otimes_k R\) by

\[
\rho_g(v \otimes r) = \sum_{(v)} v_{(0)} \otimes g(v_{(1)})\, r
\]

(using sumless Sweedler notation for \(\rho(v) = \sum v_{(0)} \otimes
v_{(1)}\)). Counit makes \(\rho_g\) become the identity when \(g\) is
the unit of \(G(R)\); coassociativity makes \(\rho_{gh}\) equal
\(\rho_g \circ \rho_h\). Hence \(\rho\) induces a group homomorphism
\(G(R) \to \operatorname{GL}_R(V \otimes_k R)\), natural in \(R\).

Conversely, from a natural family of group homomorphisms one recovers
the coaction by evaluating at the universal \(R\)-point
\(\operatorname{id}_A : A \to A\) in \(G(A)\).

When \(V\) is finite-dimensional, the functor of points
\(R \mapsto \operatorname{GL}_R(V \otimes_k R)\) is represented by an
affine group scheme \(\operatorname{GL}(V)\), and a natural
transformation \(G(-) \to \operatorname{GL}(V)(-)\) of group-valued
functors corresponds by Yoneda to a morphism of group schemes
\(G \to \operatorname{GL}(V)\).  
\(\square\)
