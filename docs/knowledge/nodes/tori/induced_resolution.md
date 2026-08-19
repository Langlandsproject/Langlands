---
id: tori.induced_resolution
title: Resolution of a Torus by Induced Tori
kind: theorem
status: admitted
primary_topic: tori
topics:
- tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.induced_tori
- tori.weil_restriction_of_tori
- tori.subtori_and_quotients
- tori.f_tori_galois_module_classification
source:
  spans:
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Lemma 2.5.3"
    format: section
    note: "Two-step resolution of an arbitrary torus by induced tori via the norm map of a splitting extension."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Are both the covering and embedding directions provided, over an arbitrary field, with connectedness of the relevant kernels proved?"
  verdict: "Yes. Both a surjection from an induced torus with torus kernel and a closed embedding into an induced torus with torus quotient are constructed, plus the iterated two-step resolution."
tags:
- torus
- induced
- resolution
- theorem
- tori
---

# Resolution of a Torus by Induced Tori

Let \(T\) be a torus over \(k\). Then:

1. **(Covering.)** There is a surjection \(R_0 \twoheadrightarrow T\)
   with \(R_0\) induced and \(\ker(R_0 \to T)\) a torus; iterating on
   the kernel produces an exact sequence
   \[
   R_1 \longrightarrow R_0 \longrightarrow T \longrightarrow 1
   \]
   with \(R_1\) and \(R_0\) induced.
2. **(Embedding.)** There is a closed immersion
   \(T \hookrightarrow R^0\) with \(R^0\) induced and \(R^0/T\) a
   torus; equivalently a short exact sequence
   \(1 \to T \to R^0 \to T' \to 1\) with \(R^0\) induced and \(T'\) a
   torus.

These resolutions are the reduction engine of the whole topic: a
statement about arbitrary tori that is stable under the boundary maps
of these sequences reduces to the case of induced tori, hence — by the
product description in [[node:tori.induced_tori]] — to
\(\mathbb{G}_m\) over finite separable extensions.

*Proof.*
Let \(E/k\) be the minimal splitting field of \(T\) and set
\(R_0 = R_{E/k}(T_E)\), which is induced: \(\Theta_E\) acts trivially
on \(X^*(T)\), so
\(X^*(R_0) = \operatorname{Ind}_{\Theta_E}^{\Theta} X^*(T)\)
is a permutation module
([[node:tori.weil_restriction_of_tori]]).

*(1)* Since \(T\) is commutative, the norm morphism
\(N : R_0 \to T\), given on points of \(k\)-algebras after base
change to \(k_s\) by multiplying the coordinates of the product
decomposition, is a homomorphism defined over \(k\); on \(k\)-points
it is \(t \mapsto \prod_{\iota} \iota(t)\). On characters it is the
map
\[
N^* : X^*(T) \longrightarrow \operatorname{Ind}_{\Theta_E}^{\Theta}
X^*(T), \qquad \chi \longmapsto \textstyle\sum_{c} c \otimes c^{-1}\chi
\]
summing over the cosets \(c \in \Theta/\Theta_E\). This is injective,
so \(N\) is surjective. Its cokernel is torsion-free: if
\(m\,x = N^*(\chi)\) for some \(x\) in the induced module and
\(m \geq 1\), the coefficient of the trivial coset gives
\(\chi = m\psi\) for some \(\psi \in X^*(T)\), whence
\(m\,x = m\,N^*(\psi)\) and \(x = N^*(\psi)\). A saturated inclusion
of the character lattice means the kernel
\(\ker N\) has torsion-free character group
\(\operatorname{coker}(N^*)\), i.e. is a torus
([[node:tori.subtori_and_quotients]]). Iterating the construction on
\(\ker N\) and composing gives the two-step exact sequence.

*(2)* Choose a finite \(\Theta\)-stable generating set of
\(X^*(T)\) (a \(\Theta\)-orbit of a generating set is finite by
continuity). The induced surjection of \(\Theta\)-modules
\(P \twoheadrightarrow X^*(T)\) from the permutation module \(P\) on
that set corresponds, by
[[node:tori.f_tori_galois_module_classification]], to a closed
immersion \(T \hookrightarrow R^0\) into the induced torus \(R^0\)
with \(X^*(R^0) = P\). The quotient \(R^0/T\) has character group
\(\ker(P \to X^*(T))\), a subgroup of a lattice, hence torsion-free,
so \(R^0/T\) is a torus.
