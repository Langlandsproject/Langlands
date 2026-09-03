---
id: foundations.quantum_group_definition
title: Quantum Group (Formal-Deformation Convention)
kind: definition
status: admitted
primary_topic: Foundations
topics:
- Foundations
uses:
- foundations.hopf_algebras
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does the definition distinguish a quantum group from an arbitrary noncommutative Hopf algebra and retain a well-defined classical limit?"
  verdict: "Yes. The project uses a topologically free formal Hopf deformation together with an explicit specialization to a classical Hopf algebra; an arbitrary Hopf algebra is not called a quantum group without such deformation or specialization data."
tags:
- quantum-groups
- hopf-algebras
- formal-deformation
- foundational-inputs
---

# Quantum Group (Formal-Deformation Convention)

The term **quantum group** is used in several closely related ways. In this
knowledge base, the primary meaning is a Hopf algebra equipped with explicit
deformation data and a classical limit.

## Definition

Let \(k\) be a field, let \(H_0\) be a Hopf algebra over \(k\), and write
\(A=k[[\hbar]]\). A **formal quantum group deforming \(H_0\)** is a Hopf
algebra \(H_\hbar\) over \(A\), together with an isomorphism of Hopf algebras

$$
H_\hbar/\hbar H_\hbar \;\cong\; H_0,
$$

such that \(H_\hbar\) is complete and separated for the \(\hbar\)-adic
topology and is topologically free as an \(A\)-module. Equivalently, as a
topological \(A\)-module it has the form \(M[[\hbar]]\) for some \(k\)-vector
space \(M\).
Topological freeness is the flatness condition that prevents the deformation
from acquiring \(\hbar\)-torsion.

The multiplication, unit, comultiplication, counit, and antipode of
\(H_\hbar\) must all be continuous and must satisfy the Hopf algebra axioms.
Reduction modulo \(\hbar\) recovers every structure map of \(H_0\).

## Two standard forms

- A **quantized universal enveloping algebra** \(U_\hbar(\mathfrak g)\)
  deforms the cocommutative Hopf algebra \(U(\mathfrak g)\), usually starting
  from a Lie bialgebra \(\mathfrak g\).
- A **quantized coordinate algebra** \(\mathcal O_\hbar(G)\) deforms the
  commutative coordinate Hopf algebra \(\mathcal O(G)\), usually starting from
  a Poisson--Lie group \(G\).

These are dual viewpoints when suitable finiteness or topological duality
hypotheses are available; they are not literally dual for arbitrary
infinite-dimensional Hopf algebras.

## Classical limit

The first-order failure of commutativity or cocommutativity records the
classical infinitesimal structure. For example, if \(H_0\) is commutative,
\(a,b\in H_\hbar\), and \(a_0,b_0\in H_0\) are their reductions, then

$$
\{a_0,b_0\}
  = \left(\frac{ab-ba}{\hbar}\right)\bmod \hbar
$$

defines the associated Poisson bracket. Dually, when the undeformed coproduct
is cocommutative, the first-order term of
\((\Delta_\hbar-\Delta_\hbar^{\mathrm{op}})/\hbar\) gives the corresponding
Lie cobracket.

## The \(q\)-notation

Many examples are written as \(U_q(\mathfrak g)\) or \(\mathcal O_q(G)\).
To retain a classical limit, a quantum group over \(k(q)\) must be accompanied
by a suitable integral form over a ring such as \(k[q,q^{-1}]\), or by a
completion near \(q=1\), whose specialization at \(q=1\) is the classical Hopf
algebra. A Hopf algebra over \(k(q)\) without chosen specialization data does
not by itself determine a deformation of a classical group.

Thus, in this project, "quantum group" does **not** mean every
noncommutative Hopf algebra. The deformation parameter, flatness or
topological-freeness condition, and classical specialization are part of the
definition.

## References

- V. G. Drinfeld, *Quantum groups*, Proceedings of the International Congress
  of Mathematicians, Berkeley (1986).
- M. Jimbo, *A q-difference analogue of U(g) and the Yang--Baxter equation*,
  Letters in Mathematical Physics 10 (1985).
- C. Kassel, *Quantum Groups*, Graduate Texts in Mathematics 155 (1995).
- V. Chari and A. Pressley, *A Guide to Quantum Groups* (1994).

## Prerequisite

- [[node:foundations.hopf_algebras|Hopf Algebras]]
