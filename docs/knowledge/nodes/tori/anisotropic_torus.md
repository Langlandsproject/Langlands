---
id: tori.anisotropic_torus
title: Anisotropic Torus
kind: definition
status: admitted
primary_topic: tori
topics:
- tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.character_and_cocharacter_lattices
source:
  spans:
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Proposition 2.5.8"
    format: section
    note: "Anisotropy of a torus via vanishing of rational (co)characters; equivalence with boundedness of T(k) in the valued setting."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are the character-side and cocharacter-side formulations both recorded, with their equivalence proved rather than assumed?"
  verdict: "Yes. The equivalence is proved by an averaging argument on the perfect pairing; the cocharacter form is designated as the working definition."
tags:
- torus
- anisotropic
- definition
- tori
---

# Anisotropic Torus

A torus \(T\) over \(k\) is **anisotropic** if
\[
X_*(T)^{\Theta} \;=\; 0,
\]
that is, \(T\) admits no non-trivial \(k\)-homomorphism
\(\mathbb{G}_m \to T\). This is the working definition throughout the
knowledge base.

**Equivalent formulations.** The following are equivalent:

1. \(X_*(T)^{\Theta} = 0\);
2. \(X^*(T)^{\Theta} = 0\), i.e. \(T\) has no non-trivial
   \(k\)-rational character \(T \to \mathbb{G}_m\);
3. the maximal split subtorus of \(T\) (see
   [[node:tori.split_anisotropic_decomposition]]) is trivial.

*Equivalence of (1) and (2).* The pairing
\(\langle\,,\,\rangle : X^*(T) \times X_*(T) \to \mathbb{Z}\) is
perfect and \(\Theta\)-invariant, and \(\Theta\) acts through a finite
quotient \(Q\) (see [[node:tori.splitting_field]]). Suppose
\(\lambda \in X_*(T)^{\Theta}\) is non-zero. Choose
\(\chi \in X^*(T)\) with \(\langle \chi, \lambda\rangle \neq 0\) and
set \(\chi' = \sum_{q \in Q} q\chi\). Then \(\chi'\) is
\(\Theta\)-fixed and
\(\langle \chi', \lambda \rangle = \sum_{q}\langle \chi, q^{-1}\lambda\rangle
= \lvert Q\rvert \,\langle \chi, \lambda \rangle \neq 0\), so
\(\chi' \neq 0\) and \(X^*(T)^{\Theta} \neq 0\). The same argument
with the roles of the lattices exchanged gives the converse.

Over a discretely valued Henselian field, anisotropy of \(T\) is
further equivalent to boundedness of the group \(T(k)\); that
equivalence belongs to the arithmetic stage of this topic and is
recorded with the source span above.
