---
id: tori.classification_by_cocycles
title: Tori Are Classified by Cocycles in GL_n(Z)
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
- AlgebraicGroups.Forms
uses:
- tori.f_tori_galois_module_classification
- tori.splitting_field
- forms.nonabelian_h1
source:
  spans:
  - artifact: waterhouse-affine-group-schemes
    locator: "Chapter 17"
    format: section
    note: "Cocycle classification of forms via descent data."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the cocycle description stated for arbitrary base fields, with the continuous (profinite) version and the fixed-finite-level version distinguished?"
  verdict: "Yes. The profinite statement uses continuity of the Galois action; the fixed-E statement is the finite-level specialization. No field hypotheses beyond separability bookkeeping enter."
tags:
- torus
- galois-cohomology
- cocycle
- theorem
- AlgebraicGroups.Tori
---

# Tori Are Classified by Cocycles in GL_n(Z)

Let \(k\) be a field, \(k_s\) a separable closure,
\(\Theta = \operatorname{Gal}(k_s/k)\), and \(n \geq 0\). Since the
automorphism group of the split torus \(\mathbb{G}_m^{\,n}\) is
\(\operatorname{GL}_n(\mathbb{Z})\) — acting on the character
lattice — with **trivial** \(\Theta\)-action, the general
form-cocycle machinery ([[node:forms.nonabelian_h1]]) simplifies:

1. Isomorphism classes of rank-\(n\) tori over \(k\) are in
   bijection with
   \[
   H^1\bigl(\Theta,\, \operatorname{GL}_n(\mathbb{Z})\bigr)
   \;=\;
   \operatorname{Hom}_{\mathrm{cont}}\bigl(\Theta,\,
     \operatorname{GL}_n(\mathbb{Z})\bigr)\big/\text{conj},
   \]
   continuous homomorphisms up to conjugacy (cocycles for a trivial
   action are homomorphisms, and cohomologous means conjugate).
2. For a fixed finite Galois extension \(E/k\) with group
   \(\Gamma\), tori split by \(E\) correspond to
   \(\operatorname{Hom}(\Gamma, \operatorname{GL}_n(\mathbb{Z}))/\text{conj}\).

*Proof.*
By [[node:tori.f_tori_galois_module_classification]], rank-\(n\)
tori up to isomorphism correspond to \(\Theta\)-lattices of rank
\(n\) up to isomorphism. Choosing a \(\mathbb{Z}\)-basis of the
lattice turns the action into a continuous homomorphism
\(\Theta \to \operatorname{GL}_n(\mathbb{Z})\) (continuity =
open kernel, by [[node:tori.splitting_field]] the kernel cuts out
the minimal splitting field); changing the basis conjugates the
homomorphism, and two lattices are isomorphic iff the homomorphisms
are conjugate. A torus is split by \(E\) iff its homomorphism
factors through \(\Gamma = \operatorname{Gal}(E/k)\), giving (2).
That this bijection agrees with the general nonabelian-\(H^1\)
classification of forms is the observation that both sides classify
descent data on \(\mathbb{G}_{m,k_s}^{\,n}\), with trivial action on
\(\operatorname{Aut} = \operatorname{GL}_n(\mathbb{Z})\) because
every automorphism of the split torus is defined over the prime
field. \(\square\)
