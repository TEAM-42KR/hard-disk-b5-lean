import Mathlib

/-!
# Hard-disk fifth virial coefficient b5 in closed form (paper A 1.0.0, doi:10.5281/zenodo.23097001, Theorem 1.1) - Lean 4 formalization (challenge statements)

Imports only Mathlib. The 2 definitions that the statements use are copied verbatim from the
definition modules (the same text as `HardDiskB5Lean/Definitions/`);
the public statements follow. `Solution.lean` proves every theorem below; `config.json` lets Comparator
check that with the standard axioms only.

## Definitions
 1. `HardDiskB5.Lean.lensArea` — The Euclidean plane (Euclidean distance, Lebesgue measure).
 2. `HardDiskB5.Lean.b5` — Hard-disk Mayer function `f(r) = -1_{r<1}` (unit diameter).

## Public statements
- `theorem_1_1` — Theorem 1.1 of paper A (doi:10.5281/zenodo.23097001), printed form: any unit vector e.
-/

-- definition copied verbatim from `Definitions.Def_HardDiskB5_Lean_lensArea` (node `HardDiskB5.Lean.lensArea`)
section
set_option autoImplicit false

/-! HardDiskB5 Lean pilot (2026-10-02): planar geometry layer for the 2D hard-disk b5 programme.
Unit-radius disks D(c) = ball c 1 (close iff centre distance < 1). `Pt` = EuclideanSpace ℝ (Fin 2):
Euclidean metric (not the sup metric of ℝ × ℝ) and Lebesgue measure. -/

noncomputable section
open MeasureTheory

namespace HardDiskB5.Lean

/-- The Euclidean plane (Euclidean distance, Lebesgue measure). -/
abbrev Pt := EuclideanSpace ℝ (Fin 2)

/-- Open unit disk centred at `c`. -/
def disk (c : Pt) : Set Pt := Metric.ball c 1

/-- `e = (1, 0)`. -/
def e1 : Pt := EuclideanSpace.single 0 1

/-- `(0, 1)`. -/
def e2 : Pt := EuclideanSpace.single 1 1

/-- The lens `L = D(0) ∩ D(e)`. -/
def lens : Set Pt := disk 0 ∩ disk e1

/-- Lens-area closed form `A(s) = 2 arccos(s/2) - (s/2) √(4 - s²)` (meaningful for `0 ≤ s ≤ 2`). -/
def lensArea (s : ℝ) : ℝ := 2 * Real.arccos (s / 2) - s / 2 * Real.sqrt (4 - s ^ 2)

end HardDiskB5.Lean
end

-- definition copied verbatim from `Definitions.Def_HardDiskB5_Lean_b5` (node `HardDiskB5.Lean.b5`)
section
set_option autoImplicit false

/-! Mayer cluster layer: `virialB n = B_{n+1}` of 2D unit-diameter hard disks.
`virialB n = -(n/(n+1)!) ∫ Σ_{G 2-connected, labelled on Fin (n+1)} ∏_{i<j, ij∈G} f(|x_i - x_j|)`,
point 0 pinned at the origin (translation invariance = per-volume thermodynamic limit).
n+1 = 5: prefactor -1/30 over the 238 labelled 2-connected graphs; n+1 = 2: B₂ = π/2.
All integrands are bounded, measurable and compactly supported (no vacuous Bochner zero). -/

noncomputable section
open MeasureTheory

namespace HardDiskB5.Lean

/-- Hard-disk Mayer function `f(r) = -1_{r<1}` (unit diameter). -/
def mayerF (r : ℝ) : ℝ := if r < 1 then -1 else 0

/-- 2-connected labelled simple graph on `Fin n`: connected, and still connected after deleting any
single vertex (for `n = 2` exactly `K₂`; for `n ≥ 3` the usual notion). -/
def IsBiconnected {n : ℕ} (G : SimpleGraph (Fin n)) : Prop :=
  G.Connected ∧ ∀ v : Fin n, (G.induce ({v}ᶜ : Set (Fin n))).Connected

open Classical in
/-- Mayer weight `∏_{i<j, ij ∈ E(G)} f(|x_i - x_j|)`. -/
def mayerWeight {n : ℕ} (G : SimpleGraph (Fin n)) (x : Fin n → Pt) : ℝ :=
  ∏ i : Fin n, ∏ j : Fin n, if i < j ∧ G.Adj i j then mayerF (dist (x i) (x j)) else 1

open Classical in
/-- Virial coefficient `B_{n+1}` of 2D unit-diameter hard disks (Mayer cluster integral). -/
def virialB (n : ℕ) : ℝ :=
  -((n : ℝ) / ((n + 1).factorial : ℝ)) *
    ∫ y : Fin n → Pt,
      ∑ G ∈ (Finset.univ.filter fun G : SimpleGraph (Fin (n + 1)) => IsBiconnected G),
        mayerWeight G (Fin.cons (0 : Pt) y : Fin (n + 1) → Pt)

/-- Reduced fifth virial coefficient `b₅ = B₅ / B₂⁴`. -/
def b5 : ℝ := virialB 4 / virialB 1 ^ 4

end HardDiskB5.Lean
end

/-! ## Public statements -/

section
set_option autoImplicit false
open MeasureTheory HardDiskB5.Lean

/-- Theorem 1.1 of paper A (doi:10.5281/zenodo.23097001), printed form: any unit vector e. -/
theorem theorem_1_1 (e : HardDiskB5.Lean.Pt) (he : ‖e‖ = 1) :
    b5 = 140 / 81 - 101 * Real.sqrt 3 / (9 * Real.pi) + 1169 / (18 * Real.pi ^ 2) - 71 * Real.sqrt 3 / (2 * Real.pi ^ 3)
      + 4 * (∫ x in disk 0 ∩ disk e, (volume (disk 0 ∩ disk e ∩ disk x)).toReal ^ 2) / Real.pi ^ 3 := by
  sorry
end
