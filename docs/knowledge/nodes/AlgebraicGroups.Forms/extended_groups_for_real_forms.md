---
id: forms.extended_groups_for_real_forms
title: Extended Groups for Real Forms
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
uses:
- forms.real_forms
- forms.inner_forms
- linear_algebraic_groups.automorphism_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are extended groups for real forms defined uniformly with the ABV formalism?"
  verdict: "Yes. The extended group is a semidirect product of the complex group with the Galois group of C/R; it parametrises all real forms simultaneously."
tags:
- extended-groups
- real-forms
- descent-and-forms
---

# Extended Groups for Real Forms

The **extended group** \(G^\Gamma\) (in the ABV formalism) is a semi-
direct product of the complex reductive group with the absolute Galois
group of \(\mathbb{C}/\mathbb{R}\). It is the natural setting for
parametrising all real forms (and their L-packets) simultaneously.

## Definition

For a connected reductive complex group \(G_\mathbb{C}\), let
\(\Gamma = \mathrm{Gal}(\mathbb{C}/\mathbb{R}) = \mathbb{Z}/2\), and
let \(\theta : G_\mathbb{C} \to G_\mathbb{C}\) be a fixed Cartan
involution (an inner automorphism realising the compact form).

The **extended group** is
\[
G^\Gamma \;:=\; G_\mathbb{C} \;\rtimes\; \mathbb{Z}/2,
\]
where the non-trivial element of \(\mathbb{Z}/2\) acts by an
anti-holomorphic involution \(\delta\) realising one of the real forms.

The "double coset" structure of \(G^\Gamma\) encodes all the real
forms simultaneously: each real form corresponds to a conjugacy class
of involutions in \(G^\Gamma\) lifting the non-trivial element of
\(\mathbb{Z}/2\).

## Strong real forms via \(G^\Gamma\)

A **strong real form** corresponds to a specific conjugacy class of
order-2 elements in \(G^\Gamma\) projecting non-trivially. Two strong
real forms differing by an inner automorphism correspond to elements
in the same \(G_\mathbb{C}\)-conjugacy class within \(G^\Gamma\).

The set
\[
\mathcal{X}(G^\Gamma) \;:=\; \{g \in G^\Gamma : g^2 = 1, \;g \notin G_\mathbb{C}\} / G_\mathbb{C}\text{-conj}
\]
classifies strong real forms.

## Why the extended group?

- **Uniform framework**: all real forms appear as conjugacy classes
  in a single object.
- **Canonical Cartan**: the choice of base Cartan involution
  \(\theta\) makes the construction work coherently across forms.
- **Cohomology**: \(H^1(\mathbb{R}, G_\mathbb{C}) = H^1(\Gamma, G_\mathbb{C}(\mathbb{C}))\)
  is computable via standard group-cohomology techniques on the
  semidirect product.

## ABV book setting

In the Adams-Barbasch-Vogan book (1992), the extended group is the
fundamental object for stating and proving the local Langlands
correspondence at \(\mathbb{R}\). The L-parameter
\(\varphi : W_\mathbb{R} \to {}^L G\) and the strong real form
\((G_\mathbb{R}, \delta)\) are paired via the extended group:

- \(W_\mathbb{R}\) has a specific structure with non-trivial Frobenius
  \(j\) (with \(j^2 = -1\)) — a non-trivial central extension of
  \(\mathbb{Z}/2\) by \(\mathbb{C}^\times\).
- The map \(\varphi\) lands in \({}^L G = \hat G \rtimes \Gamma\), and
  the "Vogan duality" matches it with strong-form data via the
  extended group.

## Examples

### \(G = \mathrm{SL}_2\)

\(G^\Gamma = \mathrm{SL}_2(\mathbb{C}) \rtimes \mathbb{Z}/2\) (with
the non-trivial Galois acting by complex conjugation followed by
transpose-inverse). Two real forms:

- Trivial conjugacy class of involutions → \(\mathrm{SU}(2)\) (compact).
- Non-trivial conjugacy class → \(\mathrm{SL}_2(\mathbb{R})\) (split).

### \(G = \mathrm{GL}_n\)

Multiple real forms (\(\mathrm{GL}_n(\mathbb{R})\), \(\mathrm{U}(p, q)\),
\(\mathrm{GL}_n(\mathbb{H})\) for \(n\) even) all appear as
conjugacy classes in \(G^\Gamma\).

## Generalisations to \(p\)-adic and global

For \(p\)-adic fields: the analogous construction uses a Galois gerbe
(Kaletha), not just a semidirect product, because \(H^1(F, G)\) is
generally more complex.

For global fields: the global ABV / Kaletha framework uses a global
Galois gerbe and the "Hasse-principle gerbe" connecting it to local
data at all places.

## Role in Langlands

- **Real L-packets**: the ABV parametrisation indexes packets by
  representations of component groups of L-parameters within
  \(G^\Gamma\).
- **Kazhdan-Lusztig polynomials**: real KL polynomials are computed
  on the extended group, controlling composition multiplicities of
  cohomological induction.
- **Vogan duality**: an involution on representations realised at the
  level of the extended group.

## References

- Adams–Barbasch–Vogan, *The Langlands Classification and Irreducible
  Characters for Real Reductive Groups* (1992).
- Vogan, *Representations of Real Reductive Lie Groups* (1981).
- Borel, *Automorphic L-functions* (Corvallis 1979), §10.

## Prerequisite Topics

- [[node:forms.real_forms|Real Forms]]
- [[node:forms.inner_forms|Inner Forms]]
- [[node:linear_algebraic_groups.automorphism_groups|Automorphism Groups]]
