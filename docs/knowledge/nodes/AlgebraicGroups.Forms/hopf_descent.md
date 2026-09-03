---
id: forms.hopf_descent
title: Galois Descent for Hopf Algebras
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
- AlgebraicGroups.Tori
uses:
- forms.galois_groups_and_descent_data
- forms.galois_descent_for_vector_spaces
- foundations.hopf_algebras
source:
  spans:
  - artifact: waterhouse-affine-group-schemes
    locator: "Chapter 17"
    format: section
    note: "Forms and Galois descent for affine group schemes; the Hopf-algebra formulation."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the descent stated for a finite Galois extension of arbitrary fields, for arbitrary (not necessarily finite-dimensional) commutative Hopf algebras, with the equivalence of categories and not just the object-level bijection?"
  verdict: "Yes. Only finiteness and Galois-ness of E/k are used; the Hopf algebras are arbitrary commutative E-Hopf algebras, and the statement includes the hom-level bijection making the correspondence an equivalence of categories."
tags:
- galois-descent
- hopf-algebra
- semilinear
- theorem
- AlgebraicGroups.Forms
---

# Galois Descent for Hopf Algebras

Let \(E/k\) be a finite Galois extension with group
\(\Gamma = \operatorname{Gal}(E/k)\). Let \(A\) be a commutative
\(E\)-Hopf algebra equipped with a **semilinear \(\Gamma\)-action**:
ring automorphisms \(\rho_\gamma : A \to A\) with
\(\rho_1 = \mathrm{id}\), \(\rho_{\gamma\delta} =
\rho_\gamma \circ \rho_\delta\),
\(\rho_\gamma(c\,a) = \gamma(c)\,\rho_\gamma(a)\) for \(c \in E\),
**compatible with the Hopf structure**:
\[
\Delta \circ \rho_\gamma = (\rho_\gamma \otimes \rho_\gamma) \circ \Delta,
\qquad
\varepsilon(\rho_\gamma a) = \gamma\bigl(\varepsilon(a)\bigr),
\qquad
S \circ \rho_\gamma = \rho_\gamma \circ S,
\]
where the middle identity uses the semilinear action of \(\gamma\) on
the codomain \(E\) of \(\varepsilon\), and the first uses the
diagonal semilinear action on \(A \otimes_E A\) (well defined because
\(\rho_\gamma \otimes \rho_\gamma\) is balanced over the
\(\gamma\)-twist).

Then, writing \(B := A^\Gamma\) for the fixed points:

1. \(B\) is a \(k\)-Hopf algebra under the restrictions of the
   structure maps of \(A\);
2. the natural multiplication map
   \(E \otimes_k B \longrightarrow A\) is an isomorphism of
   \(E\)-Hopf algebras (where \(E \otimes_k B\) carries the base-change
   Hopf structure);
3. the assignments \(A \mapsto A^\Gamma\) and
   \(B \mapsto E \otimes_k B\) are quasi-inverse equivalences between
   the category of commutative \(E\)-Hopf algebras with compatible
   semilinear \(\Gamma\)-action (morphisms: \(\Gamma\)-equivariant
   \(E\)-Hopf maps) and the category of commutative \(k\)-Hopf
   algebras; in particular
   \[
   \operatorname{Hom}_{k\text{-Hopf}}(B, B')
   \;\cong\;
   \operatorname{Hom}_{\Gamma,\,E\text{-Hopf}}(A, A').
   \]

*Proof.*
**Step 1: linear descent.** By
[[node:forms.galois_descent_for_vector_spaces]] applied to the
underlying \(E\)-vector space of \(A\), the fixed points \(B\) span
\(A\) over \(E\) and \(k\)-linearly independent fixed vectors stay
\(E\)-independent; hence \(E \otimes_k B \to A\) is an isomorphism of
\(E\)-vector spaces. Applied to \(A \otimes_E A\) with the diagonal
semilinear action, the same theorem gives
\((A \otimes_E A)^\Gamma \cong B \otimes_k B\): the spanning half
shows every fixed tensor is an \(E\)-combination of fixed
decomposables, and independence identifies the \(k\)-structure.

**Step 2: the structure maps restrict.** Multiplication and unit are
\(\Gamma\)-equivariant because the \(\rho_\gamma\) are ring maps.
The compatibility hypotheses say exactly that \(\Delta\),
\(\varepsilon\), \(S\) are \(\Gamma\)-equivariant; hence they carry
fixed points to fixed points:
\(\Delta(B) \subseteq (A \otimes_E A)^\Gamma = B \otimes_k B\),
\(\varepsilon(B) \subseteq E^\Gamma = k\) (Galois),
\(S(B) \subseteq B\). The Hopf axioms for the restricted maps hold
because they hold in \(A\) and \(B \hookrightarrow A\),
\(B \otimes_k B \hookrightarrow A \otimes_E A\) are injective
(Step 1). This proves (1), and (2) upgrades the linear isomorphism of
Step 1 to Hopf: it is a ring map by construction, and comultiplication
is compatible because it is determined on the spanning set
\(B\).

**Step 3: homs.** A \(\Gamma\)-equivariant \(E\)-Hopf map
\(\phi : A \to A'\) carries fixed points to fixed points, giving
\(\phi^\Gamma : B \to B'\), a \(k\)-Hopf map. Conversely a \(k\)-Hopf
map \(\psi : B \to B'\) base-changes to
\(E \otimes \psi : E \otimes_k B \to E \otimes_k B'\), which is
\(\Gamma\)-equivariant for the actions \(\gamma \otimes 1\) — these
correspond to the given actions under (2). The two constructions are
mutually inverse: \(\phi\) is determined by its restriction to \(B\)
because \(B\) spans \(A\) over \(E\) and \(\phi\) is \(E\)-linear.
This proves (3). \(\square\)

## Remarks

- The compatibility of \(\Delta\) is stated through the diagonal
  semilinear action on \(A \otimes_E A\); making this precise is the
  only delicate point of the formalization (plan G0.C M3, where it is
  done for the concrete twisted group algebra rather than
  axiomatically — design decision D-d).
- Specialized to \(A = E[M]\) with the action twisted by a lattice
  action of \(\Gamma\), this theorem produces all twisted forms of
  split tori; see [[node:tori.twisted_form_of_lattice]].
