---
id: conjugacy_classes.jordan_decomposition
title: Jordan Decomposition in Algebraic Groups
kind: theorem
status: admitted
primary_topic: conjugacy_classes
topics:
- conjugacy_classes
- reductive_structure
uses:
- affine_group_schemes.affine_algebraic_groups
- reductive_structure.reductive_groups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.4"
    format: section
    note: "Abstract Jordan decomposition in linear algebraic groups."
  - artifact: borel-linear-algebraic-groups
    locator: "Theorem 4.3"
    format: theorem
    note: "Existence and functoriality of the Jordan decomposition."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does the Jordan decomposition hold over an arbitrary algebraically closed field, including characteristic p?"
  verdict: "Yes. For a linear algebraic group G over an algebraically closed field k, every g in G(k) has a unique decomposition g = g_s g_u = g_u g_s with g_s semisimple and g_u unipotent. This is the abstract (group-theoretic) Jordan-Chevalley decomposition; it works in all characteristics."
tags:
- jordan-decomposition
- semisimple-elements
- unipotent-elements
- conjugacy
---

# Jordan Decomposition in Algebraic Groups

## Statement

Let \(G\) be a linear algebraic group over an algebraically closed field \(k\).
For every element \(g \in G(k)\), there exists a **unique** decomposition
\[
g = g_s \, g_u = g_u \, g_s
\]
where \(g_s\) is **semisimple** (diagonalisable over \(k\)) and \(g_u\) is
**unipotent** (\((g_u - 1)^N = 0\) for some \(N\), equivalently all
eigenvalues of \(\rho(g_u)\) equal \(1\) for any faithful representation \(\rho\)).

This is the **abstract Jordan-Chevalley decomposition** in \(G\).

## Functoriality

The decomposition is functorial: for any morphism of algebraic groups
\(\phi : G \to H\),
\[
\phi(g)_s = \phi(g_s), \quad \phi(g)_u = \phi(g_u).
\]
In particular, the decomposition is intrinsic to \(G\) and does not depend on
a choice of embedding \(G \hookrightarrow \mathrm{GL}_n\).

## Construction

Embed \(G \hookrightarrow \mathrm{GL}_n\). In \(\mathrm{GL}_n(k)\), the
classical Jordan decomposition (of matrices over \(k\)) gives \(g = g_s g_u\)
with \(g_s\) semisimple and \(g_u\) unipotent. One verifies:

1. \(g_s, g_u \in G(k)\) (they lie in every closed subgroup containing \(g\)).
2. The decomposition is independent of the embedding.

The key lemma: the semisimple and unipotent parts of \(g \in \mathrm{GL}_n(k)\)
lie in the Zariski closure of the cyclic group \(\langle g \rangle\), hence in
any closed subgroup containing \(g\).

## Conjugacy classes and Jordan decomposition

The Jordan decomposition partitions \(G(k)\) into:

- **Semisimple elements**: elements with \(g = g_s\) (unipotent part trivial).
  These are \(G\)-conjugate iff they are conjugate in some maximal torus.
- **Unipotent elements**: elements with \(g = g_u\) (semisimple part \(= 1\)).
  These form a closed \(G\)-stable subvariety, the *unipotent variety*.
- **Mixed elements**: general \(g\) with both \(g_s \ne 1\) and \(g_u \ne 1\).
  The study of mixed conjugacy classes reduces to unipotent elements in
  the centraliser \(C_G(g_s)^\circ\).

## Relation to the Lie algebra

The differential of the Jordan decomposition at \(1\) gives the Jordan
decomposition in \(\mathrm{Lie}(G)\):
\[
X = X_s + X_n \in \mathrm{Lie}(G), \quad [X_s, X_n] = 0,
\]
where \(X_s\) is semisimple and \(X_n\) is nilpotent (as endomorphisms via
the adjoint representation). The exponential map (when it exists, e.g.\ in
characteristic \(0\)) interchanges \(\exp(X_n) \leftrightarrow g_u\).
