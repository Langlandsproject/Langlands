---
id: linear_algebraic_groups.algebra_hom_convolution
title: Convolution of Algebra Homomorphisms
kind: definition
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.coordinate_rings_and_hopf_algebras
- foundational_inputs.hopf_algebras
- foundational_inputs.commutative_algebra
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the definition stated at the right level — bialgebra source, commutative target — to support the group-structure construction?"
  verdict: "Yes. The bialgebra structure on \\(A\\) provides comultiplication; the commutativity of \\(B\\) is what makes the convolution of two algebra homomorphisms again an algebra homomorphism."
tags:
- convolution
- hopf-algebra
- definition
- linear-algebraic-groups
---

# Convolution of Algebra Homomorphisms

Let \(R\) be a commutative ring, \(A\) an \(R\)-bialgebra (in particular, an
\(R\)-coalgebra with comultiplication \(\Delta : A \to A \otimes_R A\)),
and \(B\) a commutative \(R\)-algebra with multiplication
\(m_B : B \otimes_R B \to B\). For two \(R\)-algebra homomorphisms
\(f, g : A \to B\), their **convolution** \(f * g : A \to B\) is the
\(R\)-linear map

\[
f * g \;=\; m_B \circ (f \otimes_R g) \circ \Delta.
\]

Using sumless Sweedler notation \(\Delta(a) = \sum_{(a)} a_{(1)} \otimes a_{(2)}\),
the formula reads

\[
(f * g)(a) \;=\; \sum_{(a)} f(a_{(1)}) \cdot g(a_{(2)}).
\]

Convolution restricts the general
\(\operatorname{Hom}_R(A, B)\)-level convolution from
[[node:foundational_inputs.hopf_algebras|the Hopf algebra
infrastructure]] (Mathlib's
\(\texttt{Mathlib.RingTheory.Coalgebra.Convolution}\)) to the subset of
\(R\)-algebra homomorphisms. That this subset is closed under
convolution is the content of
[[node:linear_algebraic_groups.convolution_of_algebra_homs_is_algebra_hom|the next theorem]].
