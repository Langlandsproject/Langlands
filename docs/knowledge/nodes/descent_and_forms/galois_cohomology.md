---
id: descent_and_forms.galois_cohomology
title: Galois Cohomology
kind: topic
status: admitted
primary_topic: linear_algebraic_groups
topics:
- descent_and_forms
uses:
- descent_and_forms.galois_groups_and_descent_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is Galois cohomology treated for arbitrary algebraic groups (not just abelian / commutative) over arbitrary fields?"
  verdict: "Yes. The H^0/H^1 framework is developed for any algebraic group as a pointed set (non-abelian for H^1); higher H^i is the standard derived functor for abelian coefficients."
tags:
- galois-cohomology
- descent-and-forms
---

# Galois Cohomology

**Galois cohomology** is the cohomology of the absolute Galois group
\(\Gamma = \operatorname{Gal}(\bar k/k)\) with values in
\(\Gamma\)-modules — equivalently, the derived functor of "fixed
points." For algebraic groups, it parametrises forms, twists, and
classifies arithmetic invariants of \(G/k\).

## Definition

Let \(k\) be a field with separable closure \(\bar k\) and absolute
Galois group \(\Gamma = \operatorname{Gal}(\bar k/k)\) (a profinite
group). For a continuous discrete \(\Gamma\)-module \(M\):

\[
H^i(k, M) \;:=\; H^i_{\mathrm{cont}}(\Gamma, M),
\]

the continuous cohomology. Equivalently, étale cohomology of
Spec \(k\) with values in \(M\):
\[
H^i(k, M) \;\cong\; H^i_{\mathrm{\acute{e}t}}(\mathrm{Spec}\, k, M).
\]

For an algebraic group \(G\) over \(k\) (possibly non-abelian), one
defines:

- \(H^0(k, G) := G(k)\), the rational points;
- \(H^1(k, G)\) := equivalence classes of 1-**cocycles**
  \(c : \Gamma \to G(\bar k)\) satisfying \(c_{\sigma \tau} = c_\sigma \cdot \sigma(c_\tau)\),
  modulo \(c_\sigma \sim g^{-1} c_\sigma \sigma(g)\) for \(g \in G(\bar k)\).

For \(G\) abelian (commutative), \(H^i(k, G)\) is defined for all
\(i \ge 0\) by standard cocycle/coboundary formulas. For \(G\)
non-abelian, only \(H^0\) and \(H^1\) are defined, the latter as a
**pointed set**.

## Hilbert 90

**Theorem (Hilbert 90).**
\[
H^1(k, \mathbb{G}_m) \;=\; H^1(k, \mathrm{GL}_n) \;=\; 0
\]
for any field \(k\). For \(\mathbb{G}_m\) the proof goes back to
Kummer/Hilbert; for \(\mathrm{GL}_n\) the result expresses the
triviality of the **Brauer-Severi variety** in degree 0.

Consequence: every form of \(\mathrm{GL}_n\) over \(k\) twisted by a
1-cocycle is trivial, so all forms of \(\mathrm{GL}_n\) arise as
**inner forms** (twists by \(\mathrm{PGL}_n = \mathrm{Aut}(\mathrm{GL}_n)\)).

## Long exact sequence

For a short exact sequence of \(\Gamma\)-modules (or algebraic groups)
\(1 \to A \to B \to C \to 1\):

\[
1 \to H^0(k, A) \to H^0(k, B) \to H^0(k, C) \to H^1(k, A) \to H^1(k, B) \to H^1(k, C) \to \cdots
\]

(further only if \(A\) is in the centre of \(B\); for non-central
extensions the sequence stops after \(H^1\)).

The connecting map \(H^0(k, C) \to H^1(k, A)\) is the source of all
**obstructions** in descent problems.

## Cohomological dimension

A field \(k\) has **cohomological dimension** \(\mathrm{cd}(k) \le n\)
if \(H^i(k, M) = 0\) for all torsion modules \(M\) and all \(i > n\).
Key cases:

| \(k\) | \(\mathrm{cd}(k)\) | \(H^1(k, G)\) for connected \(G\) |
|---|---|---|
| Algebraically closed | 0 | 0 |
| Finite | 1 | 0 (Lang's theorem) |
| Function field \(k(C)\), \(C\)/\(\bar k\) | 1 | 0 |
| Non-archimedean local field | 2 | non-trivial for semisimple groups (e.g.\ \(\mathrm{PGL}_n\)) |
| Number field | 2 (away from real places) | non-trivial, but Hasse principle applies |
| \(\mathbb{R}\) | \(\infty\) (because \(\mathbb{Z}/2\)) | real forms classified by \(H^1\) |

## The Brauer group

\(H^2(k, \mathbb{G}_m) = \mathrm{Br}(k)\), the **Brauer group** of
\(k\). Classifies:

- Central simple \(k\)-algebras of any rank (via Wedderburn) up to
  Morita equivalence;
- Inner forms of \(\mathrm{PGL}_n\): \(\mathrm{Br}(k)[n]\) is the
  \(n\)-torsion;
- Galois algebras of period \(n\).

For local fields: \(\mathrm{Br}(F) = \mathbb{Q}/\mathbb{Z}\) (canonical iso
via Hasse invariant). For number fields: exact sequence
\(0 \to \mathrm{Br}(F) \to \bigoplus_v \mathrm{Br}(F_v) \to \mathbb{Q}/\mathbb{Z} \to 0\)
(Albert-Brauer-Hasse-Noether).

## Galois cohomology of tori

For a torus \(T\) over \(k\) split by \(K\):
\[
H^i(k, T) \;=\; H^i(\mathrm{Gal}(K/k), T(K)),
\]
computable via the character lattice \(X^*(T)\) as a Galois module.

For \(T\) a norm torus or Weil restriction: explicit computations via
Shapiro's lemma.

## Local-global principles

For a connected reductive group \(G\) over a global field \(F\), the
**Tate–Shafarevich set** is
\[
\Sha^1(F, G) \;:=\; \ker\Big(H^1(F, G) \to \prod_v H^1(F_v, G)\Big).
\]

**Hasse principle (when it holds):** \(\Sha^1(F, G) = 0\), i.e.\ a
\(G\)-torsor is trivial iff it is locally trivial everywhere. Holds
for many \(G\) (Kneser, Harder, Chernousov: for simply connected
semisimple \(G\) over number fields).

Failure of Hasse principle is measured by \(\Sha^1\) and is itself a
deep arithmetic invariant.

## Role in Langlands

- **Forms of \(G\)**: classified by \(H^1(k, \mathrm{Aut}(G))\); inner
  forms by \(H^1(k, G_{\mathrm{ad}})\); outer forms by the diagram
  automorphism component.
- **Endoscopy** depends on \(H^1\) of \(G\) and its endoscopic
  groups.
- **Kottwitz invariants** \(\kappa : B(G) \to \pi_1(G)_\Gamma\) and
  \(H^1\) are unified by Borovoi's abelianised Galois cohomology.
- **Global Langlands**: \(\Sha^1\) is part of the input to the trace
  formula and stable trace formula.

## References

- Serre, *Cohomologie Galoisienne* (1964).
- Platonov–Rapinchuk, *Algebraic Groups and Number Theory* (1994).
- Milne, *Arithmetic Duality Theorems* (2006).
- Conrad, *Math 252: Galois Cohomology* (notes).

## Prerequisite Topics

- [[node:descent_and_forms.galois_groups_and_descent_data|Galois Groups and Descent Data]]
