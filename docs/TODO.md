# TODO — Knowledge-Base Roadmap

The current working surface is **Bruhat–Tits theory** for the
`buildings_and_parahorics` topic (theme codes BT1–BT4 in
[topics/algebraic-groups.md](topics/algebraic-groups.md)). The knowledge
base comes first; Lean formalization follows the admitted nodes.

Method for every goal (see `AGENTS.md`):

1. blueprint nodes in `docs/knowledge/nodes/buildings_and_parahorics/`;
2. bind sources (`source:` spans against the registered reference ids);
3. `tools.knowledge.check` reports 0 errors;
4. only then GitHub issues / Lean work.

A goal is sized for one or two focused sessions. Do them in order unless
noted; each goal leaves the DAG consistent and publishable.

## Reference layer — done 2026-07-28

- [x] Register the Bruhat–Tits articles with precise journal data and
      the Kaletha–Prasad monograph in `docs/knowledge/mdblueprint.yml`:
      `bruhat-tits-groupes-reductifs-i` (IHÉS 41, 1972),
      `bruhat-tits-groupes-reductifs-ii` (IHÉS 60, 1984),
      `kaletha-prasad-bruhat-tits` (Cambridge NMM 44, 2023).
- [x] Record the citations and the chapter structure of Kaletha–Prasad
      in
      [knowledge/references/bruhat-tits-sources.md](knowledge/references/bruhat-tits-sources.md).

## G0 — Algebraic tori (prerequisite layer)

*2026-08-19: definitional core landed — topic `tori` registered, 17
nodes under `docs/knowledge/nodes/tori/` (2 migrated, 15 new),
`tools.knowledge.check` at 0 errors. Also added
`multiplicative_type_characterization` (the char-p trichotomy node,
not in the original list). Open: G0.2 machinery migration, G0.5–G0.10. Lean side (2026-08-19,
second pass): toolchain upgraded v4.28→v4.33; `LanglandsLean/Tori/`
has Diagonalizable (D(M)), SplitTorus (D(Z^n)), CharacterGroup
(X^*, X_*, Cartier T1a **proved** at object/hom/iso level over a
domain, riding v4.33's GroupLike + mapDomainBialgHomEquiv), and
GaloisDescent (semilinear action + twistedGroupAlgebra defined
sorry-free), and Speiser (**proved**: general semilinear Galois
descent `span_fixedPoints_eq_top` via Dedekind independence +
averaging — infrastructure Mathlib lacks — plus its application
`span_twistedGroupAlgebra_eq_top`). `twistedGroupAlgebra_one` also proved (2026-08-19 third pass);
**the Lean library is sorry-free**. Open Lean items: independence
half of descent, Hopf structure on the twisted algebra, X^* of the
twisted form.*

Blocks G5, G7, and the `kottwitz_structures` cluster. Land this before
resuming G1–G4; the Bruhat–Tits nodes silently assume it.

Sources: KP §2.5 (pp. 86–92), §2.6(a) (p. 93), Ch. 11 §§11.1–11.2
(pp. 421–427), App. B (pp. 653–695), Def. 16.1 (p. 547), Def. 17.1
(p. 553); SGA3 Exp. VIII–X; Borel §8; Colliot-Thélène–Sansuc for the
flasque material.

Two design decisions are recorded here because both diverge from the
book's presentation. They agree with each other, which is why they are
worth committing to.

**(D1) κ_T is the primitive; ω_T is derived.** KP present ω_T in §2.5
and κ_T only in Ch. 11, because a book must be linear. The dependency
runs the other way: for split T, κ_T is `id ⊗ ω` and needs nothing;
ω_T is `κ_T` followed by "forget torsion". Under this order KP
Def. 2.5.13 and Prop. 2.5.8 become theorems, and Lem. 2.5.18 and
Rem. 2.5.15 collapse to one-line lattice facts. See G0.6.

**(D2) The cluster is tiered by what the building formalization
consumes, not by mathematical subject.**

- *Tier A (lattice tier)* — G0.1–G0.7. Stated entirely in terms of
  lattices, Galois modules and the abstract group `T(k)`. **No schemes.**
  This is exactly what the construction of the building needs: KP build
  the apartment (Ch. 6) and the building (Ch. 7) from the valued root
  datum, Iwahori subgroups and the Iwahori–Tits system, all *before*
  integral models appear in Ch. 8.
- *Tier B (scheme tier)* — G0.8. Integral models, Néron models,
  filtrations. Needed for parahoric *group schemes* (G5), Moy–Prasad
  (G7), and unramified descent to non-quasi-split `G` (Ch. 9, which
  does use Ch. 8), but **not** for the building over `K` as a metric
  and polysimplicial object.

Consequence for Lean: Tier A is reachable without étale descent,
Néron models, or dilatations. Formalize it first and the building
construction is unblocked; Tier B can lag.

**(D3) Topic placement: tori sit between `linear_algebraic_groups` and
`reductive_structure`, and the anti-equivalence machinery sits below
tori.** The apparent circle "a torus is a special case of a reductive
group, yet also its foundation" is resolved at the level of
definitions: *reductive* is defined via the unipotent radical without
mentioning tori, and *torus* is defined as a linear algebraic group
without mentioning reductive; so the DAG layers as

```
affine_group_schemes            (Hopf algebras; NOT smoothness-restricted)
  └─ D(M), multiplicative type, the anti-equivalence   ← machinery here
linear_algebraic_groups         (convention: smooth affine finite type)
tori                            (a class of LAG; uses both layers above)
reductive_structure             (uses linear_algebraic_groups + tori)
  └─ theorem `tori_are_reductive`   ← the "special case" edge
buildings_and_parahorics        (entry: G connected REDUCTIVE over
                                 Henselian discretely valued k)
  └─ degenerate base case `building_of_a_torus`  ← the "foundation" edge
```

"Special case" and "foundation" are two families of edges in opposite
directions between different nodes; neither creates a cycle. The
multiplicative-type machinery cannot live inside `tori` or
`linear_algebraic_groups` because in char p it contains μ_p, which is
not smooth: it belongs to `affine_group_schemes`.

### G0.0 — Architecture repair (do first)

- [x] Create a top-level topic `tori` positioned per (D3): it `uses`
      `linear_algebraic_groups` and `affine_group_schemes`; it is used
      by `reductive_structure`. Not a child of `reductive_structure`.
- [ ] (partial 2026-08-19: `algebraic_tori`, `character_and_cocharacter_lattices`, `f_tori_galois_module_classification` moved into `tori` with full id renames; diagonalizable trio still in `reductive_structure`, char-p component-group errors in them fixed in place) Move the machinery down: `diagonalizable_groups`,
      `diagonalizable_group_characterization`,
      `diagonalizable_groups_antiequivalence` (and a new
      multiplicative-type node) migrate to `affine_group_schemes`,
      since they cover non-smooth objects (μ_p). Move
      `algebraic_tori`, `character_and_cocharacter_lattices`,
      `f_tori_galois_module_classification` into `tori`. Keep id
      aliases so existing `uses:` edges resolve during the move.
- [x] Fix the inverted dependency: the multiplicative-type nodes must
      NOT `uses` `algebraic_tori`. The general anti-equivalence comes
      first; tori are the torsion-free case.
- [ ] Add a convention node in `linear_algebraic_groups`: LAG :=
      **smooth** affine group scheme of finite type over k (not
      "reduced" — over imperfect fields reduced does not imply smooth),
      with the embedding theorem G ↪ GL_n as the bridge to the
      classical picture. Torus nodes then inherit LAG-ness by the
      smoothness criterion below rather than by fiat.
- [x] Split `algebraic_tori` (currently one `kind: topic` node carrying
      ~8 definitions and 3 theorems, which makes its
      `verification.definition` field meaningless) into separate
      definition and theorem nodes, each with its own `source:` span.
- [ ] Detach the dual torus from `root_data_and_duality`: for a torus
      `T̂ = Hom(X^*(T), C^×)` needs no root datum, and routing it through
      root data is a false dependency that currently makes local
      Langlands for tori unstatable.

### G0.1 — Conventions (fix before writing any node)

These are formalization-driven. Each one removes a choice, a `Q`, or a
base point that would otherwise have to be carried through the whole
building development.

- [x] **`X_*` is the working lattice.** State the anti-equivalence with
      `X^*` (standard, and KP's convention), then fix
      `X_* = Hom(X^*, Z)` and phrase every downstream statement in
      `X_*`. Building theory consumes `X_*` only.
- [ ] **Coinvariants, not invariants, are the target.** `κ_T` lands in
      `X_*(T)_I`; the apartment's vector space is `X_*(T)_I ⊗ R`.
      Coinvariants are a quotient, so maps *out of* `T(k)` are definable
      with no choice; `X_*(T)^Θ ⊗ Q` needs the KP Lem. 2.5.5 comparison.
      Record `X_*(T)_I ⊗ Q ≅ X_*(T)^I ⊗ Q` as a lemma and use it in no
      definition.
- [x] **No `Q`- or `R`-valued map is primitive.** Every primitive map is
      `Z`-valued into a finitely generated abelian group. `⊗ R` happens
      once, at the apartment, and nowhere else.
- [ ] **The apartment is an `AddTorsor`, not a vector space.** KP's
      equipollence-class definition (Def. 6.1.15 / 6.1.24 / 6.1.27) is
      literally a torsor under `V`. Introduce no origin in KB
      statements; a Chevalley valuation is then a torsor point, not
      "the origin". This is Mathlib-native and must be fixed now,
      because retrofitting a base point out of the apartment nodes
      later is a rewrite.
- [x] **`X^*(T) = Hom_{k_s}(T, G_m)`** with the Galois action as
      separate data (KP p. 86). No `\bar k` anywhere in the torus or
      building clusters.
- [x] **Anisotropic means `X_*(T)^Θ = 0`** (KP Prop. 2.5.8). The current
      node states it two incompatible ways; pick this one everywhere.
- [x] Avoid naming a splitting field in statements. Phrase as "there
      exists a finite Galois `E/k` such that …", with `E`-independence
      proved as a lemma wherever a construction appears to need one
      (this is exactly the shape of KP Lem. 2.5.12 and Prop. 11.1.1).

### G0.2 — Multiplicative type and the anti-equivalence (Tier A;
placed in `affine_group_schemes` per (D3))

- [x] `group_algebra_scheme` [def] — `D(M) = Spec k[M]` (KB node + Lean `DiagGroup`, `diagGroupPointsEquiv` 2026-08-19).
- [ ] `diagonalizable_characterization` [thm] — `k[D]` spanned by
      characters ⟺ `D ≅ D(M)`.
- [ ] `cartier_duality_split` [thm] — the split anti-equivalence. Pure
      Hopf algebra, no Galois. **Lean-reachable now**; mark as such.
- [ ] `automorphism_scheme_is_constant` [thm] — `Aut(D(M)) = Aut(M)`.
- [ ] `forms_by_galois_descent` [thm] — forms ↔ `Hom_cont(Θ, Aut(M))`
      up to conjugacy. Needs étale descent; record the Mathlib gap as an
      issue, and note that the lattice-first Lean route (G8) can take
      this as a *definition* rather than a theorem.
- [ ] `antiequivalence_over_a_field` [thm] — the two previous combined.
- [ ] `rigidity` [thm] — connected groups act trivially on
      multiplicative-type groups. Export edge to the reductive cluster
      (`N_G(S)/Z_G(S)` finite étale, KP Lem. 2.4.8(1)) — this is what
      makes the Weyl group finite and hence the whole affine
      combinatorics discrete.

### G0.3 — Torus structure (Tier A)

- [x] `torus_definition` [def] — multiplicative type with `X^*(T)`
      **torsion-free**; equivalently smooth **and** connected
      multiplicative type; equivalently `T_{k_s} ≅ G_m^n`. Record the
      char-p trichotomy that forces this phrasing: `D(M)` is smooth ⟺
      `M` has no p-torsion, connected ⟺ `M` has no prime-to-p torsion;
      so μ_p is connected multiplicative type but NOT a torus, and
      "connected multiplicative type" alone is a wrong definition.
- [x] (folded into `torus_definition`: the definition takes T to be a linear algebraic group, and `multiplicative_type_characterization` carries the smoothness content) `tori_are_linear_algebraic` [thm] — torsion-free ⟹ smooth, so a
      torus is a linear algebraic group; this is the edge `tori` →
      `linear_algebraic_groups` demanded by (D3).
- [x] `splitting_field` [thm] — minimal splitting field is finite
      Galois; `Gal(E/k) ↪ GL_n(Z)`.
- [x] (as `subtori_and_quotients`) `subtori_quotients_dictionary` [thm] — subtori ↔ saturated
      quotients of `X^*(T)`; quotient tori ↔ saturated submodules.
- [x] `split_anisotropic_decomposition` [thm] — `X_*(S) = X_*(T)^Θ`,
      `X^*(T_a) = X^*(T)/X^*(T)^Θ`; `T = S · T_a` is an almost direct
      product, **not** a direct product. Include the `R_{E/k}G_m`
      counterexample. `X_*(S)` is the lattice the apartment is built on,
      so this node is on the building's critical path.
- [x] `weil_restriction_of_tori` [thm] — `X^*(R_{E/k}T) = Ind`.
- [x] `rank_one_classification` [example] — `G_m` and `R^1_{E/k}G_m`
      exhaust rank one.

### G0.4 — Special classes of tori (Tier A)

- [x] `induced_torus` (né `induced_tori`; singularized 2026-08-19) [def] — permutation lattice ⟺ product of
      `R_{E_i/k}G_m` (KP Def. 2.5.1). Record KP's terminology warning:
      do not call these "quasi-split tori"; every torus is a quasi-split
      reductive group.
- [x] `induced_resolution` [thm] — `R_1 → R_0 → T → 1` (KP Lem. 2.5.3).
      The reduction engine for G0.5–G0.8; state it early.
- [x] `unramified_torus` [def] — splits over `K` (KP Def. 16.1).
- [x] `tamely_ramified_torus` [def] — splits over a tame Galois
      extension (KP Def. 17.1).
- [x] `weakly_induced_torus` [def] — wild inertia permutes a basis
      (KP Def. B.6.2).
- [ ] `flasque_coflasque_resolution` [thm] — Colliot-Thélène–Sansuc.
      Not used by KP and not on the building path; drop from this goal
      if it overruns.

### G0.5 — Galois cohomology of tori (Tier A)

- [ ] `h1_of_induced_vanishes` [thm] — Hilbert 90 + Shapiro.
- [ ] `cohomology_vanishing_dim_le_1` [thm] — KP Lem. 2.5.4. This is the
      licence for G0.6; admit it before κ_T.
- [ ] `h1_of_norm_one_torus` [example] — `k^×/N_{E/k}E^×`.
- [ ] `h1_via_cocharacter_coinvariants` [thm] —
      `H^1(k,T) ≅ X_*(T)_{Θ,tor}` for local `k` (KP Thm. 11.7.7
      specialized to a torus).
- [ ] `tate_nakayama_local_duality` [thm] — optional in this pass; not
      on the building path.

### G0.6 — The Kottwitz homomorphism for tori (Tier A) ★

The keystone. G0.7, G0.8, G5, G7 and `kottwitz_structures` all depend
on it.

- [ ] `kappa_for_split_tori` [def] — `id ⊗ ω : X_*(T) ⊗ K^× → X_*(T)`.
      Elementary: no `Q`, no invariants, no KP Lem. 2.5.5. This is the
      node the Lean development should start from.
- [ ] `kottwitz_homomorphism_for_tori` [thm] — KP Prop. 11.1.1:
      existence, uniqueness, surjectivity and `Γ`-equivariance of
      `κ_T : T(K) → X_*(T)_I`, by norm descent from a splitting `L/K`.
      `uses:` `cohomology_vanishing_dim_le_1`.
- [ ] `iwahori_subgroup` [def] — `T(K)_0 := ker κ_T`,
      `T(k)_0 := T(K)_0 ∩ T(k)`. **Primary definition.**
- [ ] `norm_image_characterization` [thm] — `ker κ_T = N_{L/K}(T(L)_1)`,
      i.e. KP Def. 2.5.13 demoted to a theorem (KP Prop. 11.1.5). Record
      both; downstream nodes use the kernel form.
- [ ] `maximal_bounded_subgroup` [def+thm] —
      `T(K)_1 := κ_T^{-1}(X_*(T)_{I,tor})`; it is the unique maximal
      bounded subgroup (KP Prop. 2.5.8, Lem. 11.1.3).
- [ ] `anisotropic_iff_bounded` [thm] — `T(k)` bounded ⟺ `X_*(T)^Θ = 0`.
- [ ] `valuation_homomorphism` [def] — `ω_T` as `κ_T` followed by
      `X_*(T)_I → Hom(X^*(T)^I, Z)`. **Derived, not primitive.**
- [ ] `image_of_omega` [thm] — the renormalized norm description
      (KP Cor. 11.7.3), completing KP Lem. 2.5.7.
- [ ] `component_quotients` [thm] — `T(k)/T(k)_0 ↪ (X_*(T)_I)^Γ` and
      `T(k)_1/T(k)_0 ↪ (X_*(T)_{I,tor})^Γ`, isomorphisms when
      `dim(f) ≤ 1` (KP Cor. 11.1.6, 11.7.2).
- [ ] `induced_ramification` [def+thm] — `T_K` induced ⟺ `X_*(T)_I`
      torsion-free ⟹ `T(k)_0 = T(k)_1`. Under (D1) a one-line
      consequence, replacing KP's Lem. 2.5.18 norm computation.
- [ ] `ramified_norm_one_example` [example] — `T = R^1_{ℓ/k}G_m` with
      `ℓ/k` ramified quadratic: `X_*(T)_I = Z/2`, so
      `[T(K)_1 : T(K)_0] = 2`. This is the index part of KP Rem. 2.5.15;
      the finer location of `T(K)_0` inside `1 + M_L` belongs to the
      filtration nodes in G0.8.

### G0.7 — The building of a torus: the degenerate base case (closes Tier A) ★

Buildings are attached to *connected reductive* groups; a torus is the
degenerate case, and Tier A is precisely its complete Bruhat–Tits
theory. Writing this as a node turns the torus/building interface from
a hand-maintained list into a mathematical object, with a built-in
consistency test: the general theory restricted to `G = T` must
reproduce Tier A verbatim.

- [ ] `building_of_a_torus` [def+thm] — for a torus `T` over Henselian
      discretely valued `k`: the reduced building `B(T)` is a point;
      the enlarged building is a torsor under
      `V(T) = X_*(T)^Θ ⊗ R` (an affine space with no preferred
      origin — keep it an `AddTorsor` per G0.1); the stabilizer of any
      point is `T(k)_1`, the parahoric is `T(k)_0`, the Moy–Prasad
      filtration is `{T(k)_r}` (Tier B supplies the last item).
- [ ] `torus_interface_for_buildings` [topic] — the contract listing
      exactly what `buildings_and_parahorics` consumes from `tori`,
      and nothing else:
      - `V(S) = X_*(S) ⊗ R` — the vector space the apartment is a
        torsor under;
      - `ν = -ω_Z : Z(k) → V(S)` for `Z = Z_G(S)` — the translation
        part of the `N(k)` action (KP Axiom 4.1.4, Ch. 6 §6.1); note
        `Z` is a torus exactly when `G` is quasi-split, which is how
        the general case consumes `building_of_a_torus`;
      - `T(k)_0 = ker κ_T` — makes `W̃ = N(k)/T(k)_0` discrete
        (KP §7.4–7.5);
      - `X_*(T)_I` — the translation lattice of `W̃`, with
        `W̃ / W_aff ≅ π_1(G)_I` (KP Cor. 11.6.3);
      - `{T(k)_r}` — Moy–Prasad, supplied later by G0.8.
- [ ] Verify the list against KP Ch. 6 §6.1, Ch. 7 §§7.4–7.6, §§9.2–9.3.
      If a building node needs a torus fact not on this list, either the
      list is wrong or the node is reaching past the interface — resolve
      before proceeding.
- [ ] Fix the entry-point definition downstream:
      `buildings.bruhat_tits_buildings` must state its
      input data as (`G` connected **reductive**, `k` Henselian
      discretely valued, `f` perfect) — buildings are not attached to
      arbitrary linear algebraic groups — and cite
      `building_of_a_torus` as its degenerate case.
- [ ] Record explicitly that everything above except `{T(k)_r}` is
      Tier A: the apartment and the building over `K` are
      constructible with no integral model. Unramified descent to
      general `G` (Ch. 9) is where Tier B first becomes unavoidable.

### G0.8 — Integral models and filtrations (Tier B)

Needed for G5 (parahoric group schemes), G7 (Moy–Prasad) and Ch. 9
descent. Not needed for the apartment or for the building over `K`.

- [ ] `o_torus` [def] — SGA3 Exp. IX 1.3; over `o`, equivalent to
      splitting after a finite unramified extension. Record KP's warning
      (p. 654) that the models below are generally **not** `o`-tori.
- [ ] `standard_model` [def] — split (KP Def. B.2.1) → induced
      (Def. B.3.4) → general as schematic closure (Def. B.4.1); note the
      identification with BT84's "canonical scheme".
- [ ] `neron_mapping_properties` [def] — Néron / ft-Néron / connected
      (KP Def. B.8.1).
- [ ] `neron_tower` [thm] — `T^0 ⊂ T^ft ⊂ T^lft` with
      `T^0(o) = T(k)_0`, `T^ft(o) = T(k)_1`, `T^lft(o) = T(k)`
      (KP Prop. B.7.2, Cor. B.8.7). This is the bridge from Tier A to
      Tier B: the group-theoretic subgroups of G0.6 are exactly the
      integral points of this tower.
- [ ] `pi0_via_kappa` [thm] — `π_0(T^lft) = X_*(T)_I`,
      `π_0(T^ft) = X_*(T)_{I,tor}` as `Gal(K/k)`-modules
      (KP Cor. 11.2.1).
- [ ] `special_fiber_structure` [thm] — `X_*(T̄) = X_*(T)^I`; `T^0` is an
      `o`-torus ⟺ `T` splits over `K`; `T^0 = S × R_u(T^0)`
      (KP Prop. B.7.9, Cor. B.7.10, Cor. B.7.12).
- [ ] `standard_filtration` [def] — schematic / connected / congruent
      (KP Def. B.5.1–B.5.3); good exactly for weakly induced tori
      (Prop. B.6.4).
- [ ] `minimal_congruent_filtration` [def] — KP §B.10; the correct
      general filtration. Export edge to `moy_prasad_filtrations`.
- [ ] Consistency check (node, or a rule in `tools.knowledge.check`):
      `T^lft(o)/T^0(o) = T(k)/T(k)_0 ↪ (X_*(T)_I)^Γ = π_0(T^lft)(f̄)^Γ`.
      Closes the loop between G0.6 and G0.8; should fail loudly if
      either side drifts.

### G0.9 — Dual side

- [ ] `dual_torus` [def] — `T̂ = Hom(X^*(T), C^×)` with the dual
      `Θ`-action. No root datum in the dependency list.
- [ ] `l_group_of_a_torus` [def] — `^L T = T̂ ⋊ W_k`.
- [ ] `local_langlands_for_tori` [thm] —
      `Hom_cont(T(k), C^×) ≅ H^1(W_k, T̂)`; local class field theory is
      the case `T = G_m`. Currently absent from the KB, which is a real
      gap for a Langlands knowledge base.

### G0.10 — Rewire downstream

- [ ] `kottwitz.kottwitz_homomorphism` must `uses`
      `tori.kottwitz_homomorphism_for_tori`. KP build `κ_G` from `κ_T`
      via z-extensions (§11.4–11.5); the torus case is the base case,
      not a special case.
- [ ] New node `z_extensions` (KP §11.4) in `kottwitz_structures`,
      `uses` `tori.induced_torus`.
- [ ] New node: `G(k)^0 = ker κ_G` (KP Prop. 11.5.4), which makes the ad
      hoc Def. 2.6.23 conceptual and is the definitional basis for
      parahorics. Edge into `parahoric_subgroups`.
- [ ] `moy_prasad_filtrations` must `uses`
      `tori.minimal_congruent_filtration` — the edge does not currently
      exist, which is why G7 is stalled.
- [ ] New node `reductive_groups.tori_are_reductive` [thm] — a
      torus has no roots and trivial Weyl group, hence is reductive and
      automatically quasi-split; `uses` `tori.torus_definition` and
      `reductive_groups.reductive_groups`. This is the "special
      case" edge of (D3), and the source of KP's terminology warning
      ("quasi-split torus" carries no information).
- [ ] Pseudo-reductive pointer node in `reductive_structure`: over
      imperfect fields `R_u(G_k)` trivial does not imply geometrically
      trivial; cite [CGP15]; the KB main line (like KP) defines
      reductive via the geometric unipotent radical and does not
      develop pseudo-reductive theory.
- [ ] Keep `special_tori` (KP 9.2.2), `elliptic_maximal_tori`
      (Def. 16.6) and the Ch. 16–17 classifications in
      `buildings_and_parahorics`, not in `tori`: their definitions
      mention `G` and `B(G_K)`. They `uses` `tori.unramified_torus`.
- [ ] Update G5's "Néron models of tori as external input" and G7's
      "filtrations of tori" to point at G0.8 instead of treating them as
      external.

## G0.C — Classification theory of tori (master plan, 2026-08-19)

Goal: the classification of tori done *completely* — KB proof
structure closed, Lean theorem sorry-free. Supersedes the scattered
classification items inside G0.

**Definition of done.** KB: the proof of
`tori.f_tori_galois_module_classification` is a structured composition
of admitted nodes (no prose gaps); corollary nodes admitted. Lean:
the categorical statement `toriClassification : (ToriCat k E)ᵒᵖ ≌
LatticeCat Γ` compiles without sorry (built from essential
surjectivity + full faithfulness + inverse computation via
`ofFullyFaithfullyEssSurj`), plus rank/split rank, the cocycle
bijection, and rank-one classification. Links: every theorem node lean-linked, reverse check
0 cross-mismatch, site published.

**Fixed design decisions** (do not relitigate mid-way):

- (D-a) Algebra-first: the classification lives at the Hopf-algebra
  level; the scheme layer is a corollary through the existing
  `hopfSpec` machinery. No group-scheme base-change machinery.
- (D-b) Finite level: Lean statements are parameterized by a fixed
  finite Galois `E/k` — {tori split by E} ≃ {Gal(E/k)-lattices}. The
  continuous-`Θ` version stays KB-level (`tori.splitting_field`
  justifies the equivalence).
- (D-c revised) The final statement IS a `CategoryTheory.Equivalence`
  on `CommHopfAlgCat`-based carriers; the three working theorems are
  the ingredients (see the plan file for the reversal rationale).

### M1 — KB: close the four proof holes (KB-first; do before Lean M2+)

DONE 2026-08-19 (commit a3cc0e6): all ten nodes admitted, gates green.
Note: `finiteness_per_rank` landed as kind `theorem` statement-only
(`proof: gap`), not `external-theorem`, per plan §1.8.

- [x] `forms.hopf_descent` [thm] — the multiplicative upgrade of
      [[node:forms.galois_descent_for_vector_spaces]]: for a Hopf
      algebra with compatible semilinear action, fixed points form a
      k-Hopf algebra and `E ⊗_k A^Γ ≅ A` as Hopf algebras.
- [x] `tori.twisted_form_of_lattice` [def+thm] — the inverse
      construction packaged: `Spec (E[M])^Γ` is a torus with character
      lattice `(M, σ)`.
- [x] `tori.classification_hom_level` [thm] — full faithfulness over
      k: `Hom_k(T,T') ≅ Hom_Γ(X^*(T'), X^*(T))` (descent of morphisms
      + Cartier over E).
- [x] `tori.classification_by_cocycles` [thm] — rank-n tori up to iso
      ↔ `Hom_cont(Θ, GL_n(Z))`/conj = `H¹(Θ, GL_n(Z))`.
- [x] `tori.real_tori_classification` [example] — Z[Z/2] has three
      indecomposable lattices; every real torus is
      `G_m^a × (S¹)^b × (Res_{C/R} G_m)^c`.
- [x] `tori.tori_over_finite_fields` [example] — tori/F_q ↔ conjugacy
      classes of finite-order elements of GL_n(Z) (Frobenius image).
- [x] `tori.finiteness_per_rank` [external-theorem] —
      Jordan–Zassenhaus: finitely many rank-n tori types per field.
- [x] `tori.isogeny_classification` [thm] — isogeny classes ↔
      Q-representations of finite quotients (Maschke).
- [x] `tori.split_rank` [def] — split rank = rk X_*(T)^Θ; bounds and
      split/anisotropic criteria; = apartment dimension downstream.
- [x] Rewrite the proof of `tori.f_tori_galois_module_classification`
      as a structured composition of the nodes above.

- [ ] POST-M0 REBASE (recorded 2026-08-19): once the bridges
      (`hopfSpec_map_bijective`, `nonempty_characterGroup_equiv_hopf`)
      are proved, rebase `CharLattice`/`CocharLattice` from the
      coordinate presentations (`HopfCharacterGroup`,
      `HopfCocharacterGroup`) onto the primary
      `CharacterGroup`/`CocharacterGroup` (scheme homs) by transport,
      so the lattice layer speaks in the definition, not the
      presentation.

- [ ] **MIGRATION (found 2026-08-19 by the reuse audit): replace the
      repo hopfSpec machinery with Mathlib's.** Mathlib
      `AlgebraicGeometry/Group/Affine.lean` provides
      `hopfSpec : (CommHopfAlgCat R)ᵒᵖ ⥤ Grp (Over (Spec R))` with
      `instFull`/`instFaithful`/`fullyFaithful` PROVED — the repo's
      Phase-B Yoneda chain (AlgHomPointsPresheaf, HopfSpecFunctor,
      specObjOver/hopfSpecGrpObj, and the M0 sorry
      `hopfSpec_map_bijective`) duplicates it. Plan: rebase
      `multiplicativeGroup`/`DiagGroup`/`specObjOver` consumers onto
      Mathlib's functor; `hopfSpec_map_bijective` and the
      `nonempty_characterGroup_equiv_hopf` bridge then close by
      reuse; retire the duplicated repo modules; update the KB nodes
      (hopf_spec_functor, hopf_spec_fully_faithful,
      hopf_spec_grpobj_via_yoneda, spec_representability…) to list
      Mathlib declarations. Sized as its own session.

### M2 — Lean: complete linear descent

- [ ] Independence half: k-linearly independent fixed vectors stay
      E-independent (mirror Mathlib's
      `FixedPoints.linearIndependent_smul_of_linearIndependent`).
- [ ] Package `E ⊗_k V^Γ ≃ₗ V` as an explicit isomorphism
      (Speiser spanning + independence).

### M3 — Lean: Hopf descent ★ (hardest step)

- [ ] Descent commutes with tensor square:
      `(E[M] ⊗_E E[M])^Γ ≅ A ⊗_k A` for `A = twistedGroupAlgebra σ`.
      Fallback if the general statement balloons: prove it for the
      concrete basis of `E[M]` (finite-free case suffices here).
- [ ] Descend Δ: `HopfAlgebra k (twistedGroupAlgebra σ)` instance.
- [ ] Base-change Hopf isomorphism `E ⊗_k A ≅ E[M]`.

### M4 — Lean: the torus object

- [ ] `twistedTorus (M,σ)` := Spec of the twisted algebra as a group
      scheme over k (existing specObjOver/hopfSpecGrpObj machinery).
- [ ] `IsTorus` predicate, algebra-level:
      `∃ E finite Galois, ∃ n, E ⊗ A ≅ E[Z^n]` as Hopf algebras;
      scheme-level reading as corollary. Also the deferred
      `IsDiagonalizable`.
- [ ] `twistedTorus` satisfies `IsTorus`; smoke test
      `SplitTorus R 1 ≅ Gm R`.
- [x] Universe note RESOLVED 2026-08-19 (8e165b1): no ULift anywhere —
      predicates and `splitTorusOver` are lattice-parameterized
      (`[Module.Free ℤ M] [Module.Finite ℤ M]`); rule in conventions §7.

### M5 — Lean: the classification functors

- [x] STATEMENT LAYER 2026-08-19: `CharLattice`, `charGalAct`,
      `charRep`, `torusRank`, `torusSplitRank`, `CocharLattice`,
      `charPairing`, `IsAnisotropicAlgebra` + 14 sorry'd statements
      in `Tori/CharLattice.lean`. Proof pass pending (invoke
      lean-sorry-crusher). E-independence stays KB-level (D-b).
- [ ] Inverse computation: `X^*(twistedTorus (M,σ)) ≅ (M,σ)`
      (Lean side of `tori.twisted_form_of_lattice`).

### M6 — Lean: assemble the theorem

- [ ] Full faithfulness over k (Galois descent of morphisms +
      `diagHomEquiv` over E).
- [ ] Essential surjectivity = M4 + M5.
- [x] STATEMENT LAYER 2026-08-19: `TorusAlgCat`/`TorusCat`/
      `LatticeCat`, `charLatticeFunctor` (data real, functor laws
      sorry), Full/Faithful/EssSurj instances (sorry),
      `toriClassification : (TorusCat k E)ᵒᵖ ≌ LatticeCat Γ` in
      `Tori/Classification.lean`; `f_tori` node now carries its lean
      block (alignment: pending until the proof pass).

### M7 — Corollaries and examples

- [ ] Lean: cocycle bijection; split ⟺ trivial action; anisotropic ⟺
      split rank 0; `normOneTorus` and `inducedTorus` (lattice-side);
      rank-one classification.
- [ ] Stretch: R and F_q lists in Lean (KB versions land in M1).

### M8 — Lean structure theorems (transported through the equivalence)

- [ ] Subtori/quotients dictionary; split-anisotropic decomposition;
      isogeny (lattice-side definition). Statements fixed after M6.

Non-goals of G0.C (recorded in the plan §9): continuous-Θ statement,
D(M) smoothness/connectedness trichotomy, Weil restriction machinery,
Jordan–Zassenhaus proof, arithmetic classes (G0.5–G0.8).

Sequencing: M1 independent and first (KB-first discipline); M2→M3→M4
→M5→M6 strictly serial; M7 after M6. Assets already in place: Cartier
T1a fully proved (engine over E), Speiser spanning half,
twistedGroupAlgebra + trivial-action computation, D(M) with the points
characterization.

## G1 — Affine root systems and affine Weyl groups (BT1)

Sources: KP Ch. 1 §1.3; Bourbaki *Groupes et algèbres de Lie* VI.

- [ ] Upgrade `affine_root_systems`, `affine_weyl_groups`,
      `coxeter_complexes` from topic stubs to definition-complete nodes
      (affine roots, gradients, alcoves, extended affine Weyl group).
- [ ] New node: alcoves and the fundamental alcove (walls, vertices,
      local Dynkin diagram).
- [ ] `uses:` edges into `root_data_and_duality`
      (`weyl_group_coxeter_structure`, `coxeter_systems_and_bruhat_order`,
      `classification_of_root_systems`).

## G2 — Tits systems and spherical buildings (TB layer)

Sources: KP Ch. 1 §1.4–1.5; BT I §2.

- [ ] Complete `bn_pairs_and_tits_systems` (axioms, Bruhat
      decomposition from a BN-pair, parabolic subgroups from subsets of
      simple reflections).
- [ ] Complete `spherical_buildings` and `tits_buildings` (abstract
      buildings, apartments, the spherical building of a reductive
      group); connect to `root_data.bruhat_decomposition`.

## G3 — Valued root data and the apartment (BT2, part 1)

Sources: BT I §6; KP Ch. 4 §4.1, Ch. 6.

- [ ] Complete `valued_root_data`: valuation of the root datum of a
      reductive group over a discretely valued field; the affine space
      A(G,S); equipollence classes.
- [ ] New node: root group filtrations \(U_{a,r}\) and the affine root
      system of a quasi-split group.
- [ ] New node: axiomatization of Bruhat–Tits theory (the KP §4.1
      axiom list), as the interface later nodes depend on.
- [ ] Complete `bruhat_tits_apartments`; affine Weyl group action;
      uniqueness of the apartment (KP §4.4).
- [ ] Complete `reductive_groups_over_local_fields` as the topic-level
      entry point (Henselian and complete discretely valued cases).

## G4 — The building, parahorics, decompositions (BT2/BT3)

Sources: BT I §7; KP Ch. 5, Ch. 7.

- [ ] Complete `bruhat_tits_buildings` (construction from the valued
      root datum, metric, CAT(0) statement as external-theorem) and
      `facets_in_bruhat_tits_buildings` (facets, chambers, special
      points; hyperspecial to be added in G6).
- [ ] Complete `parahoric_subgroups`; new nodes: Iwahori subgroups and
      the Iwahori–Tits system; the Iwahori–Weyl group.
- [ ] New nodes: affine Bruhat decomposition; Cartan decomposition;
      Iwasawa decomposition (KP Ch. 5).

## G5 — Integral models and parahoric group schemes (BT3)

Sources: BT II; KP Ch. 2 §2.10, Ch. 8, App. A–B.

- [ ] Complete `smooth_affine_group_schemes_over_valuation_rings`
      (smooth models, dilatation/smoothening as constructions,
      Néron models of tori as external input).
- [ ] Complete `parahoric_group_schemes` (the BT/KP construction;
      connected stabilizer description via the Kottwitz homomorphism,
      linking `kottwitz_structures` — KP Ch. 11).
- [ ] Complete `reductive_quotients_of_parahoric_group_schemes`
      (special fiber structure, KP §8.4).

## G6 — Descent (BT2/BT3 closure)

Sources: BT II §5; KP Ch. 9, Ch. 12.

- [ ] New node: unramified descent — the building over k from the
      building over the maximal unramified extension; existence of
      valued root data for all (not just quasi-split) groups.
- [ ] New node: special, superspecial, and hyperspecial points;
      residually split and residually quasi-split groups (KP §9.9–9.10).
- [ ] New node: tamely ramified descent and fixed-point buildings
      (KP Ch. 12), marked optional if time is short.
- [ ] `uses:` edges into `descent_and_forms` (Galois descent,
      cohomology) rather than restating descent theory locally.

## G7 — Moy–Prasad filtrations and first applications (BT4)

Sources: KP Ch. 13; Ch. 16–17 optional.

- [ ] Complete `moy_prasad_filtrations` (filtrations of tori, parahoric
      subgroups, Lie algebra; the Moy–Prasad isomorphism; depth).
- [ ] Optional stretch: classification of maximal unramified tori
      (KP Ch. 16, d'après DeBacker) as external-theorem nodes.

## G8 — Lean linkage (after G1–G2 are admitted)

- [ ] Mathlib survey per AGENTS.md step 1 (Coxeter groups exist in
      Mathlib; check affine root systems / buildings coverage — expect
      genuine gaps to record as issues, not blockers).
- [ ] Issue-per-node for G1–G2 nodes; fill `lean:` fields and
      `verification.alignment` as implementations land.

## Standing hygiene

- [ ] mdblueprint linter gaps found 2026-08-19 (rules that should be
      mechanical, not checklist items): warn on `Blueprint:` appearing
      mid-line in a docstring (currently silently ignored — caused a
      fake 0-cross-mismatch); naming lint for Type-valued lowerCamel
      defs in the Lean index; surface per-file sorry counts in
      lean_reverse_check output.

- [ ] Keep `tools.knowledge.check` at 0 errors before every commit
      (the 2026-07-28 merge repaired 71 errors introduced by a remote
      batch; do not let cloud sessions land unchecked).
- [ ] Re-publish the site (`scripts/publish_md.py`) after each goal so
      the graph JSONs track the node set.
