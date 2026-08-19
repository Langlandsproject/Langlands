---
id: forms.real_forms
title: Real Forms
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
uses:
- forms.rational_forms_of_reductive_groups
- forms.inner_forms
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are real forms of reductive groups classified uniformly via Cartan involutions and Vogan diagrams, not specialised to one type?"
  verdict: "Yes. Real forms of complex reductive groups are in bijection with conjugacy classes of Cartan involutions; Vogan diagrams provide a uniform combinatorial classification."
tags:
- real-forms
- descent-and-forms
---

# Real Forms

A **real form** of a complex reductive group \(G_\mathbb{C}\) is an
\(\mathbb{R}\)-form: a real algebraic group \(G_\mathbb{R}\) with
\(G_\mathbb{R} \otimes_\mathbb{R} \mathbb{C} \cong G_\mathbb{C}\).
Real forms are classified by Cartan involutions, and they give the
real Lie groups of "classical Lie theory."

## Definition

For a connected reductive algebraic group \(G_\mathbb{C}\) over
\(\mathbb{C}\), a **real form** is an algebraic group \(G_\mathbb{R}\)
over \(\mathbb{R}\) such that
\[
G_\mathbb{R} \otimes_\mathbb{R} \mathbb{C} \;\cong\; G_\mathbb{C}.
\]

Equivalently: a \(\mathbb{C}\)-anti-linear involution
\(\sigma : G_\mathbb{C} \to G_\mathbb{C}\) (with
\(G_\mathbb{R} = G_\mathbb{C}^\sigma\)) commuting with the group
structure.

## Classification via Galois cohomology

\(\mathrm{Gal}(\mathbb{C}/\mathbb{R}) = \mathbb{Z}/2\), so:
\[
\{\text{real forms of } G_\mathbb{C}\} \;\cong\; H^1(\mathbb{R}, \mathrm{Aut}(G_\mathbb{C})).
\]

The Galois cohomology of \(\mathrm{Aut}(G_\mathbb{C})\) decomposes into
inner and outer parts via the exact sequence:
\[
1 \to G_{\mathbb{C}, \mathrm{ad}} \to \mathrm{Aut}(G_\mathbb{C}) \to \mathrm{Out}(G_\mathbb{C}) \to 1.
\]

## Cartan involutions

A **Cartan involution** of a real Lie group \(G_\mathbb{R}\) is an
involution \(\theta : G_\mathbb{R} \to G_\mathbb{R}\) such that
\(K = G_\mathbb{R}^\theta\) is a maximal compact subgroup.

**Theorem (Cartan).** Every connected reductive real Lie group has a
Cartan involution, unique up to inner automorphism by an element of
\(K\). The bijection:
\[
\{\text{real forms of } G_\mathbb{C}\}/\mathrm{conj} \;\stackrel{\sim}{\longleftrightarrow}\; \{\text{Cartan involutions of complex form}\}/\mathrm{conj}.
\]

## Examples

### Real forms of \(\mathrm{SL}_n(\mathbb{C})\)

| Form | Description |
|---|---|
| \(\mathrm{SL}_n(\mathbb{R})\) | split form |
| \(\mathrm{SU}(n)\) | compact form |
| \(\mathrm{SU}(p, q)\), \(p + q = n\) | mixed signature; inner forms of split |
| \(\mathrm{SL}_n(\mathbb{H}) = \mathrm{SU}^*(2n)\), \(n\) even | quaternionic; outer form |

### Real forms of \(\mathrm{Spin}_{2n+1}(\mathbb{C})\)

\(\mathrm{Spin}(p, q)\) for \(p + q = 2n+1\); the compact form is
\(\mathrm{Spin}(2n+1)\).

### Real forms of exceptional groups

| Type | Compact | Split | Intermediate |
|---|---|---|---|
| \(G_2\) | \(G_{2(-14)}\) | \(G_{2(2)}\) | — |
| \(F_4\) | \(F_{4(-52)}\) | \(F_{4(4)}\) | \(F_{4(-20)}\) |
| \(E_6\) | \(E_{6(-78)}\) | \(E_{6(6)}\) | \(E_{6(-26)}, E_{6(-14)}, E_{6(2)}\) (and \({}^2 E_6\) forms) |
| \(E_7\) | compact | split \(E_{7(7)}\) | various intermediates |
| \(E_8\) | compact | split \(E_{8(8)}\) | \(E_{8(-24)}\) |

The notation \(E_{6(s)}\) records the **signature** \(s\) of the
Killing form on the Lie algebra (= dim non-compact minus dim
compact).

## Compact and split forms

Two distinguished real forms:

- **Compact form**: \(K \le G_\mathbb{R}\) is a maximal compact
  subgroup; for the compact form, \(K = G_\mathbb{R}\) (so
  \(G_\mathbb{R}\) is itself compact).
- **Split form**: maximal \(\mathbb{R}\)-split torus has dimension =
  rank of \(G_\mathbb{C}\); equivalently, \(G_\mathbb{R}\) has the
  largest possible Cartan subgroup defined over \(\mathbb{R}\).

Every semisimple complex group has a unique compact form (up to
isomorphism) and a unique split form.

## Vogan diagrams

A **Vogan diagram** is a Dynkin diagram with additional decorations
encoding a real form:
- Vertices coloured "compact" or "non-compact" (black/white circles);
- Optional diagram automorphism (for outer real forms).

**Theorem (Borel-de Siebenthal, Vogan).** Vogan diagrams classify
real forms of complex semisimple Lie algebras up to inner
automorphism.

## Cartan decomposition

For a real form \(G_\mathbb{R}\) with Cartan involution \(\theta\):
\[
\mathfrak{g}_\mathbb{R} \;=\; \mathfrak{k} \;\oplus\; \mathfrak{p},
\]
where \(\mathfrak{k} = \mathfrak{g}_\mathbb{R}^\theta\) (Lie algebra
of \(K\)) and \(\mathfrak{p} = \mathfrak{g}_\mathbb{R}^{-\theta}\)
(the "non-compact" direction).

The Killing form is negative-definite on \(\mathfrak{k}\) and
positive-definite on \(\mathfrak{p}\); this is the foundation of
symmetric-space theory.

## Restricted root system

The action of \(\mathfrak{a} \subseteq \mathfrak{p}\) (a maximal
abelian subalgebra) on \(\mathfrak{g}_\mathbb{R}\) decomposes
\(\mathfrak{g}_\mathbb{R}\) into **restricted root spaces**, with the
non-zero weights forming the **restricted root system**.

The restricted root system can be smaller than the absolute root
system (and need not be reduced — type \(BC_n\) occurs).

## Role in Langlands

- **Real Langlands**: parameters \(W_\mathbb{R} \to {}^L G\) where
  \(W_\mathbb{R}\) is the Weil group of \(\mathbb{R}\) (an extension of
  \(\mathbb{Z}/2\) by \(\mathbb{C}^\times\)).
- **Discrete series**: real reductive groups with equal-rank
  maximal compact subgroup carry discrete series representations
  (Harish-Chandra). The condition is real-form-specific.
- **Vogan-Zuckerman duality**: relates real-form L-packets to
  cohomological packets via Vogan-Zuckerman cohomological induction.

## Mathlib

Not formalised; depends on real-Lie-algebra infrastructure.

## References

- Helgason, *Differential Geometry, Lie Groups, and Symmetric Spaces*
  (1978).
- Knapp, *Lie Groups Beyond an Introduction* (2002).
- Onishchik–Vinberg, *Lie Groups and Algebraic Groups* (1990).
- Vogan, *Representations of Real Reductive Lie Groups* (1981).

## Prerequisite Topics

- [[node:forms.rational_forms_of_reductive_groups|Rational Forms of Reductive Groups]]
- [[node:forms.inner_forms|Inner Forms]]
