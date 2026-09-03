---
id: tori.twisted_form_of_lattice
title: The Twisted Form of a Galois Lattice
kind: definition
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
- AlgebraicGroups.Forms
uses:
- forms.hopf_descent
- affine_group_schemes.group_algebra_scheme
- tori.torus_definition
- tori.split_torus
- tori.characters_as_group_like_elements
lean:
  modules:
  - LanglandsLean.AlgebraicGroups.Tori.Classification
  declarations:
  - Langlands.Tori.exists_charLatticeRep_iso
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 13.1"
    format: section
    note: "Proposition 13.1.4, essential surjectivity direction: the fixed algebra of a semilinear action on a group algebra."
  - artifact: waterhouse-affine-group-schemes
    locator: "Chapter 17"
    format: section
    note: "Descent of Hopf algebras applied to group algebras."
verification:
  definition: accepted
  proof: not_applicable
  alignment: pending
generality:
  reviewed: true
  prompt: "Is the construction stated for an arbitrary finite Galois extension and an arbitrary finite free lattice with Gamma-action, without hypotheses on the characteristic or on the action?"
  verdict: "Yes. E/k is any finite Galois extension, (M, sigma) any finite free Z-module with Gal(E/k)-action; no characteristic or perfectness hypotheses enter."
tags:
- torus
- twisted-form
- galois-lattice
- definition
- AlgebraicGroups.Tori
---

# The Twisted Form of a Galois Lattice

Let \(E/k\) be a finite Galois extension,
\(\Gamma = \operatorname{Gal}(E/k)\), and let \((M, \sigma)\) be a
**\(\Gamma\)-lattice**: a finite free \(\mathbb{Z}\)-module \(M\)
with an action \(\sigma : \Gamma \to \operatorname{Aut}(M)\).

On the group algebra \(E[M]\) (the coordinate Hopf algebra of the
split torus \(D(M)\), see
[[node:affine_group_schemes.group_algebra_scheme]]), define the
semilinear \(\Gamma\)-action
\[
\rho_\gamma\bigl(a\,e^m\bigr) \;=\; \gamma(a)\, e^{\sigma_\gamma m},
\qquad a \in E,\; m \in M .
\]
Each \(\rho_\gamma\) permutes the group-like basis \(\{e^m\}\) and is
therefore compatible with the Hopf structure
(\(\Delta e^m = e^m \otimes e^m\), \(\varepsilon(e^m) = 1\),
\(S(e^m) = e^{-m}\)), so [[node:forms.hopf_descent]] applies. The
**twisted form of \((M,\sigma)\)** is the affine group scheme
\[
T(M, \sigma) \;:=\;
\operatorname{Spec}\Bigl( E[M]^{\Gamma} \Bigr)
\]
over \(k\), with coordinate \(k\)-Hopf algebra the fixed algebra
\(E[M]^\Gamma\).

## Properties

1. **Descent.** \(E[M]^\Gamma\) is a \(k\)-Hopf algebra and the
   natural map \(E \otimes_k E[M]^\Gamma \to E[M]\) is an isomorphism
   of \(E\)-Hopf algebras — this is
   [[node:forms.hopf_descent]] (1)–(2), applicable because
   \(\rho\) permutes the group-like basis.
2. **\(T(M,\sigma)\) is a torus split by \(E\).** By (1) the base
   change \(T(M,\sigma)_E\) is \(D(M) \cong \mathbb{G}_m^{\,n}\)
   (\(n = \operatorname{rk} M\), after a choice of basis), which is
   the defining property in [[node:tori.torus_definition]].
3. **Character lattice.** \(X^*(T(M,\sigma)) \cong (M, \sigma)\) as
   \(\Gamma\)-lattices: the characters of \(T(M,\sigma)_E = D(M)\)
   are the group-likes \(\{e^m\}\) of \(E[M]\)
   ([[node:tori.characters_as_group_like_elements]]), and the Galois
   action transported through the isomorphism of (1) sends
   \(e^m \mapsto e^{\sigma_\gamma m}\), i.e. is \(\sigma\) on
   \(M\).
4. **Trivial action.** If \(\sigma\) is trivial then
   \(E[M]^\Gamma = k[M]\) (coefficientwise Galois fixed points), so
   \(T(M, \mathrm{triv}) = D(M)\) is the split torus
   ([[node:tori.split_torus]]).

This construction is the essential-surjectivity half of the
classification [[node:tori.f_tori_galois_module_classification]]:
every \(\Gamma\)-lattice arises as the character lattice of a torus,
namely of its twisted form.
