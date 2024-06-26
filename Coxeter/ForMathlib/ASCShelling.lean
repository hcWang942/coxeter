--import Mathlib.Data.Finset.Basic
import Mathlib.Data.Set.Card
import Coxeter.ForMathlib.AbstractSimplicialComplex

namespace AbstractSimplicialComplex
variable {V : Type*} --[DecidableEq V]

/--
Definition: Let `F` be a pure abstract simplicial complex of rank `d + 1` with finite facets.
A shelling of `F` is an linear ordering `l₁`, ⋯ , `lₘ` of all (maximal) facets of F such that
 `lᵢ ⊓ (⨆ {j < i}, lⱼ)`  is an abstract simplicial complex pure of rank `d`.
-/
def Shelling {F : AbstractSimplicialComplex V} [hpure : Pure F] {m : ℕ} (l : Fin m ≃ Facets F) := F.rank > 0 ∧
  ∀ k : Fin m, 0 < k.1 → isPure' ((⨆ j : {j // j < k}, closure {(l j).1}) ⊓ (closure {(l k).1})) (F.rank - 1)

open Classical

/--
Definition': Let `F` be a pure abstract simplicial complex of rank `d + 1`.
A shelling of `F` is an linear ordering `l₁`, ⋯ , `lₘ` of all (maximal) facets of `F` such that
 for any `i < k`, there exists `j < k`, such that `lᵢ ∩ lₖ ⊆ lⱼ ∩ lₖ` and `|lⱼ ∩ lₖ| = d`.
-/
def Shelling' {F :  AbstractSimplicialComplex V} [hpure : Pure F] {m : ℕ} (l : Fin m ≃ Facets F) :=
  F.rank > 0 ∧
  ∀ k i : Fin m, i < k → ∃ j : Fin m, j < k ∧
    (closure {(l i).1} ⊓ closure {(l k).1} ≤ closure {(l j).1} ⊓ closure {(l k).1}) ∧
    (closure {(l j).1} ⊓ closure {(l k).1}).rank + 1 = F.rank

/-- Lemma: The two definitions of shellings are equivalent.
-/

lemma shelling_iff_shelling' {F : AbstractSimplicialComplex V}  [hpure: Pure F] {m : ℕ} (l : Fin m ≃ Facets F) :
    Shelling l ↔ Shelling' l := by
    constructor
    · sorry
    · refine fun ⟨a, b⟩ ↦ ⟨a, ?_⟩
      rw [iSup_inf_eq (a := closure {(l k).1})] at hs
      sorry


<<<<<<< HEAD
/-- Definition: An abstract simplicial complex `F` is called shellable, if it admits a shelling. -/
def Shellable (F : AbstractSimplicialComplex F) [Pure F] := ∃ (m: ℕ) (l : Fin m ≃ Facets F), Shelling l

def cone_facet_bijection {F G : AbstractSimplicialComplex V} (h : Cone F G x) : Facets F ≃ Facets G := by
  simp [Cone] at h

  sorry


=======
def cone_facet_bijection {F G : AbstractSimplicialComplex V} (h : Cone F G x) : Facets F ≃ Facets G := by  
  sorry
  
>>>>>>> 739d9c45217ef15dafcfa5d16710b0cf0f7ab01f
lemma cone_Shellable_iff {F G : AbstractSimplicialComplex V} {r : ℕ} [Pure F] [Pure G] (x : V) (hcone: Cone F G x) :
    Shellable F ↔ Shellable G := by
  simp [Shellable, Shelling]
  constructor
  · rintro ⟨hrf, ⟨m, l, hml⟩⟩
    -- add x to each set??
  · rintro ⟨hrf, h⟩
    -- remove x from each set??
<<<<<<< HEAD
=======
    
>>>>>>> 739d9c45217ef15dafcfa5d16710b0cf0f7ab01f

end AbstractSimplicialComplex
