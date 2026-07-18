---
id: linear_algebraic_groups.antipode_multiplicativity_commutative_hopf
title: Antipode of a Commutative Hopf Algebra Is Multiplicative
kind: theorem
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- foundational_inputs.hopf_algebras
- linear_algebraic_groups.multiplication_is_coalgebra_hom
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.HopfObjectBridge
  declarations:
    - Langlands.AlgebraicGeometry.HopfAntipode.antipode_mul_of_commutative
    - Langlands.AlgebraicGeometry.HopfAntipode.convMul_mul_convCompAntipode
    - Langlands.AlgebraicGeometry.HopfAntipode.convCompAntipode_mul_convMul
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the hypothesis 'A is a commutative Hopf algebra' the right level — does the statement fail without commutativity?"
  verdict: "Yes. Without commutativity of A, the antipode is only anti-multiplicative (S(ab) = S(b)S(a)), not multiplicative. Commutativity of A collapses anti-mult to mult. The direct proof below uses commutativity in exactly one Sweedler step."
tags:
- antipode
- hopf-algebra
- theorem
- linear-algebraic-groups
---

# Antipode of a Commutative Hopf Algebra Is Multiplicative

Let \(R\) be a commutative ring and \(A\) a **commutative** \(R\)-Hopf
algebra with antipode \(S : A \to A\), comultiplication
\(\Delta : A \to A \otimes_R A\), counit \(\varepsilon : A \to R\), unit
\(\eta : R \to A\), and multiplication \(\mu : A \otimes_R A \to A\).
For all \(a, b \in A\),

\[
S(a \cdot b) \;=\; S(a) \cdot S(b).
\]

In particular, \(S\) is an \(R\)-algebra homomorphism \(A \to A\) (it is
\(R\)-linear by construction, sends \(1\) to \(1\) by
\(S(1) = 1\), and is multiplicative by the above).

## Strategy

The proof proceeds in three steps. We work in the convolution algebra
\(\operatorname{Hom}_R(A \otimes A, A)\), with multiplication

\[
(f * g)(x) \;=\; \mu_A \circ (f \otimes g) \circ \Delta_{A \otimes A}(x)
\]

and identity \(1 = \eta_A \circ \varepsilon_{A \otimes A}\). Here
\(\Delta_{A \otimes A}\) is the tensor-product comultiplication,
satisfying \(\Delta_{A \otimes A}(a \otimes b) = \sum (a_{(1)} \otimes
b_{(1)}) \otimes (a_{(2)} \otimes b_{(2)})\) in Sweedler notation.

We show:

- **Step 1.** \(S \circ \mu\) is a *two-sided* convolution inverse of
  \(\mu\) (does not use commutativity of \(A\)).
- **Step 2.** \(\mu \circ (S \otimes S)\) is a *right* convolution
  inverse of \(\mu\) (uses commutativity of \(A\)).
- **Step 3.** Apply the uniqueness "left inverse equals right inverse"
  in any monoid, then evaluate at \(a \otimes b\).

## Proof

### Step 1. \(S \circ \mu\) is a two-sided convolution inverse of \(\mu\)

By [[node:linear_algebraic_groups.multiplication_is_coalgebra_hom|the bialgebra axioms]],
\(\mu : A \otimes A \to A\) is an \(R\)-coalgebra homomorphism.
Pre-composition by a coalgebra hom \(h : C \to D\) intertwines
convolution products on the source and target sides: for any
\(f, g \in \operatorname{End}_R(D)\),

\[
(f \circ h) * (g \circ h) \;=\; (f * g) \circ h
  \qquad \text{(as elements of } \operatorname{Hom}_R(C, D)\text{).}
\]

Taking \(C = A \otimes A\), \(D = A\), and \(h = \mu\), with
\((f, g) = (\operatorname{id}_A, S)\) gives

\[
\mu * (S \circ \mu)
  \;=\; (\operatorname{id}_A \circ \mu) * (S \circ \mu)
  \;=\; (\operatorname{id}_A * S) \circ \mu
  \;=\; (\eta_A \circ \varepsilon_A) \circ \mu
  \;=\; \eta_A \circ \varepsilon_{A \otimes A},
\]

where the third equality is the antipode axiom
\(\operatorname{id}_A * S = 1_{\operatorname{End}_R(A)} = \eta_A \circ \varepsilon_A\),
and the last equality is the counit axiom of
[[node:linear_algebraic_groups.multiplication_is_coalgebra_hom|\(\mu\) being a coalgebra hom]]
(\(\varepsilon_A \circ \mu = \varepsilon_{A \otimes A}\)). The right-hand
side is exactly the convolution identity in
\(\operatorname{Hom}_R(A \otimes A, A)\). Hence \(\mu * (S \circ \mu) = 1\).

Symmetrically, taking \((f, g) = (S, \operatorname{id}_A)\) and using
\(S * \operatorname{id}_A = 1_{\operatorname{End}_R(A)}\) gives
\((S \circ \mu) * \mu = 1\).

So \(S \circ \mu\) is both a left and a right convolution inverse of
\(\mu\) in \(\operatorname{Hom}_R(A \otimes A, A)\).

### Step 2. \(\mu \circ (S \otimes S)\) is a right convolution inverse of \(\mu\) (uses commutativity of \(A\))

Compute \(\mu * (\mu \circ (S \otimes S))\) directly on \(a \otimes b\),
using the Sweedler expansion
\(\Delta_{A \otimes A}(a \otimes b) =
\sum (a_{(1)} \otimes b_{(1)}) \otimes (a_{(2)} \otimes b_{(2)})\):

\[
\begin{aligned}
\bigl(\mu * (\mu \circ (S \otimes S))\bigr)(a \otimes b)
  &= \mu_A \circ \bigl(\mu \otimes (\mu \circ (S \otimes S))\bigr)
      \circ \Delta_{A \otimes A}(a \otimes b) \\
  &= \sum \mu(a_{(1)} \otimes b_{(1)}) \cdot
      (\mu \circ (S \otimes S))(a_{(2)} \otimes b_{(2)}) \\
  &= \sum (a_{(1)} \cdot b_{(1)}) \cdot (S(a_{(2)}) \cdot S(b_{(2)})) \\
  &= \sum a_{(1)} \cdot b_{(1)} \cdot S(a_{(2)}) \cdot S(b_{(2)}).
\end{aligned}
\]

Now the **commutativity of \(A\)** lets us rearrange the four-factor
product to bring each \(b_{(j)}\) past the corresponding \(S(a_{(j)})\):

\[
a_{(1)} \cdot b_{(1)} \cdot S(a_{(2)}) \cdot S(b_{(2)})
  \;=\;
a_{(1)} \cdot S(a_{(2)}) \cdot b_{(1)} \cdot S(b_{(2)}).
\]

Summing and applying the antipode axiom to each tensor factor
(\(\sum a_{(1)} \cdot S(a_{(2)}) = \eta_A(\varepsilon(a))\)):

\[
\begin{aligned}
\sum a_{(1)} \cdot S(a_{(2)}) \cdot b_{(1)} \cdot S(b_{(2)})
  &= \Bigl(\sum a_{(1)} S(a_{(2)})\Bigr) \cdot
     \Bigl(\sum b_{(1)} S(b_{(2)})\Bigr) \\
  &= \eta_A(\varepsilon(a)) \cdot \eta_A(\varepsilon(b)) \\
  &= \eta_A(\varepsilon(a) \cdot \varepsilon(b))
       \qquad \text{(}\eta_A\text{ is an algebra hom)} \\
  &= \eta_A\bigl(\varepsilon_{A \otimes A}(a \otimes b)\bigr)
       \qquad \text{(}\varepsilon_{A \otimes A} = m_R \circ
                      (\varepsilon \otimes \varepsilon)\text{)} \\
  &= 1(a \otimes b).
\end{aligned}
\]

(The bilinearity argument that lets us split the four-factor product
into a product of two sums uses that each factor lies in the
commutative target \(A\), so we can freely reorder.)

Hence \(\mu * (\mu \circ (S \otimes S)) = 1\) in
\(\operatorname{Hom}_R(A \otimes A, A)\), i.e., \(\mu \circ (S \otimes S)\)
is a right convolution inverse of \(\mu\).

### Step 3. Conclusion: left-inverse equals right-inverse

In any monoid \(M\) (here the multiplicative monoid of the convolution
algebra), if an element \(x \in M\) has a left inverse \(L\) (so
\(L \cdot x = 1\)) and a right inverse \(R\) (so \(x \cdot R = 1\)),
then \(L = R\):

\[
L \;=\; L \cdot 1 \;=\; L \cdot (x \cdot R) \;=\; (L \cdot x) \cdot R
  \;=\; 1 \cdot R \;=\; R.
\]

Applied to \(x = \mu\), \(L = S \circ \mu\) (Step 1, left-inverse part),
and \(R = \mu \circ (S \otimes S)\) (Step 2):

\[
S \circ \mu \;=\; \mu \circ (S \otimes S)
  \qquad \text{(in } \operatorname{Hom}_R(A \otimes A, A) \text{).}
\]

Evaluating both sides at \(a \otimes b\):

\[
S(a \cdot b)
  \;=\; (S \circ \mu)(a \otimes b)
  \;=\; (\mu \circ (S \otimes S))(a \otimes b)
  \;=\; \mu(S(a) \otimes S(b))
  \;=\; S(a) \cdot S(b).
\]

\(\square\)

## Mathlib formalization

Mathlib now proves the general anti-multiplicativity theorem as
`HopfAlgebra.antipode_mul`. The project theorem
`Langlands.AlgebraicGeometry.HopfAntipode.antipode_mul_of_commutative`
uses that result and commutativity of \(A\) to obtain
\[
S(ab)=S(a)S(b).
\]

The file `LanglandsLean/AlgebraicGeometry/HopfObjectBridge.lean` also
retains the intermediate convolution lemmas (`mulCoalgHom`,
`convMul_mul_convCompAntipode`, `convCompAntipode_mul_convMul`) because
they are useful local API for comparing the direct Sweedler proof with
Mathlib's theorem.

## Remark: the non-commutative case

For general (non-commutative) \(A\), the same Step 1 still works (gives
\(S \circ \mu\) as the two-sided convolution inverse of \(\mu\)). The
analog of Step 2 is that \(\mu \circ (S \otimes S) \circ \tau\) (with
\(\tau\) the tensor-swap) is a right inverse of \(\mu\). The
commutativity of \(A\) is exactly what lets us drop the swap
\(\tau\) and conclude \(S(ab) = S(a) S(b)\) instead of
\(S(b) S(a)\). See
[[node:linear_algebraic_groups.antipode_anti_multiplicativity|the
general anti-multiplicativity statement]].
