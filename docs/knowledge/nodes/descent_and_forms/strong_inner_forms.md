---
id: descent_and_forms.strong_inner_forms
title: Strong Inner Forms
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.strong_real_forms
- descent_and_forms.inner_forms
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are strong inner forms (Adams-Barbasch-Vogan formalism) treated uniformly for real and p-adic reductive groups?"
  verdict: "Yes. Adams-Barbasch-Vogan introduced strong inner forms for real groups; the construction generalises to p-adic via the ABV-Kaletha framework."
tags:
- strong-inner-forms
- abv
- descent-and-forms
---

# Strong Inner Forms

A **strong inner form** (Adams-Barbasch-Vogan) is an inner form
equipped with an additional rigidifying datum (a "strong real form"
in the real case). Strong inner forms provide a Vogan-style
parametrisation of L-packets that is canonical and includes a "central
character" refinement.

## Definition (real case)

A **strong real form** of a complex reductive group \(G_\mathbb{C}\)
is a pair \((G_\mathbb{R}, \delta)\) where:

- \(G_\mathbb{R}\) is a real form of \(G_\mathbb{C}\);
- \(\delta \in G_\mathbb{R}^*\) (a section of complex conjugation,
  i.e.\ a specific anti-holomorphic involution of \(G_\mathbb{C}\)
  realising the form).

Two strong real forms \((G_\mathbb{R}, \delta)\) and \((G_\mathbb{R}', \delta')\)
are equivalent if there is an inner automorphism of \(G_\mathbb{C}\)
intertwining them.

## Strong inner forms for general fields

For a connected reductive \(G\) over an arbitrary field \(k\):

A **strong inner form** is a triple \((G^*, \delta, \omega)\) where:
- \(G^*\) is an inner form of \(G\);
- \(\delta : G \to G^*\) is a specific inner-twisting isomorphism over
  \(\bar k\);
- \(\omega\) is a "central character" lift specifying the central data
  of the cocycle.

The triple data is what makes the inner form **strong**: the central
character lifts the cocycle from \(H^1(k, G_{\mathrm{ad}})\) to a
finer set parametrising both forms and central data.

## Adams-Barbasch-Vogan parametrisation

**Theorem (ABV).** For a real reductive Lie group \(G_\mathbb{R}\),
the L-packet of an L-parameter \(\varphi\) on a strong real form
\((G_\mathbb{R}, \delta)\) is canonically parametrised by
**irreducible representations of the component group** \(S_\varphi^+\)
of the centraliser of \(\varphi\) in \(\hat G\).

The bijection
\[
\Pi_\varphi(G_\mathbb{R}, \delta) \;\stackrel{\sim}{\longleftrightarrow}\; \mathrm{Irr}(S_\varphi^+)
\]
depends on the strong-form data \((G_\mathbb{R}, \delta)\); changing
\(\delta\) changes the basepoint of the bijection.

## Examples

### \(\mathrm{SL}_2(\mathbb{R})\) and \(\mathrm{SU}(2)\)

The two real forms of \(\mathrm{SL}_2(\mathbb{C})\); each has strong-
form refinements determined by the choice of involution and a sign
\(\pm\) for the central character lift.

### Discrete series of \(\mathrm{SL}_2(\mathbb{R})\)

L-packets for \(\mathrm{SL}_2(\mathbb{R})\) contain pairs of discrete
series; strong-form data distinguishes them. The "holomorphic" vs.\
"anti-holomorphic" discrete series correspond to the two strong-form
choices.

## Relation to other refinements

| Refinement | Data | Reference |
|---|---|---|
| Inner form | \(H^1(k, G_{\mathrm{ad}})\) | classical Vogan |
| Pure inner twist | \(H^1(k, G)\) | Vogan 1993 |
| Strong inner form | + central character lift | ABV 1992 |
| Rigid inner twist | Galois gerbe | Kaletha 2016 |

Each refinement is a finer parametrisation of L-packet members; rigid
inner twists give the most canonical version.

## Role in Langlands

- **Real Langlands**: ABV parametrisation is the foundation of the
  real local Langlands correspondence.
- **Vogan's \(\mathrm{PSL}_2(\mathbb{C})\)-trick**: passing between
  strong forms and ordinary forms via Galois cohomology of the centre.
- **Arthur's parameters**: Arthur's classification for orthogonal and
  symplectic groups uses strong-form data implicitly.

## References

- Adams–Barbasch–Vogan, *The Langlands Classification and Irreducible
  Characters for Real Reductive Groups* (Progress in Math.\ 1992).
- Vogan, *The local Langlands conjecture* (in: Representation Theory
  of Groups and Algebras, AMS 1993).
- Kaletha, *Rigid inner forms of real and p-adic groups* (Annals
  2016).

## Prerequisite Topics

- [[node:descent_and_forms.strong_real_forms|Strong Real Forms]]
- [[node:descent_and_forms.inner_forms|Inner Forms]]
