---
id: forms.nonabelian_h1
title: Nonabelian H1
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
uses:
- forms.galois_cohomology
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is non-abelian H^1 treated as a pointed set for arbitrary group-valued sheaves, not just for commutative coefficients?"
  verdict: "Yes. The definition via 1-cocycles modulo equivalence works for any (possibly non-abelian) group; the loss of group structure compared to the abelian case is flagged."
tags:
- nonabelian-h1
- descent-and-forms
---

# Nonabelian H1

**Non-abelian \(H^1\)** is the pointed set classifying torsors under a
non-commutative group. It is the first cohomology that survives when
the coefficient group is non-abelian, but only as a pointed set —
group structure is lost.

## Definition

Let \(\Gamma\) be a topological group and \(A\) a topological
\(\Gamma\)-group (a group on which \(\Gamma\) acts continuously by
group automorphisms, not necessarily abelian).

A **1-cocycle** is a continuous map \(c : \Gamma \to A\) satisfying
\[
c_{\sigma \tau} \;=\; c_\sigma \cdot \sigma(c_\tau).
\]

Two cocycles \(c, c'\) are **cohomologous** if there exists \(a \in A\)
with
\[
c'_\sigma \;=\; a^{-1} c_\sigma \sigma(a) \quad \text{for all } \sigma.
\]

The set of equivalence classes is the **first cohomology pointed set**:
\[
H^1(\Gamma, A) \;:=\; Z^1(\Gamma, A) / \sim,
\]
with the trivial cocycle \(c \equiv 1\) as basepoint.

## Why "pointed set" and not "group"

When \(A\) is non-abelian, the natural multiplication of cocycles
\((c \cdot c')_\sigma = c_\sigma c'_\sigma\) does **not** generally
satisfy the cocycle condition. So \(H^1\) is only a set with
distinguished basepoint, not a group.

For \(A\) abelian: \(H^1(\Gamma, A)\) recovers the usual group
structure.

## Long exact sequence (partial)

For a short exact sequence of \(\Gamma\)-groups
\(1 \to A \to B \to C \to 1\):

\[
1 \to A^\Gamma \to B^\Gamma \to C^\Gamma \to H^1(\Gamma, A) \to H^1(\Gamma, B) \to H^1(\Gamma, C)
\]

is exact as **pointed sets**. The sequence does NOT extend to higher
cohomology in general.

If \(A\) is **central** in \(B\), the sequence extends one more step:
\[
\ldots \to H^1(\Gamma, C) \to H^2(\Gamma, A),
\]
because \(A\) is then abelian and the obstruction map to "lifting" a
\(C\)-cocycle to a \(B\)-cocycle is well-defined.

## Twisting and "different basepoints"

For \(c \in Z^1(\Gamma, A)\) and a \(\Gamma\)-\(A\)-set \(X\), the
**twist** \(X^c\) has the same underlying set as \(X\) but with new
\(\Gamma\)-action \(\sigma \cdot_c x = c_\sigma \sigma(x)\). Twisting
yields:

- A bijection of pointed sets (after re-basing)
  \(H^1(\Gamma, A) \cong H^1(\Gamma, A^c)\) where \(A^c\) is the
  inner-twisted group;
- A change of basepoint: the basepoint of \(H^1(\Gamma, A^c)\)
  corresponds to \([c]\) in \(H^1(\Gamma, A)\).

This is the standard tool for comparing different forms.

## Examples

### \(A = \mathrm{PGL}_n\)

\(H^1(k, \mathrm{PGL}_n) = \mathrm{Br}(k)[n]\): central simple
\(k\)-algebras of degree \(n^2\) modulo Brauer equivalence.

### \(A = \mathrm{O}(q)\)

\(H^1(k, \mathrm{O}(q))\) = quadratic forms of the same rank and
discriminant as \(q\).

### \(A = G_{\mathrm{ad}}\) for \(G\) reductive

\(H^1(k, G_{\mathrm{ad}})\) classifies **inner forms** of \(G\) over
\(k\). The exact sequence
\(1 \to Z(G) \to G \to G_{\mathrm{ad}} \to 1\) gives:
\[
G(k) \to G_{\mathrm{ad}}(k) \to H^1(k, Z(G)) \to H^1(k, G) \to H^1(k, G_{\mathrm{ad}}) \to H^2(k, Z(G)).
\]

### \(A = S_n\) (a finite group)

\(H^1(\Gamma, S_n)\) classifies degree-\(n\) étale algebras over \(k\)
— more concretely, \(n\)-element sets with a \(\Gamma\)-action up to
isomorphism.

## Vanishing theorems

- **Hilbert 90.** \(H^1(k, \mathrm{GL}_n) = 0\) for any field \(k\).
- **Lang's theorem.** \(H^1(\mathrm{Gal}(\bar{\mathbb{F}_q}/\mathbb{F}_q), G) = 0\)
  for any connected algebraic group \(G\) over \(\mathbb{F}_q\).
- **Steinberg.** For \(G\) simply connected semisimple over a field
  of cohomological dimension \(\le 1\): \(H^1(k, G) = 0\).
- **Bruhat-Tits, Kneser.** For \(G\) simply connected semisimple over
  a non-archimedean local field \(F\): \(H^1(F, G) = 0\). (Fails for
  real local fields.)

## Springer-style obstruction theory

The non-abelian \(H^1\) admits an analogue of long-exact sequence
**with obstructions in higher dimensional gerbe-cohomology**. The
modern formulation uses **2-groups (gr-stacks)** and 2-cocycles to
capture the obstruction more cleanly.

This is the technical underpinning of Kaletha's "rigid inner forms"
and the Galois-gerbe formalism for L-packets.

## Role in Langlands

- **Forms of reductive groups**: classified by \(H^1(k, \mathrm{Aut}(G_0))\).
- **Inner twists**: classes in \(H^1(k, G_{\mathrm{ad}})\).
- **Endoscopic data**: include sections of certain non-abelian \(H^1\)
  sequences.
- **Stable conjugacy**: two semisimple elements are stably conjugate
  iff the cocycle linking them is trivial in \(H^1(k, Z(G^*))\) for
  the centraliser \(G^*\) — a non-abelian comparison.

## References

- Serre, *Cohomologie Galoisienne* (1964), Ch. I.5.
- Borel, *Linear Algebraic Groups* (1991), §24.
- Platonov–Rapinchuk, *Algebraic Groups and Number Theory* (1994),
  Ch. 6.
- Giraud, *Cohomologie non-abélienne* (1971).

## Prerequisite Topics

- [[node:forms.galois_cohomology|Galois Cohomology]]
