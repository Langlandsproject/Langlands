---
id: descent_and_forms.torsors
title: Torsors
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.nonabelian_h1
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are torsors treated in the algebro-geometric sense for arbitrary group schemes, not just affine algebraic groups?"
  verdict: "Yes. The definition via a fpqc (or étale, or fppf) sheaf-theoretic free transitive action works for any group scheme; the special cases (étale, fppf, Zariski) are noted."
tags:
- torsors
- descent-and-forms
---

# Torsors

A **torsor** under a group \(G\) is a "principal homogeneous space"
— a set with a free transitive \(G\)-action, but typically without
a distinguished basepoint. Torsors are the geometric objects classified
by \(H^1\), and the technical vehicle for descent and twisting.

## Definition

### Set-theoretic

For a group \(G\) acting on a non-empty set \(P\), \(P\) is a
**\(G\)-torsor** if the action is **free** (\(g \cdot x = x \implies g = 1\))
and **transitive** (any two elements differ by a unique group element).

Equivalently, the map \(G \times P \to P \times P\),
\((g, x) \mapsto (g \cdot x, x)\), is a bijection.

A torsor is "the same as" the group \(G\) but with the identity
"forgotten."

### Scheme-theoretic / sheaf-theoretic

For an algebraic group \(G/k\), a **\(G\)-torsor** (in the étale/fppf
topology) is a scheme \(P/k\) with a \(G\)-action such that:

- the action map \(G \times P \to P \times P\) is an isomorphism;
- there exists an étale (or fppf) cover \(\{U_i \to \mathrm{Spec}\, k\}\)
  over which \(P\) becomes trivial: \(P \times_k U_i \cong G \times_k U_i\)
  as \(G\)-schemes.

The trivial torsor is \(G\) itself acting on itself by left
translation; non-trivial torsors are forms of \(G\) twisted by a
1-cocycle.

## Classification by \(H^1\)

**Theorem.** For a smooth algebraic group \(G\) over a field \(k\),
\(G\)-torsors over \(k\) up to isomorphism are classified by
\[
H^1_{\mathrm{\acute{e}t}}(k, G) \;=\; H^1(k, G).
\]
The trivial class corresponds to the trivial torsor.

For \(G\) commutative: \(H^1(k, G)\) is an abelian group.
For \(G\) non-commutative: pointed set.

## Examples

### \(\mathbb{G}_m\)-torsors

A \(\mathbb{G}_m\)-torsor on \(\mathrm{Spec}\, k\) is a line bundle
without a chosen trivialisation. By Hilbert 90, \(H^1(k, \mathbb{G}_m) = 0\),
so all such torsors are trivial. (Over a non-trivial base scheme \(X\),
\(\mathbb{G}_m\)-torsors are line bundles up to isomorphism, the
Picard group.)

### \(\mu_n\)-torsors

By Kummer theory, \(H^1(k, \mu_n) = k^\times / (k^\times)^n\). A
\(\mu_n\)-torsor over \(k\) is a Galois algebra of exponent \(n\),
i.e.\ \(k(\sqrt[n]{a})\) for \(a \in k^\times\) modulo \(n\)-th powers.

### \(\mathrm{PGL}_n\)-torsors

\(H^1(k, \mathrm{PGL}_n) = \mathrm{Br}(k)[n]\). A torsor under
\(\mathrm{PGL}_n\) is the Brauer-Severi variety of a central simple
\(k\)-algebra \(D\) of degree \(n^2\); the variety becomes
\(\mathbb{P}^{n-1}\) over an étale extension splitting \(D\).

### \(\mathrm{O}(q)\)-torsors

Classify quadratic forms with the same dimension and discriminant
(in characteristic \(\ne 2\)); concretely, the orthonormal frames of
\(q\).

## Twisting

Given a \(G\)-object \(X\) (any object on which \(G\) acts), the
twist \(X^P := P \times^G X\) is the contraction
\((P \times X) / G\) where \(G\) acts diagonally. \(X^P\) is naturally a
\(k\)-form of \(X\). This gives a functor
\[
P \;\mapsto\; X^P, \qquad \{G\text{-objects}\} \to \{k\text{-forms of } X\}.
\]

In particular: for \(X = G\) itself, \(X^P = P\). For \(X = V\) a
representation, \(X^P\) is the **twisted bundle**.

## Geometric properties

For \(G\) smooth and a \(G\)-torsor \(P\):

- \(P\) is smooth (locally on étale cover, \(P \cong G\));
- \(\dim P = \dim G\);
- \(P\) has trivial fundamental group iff \(G\) does (and \(P\) is
  connected iff \(G\) is connected over \(\bar k\)).

If \(G\) is finite étale, \(P\) is also finite étale of the same
order; the corresponding extension \(k(P)/k\) is a Galois algebra.

## Bitorsors and biextensions

A **bitorsor** carries commuting left and right actions of (possibly
different) groups; they classify bimodule structures and appear in
extension theory of group schemes.

**Biextensions** generalise extensions of one group by another to
"two-variable" extensions; they classify Weil pairings, dualities of
abelian varieties, and the Heisenberg group in arithmetic geometry.

## Role in Langlands

- **Bun_G**: the moduli stack of \(G\)-torsors on a curve, the central
  geometric object of geometric Langlands.
- **L-packets and inner forms**: the "rigid inner twists" of Kaletha
  are torsors under \(z\)-extensions.
- **Endoscopy**: endoscopic data include torsors under endoscopic
  groups (Kottwitz–Shelstad).
- **Eisenstein series**: Eisenstein cohomology is computed from
  parabolic torsor stacks on Bun_G.

## References

- Milne, *Étale Cohomology* (1980), §III.
- Skorobogatov, *Torsors and Rational Points* (CUP 2001).
- Olsson, *Algebraic Spaces and Stacks* (2016), §12.

## Prerequisite Topics

- [[node:descent_and_forms.nonabelian_h1|Nonabelian H1]]
