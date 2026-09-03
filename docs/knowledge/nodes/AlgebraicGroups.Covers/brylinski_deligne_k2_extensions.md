---
id: covers.brylinski_deligne_k2_extensions
title: Brylinski-Deligne K2-Extensions
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Covers
topics:
- AlgebraicGroups.Covers
uses:
- reductive_groups.reductive_groups
- root_data.root_data
- covers.central_extensions_of_algebraic_groups
- foundations.algebraic_k_theory_and_k2
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Brylinski-Deligne K2-extensions defined for arbitrary reductive groups, with the classification by combinatorial data on the root datum?"
  verdict: "Yes. The framework applies to any (split) reductive group; the classification is by integer-valued symmetric bilinear forms on the cocharacter lattice plus an extra Hom-pairing for the centre."
tags:
- brylinski-deligne
- k2
- bd-covers
---

# Brylinski-Deligne K2-Extensions

A **Brylinski-Deligne extension** is a central extension of a reductive
group sheaf by the sheaf \(\mathbf{K}_2\) (Quillen's algebraic K-theory
sheaf). Such extensions provide the canonical framework for
**metaplectic covers** of reductive groups — the natural setting for
the Langlands programme for covering groups.

## Setup

Let \(X\) be a scheme (e.g.\ \(\mathrm{Spec}\, F\) for \(F\) a field).
The sheaf \(\mathbf{K}_2 = \mathbf{K}_2^M\) is the sheafification of
\(U \mapsto K_2^M(\Gamma(U, \mathcal{O}_U))\), with \(K_2^M\) the
second **Milnor K-theory group**. On a smooth scheme this agrees
with Quillen's \(K_2\) sheaf.

Let \(G\) be a connected reductive group over \(F\), regarded as an
fppf sheaf of groups.

## Definition

A **Brylinski-Deligne extension** of \(G\) by \(\mathbf{K}_2\) is a
short exact sequence of fppf sheaves of groups on the small Zariski
(or étale) site:
\[
1 \;\longrightarrow\; \mathbf{K}_2 \;\longrightarrow\; \tilde G \;\longrightarrow\; G \;\longrightarrow\; 1
\]
with \(\mathbf{K}_2\) central in \(\tilde G\).

Such extensions form an abelian category \(\mathrm{CExt}(G, \mathbf{K}_2)\)
under Baer sum.

## Classification (BD theorem)

**Theorem (Brylinski-Deligne, 2001).** For a split connected reductive
\(G\) over a field \(F\) with split maximal torus \(T\), root datum
\((X, \Phi, X^\vee, \Phi^\vee)\):

The category of Brylinski-Deligne extensions of \(G\) by \(\mathbf{K}_2\)
is equivalent to the category of triples \((Q, \mathcal{E}, \phi)\)
where:

1. \(Q : X^\vee \to \mathbb{Z}\) is a **Weyl-invariant integer-valued
   quadratic form** (\(Q(w \lambda) = Q(\lambda)\) for \(w \in W\)).
2. \(\mathcal{E}\) is a central extension of \(T\) by \(\mathbf{K}_2\)
   (equivalently: a bilinear form \(D : X^\vee \times X^\vee \to F^\times\)
   compatible with \(Q\)).
3. \(\phi\) is a compatibility datum linking the root subgroup
   extensions with \((Q, \mathcal{E})\).

For \(G\) semisimple simply connected, \(\mathcal{E}\) and \(\phi\) are
determined, so the classification reduces to: a Weyl-invariant
integer-valued quadratic form \(Q\) on \(X^\vee\).

## Examples

### \(G = \mathrm{SL}_n\)

\(X^\vee = \{(a_i) \in \mathbb{Z}^n : \sum a_i = 0\}\); the form is
\(Q(\lambda) = c \cdot \sum a_i^2\) for some \(c \in \mathbb{Z}\). The
extensions are classified by \(\mathbb{Z}\); the "fundamental" extension
is the **Steinberg-Matsumoto extension** (the universal central
extension of \(\mathrm{SL}_n\)).

### \(G = \mathbb{G}_m\)

The classifying data is a single element of \(F^\times\) (a "tame
symbol"); the resulting cover is the multiplicative analogue of the
Heisenberg group.

### Metaplectic double cover of \(\mathrm{SL}_2\)

The \(\mathbb{Z}/2\)-cover of \(\mathrm{SL}_2(F)\) (or
\(\mathrm{Sp}_{2n}(F)\)) used in the theory of theta correspondence
arises as a quotient of a Brylinski-Deligne extension by a suitable
subgroup of \(\mathbf{K}_2\).

## From BD extension to topological cover

Given a Brylinski-Deligne extension \(\tilde G\) of \(G\) by
\(\mathbf{K}_2\), and a local field \(F\) with a chosen continuous
character \(\chi : K_2(F) \to \mu_n\), one obtains a topological
central extension
\[
1 \;\to\; \mu_n \;\to\; \overline G \;\to\; G(F) \;\to\; 1.
\]

For \(F\) local, \(K_2(F)\) is computed via Moore's theorem; the
relevant characters factor through the **Hilbert symbol**
\((-, -)_n : F^\times \otimes F^\times \to \mu_n\).

This is the "geometric source" of metaplectic covers: BD extensions
provide the universal target, and the Hilbert symbol gives the
arithmetic realisation.

## Functoriality

BD extensions are functorial in \(G\):

- A morphism \(f : G \to H\) gives a pullback functor
  \(f^* : \mathrm{CExt}(H, \mathbf{K}_2) \to \mathrm{CExt}(G, \mathbf{K}_2)\).
- Galois descent works: \(\mathrm{CExt}(G_{\bar F}, \mathbf{K}_2)^{\Gamma}\)
  contains the \(F\)-rational extensions.

## Dual group for covers

For a BD extension classified by \((Q, \mathcal{E}, \phi)\), the
associated **dual group** is constructed by Weissman and others. For
the metaplectic \(n\)-cover of \(G\) at \((Q, \chi)\), the dual is a
new reductive group \(\hat G^{(n, Q)}\) whose root datum is twisted by
the bilinear form \(B_Q\) modulo \(n\).

For \(G = \mathrm{SL}_n\) and the standard \(Q\): the metaplectic dual
of the double cover of \(\mathrm{SL}_2\) is again \(\mathrm{PGL}_2\)
(self-dual case).

For higher-degree covers: the dual is a new group with rescaled coroots.

## Role in Langlands

- **Langlands programme for covers** (Gan, Weissman, Lysenko): the
  conjectural local and automorphic Langlands for metaplectic and
  general BD covers requires the BD-extension classification as input
  to construct the dual group.
- **Theta correspondence**: the metaplectic double cover of
  \(\mathrm{Sp}_{2n}(F)\) is the natural setting for the Weil
  representation and the local theta correspondence.
- **Eisenstein series for covers**: Eisenstein series on
  \(\overline G(\mathbb{A})\) (for global covers) generalise the
  classical metaplectic Eisenstein series; relevant to Kazhdan-Patterson
  generalisations.

## References

- Brylinski–Deligne, *Central extensions of reductive groups by
  \(\mathbf{K}_2\)* (Publ.\ IHES 2001).
- Weissman, *L-groups and parameters for covering groups* (Asterisque
  2018).
- Gan–Gao–Weissman, *L-groups and the Langlands program for covering
  groups* (Asterisque 2018).
- Kac, *Infinite-dimensional Lie algebras* (1990), §3.13 (the
  Kac-Peterson presentation of central extensions).

## Prerequisite Topics

- [[node:reductive_groups.reductive_groups|Reductive Groups]]
- [[node:root_data.root_data|Root Data]]
- [[node:covers.central_extensions_of_algebraic_groups|Central Extensions of Algebraic Groups]]
- [[node:foundations.algebraic_k_theory_and_k2|Algebraic K-Theory and K2]]
