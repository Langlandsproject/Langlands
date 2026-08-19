---
id: tori.character_and_cocharacter_lattices
title: Character and Cocharacter Lattices
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.algebraic_tori
lean:
  modules:
  - LanglandsLean.AlgebraicGroups.Tori.CharacterGroup
  declarations:
  - Langlands.Tori.SchemeCharacterGroup
  - Langlands.Tori.gmGrp
  - Langlands.Tori.CharacterGroup
  - Langlands.Tori.coCharacterGroup
  - Langlands.Tori.diagCharEquiv
  - Langlands.Tori.diagCocharEquiv
  - Langlands.Tori.diagGroupLikeEquiv
verification:
  definition: accepted
  proof: not_applicable
  alignment: pending
generality:
  reviewed: true
  prompt: "Are character and cocharacter lattices treated as Galois modules over the separable closure in general, not just for split tori?"
  verdict: "Yes. The lattices are functorially associated to tori over arbitrary fields via the separable closure and carry a canonical continuous Galois action."
tags:
- characters
- cocharacters
- AlgebraicGroups.Tori
---

# Character and Cocharacter Lattices

To every algebraic torus \(T\) over a field \(k\) one associates two
free abelian groups: the **character lattice** \(X^*(T)\) and the
**cocharacter lattice** \(X_*(T)\). Together with the action of
\(\Theta = \operatorname{Gal}(k_s/k)\), they form the complete
invariant of \(T\) (see
[[node:tori.f_tori_galois_module_classification]]) and, downstream,
the foundation of root data.

## Definitions

For a torus \(T\) over \(k\) of rank \(r\), with \(k_s\) a separable
closure:

- **Character lattice**
  \[
  X^*(T) \;:=\; \operatorname{Hom}_{k_s\text{-grp}}(T_{k_s}, \mathbb{G}_m),
  \]
  a free \(\mathbb{Z}\)-module of rank \(r\).
- **Cocharacter lattice**
  \[
  X_*(T) \;:=\; \operatorname{Hom}_{k_s\text{-grp}}(\mathbb{G}_m, T_{k_s}),
  \]
  a free \(\mathbb{Z}\)-module of rank \(r\); elements are
  one-parameter subgroups.
- **Perfect pairing**
  \[
  \langle -, - \rangle : X^*(T) \times X_*(T) \;\to\; \mathbb{Z},
  \]
  defined by \(\chi \circ \lambda = (z \mapsto z^{\langle \chi, \lambda \rangle})\)
  in \(\operatorname{End}(\mathbb{G}_m) = \mathbb{Z}\).

Both Homs are taken over \(k_s\); the Galois action is separate data,
not built into the Hom. A separable closure suffices because tori
split over finite separable extensions
([[node:tori.splitting_field]]); no algebraic closure is used.

## Galois action

\(\Theta\) acts on \(X^*(T)\) by
\(({}^{\gamma}\chi)(t) = \gamma\bigl(\chi(\gamma^{-1} t)\bigr)\) and
compatibly on \(X_*(T)\); the pairing is \(\Theta\)-invariant. The
action is continuous for the discrete topology on the lattices: each
character is defined over a finite subextension of \(k_s/k\). This
makes both lattices finitely generated continuous
\(\Theta\)-modules, free as \(\mathbb{Z}\)-modules.

Two natural \(\Theta\)-equivariant identifications describe the
points of \(T\) over \(k_s\):
\[
X_*(T) \otimes_{\mathbb{Z}} k_s^\times \xrightarrow{\;\sim\;} T(k_s),
\quad \lambda \otimes x \mapsto \lambda(x);
\qquad
T(k_s) \xrightarrow{\;\sim\;} \operatorname{Hom}(X^*(T), k_s^\times),
\quad t \mapsto (\chi \mapsto \chi(t)).
\]

## Functoriality

For a morphism of tori \(f : T \to T'\) over \(k\):

- \(X^*(f) : X^*(T') \to X^*(T)\) (contravariant);
- \(X_*(f) : X_*(T) \to X_*(T')\) (covariant);

both \(\Theta\)-equivariant. Under the anti-equivalence of
[[node:tori.f_tori_galois_module_classification]], closed immersions
of tori correspond to surjections of character lattices and
surjections of tori to injections; the full dictionary for subtori
and quotients is [[node:tori.subtori_and_quotients]].

## Examples

| \(T\) | \(X^*(T)\) | \(\Theta\)-action |
|---|---|---|
| \(\mathbb{G}_m\) | \(\mathbb{Z}\) | trivial |
| \(\mathbb{G}_m^n\) | \(\mathbb{Z}^n\) | trivial |
| \(R_{E/k}\mathbb{G}_m\) | \(\mathbb{Z}[\Theta/\Theta_E]\) | permutation |
| \(R^{1}_{E/k}\mathbb{G}_m\) | \(\mathbb{Z}[\Theta/\Theta_E]/\mathbb{Z}\!\cdot\!N\) | quotient of permutation |
| anisotropic \(T\) | lattice with \(X_*(T)^\Theta = 0\) | no non-zero fixed vector |

## Downstream role

For a connected reductive group with a maximal torus \(T\), the
lattice \(X^*(T)\) carries the roots and \(X_*(T)\) the coroots; the
quadruple \((X^*(T), \Phi, X_*(T), \Phi^\vee)\) is the root datum
([[node:root_data.root_data|root data]]). Valuation-theoretic
invariants of \(T(k)\) over discretely valued fields are expressed
through \(X_*(T)\), which is why the cocharacter lattice is the
preferred working lattice of this topic.
