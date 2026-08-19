---
id: linear_algebraic_groups.quotient_by_closed_subgroup_exists
title: Quotient by a Closed Subgroup Exists
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- affine_group_schemes.algebraic_group_definition
- linear_algebraic_groups.algebraic_group_action_orbits_stabilizers
- linear_algebraic_groups.kernels_images_and_quotients
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 5.5"
    format: section
    note: "Theorems 5.5.5 and 5.5.6: existence and basic properties of homogeneous quotients."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the quotient exist for arbitrary closed algebraic subgroups in the classical setting?"
  verdict: "Yes. Springer constructs the quotient variety G/H, quasi-projective in general, with the expected universal property for invariant morphisms."
tags:
- springer
- quotient
- homogeneous-space
- theorem
- linear-algebraic-groups
---

# Quotient by a Closed Subgroup Exists

Let \(G\) be a linear algebraic group over an algebraically closed field and
let \(H\subseteq G\) be a closed algebraic subgroup. Then the homogeneous
space \(G/H\) exists as a variety, the quotient map
\[
\pi:G\to G/H
\]
is a morphism, and \(\pi\) is universal among morphisms from \(G\) that are
constant on right \(H\)-cosets. The variety \(G/H\) is quasi-projective and
\[
\dim(G/H)=\dim G-\dim H.
\]

If \(H\) is normal, then \(G/H\) is a linear algebraic group and
\(\pi\) is a homomorphism.

*Proof.*  
The construction embeds \(G\) into a finite-dimensional representation and
chooses a point whose stabilizer is \(H\) after passing to a suitable
projective representation. The orbit of that point is locally closed by the
orbit theorem, and it represents the coset space \(G/H\).

The universal property follows because a morphism constant on \(H\)-cosets
is constant on the fibers of \(G\to G/H\), hence factors uniquely through the
orbit variety. The dimension formula is the fiber-dimension theorem applied
to the quotient morphism, whose fibers are translates of \(H\). If \(H\) is
normal, multiplication and inversion descend from \(G\) to \(G/H\), giving
the quotient group structure.
