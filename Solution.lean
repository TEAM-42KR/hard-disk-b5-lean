import HardDiskB5Lean.Heads

section
set_option autoImplicit false
open MeasureTheory HardDiskB5.Lean

theorem theorem_1_1 :
    ∀ (e : HardDiskB5.Lean.Pt) (he : ‖e‖ = 1), b5 = 140 / 81 - 101 * Real.sqrt 3 / (9 * Real.pi) + 1169 / (18 * Real.pi ^ 2) - 71 * Real.sqrt 3 / (2 * Real.pi ^ 3)
      + 4 * (∫ x in disk 0 ∩ disk e, (volume (disk 0 ∩ disk e ∩ disk x)).toReal ^ 2) / Real.pi ^ 3 :=
  @HardDiskB5Lean.theorem_1_1
end
