---
id: affine_group_schemes.comodule_definition
title: Comodule over a Coalgebra
kind: definition
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- affine_group_schemes.coordinate_rings_and_hopf_algebras
- foundational_inputs.hopf_algebras
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Comodule
  declarations:
    - Langlands.AlgebraicGeometry.Comodule
    - Langlands.AlgebraicGeometry.Comodule.Hom
verification:
  definition: accepted
  proof: not_applicable
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the definition stated over an arbitrary commutative semiring?"
  verdict: "Yes. The structure makes sense over any commutative semiring \\(R\\); specialization to a field \\(k\\) is left to consumers."
tags:
- comodule
- definition
- linear-algebraic-groups
---

# Comodule over a Coalgebra

Let \(R\) be a commutative semiring and let \(A\) be a coalgebra over
\(R\), with comultiplication
\(\Delta : A \to A \otimes_R A\) and counit \(\varepsilon : A \to R\).
A **(right) \(A\)-comodule** is an \(R\)-module \(V\) together with an
\(R\)-linear map (the **coaction**)

\[
\rho : V \to V \otimes_R A
\]

satisfying:

1. **Coassociativity.** The two paths from \(V\) to
   \(V \otimes_R A \otimes_R A\) agree:

   \[
   (\rho \otimes \operatorname{id}_A) \circ \rho
   \;=\;
   (\operatorname{id}_V \otimes \Delta) \circ \rho,
   \]

   after the canonical identification
   \((V \otimes A) \otimes A \simeq V \otimes (A \otimes A)\).

2. **Counit.** The composition

   \[
   V \to V \otimes_R A \to V \otimes_R R \cong V,
   \]

   where the first arrow is \(\rho\) and the second is
   \(\operatorname{id}_V \otimes \varepsilon\), is the identity map of \(V\).

A morphism of \(A\)-comodules is an \(R\)-linear map of underlying modules
commuting with the coactions.

When \(A\) is a Hopf algebra, \(A\)-comodules play the role of
representations of the dual group scheme; see
[[node:affine_group_schemes.representation_equals_comodule|representations equal comodules]].
