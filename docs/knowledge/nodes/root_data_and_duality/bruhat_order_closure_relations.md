---
id: root_data_and_duality.bruhat_order_closure_relations
title: Bruhat Order Gives Schubert Closure Relations
kind: theorem
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
- reductive_structure
uses:
- root_data_and_duality.bruhat_decomposition
- root_data_and_duality.coxeter_systems_and_bruhat_order
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 8.5"
    format: section
    note: "Theorem 8.5.4: closure relations for Bruhat cells."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the closure relation use the Coxeter Bruhat order on W?"
  verdict: "Yes. Schubert variety containment is equivalent to the Bruhat order relation."
tags:
- springer
- bruhat-order
- schubert-variety
- theorem
- root-data-and-duality
---

# Bruhat Order Gives Schubert Closure Relations

With \(G,B,T,W\) as in the Bruhat decomposition, define the Schubert variety
\[
X_w=\overline{BwB/B}\subseteq G/B.
\]
Then
\[
X_w=\bigcup_{v\leq w} BvB/B,
\]
where \(\leq\) is the Bruhat order on the Coxeter group \(W\). In particular,
\[
X_v\subseteq X_w \quad\Longleftrightarrow\quad v\leq w.
\]

*Proof.*  
For a simple reflection \(s\), the rank-one subgroup associated to \(s\)
controls the projection \(G/B\to G/P_s\). Its fibers are projective lines,
and multiplying a Bruhat cell by \(P_s\) either preserves the cell or adds
the adjacent cell indexed by \(ws\), according as \(\ell(ws)<\ell(w)\) or
\(\ell(ws)>\ell(w)\).

Inducting on a reduced expression for \(w\) gives all cells indexed by
subexpressions of that reduced word, exactly the elements \(v\leq w\) in
Bruhat order. The dimension formula for Bruhat cells prevents additional
cells from appearing in the closure.
