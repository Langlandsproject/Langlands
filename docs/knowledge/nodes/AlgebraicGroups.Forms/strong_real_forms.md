---
id: forms.strong_real_forms
title: Strong Real Forms
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
uses:
- forms.extended_groups_for_real_forms
- forms.real_forms
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are strong real forms treated as the basic refinement of real forms in the ABV / Vogan formalism?"
  verdict: "Yes. A strong real form is a real form together with a chosen anti-holomorphic involution; the construction is uniform across reductive groups."
tags:
- strong-real-forms
- abv
- descent-and-forms
---

# Strong Real Forms

A **strong real form** of a complex reductive group is a real form
together with a chosen anti-holomorphic involution realising it. Strong
real forms are the basic data for the Adams-Barbasch-Vogan (ABV)
parametrisation of L-packets at real places.

## Definition

Let \(G_\mathbb{C}\) be a connected reductive complex algebraic group.

A **strong real form** of \(G_\mathbb{C}\) is a pair
\((G_\mathbb{R}, \delta)\) where:

- \(G_\mathbb{R}\) is a real form of \(G_\mathbb{C}\) (i.e.\
  \(G_\mathbb{R} \otimes \mathbb{C} \cong G_\mathbb{C}\));
- \(\delta : G_\mathbb{C} \to G_\mathbb{C}\) is the anti-holomorphic
  involution whose fixed point group is \(G_\mathbb{R}(\mathbb{R})\).

Two strong real forms \((G_\mathbb{R}, \delta)\) and
\((G_\mathbb{R}', \delta')\) are **equivalent** if there is an inner
automorphism \(\mathrm{Int}(g)\) of \(G_\mathbb{C}\) such that
\(\delta' = \mathrm{Int}(g) \circ \delta \circ \mathrm{Int}(g)^{-1}\).

## Equivalence with cocycles

A strong real form is equivalent to a 1-cocycle
\(c : \mathrm{Gal}(\mathbb{C}/\mathbb{R}) \to G_\mathbb{C}(\mathbb{C})\)
(not just into \(G_{\mathrm{ad}}(\mathbb{C})\), as for ordinary inner
forms). Two cocycles are equivalent iff cohomologous in \(H^1(\mathbb{R}, G_\mathbb{C})\).

So strong real forms correspond to elements of
\[
H^1(\mathbb{R}, G_\mathbb{C}) \;=\; H^1(\mathbb{Z}/2, G_\mathbb{C}(\mathbb{C})).
\]

(Cf.\ ordinary inner forms = \(H^1(\mathbb{R}, G_{\mathrm{ad}})\); strong
forms include the central character data.)

## Examples

### \(\mathrm{SL}_2(\mathbb{C})\)

Strong real forms = elements of \(H^1(\mathbb{R}, \mathrm{SL}_2(\mathbb{C})) = \{\pm 1\}\):

- \(c = 1\) (trivial): strong real form = \(\mathrm{SL}_2(\mathbb{R})\)
  (split).
- \(c = -1\): strong real form = \(\mathrm{SU}(2)\) (compact).

These match the **ordinary** real forms (only two), but the strong-
form data records the **central character lift** of the inner form
data.

### \(\mathrm{GL}_n(\mathbb{C})\)

Real forms are \(\mathrm{GL}_n(\mathbb{R})\), \(\mathrm{U}(n)\),
\(\mathrm{U}(p, q)\), \(\mathrm{GL}_n(\mathbb{H})\) (for \(n\) even).
Strong real forms refine these by central character data.

### Outer real forms

For \(D_n\), \(E_6\): the outer real forms have strong-form
refinements with further central data; the **triality** strong forms
of \(D_4\) are an example.

## Relation to Cartan involutions

A strong real form determines a **Cartan involution** of \(G_\mathbb{R}\)
up to inner conjugacy: take \(\theta = \delta \cdot \tau\) where
\(\tau\) is the compact involution. The choice of \(\delta\) (modulo
inner) gives the Cartan involution (modulo inner).

So:
\[
\{\text{strong real forms}\}/\sim \;\stackrel{\sim}{\longleftrightarrow}\; \{\text{Cartan involutions of } G_\mathbb{R}\}/\mathrm{inner}.
\]

## Local Langlands at \(\mathbb{R}\)

For an L-parameter \(\varphi : W_\mathbb{R} \to {}^L G\), the
**Adams-Barbasch-Vogan** L-packet at a strong real form
\((G_\mathbb{R}, \delta)\) is:
\[
\Pi_\varphi(G_\mathbb{R}, \delta) \;\stackrel{\sim}{\longleftrightarrow}\; \mathrm{Irr}(S_\varphi^+),
\]
the irreducible representations of the (extended) component group
\(S_\varphi^+ = \pi_0(Z_{\hat G}(\varphi))\).

The choice of strong-form data is essential to make the bijection
canonical; without it, the bijection depends on arbitrary choices.

## Role in Langlands

- **ABV book**: the foundational work for real local Langlands;
  packets indexed by strong real forms.
- **Vogan duality**: pairs of L-packets across strong real forms
  related by an involutive duality.
- **Kaletha extension**: strong real forms are the prototype that
  generalises to rigid inner twists in the \(p\)-adic case.

## References

- Adams–Barbasch–Vogan, *The Langlands Classification and Irreducible
  Characters for Real Reductive Groups* (Progress in Math.\ 1992).
- Vogan, *Representations of Real Reductive Lie Groups* (Progress in
  Math.\ 1981).
- Knapp, *Lie Groups Beyond an Introduction* (2002).

## Prerequisite Topics

- [[node:forms.extended_groups_for_real_forms|Extended Groups for Real Forms]]
- [[node:forms.real_forms|Real Forms]]
