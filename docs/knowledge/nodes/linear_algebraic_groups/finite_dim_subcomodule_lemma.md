---
id: linear_algebraic_groups.finite_dim_subcomodule_lemma
title: Finite-Dimensional Subspace in a Sub-Comodule
kind: lemma
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.comodule_definition
- linear_algebraic_groups.regular_representation_example
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the lemma stated with minimal hypotheses?"
  verdict: "Yes. \\(A\\) need only be a coalgebra over \\(k\\); finite-generation of \\(A\\) as an algebra is not used here. The corollary on regular representations uses finite generation."
tags:
- comodule
- lemma
- linear-algebraic-groups
---

# Finite-Dimensional Subspace in a Sub-Comodule

Let \(k\) be a field, \(A\) a \(k\)-coalgebra, and \(V\) an
[[node:linear_algebraic_groups.comodule_definition|$A$-comodule]] with
coaction \(\rho : V \to V \otimes_k A\). Then every finite-dimensional
\(k\)-subspace \(V_0 \subseteq V\) is contained in a finite-dimensional
sub-comodule \(V_0 \subseteq W \subseteq V\).

*Proof.*  
Pick a basis \(e_1, \dots, e_n\) of \(V_0\). Extend each \(\rho(e_i)\)
in the form

\[
\rho(e_i) \;=\; \sum_{j=1}^{N} f_{ij} \otimes a_{ij},
\]

where \(\{f_{ij}\}_{i,j}\) is a finite subset of \(V\) and
\(\{a_{ij}\}_{i,j}\) is a finite subset of \(A\) (such an expansion
exists because \(V \otimes_k A\) is spanned by elementary tensors and
\(\rho(e_i)\) has only finitely many nonzero terms in any chosen basis
of \(A\)). Let

\[
W \;=\; \operatorname{span}_k\bigl(\, \{e_1, \dots, e_n\} \cup \{f_{ij}\}_{i,j} \,\bigr) \;\subseteq\; V.
\]

Then \(W\) is finite-dimensional and contains \(V_0\). We check that
\(W\) is a sub-comodule, i.e.\ \(\rho(W) \subseteq W \otimes_k A\).

For \(\rho(e_i)\) this holds by construction: \(\rho(e_i) = \sum f_{ij}
\otimes a_{ij}\) and each \(f_{ij} \in W\), so \(\rho(e_i) \in W \otimes
A\).

For \(\rho(f_{ij})\), apply coassociativity:

\[
(\operatorname{id}_V \otimes \Delta) \circ \rho \;=\; (\rho \otimes \operatorname{id}_A) \circ \rho.
\]

Applied to \(e_i\), the left side gives \(\sum_j f_{ij} \otimes \Delta(a_{ij})\)
and the right side gives \(\sum_j \rho(f_{ij}) \otimes a_{ij}\). The
linear independence of \(\{a_{ij}\}_j\) (after refining the family to a
linearly independent subset, replacing the \(f_{ij}\) by linear
combinations) implies that each \(\rho(f_{ij})\) is a linear combination
of elements \(f_{i\ell} \otimes \text{(coefficient in } A\text{)}\),
hence lies in \(W \otimes A\). Concluding, \(W\) is a sub-comodule.  
\(\square\)

**Corollary.** Let \(A\) be a finitely generated commutative Hopf
\(k\)-algebra and let \(a_1, \dots, a_m \in A\) be a finite set of
\(k\)-algebra generators. There exists a finite-dimensional sub-comodule
\(W \subseteq A\) of the
[[node:linear_algebraic_groups.regular_representation_example|regular representation]]
containing each \(a_i\); in particular, \(W\) generates \(A\) as a
\(k\)-algebra.

*Proof of corollary.* Apply the lemma to
\(V = A\), \(\rho = \Delta\), and
\(V_0 = \operatorname{span}_k\{a_1, \dots, a_m\}\).  
\(\square\)
