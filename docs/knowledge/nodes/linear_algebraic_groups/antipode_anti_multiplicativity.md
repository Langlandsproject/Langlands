---
id: linear_algebraic_groups.antipode_anti_multiplicativity
title: Antipode of a Hopf Algebra Is Anti-Multiplicative
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- foundational_inputs.hopf_algebras
- linear_algebraic_groups.coordinate_rings_and_hopf_algebras
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.HopfObjectBridge
  declarations:
    - Langlands.AlgebraicGeometry.HopfAntipode.antipode_anti_multiplicativity
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the lemma stated for arbitrary Hopf algebras (no commutativity assumption)?"
  verdict: "Yes. Anti-multiplicativity holds for every Hopf algebra; the Lean wrapper delegates to Mathlib's ring-theoretic theorem."
tags:
- antipode
- hopf-algebra
- theorem
- linear-algebraic-groups
---

# Antipode of a Hopf Algebra Is Anti-Multiplicative

Let \(R\) be a commutative ring and \(A\) an \(R\)-Hopf algebra with
antipode \(S : A \to A\). For all \(a, b \in A\),

\[
S(a \cdot b) \;=\; S(b) \cdot S(a).
\]

*Proof.*  
The standard argument uses uniqueness of inverses in the convolution
algebra. Consider the convolution algebra \(\operatorname{End}_R(A \otimes_R A, A)\)
with convolution multiplication coming from the coalgebra structure on
\(A \otimes A\) and the algebra structure on \(A\). The multiplication
map \(\mu : A \otimes A \to A\) is an element of this algebra. We
exhibit two convolution-inverses of \(\mu\) and conclude they are
equal:

1. \(\mu \circ (S \otimes S) \circ \tau\), where \(\tau\) is the
   tensor-swap, satisfies
   \(\mu * (\mu \circ (S \otimes S) \circ \tau) = \eta \circ \varepsilon \circ \mu\),
   by direct Sweedler computation using the antipode axiom on each
   factor.
2. \(S \circ \mu\) satisfies the analogous identity by a similar
   computation, using that \(\varepsilon\) is multiplicative
   (\(\varepsilon(ab) = \varepsilon(a) \varepsilon(b)\), the bialgebra
   axiom).

Convolution inverses in an algebra are unique, hence the two maps are
equal: \(S \circ \mu = \mu \circ (S \otimes S) \circ \tau\), i.e.\
\(S(ab) = S(b) S(a)\).  
\(\square\)

**Mathlib state.** This lemma is now proved directly at the
ring-theoretic level as \(\texttt{HopfAlgebra.antipode\_mul}\) in
\(\texttt{Mathlib.RingTheory.HopfAlgebra.Basic}\). The project exposes
the same theorem under
\(\texttt{Langlands.AlgebraicGeometry.HopfAntipode.antipode\_anti\_multiplicativity}\)
so downstream nodes do not depend on Mathlib naming details.

**Project use.** For affine group schemes we usually use the
**commutative-source** specialization,
[[node:linear_algebraic_groups.antipode_multiplicativity_commutative_hopf|the
multiplicativity statement \(S(ab) = S(a) S(b)\)]], which follows from
anti-multiplicativity plus commutativity of the coordinate ring.
