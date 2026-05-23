---
id: linear_algebraic_groups.algebra_homs_form_group_under_convolution
title: Algebra Homomorphisms Form a Group Under Convolution
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.convolution_of_algebra_homs_is_algebra_hom
- linear_algebraic_groups.algebra_hom_composed_with_antipode_is_algebra_hom
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the statement at the right level — Hopf source, commutative target — and is the group commutative when the bialgebra is cocommutative?"
  verdict: "Yes. The Hopf hypothesis is essential for inverses; commutativity of B is essential for the convolution to land in algebra homs. The convolution group is commutative iff A is cocommutative (Δ is symmetric)."
tags:
- convolution
- hopf-algebra
- theorem
- linear-algebraic-groups
---

# Algebra Homomorphisms Form a Group Under Convolution

Let \(R\) be a commutative ring, \(A\) an \(R\)-Hopf algebra with
counit \(\varepsilon : A \to R\) and antipode \(S : A \to A\), and \(B\)
a commutative \(R\)-algebra. The set
\(\operatorname{Hom}_{R\text{-Alg}}(A, B)\) of \(R\)-algebra
homomorphisms forms a group under
[[node:linear_algebraic_groups.algebra_hom_convolution|convolution]],
with:

- **identity element** the composition
  \(\eta_B \circ \varepsilon : A \to B\), where
  \(\eta_B : R \to B\) is the structure map of \(B\) as an
  \(R\)-algebra;
- **inverse** of \(f : A \to B\) the composition \(f \circ S : A \to B\).

*Proof.*  
That the convolution lands in algebra homs is
[[node:linear_algebraic_groups.convolution_of_algebra_homs_is_algebra_hom|the preceding theorem]].
That \(\eta_B \circ \varepsilon\) and \(f \circ S\) are algebra homs is
direct (counit and antipode are coalgebra/anti-algebra maps; combined
with the commutativity of \(B\), the antipode composed with \(f\)
remains an algebra hom — the antipode-is-anti-algebra-hom and
commutativity-of-\(B\) cancel).

*Identity.* For any \(f \in \operatorname{Hom}_{R\text{-Alg}}(A, B)\)
and \(a \in A\),

\[
((\eta_B \varepsilon) * f)(a)
  \;=\; \sum_{(a)} \eta_B(\varepsilon(a_{(1)})) \cdot f(a_{(2)})
  \;=\; \sum_{(a)} f\bigl(\varepsilon(a_{(1)})\, a_{(2)}\bigr)
  \;=\; f(a)
\]

by the **counit axiom**
\(\sum_{(a)} \varepsilon(a_{(1)})\, a_{(2)} = a\) of the coalgebra
\(A\) (and \(f\) being \(R\)-linear). Similarly
\(f * (\eta_B \varepsilon) = f\).

*Inverse.* For \(f \in \operatorname{Hom}_{R\text{-Alg}}(A, B)\) and
\(a \in A\),

\[
(f * (f \circ S))(a)
  \;=\; \sum_{(a)} f(a_{(1)}) \cdot f(S(a_{(2)}))
  \;=\; f\bigl(\sum_{(a)} a_{(1)} S(a_{(2)})\bigr)
  \;=\; f(\eta_A \varepsilon(a))
  \;=\; \eta_B \varepsilon(a)
\]

by the **antipode axiom**
\(\sum_{(a)} a_{(1)} S(a_{(2)}) = \eta_A \varepsilon(a)\), where
\(\eta_A : R \to A\) is the unit. Hence \(f * (f \circ S) = \eta_B \varepsilon\),
the identity element. Symmetrically \((f \circ S) * f = \eta_B \varepsilon\).

*Associativity.* Follows from the coassociativity of \(\Delta\) and the
associativity of the multiplication of \(B\) by a direct computation
with Sweedler notation.

Hence \((\operatorname{Hom}_{R\text{-Alg}}(A, B), *)\) is a group.  
\(\square\)
