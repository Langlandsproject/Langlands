---
id: linear_algebraic_groups.closed_image_of_homomorphism
title: Image of an Algebraic Group Homomorphism Is Closed
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- affine_group_schemes.algebraic_group_definition
- linear_algebraic_groups.morphisms_and_closed_subgroups
- linear_algebraic_groups.kernels_images_and_quotients
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.2"
    format: section
    note: "Proposition 2.2.5: image and kernel of a homomorphism."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does closedness mean Zariski closed in the target algebraic group?"
  verdict: "Yes. In the classical finite-type setting, the image is a closed algebraic subgroup; over a nonclosed ground field one tracks the corresponding closed subgroup defined over the base field."
tags:
- springer
- homomorphism
- closed-subgroup
- theorem
- linear-algebraic-groups
---

# Image of an Algebraic Group Homomorphism Is Closed

Let \(f : G \to H\) be a homomorphism of linear algebraic groups over an
algebraically closed field. Then \(\ker(f)\) is a closed normal subgroup of
\(G\), and \(f(G)\) is a closed algebraic subgroup of \(H\).

If \(G\) and \(H\) are defined over a subfield \(F\) and \(f\) is defined
over \(F\), then \(f(G)\) is a closed \(F\)-subgroup of \(H\).

*Proof.*  
The kernel is the inverse image of the closed point \(e_H\), hence is closed;
normality is immediate from the homomorphism identity.

For the image, let \(\overline{f(G)}\) be its Zariski closure in \(H\).
Because multiplication and inversion on \(H\) are regular, the closure of a
subgroup is again a closed subgroup. The image \(f(G)\) is constructible by
Chevalley's theorem and is stable under left and right multiplication by its
own elements. A constructible subgroup of an algebraic group contains a
nonempty open subset of its closure; translating this open subset by elements
of the subgroup covers the closure. Hence \(f(G)=\overline{f(G)}\), so the
image is closed.

The statement over \(F\) follows because the defining ideal of the closure is
stable under the \(F\)-structure and the homomorphism is defined over \(F\).
