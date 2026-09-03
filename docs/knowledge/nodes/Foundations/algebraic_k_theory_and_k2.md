---
id: foundations.algebraic_k_theory_and_k2
title: Algebraic K-Theory and K2
kind: topic
status: admitted
primary_topic: Foundations
topics:
- Foundations
uses:
- foundations.commutative_algebra
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is K-theory treated at the level needed for the BD-covers and metaplectic-covers chapter, not the full higher K-theory?"
  verdict: "Yes. The scope is K_0, K_1, K_2 (Milnor K-theory plus the Steinberg / tame symbol presentation) — exactly what BD covers require."
tags:
- external-background
- k-theory
- k2
- foundational-inputs
---

# Algebraic K-Theory and K2

Algebraic \(K\)-theory provides the cohomological tools needed to
construct and classify **central extensions of algebraic groups**. The
relevant pieces for the Langlands roadmap are \(K_0\), \(K_1\), and
\(K_2\) (Milnor's "low-dimensional" K-theory), which are exactly the
ingredients of the **Brylinski–Deligne covers** ([[node:covers.brylinski_deligne_k2_extensions|BD
\(K_2\)-extensions]]).

## K_0, K_1, K_2

### \(K_0(R)\)

The Grothendieck group of finitely generated projective \(R\)-modules.
For a field, \(K_0(F) = \mathbb{Z}\); for a Dedekind domain,
\(K_0(R) = \mathbb{Z} \oplus \operatorname{Pic}(R)\). Records "rank" and
"determinant" information.

### \(K_1(R)\)

\(K_1(R) = \operatorname{GL}(R)^{\mathrm{ab}} = \operatorname{GL}(R) / [\operatorname{GL}(R), \operatorname{GL}(R)]\).
For a commutative ring (with mild hypotheses),
\(K_1(R) = R^\times \times \operatorname{SK}_1(R)\) where
\(\operatorname{SK}_1(R)\) is the kernel of the determinant; for a
field, \(K_1(F) = F^\times\).

### \(K_2(R)\) (Milnor)

The **Steinberg group** \(\operatorname{St}(R)\) is presented by
generators \(x_{ij}(r)\) (for \(i \ne j\) and \(r \in R\)) subject to
the Steinberg relations. There is a surjection
\(\operatorname{St}(R) \twoheadrightarrow E(R)\) (elementary matrices)
whose kernel is **\(K_2(R)\)**:

\[
1 \to K_2(R) \to \operatorname{St}(R) \to E(R) \to 1.
\]

This is the universal central extension of \(E(R)\). For a field \(F\),
Matsumoto's theorem gives a presentation of \(K_2(F)\) by **symbols**
\(\{a, b\}\) for \(a, b \in F^\times\) modulo bilinearity and the
Steinberg relation \(\{a, 1 - a\} = 1\).

### Milnor \(K_*^M\)

Higher Milnor \(K\)-groups \(K_n^M(F) = (F^\times)^{\otimes n} / \text{Steinberg}\)
extend the \(K_2\) symbol picture. They have a coherent structure
parallel to Galois cohomology (the Bloch–Kato conjecture, now theorem).

## Tame symbols and reciprocity

For a discrete valuation \(v : F^\times \to \mathbb{Z}\) with residue
field \(k\), the **tame symbol** is the bilinear map

\[
\{-,-\}_v \colon K_2(F) \to k^\times, \qquad
\{a, b\}_v = (-1)^{v(a) v(b)} \cdot \overline{a^{v(b)} b^{-v(a)}}.
\]

These symbols satisfy a **reciprocity law** for curves over a field:
the sum over all closed points of the tame symbols of a pair of
rational functions is trivial.

## Connection to algebraic groups

- \(K_1(R) = \operatorname{GL}(R)^{\mathrm{ab}}\) is essentially the
  group of units \(R^\times\) (when commutative + nice).
- \(K_2(R)\) is the universal central extension of
  \(\operatorname{SL}(R)\) (equivalently, \(E(R)\)).
- For \(G\) a split semisimple simply connected algebraic group over a
  ring \(R\), \(G(R)\) has a universal central extension by \(K_2(R)\).
- The **Brylinski–Deligne theory** constructs central extensions of
  reductive groups by \(K_2\), parametrising metaplectic covers in a
  uniform way over local and global fields.

## Mathlib formalisation

Mathlib has limited K-theory at present. The relevant pieces:

- `Mathlib.Algebra.Module.LinearMap.Basic` and friends — modules over a
  ring, projective modules.
- `Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs` — the abstract
  group \(\operatorname{GL}_n(R)\).
- No native \(K_n(R)\) typeclass — to be developed.

## References

- Milnor, *Introduction to Algebraic K-Theory* (Annals of Mathematics
  Studies 72, 1971).
- Weibel, *The K-Book: An Introduction to Algebraic K-Theory* (AMS
  GSM 145, 2013).
- Bass, *Algebraic K-Theory* (Benjamin, 1968).
- Brylinski–Deligne, *Central extensions of reductive groups by \(K_2\)*
  (Publ. IHÉS 94, 2001).

## Prerequisite Topics

- [[node:foundations.commutative_algebra|Commutative Algebra]]
