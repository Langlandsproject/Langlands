---
id: root_data_and_duality.dual_root_data
title: Dual Root Data
kind: topic
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- root_data_and_duality.root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the dual operation on root data treated as an involution at the level of combinatorial data, not just for split reductive groups?"
  verdict: "Yes. Root datum duality is an involution at the level of quadruples (X, Φ, X^∨, Φ^∨) ↦ (X^∨, Φ^∨, X, Φ); it categorifies to Langlands duality of reductive groups via the classification."
tags:
- dual-root-data
- root-data-and-duality
---

# Dual Root Data

The **dual root datum** swaps characters with cocharacters and roots
with coroots. It is the combinatorial source of Langlands duality —
the operation that turns the root datum of \(G\) into the root datum
of the Langlands dual group \(\hat G\).

## Definition

For a root datum \(\Psi = (X, \Phi, X^\vee, \Phi^\vee)\) with the
canonical pairing \(\langle -, - \rangle : X \times X^\vee \to \mathbb{Z}\),
the **dual root datum** is
\[
\Psi^\vee \;:=\; (X^\vee, \Phi^\vee, X, \Phi)
\]
with the pairing \(\langle -, - \rangle^\vee : X^\vee \times X \to \mathbb{Z}\),
\(\langle x^\vee, x \rangle^\vee := \langle x, x^\vee \rangle\) (i.e.\
the swapped pairing).

The map \(\Psi \mapsto \Psi^\vee\) is a contravariant **involution**:
\((\Psi^\vee)^\vee = \Psi\).

## Properties

- The bijection \(\Phi \leftrightarrow \Phi^\vee\) of the original
  root datum becomes part of the new root datum: roots of \(\Psi^\vee\)
  are coroots of \(\Psi\) and vice versa.
- The pairing condition \(\langle \alpha, \alpha^\vee \rangle = 2\) is
  preserved (becomes \(\langle \alpha^\vee, \alpha \rangle = 2\) in
  \(\Psi^\vee\)).
- The Weyl group of \(\Psi^\vee\) is canonically isomorphic to that
  of \(\Psi\) (same set of reflections, dual realisation).

## Effects on Dynkin type

For irreducible root systems, duality acts on Dynkin types as follows:

| Type \(G\) | Type \(\hat G\) (= dual) |
|---|---|
| \(A_n\) | \(A_n\) (self-dual) |
| \(B_n\) | \(C_n\) |
| \(C_n\) | \(B_n\) |
| \(D_n\) | \(D_n\) (self-dual) |
| \(E_6\) | \(E_6\) (self-dual) |
| \(E_7\) | \(E_7\) (self-dual) |
| \(E_8\) | \(E_8\) (self-dual) |
| \(F_4\) | \(F_4\) (long ↔ short swap) |
| \(G_2\) | \(G_2\) (long ↔ short swap) |

Long and short roots swap their roles in non-simply-laced types.

## Lattice gap inversion

The lattice gap \(\mathbb{Z}\Phi \subseteq X \subseteq P\) (weight
lattice) and its dual \(Q^\vee = \mathbb{Z}\Phi^\vee \subseteq X^\vee \subseteq P^\vee\)
swap under duality:

- Simply connected \(G\) (\(X^\vee = Q^\vee\)) becomes adjoint
  \(\hat G\) (\(X = \mathbb{Z}\Phi\));
- Adjoint \(G\) (\(X = \mathbb{Z}\Phi\)) becomes simply connected
  \(\hat G\).

So:
- \((\mathrm{SL}_n)^\vee = \mathrm{PGL}_n\) (sc ↔ ad);
- \((\mathrm{SO}_{2n+1})^\vee = \mathrm{Sp}_{2n}\) (sc-of-B_n ↔ sc-of-C_n);
- \(\mathrm{GL}_n^\vee = \mathrm{GL}_n\) (self-dual, but with the
  determinant character swapped to the determinant cocharacter).

## Canonical inclusions

The lattice inclusions \(Q \subseteq X \subseteq P\) dualise to
inclusions \(Q^\vee \subseteq X^\vee \subseteq P^\vee\), giving:
\[
\pi_1(\Psi) \;=\; X^\vee / Q^\vee \;\stackrel{\text{dual}}{\longleftrightarrow}\; X / Q \;=\; Z(\Psi^\vee).
\]

This is the **fundamental Kottwitz duality**:
\[
\pi_1(G) \;=\; X^*(Z(\hat G)).
\]

## Examples

### \(\mathrm{GL}_n\) (self-dual)

\(X = X^\vee = \mathbb{Z}^n\); roots
\(\Phi = \{\varepsilon_i - \varepsilon_j\} \subseteq X\) and
coroots \(\Phi^\vee = \{\varepsilon_i^\vee - \varepsilon_j^\vee\} \subseteq X^\vee\).

Dualising swaps the two copies of \(\mathbb{Z}^n\). Under the
identification, this is just the identity — \(\mathrm{GL}_n\) is
self-dual.

### \(\mathrm{SL}_n\) ↔ \(\mathrm{PGL}_n\)

\(\mathrm{SL}_n\): \(X = \mathbb{Z}^n/\mathbb{Z}(1, \ldots, 1)\),
\(X^\vee = \{(a_i) : \sum a_i = 0\}\). Dualising swaps these, giving
\(\mathrm{PGL}_n\)'s root datum.

### Type \(C_2 = \mathrm{Sp}_4\)

Roots in \(X = \mathbb{Z}^2\):
\(\Phi = \{\pm \varepsilon_1 \pm \varepsilon_2, \pm 2 \varepsilon_1, \pm 2 \varepsilon_2\}\).
Coroots in \(X^\vee\):
\(\Phi^\vee = \{\pm \varepsilon_1^\vee \pm \varepsilon_2^\vee, \pm \varepsilon_1^\vee, \pm \varepsilon_2^\vee\}\).
Dualising gives \(B_2 = \mathrm{Spin}_5\) (simply connected of
\(B_2\)).

## Action on automorphism groups

Root-datum duality preserves the automorphism group:
\[
\mathrm{Aut}(\Psi) \;=\; \mathrm{Aut}(\Psi^\vee).
\]

For an outer form determined by a Galois representation
\(\Gamma \to \mathrm{Out}(G)\), the dual outer form has the same
representation \(\Gamma \to \mathrm{Out}(\hat G) = \mathrm{Out}(G)\).

## Functoriality

Duality is contravariant on morphisms: for \(f : \Psi \to \Psi'\), the
dual morphism \(f^\vee : (\Psi')^\vee \to \Psi^\vee\) is induced by
the dual lattice maps.

This compatibility is what makes Langlands duality functorial: a
homomorphism of L-groups corresponds to a "co-functoriality" in the
forward direction.

## Role in Langlands

The dual root datum is the algebraic underpinning of:

- **The dual group \(\hat G\)**: the unique split reductive group
  with root datum \(\Psi^\vee\).
- **Langlands duality**: the principle that automorphic
  representations of \(G\) correspond to L-parameters into \({}^L G\),
  with the dual side built from \(\Psi^\vee\).
- **Symplectic-orthogonal correspondence**: the duality
  \(\mathrm{Sp}_{2n} \leftrightarrow \mathrm{SO}_{2n+1}\), which makes
  Arthur's classification of automorphic representations symmetric
  between symplectic and odd-orthogonal groups, comes from \(\Psi^\vee\)
  for \(B_n \leftrightarrow C_n\).

## References

- Borel, *Automorphic L-functions* (Corvallis 1979), §2.
- Springer, *Linear Algebraic Groups* (1998), §7.
- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke
  1984), §1.

## Prerequisite Topics

- [[node:root_data_and_duality.root_data|Root Data]]
