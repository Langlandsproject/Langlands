---
id: linear_algebraic_groups.algebraic_group_action_orbits_stabilizers
title: Algebraic Group Actions, Orbits, and Stabilizers
kind: definition
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.algebraic_group_definition
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.3"
    format: section
    note: "Definitions 2.3.1 and following: G-variety, orbit, isotropy group."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does the node describe regular actions on algebraic varieties, not only abstract group actions on points?"
  verdict: "Yes. The action is required to be a morphism of varieties compatible with the group law."
tags:
- springer
- group-action
- orbit
- stabilizer
- definition
- linear-algebraic-groups
---

# Algebraic Group Actions, Orbits, and Stabilizers

Let \(G\) be a linear algebraic group and \(X\) an algebraic variety. A
**regular action** of \(G\) on \(X\) is a morphism
\[
G \times X \to X,\qquad (g,x)\mapsto g x,
\]
such that \(e x=x\) and \(g(hx)=(gh)x\) for all points.

For \(x \in X\), the **orbit** and **stabilizer** are
\[
Gx=\{gx:g\in G\},\qquad
G_x=\{g\in G:gx=x\}.
\]
The stabilizer \(G_x\) is a closed algebraic subgroup of \(G\), since it is
the fiber over \(x\) of the orbit morphism \(G\to X\), \(g\mapsto gx\).

The action is **transitive** if \(X=Gx\) for some, equivalently every,
\(x\in X\). In that case \(X\) is a homogeneous space for \(G\), and the
stabilizer records the quotient description \(X \simeq G/G_x\) whenever the
geometric quotient exists.
