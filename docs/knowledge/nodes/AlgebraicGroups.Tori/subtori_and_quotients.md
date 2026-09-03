---
id: tori.subtori_and_quotients
title: Subtori and Quotients via the Character Lattice
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.f_tori_galois_module_classification
- reductive_groups.diagonalizable_groups_antiequivalence
source:
  spans:
  - artifact: sga3
    locator: "Expose IX"
    note: "Sub- and quotient groups of diagonalizable groups via subgroups and quotients of the character group."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the dictionary distinguish multiplicative-type subgroups from subtori via saturation, and does it hold over an arbitrary base field with Galois action?"
  verdict: "Yes. Saturated Galois-stable sublattices correspond to subtori and arbitrary Galois-stable sublattices to multiplicative-type subgroups; the base field is arbitrary."
tags:
- torus
- subtorus
- quotient
- theorem
- AlgebraicGroups.Tori
---

# Subtori and Quotients via the Character Lattice

Let \(T\) be a torus over \(k\) with character lattice
\(X^*(T)\). Recall that a sublattice \(L \subseteq X^*(T)\) is
**saturated** if \(X^*(T)/L\) is torsion-free.

For a \(\Theta\)-stable sublattice \(L \subseteq X^*(T)\) put
\[
H_L \;=\; \bigcap_{\chi \in L} \ker \chi \;\subseteq\; T .
\]

1. \(H_L\) is a closed \(k\)-subgroup of multiplicative type with
   \(X^*(H_L) = X^*(T)/L\), and \(L \mapsto H_L\) is an
   inclusion-reversing bijection between \(\Theta\)-stable sublattices
   of \(X^*(T)\) and closed multiplicative-type \(k\)-subgroups of
   \(T\).
2. \(H_L\) is a subtorus if and only if \(L\) is saturated.
3. The quotient \(T/H_L\) is a torus with
   \(X^*(T/H_L) = L\), and the exact sequence
   \(1 \to H_L \to T \to T/H_L \to 1\) corresponds to the exact
   sequence \(0 \to L \to X^*(T) \to X^*(T)/L \to 0\) of
   \(\Theta\)-modules.
4. Dually, quotient tori of \(T\) correspond to \(\Theta\)-stable
   saturated sublattices (their character lattices), and surjections of
   tori correspond to injections of character lattices.

In particular every subtorus and every quotient torus of \(T\) is
again a torus, computed purely from the Galois lattice.

*Proof.*
After base change to \(k_s\) the torus is diagonalizable and the
anti-equivalence
[[node:reductive_groups.diagonalizable_groups_antiequivalence]] is
exact: a quotient of character groups \(X^*(T) \twoheadrightarrow
X^*(T)/L\) corresponds to the closed subgroup
\(D(X^*(T)/L) \subseteq D(X^*(T))\), which is exactly the common
kernel \(H_L\) of the characters in \(L\); a subgroup
\(L \subseteq X^*(T)\) corresponds to the quotient
\(D(X^*(T)) \twoheadrightarrow D(L)\), whose kernel is \(H_L\). All
constructions are functorial, so \(\Theta\)-stability of \(L\) is
exactly what makes them descend to \(k\) by
[[node:tori.f_tori_galois_module_classification]].

For (2): \(H_L\) is a torus iff its character group \(X^*(T)/L\) is
torsion-free, which is the definition of saturation. For (3): the
characters of \(T\) vanishing on \(H_L\) are precisely those mapping
to zero in \(X^*(H_L) = X^*(T)/L\), i.e. the elements of \(L\); the
quotient group \(T/H_L\) is of multiplicative type with character
group \(L\), and \(L\), being a subgroup of a lattice, is
torsion-free, so \(T/H_L\) is a torus. (4) is (1)-(3) read through the
anti-equivalence.
