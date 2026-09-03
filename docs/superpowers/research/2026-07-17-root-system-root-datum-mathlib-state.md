# Root system and root datum: Mathlib state

Date: 2026-07-17

## Versions checked

- Langlands currently pins Lean 4.28.0 and Mathlib v4.28.0.
- The latest stable Lean release checked on 2026-07-17 is
  [Lean 4.32.0](https://github.com/leanprover/lean4/releases/tag/v4.32.0),
  released on 2026-07-13.
- The relevant Mathlib source at tag v4.32.0 has the same core RootPairing,
  RootDatum, and RootPairing.IsRootSystem fields as the project's v4.28.0
  source.

An attempted probe in a vanished /tmp environment fell back to the system
Lean 4.24 toolchain and failed before importing Mathlib. No conclusion in this
review is based on that failed run.

## Verified latest interface

An isolated project at /tmp/langlands-lean432-root-probe pins Lean and Mathlib
v4.32.0. The command

~~~bash
cd /tmp/langlands-lean432-root-probe
ELAN_HOME=/Users/hoxide/.elan lake env lean \
  /Users/hoxide/mydoc/Langlands/docs/superpowers/research/probes/RootInterfaceProbe.lean
~~~

exits successfully. It verifies the following declarations:

~~~text
RootPairing
RootDatum
RootPairing.root
RootPairing.coroot
RootPairing.root_coroot_two
RootPairing.reflectionPerm
RootPairing.reflectionPerm_root
RootPairing.reflectionPerm_coroot
RootPairing.IsRootSystem
RootPairing.IsRootSystem.span_root_eq_top
RootPairing.IsRootSystem.span_coroot_eq_top
RootPairing.IsCrystallographic
RootPairing.IsReduced
~~~

The important types are:

~~~text
RootPairing.root           : RootPairing ι R M N → (ι ↪ M)
RootPairing.coroot         : RootPairing ι R M N → (ι ↪ N)
RootPairing.reflectionPerm : RootPairing ι R M N → ι → (ι ≃ ι)
RootDatum ι X₁ X₂          : Type
RootPairing.IsRootSystem P : Prop
~~~

RootPairing.IsRootSystem contains exactly two fields: roots span M, and
coroots span N.

## Definition decisions

1. The KB root-system definition follows RootPairing plus
   RootPairing.IsRootSystem. It does not use a real Euclidean space as the
   primary interface.
2. Finiteness of the index, IsCrystallographic, and IsReduced remain
   independent assumptions, matching Mathlib.
3. RootDatum ι X X∨ is RootPairing ι ℤ X X∨. Finite generation of the
   lattices, finiteness of the root index, and reducedness are supplied as
   mixins for reductive root data.
4. A root datum is not given IsRootSystem over ℤ merely to express
   semisimplicity. Semisimplicity asks that roots span after tensoring with ℚ;
   integral spanning would incorrectly depend on the isogeny form.
5. The KB nodes do not use lean frontmatter for these external declarations
   because mdblueprint.yml currently configures only the local Langlands Lean
   repository. Adding Mathlib as a separately indexed repository is a
   distinct infrastructure task.

## Mathlib gap

The core root-pairing and root-datum interfaces are already present. The
remaining Langlands-side work is not to redefine them, but to build bridges
from reductive groups, character/cocharacter lattices, and the project's
Coxeter-system layer to the existing Mathlib objects.
