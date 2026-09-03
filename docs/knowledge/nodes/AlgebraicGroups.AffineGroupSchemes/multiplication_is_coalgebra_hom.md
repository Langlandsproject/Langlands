---
id: affine_group_schemes.multiplication_is_coalgebra_hom
title: Multiplication of a Commutative Bialgebra Is a Coalgebra Hom
kind: lemma
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
uses:
- foundations.hopf_algebras
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.HopfObjectBridge
  declarations:
  - Langlands.AlgebraicGeometry.HopfAntipode.convAntipode
  - Langlands.AlgebraicGeometry.HopfAntipode.convId
  - Langlands.AlgebraicGeometry.HopfAntipode.convId_mul_convAntipode
  - Langlands.AlgebraicGeometry.HopfAntipode.convAntipode_mul_convId
  - Langlands.AlgebraicGeometry.HopfAntipode.convMul_mul_convMulCompSSTensor
  - Langlands.AlgebraicGeometry.HopfAntipode.mul_map_twist_eq_lTensor_smul_lTensor
  - Langlands.AlgebraicGeometry.HopfAntipode.mulCoalgHom
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Does this require commutativity of A?"
  verdict: "No — this is a pure bialgebra fact (counit and comul are algebra homomorphisms, by definition of bialgebra). The commutativity of A is not used in this lemma, only in downstream uses like antipode multiplicativity."
tags:
- bialgebra
- coalgebra
- lemma
- linear-algebraic-groups
---

# Multiplication of a Bialgebra Is a Coalgebra Hom

Let \(R\) be a commutative ring and \(A\) an \(R\)-bialgebra with
multiplication \(\mu : A \otimes_R A \to A\), comultiplication
\(\Delta : A \to A \otimes_R A\), counit \(\varepsilon : A \to R\), and
unit \(\eta : R \to A\). Then \(\mu\) is an \(R\)-coalgebra
homomorphism from \(A \otimes_R A\) (with its tensor-bialgebra
structure) to \(A\). Concretely, \(\mu\) satisfies the two coalgebra-hom
axioms:

\[
\varepsilon_A \circ \mu \;=\; \varepsilon_{A \otimes A},
\qquad
(\mu \otimes \mu) \circ \Delta_{A \otimes A} \;=\; \Delta_A \circ \mu.
\]

*Proof.*

By definition of the bialgebra \(A\), the counit \(\varepsilon\) and
the comultiplication \(\Delta\) are themselves \(R\)-algebra
homomorphisms. Spelled out at the level of elements (using Sweedler
notation):

- **Counit axiom.** For all \(a, b \in A\),
  \(\varepsilon(a \cdot b) = \varepsilon(a) \cdot \varepsilon(b)\)
  (since \(\varepsilon\) is an algebra hom). The right-hand side is
  exactly \(\varepsilon_{A \otimes A}(a \otimes b)\) (by the tensor
  product of coalgebras: \(\varepsilon_{A \otimes A} = m_R \circ
  (\varepsilon \otimes \varepsilon)\)). Hence
  \(\varepsilon_A \circ \mu = \varepsilon_{A \otimes A}\).

- **Comultiplication axiom.** For all \(a, b \in A\),
  \(\Delta(a \cdot b) = \Delta(a) \cdot \Delta(b)\) (since \(\Delta\) is
  an algebra hom), where the right-hand side is the algebra
  multiplication in \(A \otimes A\). Writing
  \(\Delta(a) = \sum a_{(1)} \otimes a_{(2)}\) and
  \(\Delta(b) = \sum b_{(1)} \otimes b_{(2)}\), this gives

  \[
  \Delta(a \cdot b)
    \;=\; \sum (a_{(1)} b_{(1)}) \otimes (a_{(2)} b_{(2)})
    \;=\; (\mu \otimes \mu)\bigl(\Delta_{A \otimes A}(a \otimes b)\bigr),
  \]

  where the last equality uses the tensor-bialgebra comultiplication
  \(\Delta_{A \otimes A}(a \otimes b)
    = \sum (a_{(1)} \otimes b_{(1)}) \otimes (a_{(2)} \otimes b_{(2)})\)
  (the "tensor of comuls plus swap of middle factors"). \(\square\)

## Downstream use

The coalgebra-hom structure of \(\mu\) is the key ingredient in the
convolution-inverse uniqueness proof of antipode multiplicativity for
commutative Hopf algebras (`antipode_multiplicativity_commutative_hopf`).
It lets one pull back the antipode identities from
\(\operatorname{End}_R(A)\) to \(\operatorname{Hom}_R(A \otimes A, A)\)
via pre-composition by \(\mu\).
