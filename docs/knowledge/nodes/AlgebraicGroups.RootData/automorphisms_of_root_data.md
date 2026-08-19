---
id: root_data.automorphisms_of_root_data
title: Automorphisms of Root Data
kind: topic
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.root_data
- root_data.based_root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are automorphisms of root data classified abstractly, with the equivalence to outer automorphisms of split reductive groups?"
  verdict: "Yes. Aut(root datum) = pinned-Aut of the corresponding split reductive group; for based data, Aut equals the diagram automorphism group (= Out)."
tags:
- root-data-automorphisms
- root-data-and-duality
---

# Automorphisms of Root Data

The **automorphism group** of a root datum is a finite group capturing
the "rigid" symmetries of a split reductive group. It coincides with
the **outer automorphism group** \(\mathrm{Out}(G)\) and with the
automorphism group of the Dynkin diagram (for based data).

## Definitions

For a root datum \(\Psi = (X, \Phi, X^\vee, \Phi^\vee)\):

- An **automorphism of \(\Psi\)** is a pair \((\phi, \phi^\vee)\) of
  \(\mathbb{Z}\)-linear isomorphisms \(\phi : X \to X\) and
  \(\phi^\vee : X^\vee \to X^\vee\) compatible with the pairing
  \(\langle \phi(x), \phi^\vee(x^\vee) \rangle = \langle x, x^\vee \rangle\)
  and preserving \(\Phi\) and \(\Phi^\vee\) (with the coroot bijection).

\(\mathrm{Aut}(\Psi)\) is finite (since \(\Phi\) is finite and
generates \(X \otimes \mathbb{Q}\)).

For a **based** root datum \((X, \Phi, X^\vee, \Phi^\vee; \Delta)\):

- An **automorphism** must additionally preserve the base \(\Delta\)
  as a set.

\(\mathrm{Aut}(\Psi; \Delta) \subseteq \mathrm{Aut}(\Psi)\) is the
subgroup fixing \(\Delta\).

## Decomposition

The Weyl group \(W = W(\Phi)\) sits inside \(\mathrm{Aut}(\Psi)\) as a
normal subgroup, with quotient
\[
\mathrm{Aut}(\Psi) \;/\; W \;\cong\; \mathrm{Aut}(\Psi; \Delta).
\]

In particular: every automorphism of a root datum is uniquely
\(W \cdot \sigma\) for some \(\sigma \in \mathrm{Aut}(\Psi; \Delta)\).

## Dynkin diagram automorphisms

For a based root datum, \(\mathrm{Aut}(\Psi; \Delta)\) coincides with
the automorphism group of the Dynkin diagram (permutations of vertices
preserving edge multiplicities and arrow directions).

For irreducible types:

| Dynkin type | \(\mathrm{Aut}(\text{diagram})\) | Generator |
|---|---|---|
| \(A_1\) | trivial | — |
| \(A_n\) (\(n \ge 2\)) | \(\mathbb{Z}/2\) | reverse order of vertices |
| \(B_n\), \(C_n\) | trivial | — |
| \(D_4\) | \(S_3\) | triality (3 outer legs) |
| \(D_n\) (\(n \ge 5\)) | \(\mathbb{Z}/2\) | swap two outer leaves |
| \(E_6\) | \(\mathbb{Z}/2\) | reflection of diagram |
| \(E_7\) | trivial | — |
| \(E_8\) | trivial | — |
| \(F_4\) | trivial in Dynkin; \(\mathbb{Z}/2\) in unfolded form | — |
| \(G_2\) | trivial in Dynkin; \(\mathbb{Z}/2\) in unfolded form | — |

For \(F_4, G_2\): there is **no** outer automorphism preserving the
Dynkin diagram-with-arrows, but the underlying unweighted graph has a
non-trivial symmetry — relevant in tales of "twisted" duality.

## Connection with \(\mathrm{Out}(G)\)

**Theorem.** For a connected reductive group \(G\) with based root
datum \(\Psi\):
\[
\mathrm{Out}(G) \;:=\; \mathrm{Aut}(G) / \mathrm{Inn}(G) \;\cong\; \mathrm{Aut}(\Psi; \Delta).
\]

The full automorphism group satisfies
\[
\mathrm{Aut}(G) \;=\; G_{\mathrm{ad}}(k) \;\rtimes\; \mathrm{Out}(G),
\]
i.e.\ the inner automorphisms form a group of \(k\)-points of the
adjoint quotient, and the outer ones lift the Dynkin symmetries.

## Examples

### \(\mathrm{SL}_n\) (\(n \ge 2\)) and \(\mathrm{PGL}_n\)

\(\mathrm{Out}(\mathrm{SL}_n) = \mathbb{Z}/2\); generator = "transpose-
inverse": \(g \mapsto (g^T)^{-1}\). For \(n = 2\): \((g^T)^{-1} = w g w^{-1}\)
for the longest Weyl element \(w\), so the outer automorphism is
"inner" in this case — \(\mathrm{Out}(\mathrm{SL}_2) = 1\).

### \(\mathrm{Spin}_8\) (\(D_4\)) and triality

\(\mathrm{Out}(\mathrm{Spin}_8) = S_3\). The three outer "leaves" of
the \(D_4\) diagram are the three minuscule representations: vector,
half-spin, and the other half-spin. Triality permutes them.

### \(E_6\)

\(\mathrm{Out}(E_6) = \mathbb{Z}/2\); the generator is the reflection
of the \(E_6\) diagram (swapping the two ends).

## Galois twists

For an outer form \(G\) of a split group \(G_0\) over a field \(k\):
the Galois action factors through \(\mathrm{Out}(G_0)\), giving a
homomorphism
\[
\rho : \Gamma_k \;\longrightarrow\; \mathrm{Out}(G_0).
\]

Quasi-split outer forms are classified by such homomorphisms up to
conjugacy:
\[
\{\text{quasi-split outer forms of } G_0\} \;\cong\; \mathrm{Hom}(\Gamma_k, \mathrm{Out}(G_0)) / \mathrm{Out}(G_0).
\]

## Automorphisms via lattices

For a root datum \((X, \Phi, X^\vee, \Phi^\vee)\), \(\mathrm{Aut}(\Psi)\)
is a subgroup of \(\mathrm{Aut}(X)\), and is computable by:

- Listing automorphisms of the \(\mathbb{Q}\)-vector space
  \(X \otimes \mathbb{Q}\) that preserve \(\Phi\);
- Restricting to those preserving \(X\) and inducing an isomorphism on
  the coroot side.

For a semisimple \(\Psi\), \(\mathrm{Aut}(\Psi) = W \rtimes \mathrm{Aut}(\text{diagram})\).

## Role in Langlands

- **L-group construction**: \(\mathrm{Out}\) appears as the Galois
  action on the dual root datum, giving the semi-direct product in
  \({}^L G = \hat G \rtimes \Gamma\).
- **Outer forms**: classified by \(\mathrm{Hom}(\Gamma, \mathrm{Out}(G_0))\);
  inner forms are further refined by \(H^1(\Gamma, G_{\mathrm{ad}})\).
- **Diagonal forms in functoriality**: the diagonal embedding
  \(G \hookrightarrow G \times G^\sigma\) for \(\sigma \in \mathrm{Out}\)
  is a basic L-morphism.

## References

- Borel, *Linear Algebraic Groups* (1991), §14.
- Springer, *Linear Algebraic Groups* (1998), §16.
- Bourbaki, *Groupes et Algèbres de Lie* VI (1968).

## Prerequisite Topics

- [[node:root_data.root_data|Root Data]]
- [[node:root_data.based_root_data|Based Root Data]]
