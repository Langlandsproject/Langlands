---
id: root_data.classification_of_root_systems
title: Classification of Irreducible Root Systems
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.cartan_matrices_and_dynkin_diagrams
- root_data.crystallographic_and_reduced
- root_data.root_form_and_positive_definiteness
---

# Classification of Irreducible Root Systems

The Killing–Cartan classification theorem, completed by Dynkin, gives a complete
list of finite irreducible reduced crystallographic root systems. These correspond
bijectively to the **connected Dynkin diagrams** of finite type.

## The classification theorem

**Theorem (Killing 1888; Cartan 1894; Dynkin 1947).** Every finite irreducible
reduced crystallographic root system is isomorphic to exactly one of the following:

### Classical types

- **\(A_n\)** (\(n \ge 1\)): Dynkin diagram is a linear chain of \(n\) nodes
  connected by single bonds:
  \(\circ - \circ - \cdots - \circ\) (\(n\) nodes).
  Root system in \(\mathbb{R}^n \cap \{\sum x_i = 0\}\):
  \(\Phi = \{e_i - e_j : i \ne j\}\), with \(n(n+1)\) roots.
  Weyl group: \(S_{n+1}\), order \((n+1)!\).

- **\(B_n\)** (\(n \ge 2\)): Linear chain of \(n-1\) single bonds followed by
  one double bond with arrow pointing right (short root):
  \(\circ - \circ - \cdots - \circ \Rightarrow \circ\).
  \(\Phi = \{\pm e_i \pm e_j : i < j\} \cup \{\pm e_i\}\), with \(2n^2\) roots.
  Long roots: \(\pm e_i \pm e_j\); short roots: \(\pm e_i\).

- **\(C_n\)** (\(n \ge 3\)): Linear chain with one double bond at the left,
  arrow pointing left (long root):
  \(\circ - \circ - \cdots - \circ \Leftarrow \circ\) (or equivalently
  \(\circ \Rightarrow \circ - \cdots - \circ\) depending on convention).
  \(\Phi = \{\pm e_i \pm e_j : i < j\} \cup \{\pm 2e_i\}\), with \(2n^2\) roots.
  Long roots: \(\pm 2e_i\); short roots: \(\pm e_i \pm e_j\).

- **\(D_n\)** (\(n \ge 4\)): Linear chain of \(n-2\) nodes, then forking into
  two branches at the end:
  \(\circ - \circ - \cdots - \circ < \!\!\! ^\circ_\circ\).
  \(\Phi = \{\pm e_i \pm e_j : i < j\}\), with \(2n(n-1)\) roots.
  All roots have equal length; simply laced.

### Exceptional types

- **\(G_2\)**: Two nodes connected by a triple bond with arrow:
  \(\circ \!\Rrightarrow\! \circ\).
  12 roots; two root lengths in ratio \(\sqrt{3}:1\). Weyl group dihedral of
  order 12. Unique among rank-2 crystallographic root systems.

- **\(F_4\)**: Four nodes: \(\circ - \circ \Rightarrow \circ - \circ\).
  48 roots; two root lengths in ratio \(\sqrt{2}:1\).
  Weyl group of order 1152.

- **\(E_6\)**: A chain of 5 nodes with one branch off the third:
  \(\circ - \circ - \circ - \circ - \circ\) with \(\circ\) above the middle.
  72 roots; simply laced. Weyl group of order 51840.

- **\(E_7\)**: A chain of 6 nodes with one branch off the third from left.
  126 roots; simply laced. Weyl group of order 2903040.

- **\(E_8\)**: A chain of 7 nodes with one branch off the third from left.
  240 roots; simply laced. Weyl group of order 696729600.

## Root counts

| Type | \(|\Phi|\) | Rank |
|---|---|---|
| \(A_n\) | \(n(n+1)\) | \(n\) |
| \(B_n\) | \(2n^2\) | \(n\) |
| \(C_n\) | \(2n^2\) | \(n\) |
| \(D_n\) | \(2n(n-1)\) | \(n\) |
| \(G_2\) | 12 | 2 |
| \(F_4\) | 48 | 4 |
| \(E_6\) | 72 | 6 |
| \(E_7\) | 126 | 7 |
| \(E_8\) | 240 | 8 |

Note: \(B_2 \cong C_2\) and \(A_3 \cong D_3\) as root systems; the constraints
\(n \ge 2\) for \(B\), \(n \ge 3\) for \(C\), \(n \ge 4\) for \(D\) eliminate
these overlaps.

## Proof strategy

The proof proceeds in three steps:

1. **Positivity.** The root form (see
   [[node:root_data.root_form_and_positive_definiteness|Root Form]])
   makes the Euclidean space structure canonical. The crystallographic condition
   restricts Coxeter weights to \(\{0,1,2,3,4\}\) (with weight 4 eliminated by
   the reduced hypothesis).

2. **Graph enumeration.** The Coxeter weight constraints translate to constraints
   on the Dynkin diagram: no cycles, at most one multiple bond, the rank of the
   diagram is bounded. An explicit combinatorial argument enumerates all possible
   connected graphs satisfying these constraints.

3. **Existence.** Each Dynkin diagram on the list is realized explicitly (by the
   concrete root systems above), confirming the classification is complete.

## Formalization status (Mathlib4): EXPLICIT GAP

**The classification theorem is NOT formalized in Mathlib4.** As of mid-2026, the
file `Mathlib.LinearAlgebra.RootSystem` contains:
- The general theory of root pairings, root systems, and root data.
- Finite root systems and their basic properties.
- Partial Coxeter weight constraints.

However, the statement "every finite irreducible reduced crystallographic root
system is isomorphic to one of \(A_n, B_n, C_n, D_n, E_6, E_7, E_8, F_4, G_2\)"
has **not** been formalized. The explicit constructions of individual types are
also incomplete.

**Partial coverage:** The type \(G_2\) is partially covered in Mathlib via an
explicit construction with 12 roots, and some properties of the 12-root system
are proved. However, even for \(G_2\), the identification with the unique
rank-2 crystallographic root system of Coxeter weight 3 is not a finished theorem.

This is a substantial gap that connects the combinatorial theory in Mathlib to the
full classification.

## References

- Bourbaki, *Groupes et Algèbres de Lie* IV–VI (1968), Ch. IV §1.
- Humphreys, *Introduction to Lie Algebras* (1972), §11–12.
- Dynkin, *Semisimple subalgebras of semisimple Lie algebras* (1947).
- Killing, *Die Zusammensetzung der stetigen endlichen Transformationsgruppen*
  (1888–1890).

## Related nodes

- [[node:root_data.cartan_matrices_and_dynkin_diagrams|Cartan Matrices and Dynkin Diagrams]]
- [[node:root_data.crystallographic_and_reduced|Crystallographic and Reduced Root Systems]]
- [[node:root_data.root_form_and_positive_definiteness|Root Form and Positive Definiteness]]
- [[node:root_data.root_chains|Root Chains and the String Property]]
- [[node:root_data.weyl_group_coxeter_structure|Weyl Groups as Coxeter Groups]]
