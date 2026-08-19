import Lake
open Lake DSL

package «LanglandsLean» where

require "leanprover-community" / mathlib @ git "v4.33.0"

@[default_target]
lean_lib «LanglandsLean» where
