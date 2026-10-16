# The fifth virial coefficient of hard disks: Lean 4 formalization of Theorem 1.1

This repository contains a machine-checked proof, in Lean 4 with Mathlib, of Theorem 1.1 (the one-constant
formula for b5) of the paper *The fifth virial coefficient of hard disks* by Sungsoo Na (paper A, version 1.0.0),
following the proofs of that paper and of its companion *The fifth virial coefficient of hard disks: complete
proofs and computations* (paper B). Nothing else of the two papers is formalized here (see "What is not
formalized").

## What is proved

Theorem 1.1 of paper A, as printed:

```tex
\begin{theorem}\label{thm:main}
Let $D(x)$ be the open unit disk centred at $x\in\R^2$, let $|e|=1$ and $\Lens_1=D(0)\cap D(e)$. Then
\begin{equation}\label{eq:conj-intro}
b_5=\frac{140}{81}-\frac{101\sqrt3}{9\pi}+\frac{1169}{18\pi^2}-\frac{71\sqrt3}{2\pi^3}+\frac{4P_1}{\pi^3},
\qquad P_1=\int_{\Lens_1}\bigl|D(0)\cap D(e)\cap D(x)\bigr|^2\dd x .
\end{equation}
\end{theorem}
```

Here b5 = B5/B2^4 (paper A, Section 1, with disk diameter 1).

The Lean statement (`Challenge.lean`; the same statement is `HardDiskB5Lean.theorem_1_1` in
`HardDiskB5Lean/Heads.lean` and `theorem_1_1` in `Solution.lean`):

```lean
theorem theorem_1_1 (e : HardDiskB5.Lean.Pt) (he : ‖e‖ = 1) :
    b5 = 140 / 81 - 101 * Real.sqrt 3 / (9 * Real.pi) + 1169 / (18 * Real.pi ^ 2) - 71 * Real.sqrt 3 / (2 * Real.pi ^ 3)
      + 4 * (∫ x in disk 0 ∩ disk e, (volume (disk 0 ∩ disk e ∩ disk x)).toReal ^ 2) / Real.pi ^ 3
```

`Pt` is the Euclidean plane `EuclideanSpace ℝ (Fin 2)` (Euclidean distance, Lebesgue measure `volume`),
`disk c = Metric.ball c 1` is the open unit disk centred at `c`, and the statement is made for every unit vector
`e`, as printed. The integral is the Lebesgue integral over L1 = D(0) ∩ D(e) of the squared area of the triple
intersection, that is P1.

## How b5 and B_n are defined

Paper A, Section 2, takes B_n from the Mayer cluster formula (Mayer and Mayer 1940, Sections 13f and 13h):

```tex
V_{\mathcal H}=\int_{(\R^2)^{n-1}}\prod_{ij\ \text{edge of}\ \mathcal H}\mathbf 1[|x_i-x_j|<1]\dd x_1\cdots\dd x_{n-1},\qquad x_0=0,
B_n=-\frac{n-1}{n!}\sum_{\mathcal H}(-1)^{|\mathcal H|}V_{\mathcal H},
```

the sum running over labelled 2-connected graphs H on n vertices with |H| edges. The Lean definitions (module
`HardDiskB5Lean/Definitions/Def_HardDiskB5_Lean_b5.lean`, copied verbatim into `Challenge.lean`) state the same
formula:

- `mayerF r = if r < 1 then -1 else 0` (the Mayer function of unit-diameter disks);
- `IsBiconnected G` = `G` is connected and stays connected after deleting any single vertex;
- `mayerWeight G x` = the product of `mayerF (dist (x i) (x j))` over the edges `i < j` of `G`, which equals
  (-1)^|H| times the product of the indicators in V_H;
- `virialB n = -(n / (n+1)!) * ∫ y : Fin n → Pt, Σ_{G 2-connected on Fin (n+1)} mayerWeight G (Fin.cons 0 y)`,
  so `virialB n` is B_{n+1}, with vertex 0 fixed at the origin as in the printed formula;
- `b5 = virialB 4 / virialB 1 ^ 4`, that is B5/B2^4.

So the Lean b5 is the printed b5 as a definition, with the integral over (R^2)^(n-1) written as a Lebesgue
(Bochner) integral; the integrands are bounded, measurable and compactly supported. The derivation of the Mayer
cluster formula from the virial expansion of the hard-disk fluid is not part of this formalization (paper A quotes
it from the literature too). The value B2 = π/2 is proved in the library, not assumed.

## What is checked (trust boundary)

If `lake build` succeeds, then:

1. every module of the library `HardDiskB5Lean`, `Challenge.lean`, `Solution.lean` and `Audit.lean` was checked
   by the Lean kernel;
2. `Audit.lean` (part of the default build) prints the axioms that `HardDiskB5Lean.theorem_1_1` and the
   `theorem_1_1` of `Solution.lean` depend on, and fails unless they are among `propext`, `Classical.choice` and
   `Quot.sound`; it also fails if any constant of the `HardDiskB5Lean` modules uses `sorry` directly. In the
   recorded build it printed:

   ```
   AUDIT axioms HardDiskB5Lean.theorem_1_1: [propext, Classical.choice, Quot.sound] (sorryAx allowed: false)
   AUDIT axioms theorem_1_1: [propext, Classical.choice, Quot.sound] (sorryAx allowed: false)
   AUDIT placeholders (0): []
   ```

3. the only `sorry` in the repository is the one in `Challenge.lean` (the statement to be compared); the build
   reports it as a warning. There is no `native_decide`, no `decide +native`, no `axiom` declaration, no
   `implemented_by` or `extern` attribute and no `admit`.

What you have to trust: the Lean 4 kernel (and the toolchain that runs it), the three standard axioms above, the
Mathlib definitions used in the statement (Euclidean space, metric balls, Lebesgue measure, the Bochner integral,
`Real.sqrt`, `Real.pi`, simple graphs), and that the definitions in `Challenge.lean` (`Pt`, `disk`, `lensArea` and
the definitions of b5 listed above) say what the paper says. The many intermediate statements of the library are
proved, not trusted.

`config.json` is a configuration for Comparator (`leanprover/comparator`), which checks that `theorem_1_1` of
`Solution.lean` has the same statement as in `Challenge.lean`, with identical definitions behind it, and that it
uses only the permitted axioms. A Comparator run (comparator `3927ad3`, landrun 0.1.18, lean4export `15f6055`,
built with Lean v4.33.1), on the clean machine described below and after the build, passed: after comparing the
statement and checking the axioms it replayed the solution in the Lean kernel and printed
`Lean default kernel accepts the solution` and `Your solution is okay!` (14 min 23 s wall clock, maximum resident
memory 10.5 GiB; output in `receipts/comparator.log`).

## Rebuilding

Requirements: elan (the Lean toolchain manager), git, and an internet connection for the Mathlib cache.
The build needs a machine with a lot of memory (one Lean process reached 15.0 GiB, see below).

From the repository root:

```
lake exe cache get
lake build
lake env lean Check.lean
```

Do not run `lake update` (the manifest pins every dependency).

Expected output: `lake build` ends with `Build completed successfully (10775 jobs).` Its output contains one
"declaration uses sorry" warning, from `Challenge.lean`, a large number of linter warnings from the proof modules
(unused simp arguments, unused variables, deprecations and similar; no errors), and the three `AUDIT` lines shown
above. `Check.lean` prints the type of `HardDiskB5Lean.theorem_1_1` and
`'HardDiskB5Lean.theorem_1_1' depends on axioms: [propext, Classical.choice, Quot.sound]`.

Measured on a clean machine (AWS r8g.4xlarge, AWS Graviton4; 16 cores, 123.5 GiB memory, aarch64, Amazon Linux
2023), on a source tree with the same Lean code and dependency pins as this repository (the `.lean` files differ
only in two comment lines of `HardDiskB5Lean/Heads.lean`):

- `lake exe cache get`: 43 s wall clock;
- `lake build`: 11 min 53 s wall clock, 2.73 CPU hours, maximum resident memory of a single process 15.0 GiB;
- disk used by `.lake` after the build: 17.9 GiB.

The logs of that build are in `receipts/` (`build.log`, `build.time`, `cache_get.time`, `check.out`,
`build_summary.txt`, `machine.txt`), with the Comparator output (`comparator.log`, `comparator.time`).

## Versions

- Lean: `leanprover/lean4:v4.33.1` (`lean-toolchain`).
- Mathlib: tag `v4.33.1`, commit `0df444a360eaa60ab8c11dca51a86af692955474` (`lake-manifest.json`).

## Repository layout

- `Challenge.lean`: imports only Mathlib, repeats the two definition modules the statement uses, and states
  Theorem 1.1 with `sorry`.
- `Solution.lean`: the same statement, proved by `HardDiskB5Lean.theorem_1_1`.
- `HardDiskB5Lean/Heads.lean`: the head theorem `HardDiskB5Lean.theorem_1_1`.
- `HardDiskB5Lean/Definitions/` (41 modules): definitions only.
- `HardDiskB5Lean/Theorems/` (1010 modules): one statement each, named as in the correspondence table, proved by
  the matching module of `HardDiskB5Lean/Proofs/` (1010 modules). The module and helper names in `Proofs/` carry
  a numeric suffix that only makes them unique.
- `Audit.lean`, `Check.lean`, `config.json`: the checks described above.
- `CORRESPONDENCE.md`, `CORRESPONDENCE.tsv`: the correspondence table (below).
- `receipts/`: logs of the clean build and of the Comparator run.

The library is the dependency closure of Theorem 1.1: 1010 theorem statements and 41 definition modules.

## Correspondence with the manuscript

`CORRESPONDENCE.md` (and the same rows as tab-separated values in `CORRESPONDENCE.tsv`) compares 90 Lean
statements (74 theorem statements and 16 definition modules) with the printed passages of papers A and B, and lists
the 7 items of the closure that come from a separate formalization (the geometric birthday problem for random
disks). For a theorem row in the closure, the Lean name is the declaration name in this repository (module
`HardDiskB5Lean/Theorems/Thm_<name with dots replaced by underscores>.lean`); for a definition row it names the
definition module.

| Relation | Rows 1-90 | Rows 91-97 | Total |
|---|---:|---:|---:|
| same | 78 | 0 | 78 |
| Lean stronger | 6 | 0 | 6 |
| Lean weaker | 2 | 0 | 2 |
| no printed counterpart | 4 | 7 | 11 |
| total | 90 | 7 | 97 |

Row 1 is Theorem 1.1 (relation *same*). 11 compared rows (10 theorem statements and 1 definition module) are not
used by the proof of Theorem 1.1 and are not part of this repository; their notes say so. The conventions of the
comparison (null sets, vertex numbering, the fixed unit vector e = (1,0) inside the definitions) are stated at the
top of `CORRESPONDENCE.md`.

## Differences from the route of the papers

- **M1 is proved directly.** Paper A (Lemma 3.5) and paper B (Section 2.3) obtain
  M1 = π²/2 - 3√3π/4 + 1/2 from the literature value (1.1) of b4 and a four-point contact identity. The literature
  value of b4 is not available in Lean, so the same statement (`HardDiskB5.Spine.A_lem3_5_M1`, row 25) is proved
  directly; the statement is the printed value, and its proof does not use b4.
- **The unit vector e.** Inside the definitions e is fixed to (1,0). Theorem 1.1 and Lemma 3.4, which quantify over
  e in print, are stated for every unit vector; the bridge is the rotation invariance of P1
  (`HardDiskB5.Spine.A_thm1_1_P1_unit`, row 3), a statement the paper uses without stating it.
- **Measures defined by disintegration.** The pentagon measure m and the walk measures W_n are defined in Lean by
  an explicit disintegration; that the printed epsilon-limit definition (B (3.1)) gives the same integrals is the
  proved statement `HardDiskB5.Shared.B_eq3_1_mu_limit` (row 46).
- **Statements split or made explicit.** Where one printed sentence makes several claims, Lean states them
  separately; some auxiliary facts the paper uses without stating them (integrability, additivity of the measure I
  over boxes) are separate statements (rows marked *no printed counterpart*), and a few statements hold on a larger
  range than printed (rows marked *Lean stronger*).
- **Printed statements the proof does not use.** The proof of Theorem 1.1 does not go through the printed
  statements of A Proposition 3.3, A Proposition 3.7 (the value C5) and its Section 3.4 split, A Theorem 4.1,
  A Theorem 4.2, the I22 line of B Lemma 3.1, or the count 238 of A Proposition 2.1; these, an isomorphism
  invariance of V_H and an earlier copy of one definition were compared (rows 4, 20-22, 27, 30, 34, 38, 61, 65, 90)
  but are not in this repository. A Theorem 3.8 (the ring closed form) and A Proposition 4.8 have no row.

## What is not formalized

- Corollary 1.2 (the formula in terms of K5) and Theorem 1.3 (the Eichler-integral form of b5) of paper A.
- Any numerical value: neither the digits of b5 or P1 nor the numerical comparisons of the papers are computed or
  checked here.
- Everything else in papers A and B that Theorem 1.1 does not need, in particular the results of paper A from
  Proposition 5.1 on (random-walk representation, Picard-Fuchs equation, Eichler integrals, periods), and the
  physical derivation of the Mayer cluster formula.

The repository checks the statement above and nothing else.

## Errata noticed during formalization

Three misprints in paper B were found while formalizing. None of them affects any result.

- **E1** (paper B, Section 3.3, the paragraph before Lemma 3.9): the point inversion formula is printed as
  `f(e)=2\pi\int_0^\infty kJ_0\widehat f\dd k`; it should read `f(e)=\int_0^\infty kJ_0\widehat f\dd k`. With
  `\widehat f(k)=\int_0^\infty r f(r) J_0(kr)\dd r`, the Fourier transform of a radial f on R^2 is
  2π f^(|ξ|), and inverting it gives f(x) = ∫_0^∞ k J_0(k|x|) f^(k) dk, without the factor 2π. The convolution form
  (f*g)(y) = 2π ∫ k J_0(k|y|) f^ g^ dk that paper B actually uses is correct.
- **E2** (paper B, (3.15) in the proof of Lemma 3.7, and the sentence after it): `\bar x_n` (five occurrences)
  should be `\bar x_a`; the index n is not defined there. The corrected map is
  (x_ij, x_a, x_l) -> (-x̄_a x_ij, x̄_a, -x̄_a x_l), and the claims of the following sentence hold for it.
- **E3** (paper B, Section 3.2, the paragraph after (3.1)): the two citations `[NaA, Section 5]` (for the
  Gelfand-Leray measure m of the surface of closed unit pentagons, and for the definition of near and far pairs)
  should be `[NaA, Section 4]`, where paper A 1.0.0 defines them. The later citation "as in [NaA, Section 5]" for
  w, ω, O1, O2, Π1, Π2 is correct.

## License

MIT (see `LICENSE`).

## Citation

If you use this repository, please cite the paper: Sungsoo Na, *The fifth virial coefficient of hard disks*,
version 1.0.0, DOI: 10.5281/zenodo.23097001 (all versions: 10.5281/zenodo.23097000). The companion paper
*The fifth virial coefficient of hard disks: complete proofs and computations* has DOI 10.5281/zenodo.23364640;
the supplementary material (scripts, certificates, data and receipts) has DOI 10.5281/zenodo.23364644.

Assisted by AI.
