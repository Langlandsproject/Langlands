---
id: descent_and_forms.galois_descent_for_vector_spaces
title: Galois Descent for Vector Spaces
kind: theorem
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
- tori
uses:
- descent_and_forms.galois_groups_and_descent_data
lean:
  modules:
  - LanglandsLean.Tori.Speiser
  declarations:
  - Langlands.Tori.span_fixedPoints_eq_top
  - Langlands.Tori.span_galEval_eq_top
  - Langlands.Tori.linearIndependent_algEquiv
verification:
  statement: accepted
  proof: accepted
  alignment: pending
generality:
  reviewed: true
  prompt: "Is the theorem stated for arbitrary semilinear actions on arbitrary (possibly infinite-dimensional) vector spaces over a finite extension?"
  verdict: "Yes. The vector space is arbitrary; only finiteness of the extension is used. The formalized part (the spanning half) does not even use that the extension is Galois."
tags:
- galois-descent
- semilinear
- speiser
- descent-and-forms
---

# Galois Descent for Vector Spaces

Let \(E/k\) be a finite Galois extension with group
\(\Gamma = \operatorname{Gal}(E/k)\), and let \(V\) be an
\(E\)-vector space with a **semilinear** \(\Gamma\)-action: additive
automorphisms \(\rho_\gamma\) with
\(\rho_\gamma(c v) = \gamma(c)\,\rho_\gamma(v)\), compatible with
composition. Then the natural map
\[
E \otimes_k V^{\Gamma} \;\longrightarrow\; V
\]
is an isomorphism of \(E\)-vector spaces. (Classically Speiser's
lemma; the case \(V = E^n\) with the standard action is equivalent to
\(H^1(\Gamma, \mathrm{GL}_n(E)) = 1\), the Hilbert 90 statement for the general linear group.)

Equivalently, split into the two halves that are used separately:

1. **Spanning** (surjectivity): the fixed points \(V^{\Gamma}\) span
   \(V\) over \(E\). This half does not use that \(E/k\) is Galois —
   only that \(E/k\) is finite, so that \(\Gamma\) is a finite set of
   field embeddings.
2. **Independence** (injectivity): \(k\)-linearly independent
   elements of \(V^{\Gamma}\) remain \(E\)-linearly independent
   in \(V\).

Consequently the category of \(k\)-vector spaces is equivalent to the
category of \(E\)-vector spaces with semilinear \(\Gamma\)-action,
\(W \mapsto E \otimes_k W\) with quasi-inverse \(V \mapsto V^\Gamma\).
This equivalence is the engine behind the classification of twisted
forms — in particular the classification of
[[node:tori.algebraic_tori|algebraic tori]] by Galois lattices
([[node:tori.f_tori_galois_module_classification]]), where it is
applied to the group algebra \(E[M]\) with the semilinear action
twisted by a lattice action.

*Proof.*
**Spanning.** For \(v \in V\) and \(c \in E\), the average
\(w_c = \sum_{\gamma \in \Gamma} \rho_\gamma(c v)\) is
\(\Gamma\)-fixed, and by semilinearity
\(w_c = \sum_\gamma \gamma(c)\, \rho_\gamma(v)\). The evaluation
vectors \((\gamma(c))_{\gamma \in \Gamma}\), as \(c\) ranges over
\(E\), span the function space \(\Gamma \to E\) over \(E\): a linear
functional annihilating all of them is a relation
\(\sum_\gamma a_\gamma \gamma = 0\) among the distinct field
embeddings, which forces \(a_\gamma = 0\) by Dedekind's linear
independence of characters. Choose therefore finitely many
\(c_i \in E\) and \(b_i \in E\) with
\(\sum_i b_i \gamma(c_i) = \delta_{\gamma, 1}\) for all
\(\gamma \in \Gamma\); then
\(\sum_i b_i\, w_{c_i} = \sum_\gamma \bigl(\sum_i b_i
\gamma(c_i)\bigr) \rho_\gamma(v) = \rho_1(v) = v\), exhibiting \(v\)
in the \(E\)-span of fixed vectors.

**Independence.** Let \(v_1, \dots, v_n \in V^\Gamma\) be
\(k\)-linearly independent and suppose
\(\sum_j c_j v_j = 0\) with \(c_j \in E\), not all zero, with \(n\)
minimal. Normalizing \(c_1 = 1\) and applying \(\rho_\gamma\) gives
\(\sum_j \gamma(c_j) v_j = 0\); subtracting,
\(\sum_{j \geq 2} (\gamma(c_j) - c_j) v_j = 0\) is a shorter
relation, so \(\gamma(c_j) = c_j\) for all \(\gamma\), i.e. all
\(c_j \in E^\Gamma = k\) (here Galois-ness of \(E/k\) enters),
contradicting \(k\)-independence.

**Isomorphism.** Surjectivity of \(E \otimes_k V^\Gamma \to V\) is
the spanning half; injectivity is the independence half applied to a
\(k\)-basis of \(V^\Gamma\).
