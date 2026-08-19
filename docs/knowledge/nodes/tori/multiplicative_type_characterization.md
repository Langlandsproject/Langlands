---
id: tori.multiplicative_type_characterization
title: Tori among Groups of Multiplicative Type
kind: theorem
status: admitted
primary_topic: tori
topics:
- tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- reductive_structure.diagonalizable_groups
- reductive_structure.diagonalizable_groups_antiequivalence
source:
  spans:
  - artifact: sga3
    locator: "Expose IX and Expose X"
    note: "Diagonalizable groups, groups of multiplicative type, and their classification by character groups."
  - artifact: springer-linear-algebraic-groups
    locator: "Section 3.2"
    format: section
    note: "Diagonalizable groups; tori as the torsion-free case."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the statement handle positive characteristic correctly, in particular the failure of the equivalence between connectedness and torsion-freeness?"
  verdict: "Yes. The characteristic-p trichotomy is stated explicitly, with mu_p as the witness that connected multiplicative type does not imply torus."
tags:
- torus
- multiplicative-type
- theorem
- tori
---

# Tori among Groups of Multiplicative Type

Let \(k\) be a field and let \(G\) be an affine algebraic \(k\)-group
of multiplicative type (a \(k_s/k\)-form of a
[[node:reductive_structure.diagonalizable_groups|diagonalizable group]]),
with character group \(X^*(G)\), a finitely generated abelian group.
The following are equivalent:

1. \(G\) is a torus, i.e. \(G_{k_s} \cong \mathbb{G}_m^n\);
2. \(X^*(G)\) is torsion-free;
3. \(G\) is smooth and connected.

If \(\operatorname{char}(k) = 0\), these are further equivalent to
\(G\) being connected. If \(\operatorname{char}(k) = p > 0\) they are
**not**: \(\mu_p\) is connected of multiplicative type with
\(X^*(\mu_p) = \mathbb{Z}/p\), and it is neither smooth nor a torus.
The precise trichotomy for \(G\) of multiplicative type with
\(M = X^*(G)\), in characteristic \(p \geq 0\), is:

- \(G\) is **smooth** if and only if \(M\) has no \(p\)-torsion;
- \(G\) is **connected** if and only if \(M\) has no torsion prime to
  \(p\);
- \(G\) is a **torus** if and only if \(M\) is torsion-free.

Consequently the phrase "connected multiplicative type" defines a
torus only in characteristic zero, and the torsion-freeness of
\(X^*\) (equivalently: smooth and connected) is the correct general
definition.

*Proof.*
All conditions are insensitive to base change along \(k_s/k\), so we
may assume \(G = D(M)\) diagonalizable with coordinate ring
\(k[M]\), by [[node:reductive_structure.diagonalizable_groups_antiequivalence]].
Decompose \(M \cong \mathbb{Z}^n \oplus M_{p} \oplus M_{p'}\) with
\(M_p\) the \(p\)-primary torsion and \(M_{p'}\) the torsion of order
prime to \(p\); correspondingly \(D(M) \cong \mathbb{G}_m^n \times
D(M_p) \times D(M_{p'})\).

For a cyclic factor \(\mathbb{Z}/m\) with \(p \nmid m\), the algebra
\(k[x]/(x^m - 1)\) is etale, so \(D(\mathbb{Z}/m) = \mu_m\) is a
finite etale group scheme with \(m > 1\) geometric points: smooth,
not connected. For a cyclic factor \(\mathbb{Z}/p^a\) with \(p > 0\),
the algebra \(k[x]/(x^{p^a} - 1) = k[x]/((x-1)^{p^a})\) is a local
Artin ring: \(\mu_{p^a}\) is connected, not smooth. The factor
\(\mathbb{G}_m^n\) is smooth and connected. Since smoothness and
connectedness of a finite product hold exactly when they hold for each
factor, \(D(M)\) is smooth iff \(M_p = 0\), connected iff
\(M_{p'} = 0\), and smooth and connected iff \(M\) is torsion-free,
in which case \(D(M) = \mathbb{G}_m^n\) is a torus. Conversely a torus
has \(X^* = \mathbb{Z}^n\) torsion-free.
