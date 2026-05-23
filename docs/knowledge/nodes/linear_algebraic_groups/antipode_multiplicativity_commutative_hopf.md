---
id: linear_algebraic_groups.antipode_multiplicativity_commutative_hopf
title: Antipode of a Commutative Hopf Algebra Is Multiplicative
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.antipode_anti_multiplicativity
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.HopfObjectBridge
  declarations:
    - Langlands.AlgebraicGeometry.HopfAntipode.antipode_mul_of_commutative
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the hypothesis 'A is a commutative Hopf algebra' the right level — does the statement fail without commutativity?"
  verdict: "Yes. Without commutativity of A, the antipode is only anti-multiplicative, not multiplicative. Commutativity collapses anti-mult to mult."
tags:
- antipode
- hopf-algebra
- theorem
- linear-algebraic-groups
---

# Antipode of a Commutative Hopf Algebra Is Multiplicative

Let \(R\) be a commutative ring and \(A\) a commutative \(R\)-Hopf
algebra with antipode \(S : A \to A\). For all \(a, b \in A\),

\[
S(a \cdot b) \;=\; S(a) \cdot S(b).
\]

In particular, \(S\) is an \(R\)-algebra homomorphism \(A \to A\).

*Proof.*  
By
[[node:linear_algebraic_groups.antipode_anti_multiplicativity|antipode anti-multiplicativity]],
\(S(ab) = S(b) \cdot S(a)\). By commutativity of \(A\),
\(S(b) \cdot S(a) = S(a) \cdot S(b)\). Combining,
\(S(ab) = S(a) \cdot S(b)\).

The antipode axioms also give \(S(1) = 1\), and \(S\) is \(R\)-linear
by construction. Hence \(S\) is an \(R\)-algebra homomorphism.  
\(\square\)
