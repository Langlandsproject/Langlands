---
id: conjugacy_classes.bala_carter_classification
title: Bala-Carter Classification
kind: topic
status: admitted
primary_topic: AlgebraicGroups.ConjugacyClasses
topics:
- AlgebraicGroups.ConjugacyClasses
uses:
- conjugacy_classes.nilpotent_orbits
- reductive_groups.parabolic_subgroups
- reductive_groups.levi_subgroups_and_unipotent_radicals
- conjugacy_classes.weighted_dynkin_diagrams
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: Does the classification work uniformly for all simple Lie algebras, classical
    and exceptional?
  verdict: Yes. Bala-Carter is the unified classification of nilpotent orbits across
    the entire Dynkin diagram zoo; specialisations to classical types recover the
    partition classification, but the framework is type-independent.
tags:
- bala-carter
- nilpotent-orbits
---
# Bala-Carter Classification

The **Bala-Carter classification** is the type-independent
classification of **nilpotent conjugacy classes** (orbits) in a complex
(or, over an algebraically closed field of good characteristic) simple
Lie algebra \(\mathfrak{g}\). It assigns to each nilpotent orbit a
labeled subdiagram of the Dynkin diagram.

## The classification

**Theorem (Bala–Carter).** Nilpotent \(G\)-orbits in
\(\mathfrak{g}\) are in canonical bijection with pairs
\((\mathfrak{l}, \mathcal{O}_{\mathfrak{l}})\) where:

- \(\mathfrak{l} \subseteq \mathfrak{g}\) is a **Levi subalgebra** of
  some parabolic of \(\mathfrak{g}\), taken up to \(G\)-conjugacy;
- \(\mathcal{O}_{\mathfrak{l}}\) is a **distinguished** nilpotent orbit
  in the derived subalgebra \([\mathfrak{l}, \mathfrak{l}]\)
  (one whose centraliser in the corresponding group contains no
  non-trivial torus).

A distinguished orbit, in turn, is labelled by a **weighted Dynkin
diagram** of \(\mathfrak{l}\) with weights in \(\{0, 2\}\).

## Examples

### \(\mathfrak{gl}_n\) and \(\mathfrak{sl}_n\)

For \(\operatorname{GL}_n\) (and \(\operatorname{SL}_n\)), nilpotent
orbits are classified by **partitions of \(n\)** (the Jordan canonical
form). The Bala-Carter Levi is the standard Levi corresponding to the
partition, and the distinguished orbit is the principal nilpotent
(regular Jordan block) in that Levi.

| Partition | Levi | Distinguished orbit |
|---|---|---|
| \((n)\) | \(\mathfrak{gl}_n\) itself | principal |
| \((n-1, 1)\) | \(\mathfrak{gl}_{n-1}\) | principal in \(\mathfrak{gl}_{n-1}\) |
| \((1^n)\) | \(\mathfrak{t} = \mathfrak{gl}_1^n\) | zero |

### Exceptional groups

For \(E_8\) there are 70 nilpotent orbits; for \(E_7\) there are 45;
for \(E_6\) there are 21; for \(F_4\) there are 16; for \(G_2\) there
are 5. The Bala–Carter labels are the standard way to refer to them.

## Distinguished orbits and weighted Dynkin diagrams

A nilpotent element \(e \in \mathfrak{g}\) is **distinguished** if the
identity component of the centraliser \(Z_G(e)^\circ\) is unipotent
(equivalently, contains no non-trivial torus). For each nilpotent
orbit, the **weighted Dynkin diagram**
([[node:conjugacy_classes.weighted_dynkin_diagrams|see node]]) is
obtained from a Jacobson–Morozov \(\mathfrak{sl}_2\)-triple
\((e, h, f)\) by recording the values \(\alpha_i(h)\) for each simple
root \(\alpha_i\). The weights are in \(\{0, 1, 2\}\), and for
distinguished orbits they are in \(\{0, 2\}\).

## Why this matters for Langlands

- **Jacobson-Morozov theorem** sets up the correspondence between
  nilpotent orbits and \(\mathfrak{sl}_2\)-triples.
- **Springer correspondence** relates nilpotent orbits to
  representations of the Weyl group, with components of the Springer
  fibre over each orbit indexed by \(W\)-representations.
- **Local Langlands**: the local Langlands correspondence at the
  unipotent block involves the parametrisation of nilpotent orbits in
  the dual Lie algebra and the Springer correspondence on each side.
- **Lusztig's classification** of unipotent representations of finite
  groups of Lie type is organised by Bala–Carter labels.

## References

- Bala–Carter, *Classes of unipotent elements in simple algebraic
  groups I, II* (Math. Proc. Cambridge Philos. Soc., 1976).
- Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras*
  (1993).
- Carter, *Finite Groups of Lie Type* (1985).

## Prerequisite Topics

- [[node:conjugacy_classes.nilpotent_orbits|Nilpotent Orbits]]
- [[node:reductive_groups.parabolic_subgroups|Parabolic Subgroups]]
- [[node:reductive_groups.levi_subgroups_and_unipotent_radicals|Levi Subgroups and Unipotent Radicals]]
- [[node:conjugacy_classes.weighted_dynkin_diagrams|Weighted Dynkin Diagrams]]
