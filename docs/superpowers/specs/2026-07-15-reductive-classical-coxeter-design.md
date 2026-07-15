# Reductive, Classical, and Coxeter Foundations

## Scope

This design repairs the mathematical dependency chain from reductive group schemes to classical
groups and their Coxeter complexes. It also extracts abstract Coxeter theory from the
`root_data_and_duality` topic, where it currently depends circularly on Weyl groups.

The durable source of truth is mdblueprint Markdown. Lean declarations are added only where
Mathlib has enough infrastructure to state an honest interface.

## Reductive group schemes

The primary definition follows SGA 3. A reductive group scheme over a scheme `S` is a smooth
affine group scheme `G -> S` whose geometric fibers are connected reductive algebraic groups.
For a geometric point `s -> S`, reductivity of the fiber means that its geometric unipotent
radical is trivial.

The field-level characterization is a separate node. This avoids conflating three settings:

- a reductive group scheme over an arbitrary base scheme;
- a reductive algebraic group over a field;
- a connected linear algebraic group over an algebraically closed field with trivial unipotent
  radical.

The Lean interface must not introduce an empty `Prop` called reductivity. Smoothness and
affineness can use Mathlib morphism properties, but geometric connectedness and unipotent
radicals require their own foundations before the full predicate is meaningful.

## Classical groups

`classical group` is a family label, not one additional structure. Separate definition nodes
cover `GL`, `SL`, symplectic, orthogonal, special orthogonal, and unitary group schemes. Each node
states its base assumptions and distinguishes the split group scheme from forms over a field.

The relation to Coxeter types is theorem-level data:

- `SL_(n+1)` and `PGL_(n+1)` have type `A_n`;
- `SO_(2n+1)` has type `B_n`;
- `Sp_(2n)` has type `C_n`, with the same Coxeter matrix as `B_n`;
- `SO_(2n)` has type `D_n`.

This prevents root-system calculations from becoming part of the group definitions.

## Abstract Coxeter theory

A new `coxeter_theory` topic owns the abstract combinatorics. Its first layer consists of Coxeter
matrices, presented Coxeter systems, words, reduced words, length, reflections, descents, standard
parabolic subgroups, Bruhat order, and the Coxeter complex.

The Coxeter complex of `(W,S)` is the simplicial poset of proper standard parabolic cosets
`w W_I`, ordered by reverse inclusion. Its chambers are the singleton cosets `w W_empty`, its
codimension-one faces are the cosets `w W_{s}`, and left multiplication by `W` is chamber-simple
transitive. A classical group's Coxeter complex is the Coxeter complex of its based Weyl group;
it is therefore defined only after choosing the data that determine the simple reflections.

Root-data nodes may use abstract Coxeter nodes. Abstract Coxeter nodes must not use Weyl-group or
reductive-group nodes.

## Mathlib state

Mathlib v4.28.0 has four files under `Mathlib.GroupTheory.Coxeter`: `Matrix`, `Basic`, `Length`,
and `Inversion`. They provide Coxeter matrices (including finite types), presented groups,
`CoxeterSystem`, simple reflections, words, reduced words, length, descents, reflections, and
inversion sequences.

The local source explicitly lists Matsumoto's theorem as TODO. No Mathlib declaration was found
for Bruhat order, standard parabolic subgroups and their cosets, minimal coset representatives,
the Coxeter complex, chamber/face incidence, or the classical-type realization by permutation
and signed-permutation groups. These are separate gaps; the Coxeter complex should not be blocked
on Bruhat order, but a useful Bruhat theory is blocked on exchange/deletion and Matsumoto-style
word control.

## Verification

Every new or edited node uses the current mdblueprint verification keys (`definition` for
definitions/topics and `statement`/`proof` for propositions and theorems), explicit topic fields,
source spans where available, and preferred KaTeX delimiters. The static checker and publisher
must pass. Lean work uses file-level diagnostics; a full `lake build` is reserved for an explicit
checkpoint.
