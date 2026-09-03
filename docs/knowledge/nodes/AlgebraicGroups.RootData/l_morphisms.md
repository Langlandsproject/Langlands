---
id: root_data.l_morphisms
title: L-Morphisms
kind: topic
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.l_groups
- root_data.dual_reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are L-morphisms defined uniformly for any pair of reductive groups, as the natural target of functoriality?"
  verdict: "Yes. An L-morphism between L-groups is a continuous group homomorphism commuting with projection to the Galois group; it covers all functoriality phenomena."
tags:
- l-morphisms
- root-data-and-duality
---

# L-Morphisms

An **L-morphism** is a continuous group homomorphism between L-groups
that is compatible with the Galois action. L-morphisms are the
"morphism layer" of Langlands functoriality: a single L-morphism
conjecturally encodes a transfer of automorphic representations.

## Definition

Let \(G\) and \(H\) be connected reductive groups over a field \(k\)
(local or global), with L-groups
\[
{}^L G \;=\; \hat G \rtimes W_k, \qquad {}^L H \;=\; \hat H \rtimes W_k
\]
(using the Weil-group form). An **L-morphism** \(\eta : {}^L H \to {}^L G\)
is a continuous group homomorphism such that:

- \(\eta\) commutes with the projections to \(W_k\):
  \(\mathrm{pr}_W \circ \eta = \mathrm{pr}_W\);
- the restriction \(\eta|_{\hat H} : \hat H \to \hat G\) is a
  homomorphism of complex algebraic groups.

L-morphisms are taken up to inner conjugation by \(\hat G\).

## Equivalent description via 1-cocycles

Equivalent data: a pair \((f, c)\) where:

- \(f : \hat H \to \hat G\) is a complex algebraic group homomorphism;
- \(c : W_k \to \hat G\) is a continuous 1-cocycle (with respect to the
  \(W_k\)-action on \(\hat G\)) "intertwining" the Galois actions on
  \(\hat H\) and \(\hat G\) via \(f\):
  \[
  f(\rho_H(w)(h)) \;=\; c(w) \cdot \rho_G(w)(f(h)) \cdot c(w)^{-1}.
  \]

Two pairs are equivalent if they differ by an inner automorphism of
\(\hat G\).

## Examples

### Inclusion of a Levi

For a parabolic subgroup \(P \subseteq G\) with Levi \(L\):
\[
\eta : {}^L L \;\hookrightarrow\; {}^L G.
\]
Conjecturally induces **parabolic induction** at the automorphic
level: irreducible reps of \(L\) lift to subquotients of induced reps
of \(G\).

### Base change

For a finite Galois extension \(K/k\):
\[
\eta : {}^L G_k \;\to\; {}^L G_K
\]
encodes base change. Concretely: the restriction
\(\eta|_{\hat G}\) is the diagonal, and the Galois cocycle records the
restriction \(W_k \to W_K\).

### Symmetric power

For \(G = \mathrm{GL}_2\) and \(G' = \mathrm{GL}_{n+1}\):
\[
\mathrm{Sym}^n : \mathrm{GL}_2(\mathbb{C}) \;\to\; \mathrm{GL}_{n+1}(\mathbb{C})
\]
is an L-morphism (trivial cocycle since both groups split). Conjecturally
induces the **symmetric power lift** (Kim-Shahidi for \(n \le 4\),
Newton-Thorne 2021 for general \(n\)).

### Tensor product

For \(G_1 = \mathrm{GL}_m\), \(G_2 = \mathrm{GL}_n\), \(G_3 = \mathrm{GL}_{mn}\):
\[
\mathrm{GL}_m(\mathbb{C}) \times \mathrm{GL}_n(\mathbb{C}) \;\to\; \mathrm{GL}_{mn}(\mathbb{C})
\]
is the **tensor product** L-morphism. Conjecturally induces the
**automorphic tensor product** (= Rankin-Selberg L-function in pieces).

### Endoscopic embedding

For an endoscopic group \(H\) of \(G\): there is a canonical
L-morphism
\[
\eta : {}^L H \;\to\; {}^L G
\]
arising from \(\hat H \subseteq \hat G\) (as the connected component of
the centraliser of a semisimple element). Endoscopic functoriality
conjecturally transfers representations from \(G\) to \(H\) (via
trace identities and Shelstad-Kottwitz-Ngô).

## Composition

L-morphisms compose: if \(\eta_1 : {}^L A \to {}^L B\) and
\(\eta_2 : {}^L B \to {}^L C\), then \(\eta_2 \circ \eta_1 : {}^L A \to {}^L C\)
is an L-morphism. The composition is well-defined up to inner
conjugation.

## Functoriality conjecture

**Langlands functoriality conjecture.** For every L-morphism
\(\eta : {}^L H \to {}^L G\) (\(H, G\) reductive over \(k\)), there
is a transfer of automorphic representations:
\[
\mathcal{A}(H) \;\to\; \mathcal{A}(G), \qquad \pi \mapsto \eta_*(\pi),
\]
sending an automorphic representation \(\pi\) of \(H(\mathbb{A}_k)\) to
one of \(G(\mathbb{A}_k)\), such that the L-parameter of \(\eta_*(\pi)\)
is \(\eta \circ \varphi_\pi\).

This is the "fundamental conjecture" of the Langlands programme,
unifying base change, symmetric power, tensor product, etc.

## L-morphisms and characters

An L-morphism \(\eta\) restricted to the centre induces a homomorphism
\(Z(\hat G) \to Z(\hat H)\), which dualises to:
\[
\pi_1(H) \;\to\; \pi_1(G).
\]

This is the "central character compatibility" of L-morphisms.

## Verification: how functoriality has been proved

- **Symmetric square** (\(\mathrm{Sym}^2\)): Gelbart-Jacquet (1978).
- **Symmetric cube and 4th power**: Kim-Shahidi (2000s).
- **Symmetric \(n\)-th power for \(\mathrm{GL}_2\)**: Newton-Thorne
  (2021); first complete proof.
- **Base change for \(\mathrm{GL}_n\)** in cyclic case: Arthur-Clozel
  (1989).
- **Endoscopic transfer (fundamental lemma)**: Ngô (2008); Fields
  medal 2010.
- **Tensor product**: largely conjectural for general \(\mathrm{GL}_m \times \mathrm{GL}_n\)
  (gives the Rankin-Selberg integral, not yet a direct functoriality).

## Mathlib

Not formalised; requires the full Langlands programme infrastructure.

## References

- Borel, *Automorphic L-functions* (Corvallis 1979).
- Gelbart, *An elementary introduction to the Langlands program* (Bull.\
  AMS 1984).
- Ngô, *Le lemme fondamental pour les algèbres de Lie* (Publ.\ IHES
  2010).
- Newton–Thorne, *Symmetric power functoriality for holomorphic
  modular forms* (Publ.\ IHES 2021).

## Prerequisite Topics

- [[node:root_data.l_groups|L-Groups]]
- [[node:root_data.dual_reductive_groups|Dual Reductive Groups]]
