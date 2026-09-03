import Mathlib.LinearAlgebra.RootSystem.Reduced

/-!
# Root-system and root-datum interface probe

This file records the Mathlib declarations used by the corresponding
mdblueprint definitions. It was checked against Mathlib v4.32.0 in an isolated
Lean 4.32.0 environment.
-/

#check RootPairing
#check RootDatum
#check RootPairing.root
#check RootPairing.coroot
#check RootPairing.root_coroot_two
#check RootPairing.reflectionPerm
#check RootPairing.reflectionPerm_root
#check RootPairing.reflectionPerm_coroot
#check RootPairing.IsRootSystem
#check RootPairing.IsRootSystem.span_root_eq_top
#check RootPairing.IsRootSystem.span_coroot_eq_top
#check RootPairing.IsCrystallographic
#check RootPairing.IsReduced
