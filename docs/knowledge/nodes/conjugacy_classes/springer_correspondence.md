---
id: conjugacy_classes.springer_correspondence
title: Springer Correspondence
kind: theorem
status: admitted
primary_topic: conjugacy_classes
topics:
- conjugacy_classes
uses:
- conjugacy_classes.unipotent_orbits
- conjugacy_classes.nilpotent_orbits
- conjugacy_classes.nilpotent_cone
- reductive_structure.reductive_groups
- reductive_structure.borel_subgroups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Chapter III"
    format: section
    note: "Springer's original construction of the correspondence via perverse sheaves / nearby cycles."
  - artifact: collingwood-mcgovern-nilpotent-orbits
    locator: "Chapter 6"
    format: section
    note: "Comprehensive treatment of the Springer correspondence and its combinatorics."
verification:
  statement: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does the Springer correspondence hold over fields of good characteristic, and does it use l-adic cohomology?"
  verdict: "Yes. The Springer correspondence is established over any algebraically closed field of good characteristic using l-adic cohomology of the Springer resolution. It attaches to each unipotent orbit and each local system on it an irreducible representation of the Weyl group W. In characteristic 0, this can also be done via D-modules."
tags:
- springer-correspondence
- unipotent-orbits
- nilpotent-orbits
- weyl-group
- perverse-sheaves
---

# Springer Correspondence

## Setup

Let \(G\) be a connected reductive group over an algebraically closed field
\(k\), with Weyl group \(W = N_G(T)/T\). Let \(\mathcal{B} = G/B\) be the
**flag variety** and \(\mathcal{N} \subset \mathrm{Lie}(G)\) the
**nilpotent cone**.

## The Springer resolution

The **Springer resolution** is the map
\[
\mu : \widetilde{\mathcal{N}} \longrightarrow \mathcal{N},
\]
where
\[
\widetilde{\mathcal{N}} = \{(X, B') : X \in \mathrm{Lie}(B'),\; B' \in \mathcal{B}\}
\subset \mathcal{N} \times \mathcal{B},
\]
and \(\mu(X, B') = X\). This is a proper, \(G\)-equivariant, birational
morphism resolving the singularities of \(\mathcal{N}\).

## The W-action and the correspondence

Springer showed that the Weyl group \(W\) acts on each cohomology group
\(H^i(\mu^{-1}(X), \overline{\mathbb{Q}}_\ell)\) for \(X \in \mathcal{N}\).
Specifically:

**Springer's theorem.** For each nilpotent orbit \(\mathcal{O} \subset \mathcal{N}\)
and each \(G\)-equivariant local system \(\mathcal{L}\) on \(\mathcal{O}\),
there exists an irreducible representation \(\phi_{\mathcal{O},\mathcal{L}}\)
of \(W\) appearing in \(H^{2d}(\mu^{-1}(X), \overline{\mathbb{Q}}_\ell)\)
for \(X \in \mathcal{O}\) and \(d = \dim \mu^{-1}(X)\).

This gives the **Springer correspondence**:
\[
\bigsqcup_{\mathcal{O}} \{\text{irred.\ }G\text{-equivariant local systems on }\mathcal{O}\}
\xrightarrow{\;\sim\;} \widehat{W},
\]
a bijection from pairs \((\mathcal{O}, \mathcal{L})\) to the set \(\widehat{W}\) of
irreducible complex representations of \(W\).

## For the trivial local system

For the **trivial** local system on each orbit, the Springer correspondence
gives a map (not a bijection):
\[
\{\text{nilpotent orbits}\} \to \widehat{W}, \quad \mathcal{O} \mapsto \phi_{\mathcal{O}}.
\]
In type \(A_{n-1}\) (\(G = \mathrm{SL}_n\)), this recovers the Robinson-Schensted
correspondence: both sides are parametrised by partitions of \(n\).

## Geometric interpretation

Via the **decomposition theorem** for \(\mu_*(\overline{\mathbb{Q}}_\ell)\),
the Springer correspondence can be expressed as:
\[
\mu_*(\overline{\mathbb{Q}}_\ell)[\dim G] \cong \bigoplus_{(\mathcal{O},\mathcal{L})}
V_{\mathcal{O},\mathcal{L}} \otimes \mathrm{IC}(\overline{\mathcal{O}}, \mathcal{L}),
\]
where \(V_{\mathcal{O},\mathcal{L}}\) is the corresponding \(W\)-representation
and \(\mathrm{IC}\) denotes the intersection complex.
