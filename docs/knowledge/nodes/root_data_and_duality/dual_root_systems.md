---
id: root_data_and_duality.dual_root_systems
title: Dual Root Systems
kind: topic
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- root_data_and_duality.root_systems
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the duality of root systems treated abstractly (independent of root data refinement)?"
  verdict: "Yes. The dual root system Φ^∨ ⊆ V^* is intrinsic to any root system Φ ⊆ V; the lattice refinement is added later for root data."
tags:
- dual-root-systems
- root-data-and-duality
---

# Dual Root Systems

The **dual root system** is the set of coroots associated to a root
system. It is itself a root system in the dual vector space, and the
operation \(\Phi \mapsto \Phi^\vee\) is an involution that interchanges
\(B_n\) with \(C_n\) and is the identity (with long-short swap) on
non-simply-laced types \(F_4, G_2\).

## Definition

For a root system \(\Phi \subseteq V\) (a Euclidean space with inner
product \((-, -)\)), the **dual root system** is
\[
\Phi^\vee \;=\; \{\alpha^\vee : \alpha \in \Phi\} \;\subseteq\; V,
\]
where \(\alpha^\vee = 2\alpha / (\alpha, \alpha)\) is the **coroot** of
\(\alpha\).

\(\Phi^\vee\) is a root system in \(V\), with the same Weyl group as
\(\Phi\). The bijection \(\Phi \leftrightarrow \Phi^\vee\),
\(\alpha \leftrightarrow \alpha^\vee\), is a canonical bijection.

## Properties

- \((\Phi^\vee)^\vee = \Phi\) (involution).
- \(W(\Phi) = W(\Phi^\vee)\) as a subgroup of \(\mathrm{GL}(V)\).
- The Cartan matrix \((c_{ij})\) of \(\Phi\) transposes to
  \((c_{ij}^\vee) = (c_{ji})\) for \(\Phi^\vee\) (with appropriate
  base correspondence).

## Effect on Dynkin type

For irreducible root systems:

| \(\Phi\) | \(\Phi^\vee\) |
|---|---|
| \(A_n\) | \(A_n\) (self-dual) |
| \(B_n\) | \(C_n\) |
| \(C_n\) | \(B_n\) |
| \(D_n\) | \(D_n\) (self-dual) |
| \(E_6, E_7, E_8\) | self-dual |
| \(F_4\) | \(F_4\) (long-short swap) |
| \(G_2\) | \(G_2\) (long-short swap) |

For simply-laced types (\(A, D, E\)): \(\Phi = \Phi^\vee\) literally
(no length distinction).

For non-simply-laced types: \(\Phi^\vee\) is the root system obtained
by **scaling each root by \(2/(\alpha, \alpha)\)**, which inverts the
length ratio.

## Cartan matrix transposition

If \(C = (c_{ij})\) is the Cartan matrix of \(\Phi\) (for a chosen
base), then the Cartan matrix of \(\Phi^\vee\) is the transpose
\(C^T = (c_{ji})\). This swap exchanges:

- The role of "row" (= \(\alpha_i\)) and "column" (= \(\alpha_j^\vee\));
- The arrow direction in non-simply-laced Dynkin diagrams.

## Examples

### \(A_n\) (self-dual)

All roots have the same length, so \(\alpha^\vee = \alpha\) (up to
normalisation). \(\Phi^\vee\) is literally the same set as \(\Phi\).

### \(B_2\) and \(C_2\)

\(B_2\): short roots \(\pm \varepsilon_i\), long roots
\(\pm \varepsilon_i \pm \varepsilon_j\). Coroots scale short to long
and vice versa, giving \(C_2\).

### \(G_2\)

Long roots scaled by \(1/3\) become short coroots; short roots scaled
by 1 stay short. Result: the dual root system is \(G_2\) with long
and short roles swapped.

## Connection to root data

A **root datum** is a root system enriched with a lattice
\(\mathbb{Z}\Phi \subseteq X \subseteq P\). Under root-datum duality
(swapping characters and cocharacters), the underlying root system
maps to its dual root system, and the lattice \(X\) maps to a
specific dual lattice in \(V^*\).

The dual of a root datum is **not** just the dual of the underlying
root system — it also inverts the lattice gap (sc ↔ ad).

## Geometric interpretation

In the geometric setting:
- \(\Phi\) = weights of \(T\) acting on \(\operatorname{Lie}(G)\);
- \(\Phi^\vee\) = cocharacters arising from \(\mathfrak{sl}_2\)-triples.

For the Langlands dual: roots and coroots swap. This is the
**combinatorial source** of all Langlands duality phenomena.

## Mathlib

`Mathlib.LinearAlgebra.RootSystem.RootPairing` formalises root
pairings (= root systems with their dual data). The dual operation is
built in.

## References

- Bourbaki, *Groupes et Algèbres de Lie* IV–VI (1968).
- Humphreys, *Introduction to Lie Algebras and Representation Theory*
  (1972).

## Prerequisite Topics

- [[node:root_data_and_duality.root_systems|Root Systems]]
