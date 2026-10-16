# Correspondence between the manuscript and the Lean statements

Generated from the facts file (sha256 `5d65e288b0217d5307e484809a376ab9575f6f9729755aa8385113158af8581c`; its human-readable rendering has sha256 `39c55896c0e89b4e4191fdfa52b23b4143a1bc456802f86a6b1b8f8894835357`).

Manuscript: A = *The fifth virial coefficient of hard disks*, version 1.0.0 (doi:10.5281/zenodo.23097001); B = its proof companion (doi:10.5281/zenodo.23364640). References give the document and the printed number (Theorem, Lemma, Proposition, Corollary, Figure, Section, or an equation number in parentheses), followed by the part of the printed statement that the row compares when the Lean development states the parts separately.

Each row lists one of the 74 Lean theorem statements or one of the 16 definition modules included in this comparison, and compares it with the cited manuscript passage, or identifies an auxiliary statement for which no corresponding printed sentence is claimed. The head row is Theorem 1.1. The relation concerns the compared mathematical content rather than the complete printed wording: *same* means matching content up to notation; *Lean stronger* means a broader proved scope or a more explicit conclusion; *Lean weaker* means that only part of the cited content is covered; *no printed counterpart* means an auxiliary statement with no corresponding printed sentence. A relation other than *same* means the Lean statement does not guarantee the printed wording. When the manuscript states several claims in one sentence and Lean states them separately, each row compares with the claim named in its reference.

Rows 91-97 list the 7 statements and definition modules of the dependency closure of Theorem 1.1 that the repository imports from the separate GeometricBirthday formalization (the geometric birthday problem for random disks). They have no printed counterpart in A or B; each note says what the item is.

The dependency closure of Theorem 1.1 is the set of statements and definition modules on which its Lean proof depends (1051 items: 1010 theorem statements and 41 definition modules); the released repository ships exactly this closure. A note beginning *Not used by Theorem 1.1* marks a compared row outside that closure: the statement was compared with the manuscript as part of the full statement set, but the proof of Theorem 1.1 does not use it, and it is not part of the released repository. The Status column records the proof status of each item at generation time (*Proved* = an accepted Lean proof; *Definition* = a definition module, which carries no proof obligation); the build of the released repository is the check of the proofs.

Conventions used in every row: the plane is the Euclidean plane with Lebesgue measure and D(x) is the open unit disk; B_n is the Mayer cluster formula quoted in A Section 2, with vertex 0 fixed at the origin; a graph on the manuscript's vertices 0, ..., n - 1 is a Lean graph on 0, ..., m with m = n - 1 free points; the fixed unit vector e of the manuscript is e = (1,0) inside the Lean definitions, while Theorem 1.1 and Lemma 3.4, which quantify over e in print, are stated for every unit vector e. The I-box boundaries and circle cutoffs in the planar Lebesgue integrals are null sets for the measures used in those integrals; the corner z = 0 in (4.10) is also null. In the pair-density and pentagon-density formulas, the density is extended by zero outside the geometrically allowed region, using Lean's conventions for square roots and division; this is a zero-extension statement, not a claim that those exterior regions are null. This table compares statements; the relation does not by itself assert that the statements are proved.

| Relation | Rows 1-90 | Rows 91-97 | Total |
|---|---:|---:|---:|
| same | 78 | 0 | 78 |
| Lean stronger | 6 | 0 | 6 |
| Lean weaker | 2 | 0 | 2 |
| no printed counterpart | 4 | 7 | 11 |
| total | 90 | 7 | 97 |

| Kind | Rows 1-90 | Rows 91-97 | Total |
|---|---:|---:|---:|
| theorem | 74 | 4 | 78 |
| definition | 16 | 3 | 19 |

| Status | Rows 1-90 | Rows 91-97 | Total |
|---|---:|---:|---:|
| Definition | 16 | 3 | 19 |
| Proved | 74 | 4 | 78 |

| Used by Theorem 1.1 | Rows 1-90 | Rows 91-97 | Total |
|---|---:|---:|---:|
| yes | 79 | 7 | 86 |
| no (10 theorem statements, 1 definition module) | 11 | 0 | 11 |

| # | Lean name | Kind | Manuscript reference | Relation | Status | Note |
|---:|---|---|---|---|---|---|
| 1 | `HardDiskB5.theorem_1_1` | theorem | A Theorem 1.1 | same | Proved | Stated for every unit vector e, as printed; b5 = B5/B2^4 with B_n given by the Mayer cluster formula quoted in A Section 2 (vertex 0 fixed at the origin). |
| 2 | `HardDiskB5.b5LensReduction` | theorem | A Theorem 1.1 | Lean weaker | Proved | The formula of Theorem 1.1 for the single unit vector e = (1,0) only; the statement for every unit vector is HardDiskB5.theorem_1_1. |
| 3 | `HardDiskB5.Spine.A_thm1_1_P1_unit` | theorem | A Theorem 1.1, definition of P1; A Section 3.1 | no printed counterpart | Proved | The integral P1 has the same value for every unit vector e. The manuscript defines P1 with an arbitrary unit vector e and treats it as a constant without stating this independence separately. |
| 4 | `HardDiskB5.Spine.A_prop2_1_count` | theorem | A Proposition 2.1, count 238 | same | Proved | Not used by Theorem 1.1; not part of the released repository. |
| 5 | `HardDiskB5.Spine.A_prop2_1_classes` | theorem | A Proposition 2.1, ten isomorphism classes; A Figure 1, representatives and multiplicities | same | Proved |  |
| 6 | `HardDiskB5.Spine.A_prop2_1_mayer` | theorem | A (2.1) | same | Proved |  |
| 7 | `HardDiskB5.Spine.A_sec3_1_A1` | theorem | A Section 3.1, value of A_1 | same | Proved |  |
| 8 | `HardDiskB5.Spine.A_sec3_1_P1` | theorem | A Section 3.1, P_1 = P(1); A Theorem 1.1, definition of P1 | same | Proved |  |
| 9 | `HardDiskB5.Spine.A_prop3_1_polar` | theorem | A Proposition 3.1, general statement | same | Proved |  |
| 10 | `HardDiskB5.Spine.A_prop3_1_K23` | theorem | A Proposition 3.1, display for K_{2,3} | same | Proved |  |
| 11 | `HardDiskB5.Spine.A_prop3_1_K113` | theorem | A Proposition 3.1, display for K_{1,1,3} | same | Proved |  |
| 12 | `HardDiskB5.Spine.A_prop3_1_X7` | theorem | A Proposition 3.1, display for X_7 | same | Proved |  |
| 13 | `HardDiskB5.Spine.A_prop3_1_Z8` | theorem | A Proposition 3.1, display for Z_8 | same | Proved |  |
| 14 | `HardDiskB5.Spine.A_prop3_1_W8` | theorem | A Proposition 3.1, display for W_8 | same | Proved |  |
| 15 | `HardDiskB5.Spine.A_prop3_1_K5` | theorem | A Proposition 3.1, display for K_5 | same | Proved |  |
| 16 | `HardDiskB5.Spine.A_prop3_1_Y9_P` | theorem | A Proposition 3.1, display for Y_9, first form | same | Proved |  |
| 17 | `HardDiskB5.Spine.A_prop3_1_Y9_S` | theorem | A Proposition 3.1, display for Y_9, second form | same | Proved |  |
| 18 | `HardDiskB5.Spine.A_lem3_2_pigeonhole` | theorem | A Lemma 3.2 | same | Proved |  |
| 19 | `HardDiskB5.Spine.MA_pigeon_triple` | theorem | A Lemma 3.2, proof | same | Proved |  |
| 20 | `HardDiskB5.Spine.A_prop3_3_K23` | theorem | A Proposition 3.3, K_{2,3} | same | Proved | Not used by Theorem 1.1; not part of the released repository. |
| 21 | `HardDiskB5.Spine.A_prop3_3_K113` | theorem | A Proposition 3.3, K_{1,1,3} | same | Proved | Not used by Theorem 1.1; not part of the released repository. |
| 22 | `HardDiskB5.Spine.MA_int_lamA3` | theorem | A Proposition 3.3, proof | same | Proved | Not used by Theorem 1.1; not part of the released repository. |
| 23 | `HardDiskB5.Spine.A_lem3_4_contact` | theorem | A Lemma 3.4; B Lemma 2.1, case d = 2 | same | Proved | Lean numbers the vertices 0, ..., n, so the printed factor n - 1 appears as n; stated for every unit vector e, as printed. |
| 24 | `HardDiskB5.Spine.A_lem3_5_K5` | theorem | A Lemma 3.5, formula for K_5 | same | Proved |  |
| 25 | `HardDiskB5.Spine.A_lem3_5_M1` | theorem | A Lemma 3.5, value of M_1; B Section 2.3 | same | Proved | The manuscript derives this value from the literature value (1.1) of b4; the statement is the printed value, and its Lean proof does not use b4. |
| 26 | `HardDiskB5.Spine.A_thm3_6_iso` | theorem | A Theorem 3.6 | same | Proved |  |
| 27 | `HardDiskB5.Spine.A_prop3_7_C5` | theorem | A Proposition 3.7, C_5 | same | Proved | Not used by Theorem 1.1; not part of the released repository. |
| 28 | `HardDiskB5.Spine.A_prop3_7_H6` | theorem | A Proposition 3.7, H_6 | same | Proved |  |
| 29 | `HardDiskB5.Spine.A_prop3_7_G7` | theorem | A Proposition 3.7, G_7 | same | Proved |  |
| 30 | `HardDiskB5.Spine.A_sec3_3_C5_split` | theorem | A Section 3.4 | same | Proved | Not used by Theorem 1.1; not part of the released repository. |
| 31 | `HardDiskB5.Spine.MA_Ival_split` | theorem | A Section 3.4 | no printed counterpart | Proved | Additivity of the measure I over boxes: I([0,1]x[0,2]) = I11 + I12 and I([0,2]^2) = I11 + 2 I12 + I22. The manuscript states the second only for C5 = I([0,2]^2). |
| 32 | `HardDiskB5.Spine.B_sec3_1_I12_H6_G7` | theorem | B Section 3.1, proof of the first display of A Theorem 4.5, Step 1 | same | Proved |  |
| 33 | `HardDiskB5.Spine.A_eq3_1_assembly` | theorem | A (3.1) | same | Proved |  |
| 34 | `HardDiskB5.Spine.A_thm4_1_main_equiv` | theorem | A Theorem 4.1 | same | Proved | Not used by Theorem 1.1; not part of the released repository. |
| 35 | `HardDiskB5.Spine.A_eq4_1_main` | theorem | A (4.1) | same | Proved |  |
| 36 | `HardDiskB5.Spine.A_thm4_1_B5form` | theorem | A Theorem 4.1, proof, B5 form of (1.2) | same | Proved | The B5 form of (1.2) displayed in the proof of Theorem 4.1 (equivalent to (1.2) since b5 = 16 B5/pi^4). |
| 37 | `HardDiskB5.Spine.A_thm4_2_wheel` | theorem | A (4.2) | same | Proved |  |
| 38 | `HardDiskB5.Spine.A_thm4_2_splitting` | theorem | A Theorem 4.2, splitting claim | same | Proved | Not used by Theorem 1.1; not part of the released repository. |
| 39 | `HardDiskB5.Spine.MA_wheel_smalllens` | theorem | A Theorem 4.2, proof | same | Proved |  |
| 40 | `HardDiskB5.Spine.A_thm4_5_S3` | theorem | A (4.5); A Theorem 4.5 | same | Proved |  |
| 41 | `HardDiskB5.Spine.A_thm4_6_s21` | theorem | A (4.6); A Theorem 4.6, last clause | same | Proved |  |
| 42 | `HardDiskB5.Shared.A_sec4_m_pushforward` | theorem | A Section 4, paragraph 'Closed unit pentagons'; B Section 3.2 | same | Proved | Where the printed density is undefined (\|y\| > 2 or \|e - y\| > 2) the true density is 0; Lean's conventions sqrt(negative) = 0 and x/0 = 0 give exactly 0 there. |
| 43 | `HardDiskB5.Shared.A_lem4_3_pairing` | theorem | A Lemma 4.3; B Section 3.2, pairing lemma as recalled | same | Proved |  |
| 44 | `HardDiskB5.Shared.A_cor4_4_third` | theorem | A Corollary 4.4 | same | Proved |  |
| 45 | `HardDiskB5.Shared.B_eq3_4_third` | theorem | B (3.4) | same | Proved |  |
| 46 | `HardDiskB5.Shared.B_eq3_1_mu_limit` | theorem | B (3.1); A Section 4, paragraph 'Closed unit pentagons' | same | Proved | Lean defines the walk measures by an explicit disintegration and states that the printed epsilon-expression converges to the integral against them. |
| 47 | `HardDiskB5.Shared.B_sec3_2_walk_perm` | theorem | B Section 3.3, permutation invariance; A Section 4, paragraph 'Closed unit pentagons' | same | Proved |  |
| 48 | `HardDiskB5.Shared.B_sec3_2_walk_finite` | theorem | B (3.1), total mass; B Lemma 3.4, proof, Step 4 | Lean stronger | Proved | Every walk measure W_n, n <= 4, is finite. The manuscript states m(M) < infinity for n = 0 and uses the total masses \|W_n\| for n >= 1 without stating finiteness separately. |
| 49 | `HardDiskB5.Shared.B_eq3_2_densities` | theorem | B (3.2) | same | Proved |  |
| 50 | `HardDiskB5.Shared.B_eq3_3_chart` | theorem | B (3.3); A Section 5.1 | Lean weaker | Proved | Lean states (p,q)_* m = 32 omega on O1 and O2, that the complement of O1 and O2 is null for (p,q)_* m, and the identity 4 (Im x12)^2 = 7 - 4(p+q) - 4(p-q)^2. The second equality of (3.3), m(M) = 16(Pi1 + Pi2) = 8 pi^3 Omega15, and the two-to-one property are not part of this statement. |
| 51 | `HardDiskB5.Shared.B_lem3_2_top_i` | theorem | B Lemma 3.2, part (i) | same | Proved |  |
| 52 | `HardDiskB5.Shared.B_lem3_2_top_ii` | theorem | B Lemma 3.2, part (ii), first sentence | same | Proved |  |
| 53 | `HardDiskB5.Shared.B_thm3_6_c1_rungs` | theorem | B Theorem 3.6, values of the rungs | same | Proved |  |
| 54 | `HardDiskB5.Spine.A_eq4_7_c1` | theorem | A (4.7); B Theorem 3.6, last clause | same | Proved |  |
| 55 | `HardDiskB5.Shared.B_thm3_12_c3_rungs` | theorem | B Theorem 3.12, values of the rungs | same | Proved |  |
| 56 | `HardDiskB5.Spine.A_eq4_8_c3` | theorem | A (4.8); B Theorem 3.12, last clause | same | Proved |  |
| 57 | `HardDiskB5.Spine.A_eq4_9_c4` | theorem | A (4.9) | same | Proved |  |
| 58 | `HardDiskB5.Spine.B_lem3_1_C5` | theorem | B Lemma 3.1, line for C_5 | same | Proved |  |
| 59 | `HardDiskB5.Spine.B_lem3_1_H6` | theorem | B Lemma 3.1, line for H_6 | same | Proved |  |
| 60 | `HardDiskB5.Spine.B_lem3_1_G7` | theorem | B Lemma 3.1, line for G_7 | same | Proved |  |
| 61 | `HardDiskB5.Spine.B_lem3_1_I22` | theorem | B Lemma 3.1, line for I_22 | same | Proved | Not used by Theorem 1.1; not part of the released repository. |
| 62 | `HardDiskB5.Spine.B_lem3_1_lensIntA` | theorem | B Lemma 3.1, value of the integral over L_1; A Lemma 3.5, proof | same | Proved |  |
| 63 | `HardDiskB5.Spine.B_lem3_1_diskIntA` | theorem | B Lemma 3.1, value of the integral over D(e); A Lemma 3.5, proof | same | Proved |  |
| 64 | `HardDiskB5.Spine.A_thm4_6_T` | theorem | A (4.10) | same | Proved | Iterated interval integrals over the closed square [0, pi/3]^2; the integrand differs from the printed one only at the corner z = 0 (division by zero gives 0 in Lean). |
| 65 | `HardDiskB5.Spine.MA_VH_iso` | theorem | A Proposition 2.1, each symbol denotes V of a class | no printed counterpart | Proved | Not used by Theorem 1.1; not part of the released repository. Isomorphic graphs have the same diagram volume V_H, so V of a class is well defined; the manuscript uses this when each symbol denotes V of a class. |
| 66 | `HardDiskB5.Spine.MA_Vpin_K23` | theorem | A Proposition 3.1, lens functional; A Figure 2, caption | same | Proved |  |
| 67 | `HardDiskB5.Spine.MA_Vpin_K113` | theorem | A Proposition 3.1, lens functional; A Figure 2, caption | same | Proved |  |
| 68 | `HardDiskB5.Spine.MA_Vpin_X7` | theorem | A Proposition 3.1, lens functional; A Figure 2, caption | same | Proved |  |
| 69 | `HardDiskB5.Spine.MA_Vpin_Z8` | theorem | A Proposition 3.1, lens functional; A Figure 2, caption | same | Proved |  |
| 70 | `HardDiskB5.Spine.MA_Vpin_W8` | theorem | A Proposition 3.1, lens functional; A Figure 2, caption | Lean stronger | Proved | For the wheel and the polar pair {1,3}, the pinned integral equals P(lambda) for every real lambda; the manuscript's lens functionals are defined for 0 <= lambda <= 2 (for lambda > 2 both sides are 0). |
| 71 | `HardDiskB5.Spine.MA_Vpin_Y9_P` | theorem | A Proposition 3.1, lens functional; A Proposition 3.1, proof | Lean stronger | Proved | For the complete graph minus one edge and the polar pair {0,1}, the pinned integral equals P(lambda) for every real lambda; the manuscript's lens functionals are defined for 0 <= lambda <= 2 (for lambda > 2 both sides are 0). |
| 72 | `HardDiskB5.Spine.MA_Vpin_Y9_S` | theorem | A Proposition 3.1, lens functional; A Proposition 3.1, proof | Lean stronger | Proved | For the complete graph minus one edge and the polar pair {3,4} (the missing edge), the pinned integral equals S(lambda) for every real lambda; the manuscript's lens functionals are defined for 0 <= lambda <= 2 (for lambda > 2 both sides are 0). |
| 73 | `HardDiskB5.Spine.MA_Vpin_K5` | theorem | A Proposition 3.1, lens functional; A Lemma 3.5 | Lean stronger | Proved | For the complete graph and every pair {i,j}, the pinned integral equals S(lambda) for every real lambda; the manuscript's lens functionals are defined for 0 <= lambda <= 2 (for lambda > 2 both sides are 0). |
| 74 | `HardDiskB5.Spine.MA_lens_ii` | theorem | A Proposition 3.1 | no printed counterpart | Proved | The functions lambda A^3, lambda A M, lambda P and lambda S are interval integrable on [0,2]; the manuscript uses these integrals without stating integrability separately. |
| 75 | `HardDiskB5.Lean.lensArea` | definition | A Theorem 1.1, D(x); A Section 3.1 | same | Definition | A(lambda) is the printed closed form, used for every real lambda; for lambda >= 2 it equals 0, the area of the empty lens. |
| 76 | `HardDiskB5.Lean.lensS` | definition | A Section 3.1 | same | Definition |  |
| 77 | `HardDiskB5.Lean.P1` | definition | A Theorem 1.1, definition of P1 | same | Definition |  |
| 78 | `HardDiskB5.Lean.b5` | definition | A Theorem 1.1, preceding sentence, b5 = B5/B2^4; A Section 2 | same | Definition | B_n is the Mayer cluster formula of A Section 2 with vertex 0 fixed at the origin; b5 = B5/B2^4. |
| 79 | `HardDiskB5.Lean.Vpin` | definition | A Section 2, definition of V_H for connected graphs; A Lemma 3.4 | same | Definition | For connected H, these are the manuscript's diagram integrals, with one vertex fixed at the origin and, for Vpin, the chosen pair fixed at 0 and e. No correspondence is claimed here for the extended configuration volume of disconnected graphs. |
| 80 | `HardDiskB5.Lean.VpinSc` | definition | B Section 2.2, Steps 1-2 | Lean stronger | Definition | Diagram integrals with a separate length scale for each pair; the integrals V(epsilon), V_l(epsilon) and f_l(y; epsilon) of the proof in B Section 2.2 are special cases. Not used by any other statement of this table. |
| 81 | `HardDiskB5.Lean.K5` | definition | A Proposition 2.1, class names; A Figure 1 | same | Definition |  |
| 82 | `HardDiskB5.Lean.Imeasure` | definition | A Section 3.4 | same | Definition |  |
| 83 | `HardDiskB5.Lean.kappa11` | definition | A Theorem 4.5, proof; B Lemma 3.1 | same | Definition |  |
| 84 | `HardDiskB5.Lean.FA` | definition | A Theorem 4.6 | same | Definition |  |
| 85 | `HardDiskB5.Lean.pentMeasure` | definition | A Section 4, paragraph 'Closed unit pentagons'; A Lemma 4.3, angles; B (3.1) | same | Definition | m is defined by an explicit disintegration over the angles of the first two sides; its agreement with the printed weak-limit definition is the statement HardDiskB5.Shared.B_eq3_1_mu_limit (n = 0). |
| 86 | `HardDiskB5.Lean.walkMeasure` | definition | B (3.1); B (3.2) | same | Definition | W_n is defined by an explicit disintegration; its agreement with the printed limit definition (3.1) is the statement HardDiskB5.Shared.B_eq3_1_mu_limit. |
| 87 | `HardDiskB5.Lean.ladderY` | definition | B (3.5) | same | Definition |  |
| 88 | `HardDiskB5.Lean.chartPQ` | definition | A Section 5.1; B (3.3) | same | Definition |  |
| 89 | `HardDiskB5.Lean.C1.rung` | definition | B (3.2); B Section 3.3, forms; B Lemma 3.2, part (i); B Lemma 3.2, proof, Step 1 | same | Definition | rung n is the right side of B Lemma 3.2(i) with \|W_n\| written as a full-plane form (no printed name); it is not used by any other statement of this table. |
| 90 | `HardDiskB5.Lean.c1Phi` | definition | B (3.2); B Section 3.3, forms | same | Definition | Not used by Theorem 1.1; not part of the released repository. An earlier copy of the same densities and forms; its densities differ only at r <= 0, which changes no form. Not used by any other statement of this table. |
| 91 | `GeometricBirthday.Public.Pt` | definition | none (imported) | no printed counterpart | Definition | From the separate GeometricBirthday formalization (the geometric birthday problem for random disks), reused here. Definition module: the Euclidean plane EuclideanSpace R (Fin 2), used by the statements of the two GeometricBirthday.Public.P1.Pair lemmas. |
| 92 | `GeometricBirthday.Public.P1.Pair.closedLens_eq_openLens` | theorem | none (imported) | no printed counterpart | Proved | From the separate GeometricBirthday formalization (the geometric birthday problem for random disks), reused here. For every z in the plane, the intersection of the closed unit disks centred at 0 and z has the same area as the intersection of the open unit disks (the difference lies on two circles). |
| 93 | `GeometricBirthday.Public.P1.Pair.lensAtVector` | theorem | none (imported) | no printed counterpart | Proved | From the separate GeometricBirthday formalization (the geometric birthday problem for random disks), reused here. For every z in the plane with norm at most 2, the area of the intersection of the closed unit disks centred at 0 and z is A(norm z), with A the lens area of A Section 3.1; no direction is imposed on z. |
| 94 | `GeometricBirthday.Public.P3.shapeIntegral` | definition | none (imported) | no printed counterpart | Definition | From the separate GeometricBirthday formalization (the geometric birthday problem for random disks), reused here. Definition module (a plane, determinant and triangle area, a circumradius predicate, three-disk areas and iterated shape integrals); it is in the closure only because complementPrimitive_derivative and capPolynomial import it, and no statement of this table uses its definitions. |
| 95 | `GeometricBirthday.Public.P3.capPolynomial` | definition | none (imported) | no printed counterpart | Definition | From the separate GeometricBirthday formalization (the geometric birthday problem for random disks), reused here. Definition module (a cap trigonometric expression, a weighted lens integral and a flat-triangle correction); it is in the closure only because radialLensIntegral imports it, and no statement of this table uses its definitions. |
| 96 | `GeometricBirthday.Public.P3.Lens.complementPrimitive_derivative` | theorem | none (imported) | no printed counterpart | Proved | From the separate GeometricBirthday formalization (the geometric birthday problem for random disks), reused here. For -2 < d < 2, the function x -> (x^2 - 1) arcsin(x/2) + x (x^2 + 2) sqrt(4 - x^2)/8 has derivative d (pi - A(d)) at d, with A the lens area. |
| 97 | `GeometricBirthday.Public.P3.Cap.radialLensIntegral` | theorem | none (imported) | no printed counterpart | Proved | From the separate GeometricBirthday formalization (the geometric birthday problem for random disks), reused here. For 0 <= r < 2, the integral of x A(x) over [0, r] equals pi r^2/2 - (r^2 - 1) arcsin(r/2) - r (r^2 + 2) sqrt(4 - r^2)/8, with A the lens area. |
