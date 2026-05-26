---
id: reductive_structure.character_and_cocharacter_lattices
title: Character and Cocharacter Lattices
kind: topic
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.algebraic_tori
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are character and cocharacter lattices treated as Galois modules in general, not just for split tori?"
  verdict: "Yes. The lattices are functorially associated to tori over arbitrary fields and carry a canonical Galois action that classifies non-split forms."
tags:
- characters
- cocharacters
- reductive-structure
---

# Character and Cocharacter Lattices

To every algebraic torus \(T\) over a field \(k\) one associates two
free abelian groups: the **character lattice** \(X^*(T)\) and the
**cocharacter lattice** \(X_*(T)\). Together with the Galois action of
\(\operatorname{Gal}(\bar k/k)\), they form the complete invariant of
\(T\) and the foundation of root data.

## Definitions

For an algebraic torus \(T\) over \(k\) with \(T_{\bar k} \cong \mathbb{G}_m^r\):

- **Character lattice**
  \[
  X^*(T) \;:=\; \operatorname{Hom}_{\bar k\text{-grp}}(T_{\bar k}, \mathbb{G}_m).
  \]
  A free \(\mathbb{Z}\)-module of rank \(r\); elements are
  \(\bar k\)-algebraic group homomorphisms \(T \to \mathbb{G}_m\).

- **Cocharacter lattice**
  \[
  X_*(T) \;:=\; \operatorname{Hom}_{\bar k\text{-grp}}(\mathbb{G}_m, T_{\bar k}).
  \]
  A free \(\mathbb{Z}\)-module of rank \(r\); elements are
  one-parameter subgroups of \(T\).

- **Perfect pairing**
  \[
  \langle -, - \rangle : X^*(T) \times X_*(T) \;\to\; \mathbb{Z}
  \]
  defined by \(\chi \circ \lambda = (z \mapsto z^{\langle \chi, \lambda \rangle})\)
  in \(\operatorname{End}(\mathbb{G}_m) = \mathbb{Z}\).

## Galois action

For \(T\) defined over \(k\) (not necessarily split), the absolute
Galois group \(\Gamma = \operatorname{Gal}(\bar k/k)\) acts continuously
on \(T(\bar k)\), hence on \(X^*(T)\) (and dually on \(X_*(T)\)). This
gives both lattices the structure of a **finitely generated continuous
\(\Gamma\)-module**, free as a \(\mathbb{Z}\)-module.

## The torus-lattice equivalence

**Theorem.** The functor
\[
T \;\longmapsto\; X^*(T)
\]
is an **anti-equivalence** between the category of algebraic tori over
\(k\) and the category of finitely generated free \(\mathbb{Z}\)-modules
with continuous \(\Gamma\)-action.

Under this equivalence:
- Split tori correspond to trivial \(\Gamma\)-modules.
- Quotient tori correspond to sub-\(\Gamma\)-lattices.
- Closed embeddings of tori correspond to surjections of
  \(\Gamma\)-lattices.

## Examples

| \(T\) | \(X^*(T)\) | \(\Gamma\)-action |
|---|---|---|
| \(\mathbb{G}_m\) | \(\mathbb{Z}\) | trivial |
| \(\mathbb{G}_m^n\) | \(\mathbb{Z}^n\) | trivial |
| \(R_{K/k}\mathbb{G}_m\) | \(\mathbb{Z}[\Gamma/H]\) (induced from \(H\)) | permutation |
| \(R^{(1)}_{K/k}\mathbb{G}_m\) | \(\mathbb{Z}[\Gamma/H] / \mathbb{Z}\) | quotient of permutation |
| Anisotropic torus | lattice with no \(\Gamma\)-fixed nonzero vectors | non-trivial |

## For reductive groups

If \(G\) is a connected reductive group over \(k\) with split maximal
torus \(T\), then:

- \(X^*(T)\) is the **character lattice** of \(G\) (a fundamental
  invariant);
- the **roots** \(\Phi \subseteq X^*(T)\) are the non-zero weights of
  \(T\) on \(\operatorname{Lie}(G)\);
- the **coroots** \(\Phi^\vee \subseteq X_*(T)\) come from
  \(\mathfrak{sl}_2\)-triples;
- the quadruple \((X^*(T), \Phi, X_*(T), \Phi^\vee)\) is the
  **root datum** of \(G\) ([[node:root_data_and_duality.root_data|root data]]).

For \(G\) non-split, the Galois action on \(X^*(T)\) and the set of
roots gives the **based root datum with Galois action**, which is the
complete invariant of \(G\) up to isomorphism (modern
Demazure–Grothendieck classification).

## Connection to characters of representations

For a torus \(T\), characters \(\chi \in X^*(T)\) are in bijection with
\(1\)-dimensional representations of \(T\) — the **weights** of any
representation \(V\) of \(T\) form a multiset in \(X^*(T)\), and the
decomposition into weight spaces \(V = \bigoplus_{\chi} V_\chi\) is
canonical.

For a reductive \(G\), representations of \(G\) are classified by
their **highest weight** in the dominant cone of \(X^*(T) \otimes \mathbb{Q}\),
recovering the Cartan–Weyl theory.

## Functoriality

For a morphism of tori \(f : T \to T'\):
- \(X^*(f) : X^*(T') \to X^*(T)\) (contravariant);
- \(X_*(f) : X_*(T) \to X_*(T')\) (covariant).

Both are \(\Gamma\)-equivariant when \(f\) is defined over \(k\).

## Mathlib

Mathlib's `Mathlib.LinearAlgebra.RootSystem.*` provides abstract
root-system infrastructure compatible with character lattices; the
explicit \(X^*(T)\) for the formalised \(\mathbb{G}_m\) is computed
via the antipode of the Laurent polynomial ring.

## Prerequisite Topics

- [[node:reductive_structure.algebraic_tori|Algebraic Tori]]
