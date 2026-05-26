---
id: root_data_and_duality.l_groups
title: L-Groups
kind: topic
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- root_data_and_duality.langlands_dual_groups
- root_data_and_duality.galois_action_on_root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the L-group defined uniformly for reductive groups over arbitrary fields with Galois action?"
  verdict: "Yes. The L-group L G = hat G semi-direct Galois (or Weil) is defined for any connected reductive G over a field, using the canonical Galois action on the dual root datum."
tags:
- l-groups
- root-data-and-duality
---

# L-Groups

The **L-group** \({}^L G\) is the Galois-twisted Langlands dual group:
the semi-direct product of the complex dual group \(\hat G\) with the
Galois (or Weil) group acting through pinned automorphisms. It is the
target of L-parameters and the central character of the Langlands
correspondence.

## Definition

Let \(k\) be a field with separable closure \(\bar k\) and absolute
Galois group \(\Gamma = \operatorname{Gal}(\bar k/k)\). Let \(G\) be a
connected reductive group over \(k\). Pick a pinning of \(\hat G\)
(maximal torus \(\hat T\), Borel \(\hat B\), and a system of root
vectors). The Galois group \(\Gamma\) acts on the based root datum of
\(G\), hence (via the duality swap) on the based root datum of
\(\hat G\), giving a homomorphism
\[
\rho_G : \Gamma \;\longrightarrow\; \operatorname{Aut}(\hat G, \text{pinning}).
\]

The **Galois form** of the L-group is the semi-direct product:
\[
{}^L G \;:=\; \hat G(\mathbb{C}) \;\rtimes_{\rho_G}\; \Gamma.
\]

For local fields \(F\), one usually uses the **Weil form**:
\[
{}^L G \;:=\; \hat G(\mathbb{C}) \;\rtimes\; W_F,
\]
with \(W_F\) the Weil group of \(F\) acting through its quotient
\(W_F \to \Gamma\).

## Equivalent formulations

- **Pinned automorphisms** of \(\hat G\) are in bijection with
  diagram automorphisms (\(\mathbb{Z}/2\) for types \(A_n\) (\(n \ge 2\)),
  \(D_n\) (\(n \ne 4\)), \(E_6\); \(S_3\) for \(D_4\); trivial
  otherwise).
- For \(G\) split: \(\rho_G\) is trivial, so \({}^L G = \hat G \times \Gamma\).
- For \(G\) quasi-split: \(\rho_G\) factors through the diagram
  automorphism group; the L-group is uniquely determined.

## Examples

### \(\mathrm{GL}_n\) (split)

\({}^L \mathrm{GL}_n = \mathrm{GL}_n(\mathbb{C}) \times \Gamma\).
Continuous L-parameters \(W_F \to {}^L \mathrm{GL}_n\) project to
\(n\)-dimensional Galois representations (modulo the Frobenius
semisimplification convention).

### \(\mathrm{U}(n)\), quasi-split

For the unitary group attached to a quadratic extension \(E/F\),
\(\rho_G : \mathrm{Gal}(E/F) = \mathbb{Z}/2 \to \mathrm{Out}(\hat G) = \mathrm{Out}(\mathrm{GL}_n) = \mathbb{Z}/2\)
is the non-trivial map (diagram flip). Then
\[
{}^L \mathrm{U}(n) \;=\; \mathrm{GL}_n(\mathbb{C}) \rtimes \mathrm{Gal}(E/F).
\]

### \({}^3 D_4\), the triality form

For the trialitarian form of \(\mathrm{Spin}_8\) over a cubic
extension \(K/k\), \(\Gamma\) acts on \(\hat G = \mathrm{Spin}_8\) via
the order-\(3\) diagram automorphism. The L-group involves the
\(S_3\)-action on the Dynkin diagram of \(D_4\).

### Tori

For a torus \(T\), \(\hat T = (X^*(T)) \otimes \mathbb{C}^\times\)
with the natural Galois action on \(X^*(T)\). The L-group is
\(\hat T \rtimes \Gamma\), and continuous L-parameters into \(\hat T\)
are exactly continuous characters
\(\chi : W_F^{\mathrm{ab}} \to \hat T\) — these are L-parameters
for characters of \(T(F)\) via local class field theory.

## L-parameters and L-packets

An **L-parameter** for \(G/F\) (\(F\) local) is a continuous
homomorphism
\[
\varphi : W_F \times \mathrm{SL}_2(\mathbb{C}) \;\longrightarrow\; {}^L G
\]
satisfying:
- \(\varphi\) commutes with the projection \({}^L G \to \Gamma\);
- \(\varphi|_{W_F}\) is semisimple (image consists of semisimple
  elements);
- \(\varphi|_{\mathrm{SL}_2}\) is algebraic.

L-parameters are taken up to \(\hat G(\mathbb{C})\)-conjugacy. The
conjectural map
\[
\{\text{irreducible smooth reps of } G(F)\} \;\twoheadrightarrow\; \{\text{L-parameters}\}
\]
has finite fibres called **L-packets**.

## Functoriality

A homomorphism \({}^L H \to {}^L G\) compatible with the projections
to \(\Gamma\) conjecturally induces a transfer of automorphic
representations from \(H\) to \(G\). Examples:

- **Base change**: \({}^L (G_F) \to {}^L (G_E)\) for \(E/F\) a finite
  extension.
- **Symmetric power**: \({}^L \mathrm{GL}_2 \to {}^L \mathrm{GL}_{n+1}\)
  via \(\mathrm{Sym}^n\), the \((n+1)\)-th symmetric power.
- **Endoscopic transfer**: \({}^L H \to {}^L G\) where \(H\) is the
  centraliser of a semisimple element in \(\hat G\).

## Variants

- **Weil-Deligne form**: \({}^L G\) defined with the Weil-Deligne
  group \(W'_F = W_F \times \mathrm{SL}_2(\mathbb{C})\) in place of
  just \(W_F\); equivalent for L-parameter purposes.
- **C-group**: variant introduced by Buzzard-Gee, more natural for
  arithmetic Galois representations.

## Mathlib status

Not yet formalised; depends on full reductive-group infrastructure
plus Galois cohomology.

## References

- Borel, *Automorphic L-functions* (Corvallis 1979).
- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke
  1984), §1.
- Gross-Reeder, *Arithmetic invariants of discrete Langlands
  parameters* (Duke 2010).
- Buzzard-Gee, *The conjectural connections between automorphic
  representations and Galois representations* (Proc.\ LMS 2014).

## Prerequisite Topics

- [[node:root_data_and_duality.langlands_dual_groups|Langlands Dual Groups]]
- [[node:root_data_and_duality.galois_action_on_root_data|Galois Action on Root Data]]
