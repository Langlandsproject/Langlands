---
id: tori.split_rank
title: Rank and Split Rank of a Torus
kind: definition
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.torus_definition
- tori.character_and_cocharacter_lattices
- tori.split_anisotropic_decomposition
- tori.anisotropic_torus
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 13.2"
    format: section
    note: "Split and anisotropic parts; the rank of the split part via Galois invariants."
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Section 2.5"
    format: section
    note: "Working conventions for rank and k-rank of tori; the split rank as the apartment dimension downstream."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are rank and split rank defined over an arbitrary field via the Galois module structure, with the equality of the two invariant-rank formulas justified?"
  verdict: "Yes. Both are defined via the continuous Galois action on the lattices; the equality rk X_*(T)^Theta = rk X^*(T)^Theta is proved by the averaging/pairing argument, valid over any field."
tags:
- torus
- rank
- split-rank
- definition
- AlgebraicGroups.Tori
---

# Rank and Split Rank of a Torus

Let \(T\) be a torus over \(k\), with character and cocharacter
lattices \(X^*(T), X_*(T)\) and
\(\Theta = \operatorname{Gal}(k_s/k)\)
([[node:tori.character_and_cocharacter_lattices]]).

- The **rank** of \(T\) is
  \[
  \operatorname{rank} T \;:=\; \operatorname{rk}_{\mathbb{Z}} X^*(T)
  \;=\; \operatorname{rk}_{\mathbb{Z}} X_*(T),
  \]
  the \(n\) with \(T_{k_s} \cong \mathbb{G}_m^{\,n}\)
  ([[node:tori.torus_definition]]).
- The **split rank** (or **\(k\)-rank**) of \(T\) is the rank of the
  maximal split subtorus \(T_d \subseteq T\)
  ([[node:tori.split_anisotropic_decomposition]]):
  \[
  \operatorname{rank}_k T \;:=\; \operatorname{rank} T_d
  \;=\; \operatorname{rk}_{\mathbb{Z}} X_*(T)^{\Theta}.
  \]
  The second equality holds because cocharacters of \(T\) defined
  over \(k\) are exactly the \(\Theta\)-fixed cocharacters, and they
  all land in \(T_d\).
- Equivalently on the character side:
  \[
  \operatorname{rank}_k T
  \;=\; \operatorname{rk}_{\mathbb{Z}} X^*(T)^{\Theta}.
  \]
  *Why the two invariant ranks agree.* \(\Theta\) acts through a
  finite quotient \(Q\). Over \(\mathbb{Q}\), the perfect
  \(\Theta\)-invariant pairing
  \(X^*(T)_{\mathbb{Q}} \times X_*(T)_{\mathbb{Q}} \to \mathbb{Q}\)
  identifies \(X_*(T)_{\mathbb{Q}}\) with the dual representation of
  \(X^*(T)_{\mathbb{Q}}\), and for a finite group the invariants of a
  representation and of its dual have the same dimension (both equal
  the multiplicity of the trivial representation, by averaging /
  Maschke). Intersecting with the lattices does not change the rank
  of the invariants.

## Basic facts

1. \(0 \leq \operatorname{rank}_k T \leq \operatorname{rank} T\).
2. \(\operatorname{rank}_k T = \operatorname{rank} T\) iff \(T\) is
   split (trivial action on a finite-index sublattice of \(X^*\)
   forces trivial action, since the action is by finite-order
   automorphisms of the lattice).
3. \(\operatorname{rank}_k T = 0\) iff \(T\) is anisotropic
   ([[node:tori.anisotropic_torus]]).
4. \(\operatorname{rank}_k T =
   \operatorname{rank} T_d\) and
   \(\operatorname{rank} T = \operatorname{rank}_k T +
   \operatorname{rank} T_a\) minus the rank of the finite
   intersection's contribution — precisely: the isogeny
   \(T_d \times T_a \to T\) of
   [[node:tori.split_anisotropic_decomposition]] gives
   \(\operatorname{rank} T = \operatorname{rank}_k T +
   \operatorname{rank} T_a\).

**Downstream.** The split rank of a maximal torus is the dimension of
the corresponding apartment in the Bruhat–Tits building; the split
rank of the connected center measures the non-compactness of the
group of rational points.
