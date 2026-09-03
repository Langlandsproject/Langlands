---
id: affine_group_schemes.special_linear_group_scheme
title: Special Linear Group Scheme SL_n
kind: definition
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
- AlgebraicGroups.ClassicalAndExceptionalGroups
uses:
- affine_group_schemes.general_linear_group_scheme
- affine_group_schemes.multiplicative_group_scheme
- affine_group_schemes.affine_group_scheme_definition
- affine_group_schemes.coordinate_hopf_algebra_of_group_scheme
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.1"
    format: section
    note: "SL_n as the kernel of the determinant character on GL_n."
  - artifact: demazure-gabriel-groupes-algebriques
    locator: "Chapter II, §1"
    format: section
    note: "SL_n as a closed subgroup scheme of GL_n via the determinant."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is SL_n defined as a group scheme over an arbitrary base, not just over a field?"
  verdict: "Yes. The determinant is a morphism of group schemes over any base, so SL_n = ker(det) is a flat closed subgroup scheme of GL_n over Z, hence over any base scheme."
tags:
- classical-groups
- special-linear
- group-scheme
- determinant
- affine-group-scheme
---

# Special Linear Group Scheme SL_n

## Definition (functor of points)

For a commutative ring \(R\), define
\[
\mathrm{SL}_n(R) = \{A \in M_n(R) : \det A = 1\}.
\]
This rule \(R \mapsto \mathrm{SL}_n(R)\) is a representable functor,
represented by the affine group scheme
\[
\mathrm{SL}_n = \operatorname{Spec}\bigl(\mathbb{Z}[x_{ij}]_{1\le i,j\le n}/(\det(x_{ij})-1)\bigr).
\]

## Coordinate Hopf algebra

The coordinate ring is
\[
\mathcal{O}(\mathrm{SL}_n) = \mathbb{Z}[x_{ij}]/(\det - 1).
\]
The Hopf algebra structure is inherited from \(\mathcal{O}(\mathrm{GL}_n)\):

- **Comultiplication** \(\Delta(x_{ij}) = \sum_k x_{ik} \otimes x_{kj}\)
  (matrix multiplication).
- **Counit** \(\varepsilon(x_{ij}) = \delta_{ij}\)
  (identity matrix).
- **Antipode** \(S(x_{ij}) = (-1)^{i+j} M_{ji}\),
  where \(M_{ji}\) is the \((j,i)\)-minor (inverse via Cramer's rule;
  the determinant constraint makes this polynomial, not requiring
  inversion).

## As kernel of the determinant

\(\mathrm{SL}_n\) is the kernel of the determinant character
\[
\det : \mathrm{GL}_n \longrightarrow \mathbb{G}_m,\quad A \mapsto \det A.
\]
That is, \(\mathrm{SL}_n = \ker(\det)\) in the category of group schemes.
This is a closed immersion of group schemes, making \(\mathrm{SL}_n\) a
normal closed subgroup scheme of \(\mathrm{GL}_n\).

## Structure

- **Dimension**: \(n^2 - 1\) (removing one degree of freedom from \(GL_n\)).
- **Smoothness**: \(\mathrm{SL}_n\) is smooth over \(\mathbb{Z}\)
  (the determinant map is surjective on tangent spaces; equivalently,
  the Jacobian criterion holds). In particular, it is a smooth group scheme
  over any base.
- **Simply connected**: \(\mathrm{SL}_n\) is the simply connected cover
  in its isogeny class (root datum \(A_{n-1}\) with weight lattice as
  character group).
- **Quotient**: The quotient \(\mathrm{GL}_n / \mathrm{SL}_n \cong \mathbb{G}_m\)
  via the determinant.
- **Centre**: \(Z(\mathrm{SL}_n) = \mu_n\) (the \(n\)-th roots of unity),
  embedded as scalar matrices \(\zeta I_n\).

## Small cases

- \(\mathrm{SL}_1 = \{1\}\) (trivial group).
- \(\mathrm{SL}_2\): the simply connected cover of \(\mathrm{PGL}_2\);
  root datum \(A_1\); over \(\mathbb{C}\), isomorphic to \(\mathrm{SU}(2)\)
  as a real Lie group.
- \(\mathrm{SL}_n/\mu_n \cong \mathrm{PGL}_n\) (the adjoint form of type
  \(A_{n-1}\)).

## Lie algebra

\[
\operatorname{Lie}(\mathrm{SL}_n) = \mathfrak{sl}_n
= \{X \in M_n : \operatorname{tr}(X) = 0\}.
\]
Dimension \(n^2-1\); the adjoint representation on \(\mathfrak{sl}_n\)
is the adjoint representation of the Lie algebra.

## Root datum

\(\mathrm{SL}_n\) with maximal torus
\(T = \{\mathrm{diag}(t_1,\dots,t_n) : \prod t_i = 1\}\) has
\[
X^*(T) = \{(a_1,\dots,a_n)\in\mathbb{Z}^n : \sum a_i = 0\},\quad
\Phi = \{\varepsilon_i - \varepsilon_j : i\ne j\}.
\]
This is the root datum of type \(A_{n-1}\), simply connected form.
