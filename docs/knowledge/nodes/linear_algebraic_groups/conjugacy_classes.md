---
id: linear_algebraic_groups.conjugacy_classes
title: Conjugacy Classes
kind: topic
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.linear_algebraic_groups
- linear_algebraic_groups.automorphism_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are conjugacy classes treated as geometric objects (orbits under conjugation), allowing the base to vary?"
  verdict: "Yes. Conjugacy is treated functorially via the conjugation action `G × G → G`, `(g, h) ↦ ghg⁻¹`; orbits and stabilisers vary with the base."
tags:
- conjugacy
- linear-algebraic-groups
---

# Conjugacy Classes

For an algebraic group \(G\) acting on itself by conjugation
\((g, h) \mapsto ghg^{-1}\), the orbits are the **conjugacy classes**.
These carry rich structure used throughout the theory.

## The conjugation action

The conjugation morphism

\[
c : G \times G \to G, \qquad (g, h) \mapsto g h g^{-1}
\]

is a morphism of schemes. For each fixed \(g \in G\), conjugation by
\(g\) is an automorphism \(c_g : G \to G\) (the
**inner automorphism**). The map \(g \mapsto c_g\) is a homomorphism
\(G \to \operatorname{Aut}(G)\) whose image is the
**inner automorphism group** \(\operatorname{Inn}(G)\) and whose kernel
is the **centre** \(Z(G)\).

## Orbits and stabilisers

For \(h \in G(K)\) (a point with values in a field \(K\)):

- the **conjugacy class** of \(h\) is the orbit
  \(\{c_g(h) : g \in G(K')\}\) for varying \(K'/K\) extensions;
- the **centraliser** \(Z_G(h)\) is the closed subscheme of \(G\)
  fixing \(h\) under conjugation;
- \(\dim(\text{orbit}) + \dim(\text{centraliser}) = \dim G\).

## Semisimple vs. unipotent elements

Over a field, an element \(g \in G\) of an affine algebraic group
admits a **Jordan decomposition**
\(g = g_s \cdot g_u = g_u \cdot g_s\) with \(g_s\) semisimple and
\(g_u\) unipotent. The decomposition is functorial under group
morphisms.

- **Semisimple conjugacy classes.** Classified (over an algebraically
  closed field) by characters of a maximal torus modulo Weyl-group
  action — see [[node:root_data_and_duality.based_root_data|root data]].
- **Unipotent conjugacy classes.** Far richer; for classical groups
  there is a combinatorial classification by partitions. See
  [[node:conjugacy_classes.bala_carter_classification|nilpotent orbits]].
- **General conjugacy classes.** Determined by a pair (semisimple
  class, unipotent class in the centraliser), via Jordan decomposition.

## Steinberg's theorem

For a connected reductive group \(G\) over an algebraically closed
field, two semisimple elements are conjugate iff they lie in a common
maximal torus and are conjugate by the Weyl group. The Weyl-orbit
structure on a maximal torus is therefore the key combinatorial data.

## Conjugacy of subgroups

A parallel notion is **conjugacy of subgroups**: two closed subgroups
\(H, H' \subseteq G\) are conjugate if \(H' = g H g^{-1}\) for some
\(g \in G\). Key examples:

- Maximal tori are all conjugate over \(\bar{k}\) — this is the
  uniqueness statement for the abstract torus structure.
- Borel subgroups of a connected reductive group are all conjugate
  over \(\bar{k}\) — this is the cornerstone of the **Bruhat
  decomposition**.

## Kottwitz / twisted conjugacy

In the local Langlands program, an important variant is
\(\sigma\)-**twisted conjugacy** for an automorphism (or Frobenius)
\(\sigma\): the classes of the action \(g \cdot h = g h \sigma(g)^{-1}\).
See [[node:kottwitz_structures.b_of_g|Kottwitz structures]].

## Prerequisite Topics

- [[node:linear_algebraic_groups.linear_algebraic_groups|Linear Algebraic Groups]]
- [[node:linear_algebraic_groups.automorphism_groups|Automorphism Groups]]
