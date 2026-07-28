---
id: conjugacy_classes.nilpotent_orbits
title: Nilpotent Orbits
kind: topic
status: admitted
primary_topic: conjugacy_classes
topics:
- conjugacy_classes
uses:
- conjugacy_classes.nilpotent_cone
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: Are nilpotent orbits treated for reductive groups in general, with classical
    types as examples rather than the only case?
  verdict: Yes. Nilpotent orbits are defined for any reductive group over a field
    of good characteristic; the partition classification for classical groups is recovered
    as a corollary of the Bala-Carter classification.
tags:
- nilpotent-orbits
---
# Nilpotent Orbits

A **nilpotent orbit** in a reductive Lie algebra \(\mathfrak{g}\) is an
adjoint orbit of nilpotent elements. The set of nilpotent orbits is
finite, partially ordered, and stratifies the nilpotent cone — making
it one of the basic combinatorial invariants of \(\mathfrak{g}\).

## Definition

Let \(G\) be a connected reductive algebraic group over an
algebraically closed field \(k\) of characteristic zero (or "good"
characteristic for the type of \(G\)), with Lie algebra
\(\mathfrak{g} = \operatorname{Lie}(G)\). An element
\(X \in \mathfrak{g}\) is **nilpotent** if \(\operatorname{ad}(X)\) is
nilpotent, equivalently if \(X\) lies in the **nilpotent cone**
\(\mathcal{N} \subseteq \mathfrak{g}\).

A **nilpotent orbit** is an orbit
\(\mathcal{O} = G \cdot X \subseteq \mathfrak{g}\) for the adjoint
action, where \(X \in \mathcal{N}\).

## Finiteness

**Theorem.** There are only finitely many nilpotent orbits in
\(\mathfrak{g}\).

The proof uses the **Jacobson–Morozov theorem**: every nilpotent
element \(X \ne 0\) extends to an \(\mathfrak{sl}_2\)-triple
\((X, H, Y)\), and \(\mathfrak{sl}_2\)-triples are classified up to
\(G\)-conjugacy by a finite combinatorial datum (a **weighted Dynkin
diagram**).

## Examples

### \(\mathfrak{gl}_n\) and \(\mathfrak{sl}_n\)

Nilpotent orbits in \(\mathfrak{gl}_n\) are in bijection with
**partitions of \(n\)**, via Jordan canonical form. A nilpotent
\(n \times n\) matrix is conjugate to a sum of Jordan blocks; the
partition records the block sizes.

For \(\mathfrak{sl}_n\) the bijection is the same (the trace-zero
condition is automatic for nilpotent matrices).

### Classical types

For \(\mathfrak{so}_{2n+1}\), \(\mathfrak{sp}_{2n}\), \(\mathfrak{so}_{2n}\):
nilpotent orbits are classified by partitions satisfying parity
constraints:

| Type | Partitions of \(n\) (or \(2n+1\)) with constraint |
|---|---|
| \(\mathfrak{sp}_{2n}\) | odd parts have even multiplicity |
| \(\mathfrak{so}_{2n+1}\) | even parts have even multiplicity |
| \(\mathfrak{so}_{2n}\) | even parts have even multiplicity (very even ones split into two) |

### Exceptional types

For \(E_8, E_7, E_6, F_4, G_2\) the classification is via the
Bala-Carter labels; there is no partition shortcut.

## The closure order

Nilpotent orbits are partially ordered by
\(\mathcal{O}_1 \le \mathcal{O}_2 \iff \mathcal{O}_1 \subseteq \overline{\mathcal{O}_2}\)
(closure in the Zariski topology). The poset has:

- a **minimum**: the zero orbit \(\{0\}\);
- a **maximum**: the **principal** (= regular) nilpotent orbit, of
  dimension \(\dim \mathfrak{g} - \operatorname{rank} \mathfrak{g}\).

For \(\mathfrak{gl}_n\), the partition order on orbits is the
**dominance order** on partitions.

## Springer theory

The **Springer resolution**
\(\mu : \tilde{\mathcal{N}} \to \mathcal{N}\) (with
\(\tilde{\mathcal{N}}\) the cotangent bundle of the flag variety
\(G/B\)) realises the nilpotent cone as the image of a smooth
projective variety. The fibres are the **Springer fibres**
\(\mathcal{B}_X = \mu^{-1}(X)\), and their cohomology carries a
\(W\)-action (the **Springer representation**), giving a fundamental
bijection:

\[
\{\text{nilpotent orbits in } \mathfrak{g}\} \;\hookrightarrow\; \widehat{W}
\]

(the **Springer correspondence**, when refined by the component group
of the stabiliser \(Z_G(X)\)).

## Role in Langlands

- **Local Langlands at the unipotent block** (Lusztig, Kazhdan-Lusztig)
  is organised by nilpotent orbits in the dual Lie algebra
  \(\operatorname{Lie}(\hat G)\).
- **Wavefront sets** and **Whittaker support** of admissible
  representations are tracked by their associated nilpotent orbit.
- **Endoscopy** transfers nilpotent orbits between groups via the
  Langlands–Shelstad transfer map.
- **Bala-Carter classification** is the type-independent way to label
  orbits in the dual Lie algebra appearing in L-parameters.

## References

- Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras*
  (1993).
- Carter, *Finite Groups of Lie Type* (1985), Ch. 5.
- Jantzen, *Nilpotent Orbits in Representation Theory* (2004).
- Springer, *Trigonometric sums, Green functions of finite groups of
  Lie type and representations of Weyl groups* (Inventiones 1976).

## Prerequisite Topics

- [[node:conjugacy_classes.nilpotent_cone|Nilpotent Cone]]
