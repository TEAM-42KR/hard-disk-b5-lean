import HardDiskB5Lean.Theorems.Thm_HardDiskB5_theorem_1_1

/-!
# Head theorems (GENERATED; the statements are frozen)

Each theorem restates one head node with its approved statement and is proved by the node itself,
so Lean re-checks that the assembled node has exactly the frozen statement.
-/

section
set_option autoImplicit false
open MeasureTheory HardDiskB5.Lean

/-- Theorem 1.1 of paper A (doi:10.5281/zenodo.23097001), printed form: any unit vector e.
Frozen statement of `HardDiskB5.theorem_1_1`; proved by that theorem. -/
theorem HardDiskB5Lean.theorem_1_1 :
    ∀ (e : HardDiskB5.Lean.Pt) (he : ‖e‖ = 1), b5 = 140 / 81 - 101 * Real.sqrt 3 / (9 * Real.pi) + 1169 / (18 * Real.pi ^ 2) - 71 * Real.sqrt 3 / (2 * Real.pi ^ 3)
      + 4 * (∫ x in disk 0 ∩ disk e, (volume (disk 0 ∩ disk e ∩ disk x)).toReal ^ 2) / Real.pi ^ 3 :=
  @HardDiskB5.theorem_1_1
end
