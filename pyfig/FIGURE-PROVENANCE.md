# Provenance and copyright of the figures of chapters 1 and 2

**The 22 figures the scripts of `pyfig/` produce, and the one R produces
(`qdm-xyz`), are all original drawings made for this book.** Not one of the
third-party illustrations (scans, screen captures, quoted images) that appeared
in the author's original lecture material (the DIA conference talk of
2022-11-18 and "BD How to decide" of 2022-03-14) has been used.

## Classes

- **A. Redrawn from data**: drawn directly from public statistics or from the
  author's own data.
- **B. The concept drawn anew**: the third-party illustration the original
  lecture quoted is not used; the drawing was designed and made from scratch
  **from the facts and the concept it conveyed**, and from nothing else.
- **C. Newly devised for the text**: not in the original lecture material,
  made because the argument of the text needed it.

## The list

| Figure | File | Class | Source of the facts | How copyright is handled |
|---|---|---|---|---|
| 1.1  | `ov-fda-process` | B | The facts of the US FDA drug development diagram (stages, durations, accelerated routes) | The original diagram is not copied; drawn anew from the stages and durations alone |
| 1.2  | `ov-attrition-funnel` | B | The compound attrition of NTRM (2002) (tens of thousands to hundreds to tens to 5 to 2) | The original table is not copied; designed anew as a funnel. No number that is not in the source was added |
| 1.7  | `ov-tollgates` | B | The structure of a company's internal tollgates (the facts of the presentation by YH Kim, Hanmi Pharmaceutical, 2011-06-28) | The original slide is not copied; drawn anew as a three-tier structure of gate, items assessed and decision maker |
| 1.8  | `ov-four-pillars` | B | The concept of the four pillars looked at up to phase 1 | The pictograms of the original slide are removed and the figure drawn anew |
| 1.9  | `ov-potency-efficacy` | B | The distinction between potency and efficacy (drug A: EC50 $10^{-6}$ M, Emax 1.0; B: EC50 $10^{-8}$ M, Emax 0.5) | Drawn anew from the Emax model |
| 1.10 | `ov-benefit-risk` | B | The concept of benefit and risk curves against dose | Drawn anew from logistic functions, with the therapeutic window shaded |
| 1.11 | `ov-logp-schematic` | B | The bell-shaped LogP-bioavailability relation of the textbooks (optimum 0 < LogP < 3) | No third-party illustration is used; drawn anew as a schematic. A histogram of cLogP of unknown origin was dropped |
| 1.12 | `ov-logp-reality` | A | Measured LogP and oral bioavailability of 45 drugs, compiled by the author from public sources (`data/LogP-F.csv`) | The author's own data, drawn directly ($n=45$, $r=-0.1324$). The numbers are recomputed by `R/snippets/qdm-logp.R` |
| 1.13 | `ov-ind-to-market` | A | The author's IND-to-market data | The author's own data, drawn directly |
| 1.14 | `ov-risk-perception` | B | Slovic P, Fischhoff B, Lichtenstein S. Rating the risks. *Environment* 1979;21(3) | The original figure is not copied; drawn anew as a **schematic**. Neither the individual item names nor the measured coordinates are used, only the conclusion that the judgment line has a slope below 1 |
| 1.15 | `ov-equivalent-risk` | B | Kletz TA. What risks should we run? *New Scientist* 1977;74:320--322 | The illustration is not used; only the facts of the four equivalent risks, drawn anew as a box diagram |
| 1.16 | `ov-voluntary-risk` | B | Starr C. Social benefit versus technological risk. *Science* 1969;165 | The original figure is not copied; drawn anew as a schematic. The measured coordinates are not used, only the conclusion that the two lines lie about 1000-fold apart |
| 1.17 | `ov-numbers-not-added` | B | The error of adding numbers with different units (the idea comes from Dana Fradon, *The New Yorker*, 2001) | The original cartoon is not used; an imaginary town sign was drawn anew |
| 2.1  | `qdm-observation-inference` | B | Chevalier's anecdote of the black sheep of Australia (text) | The stock photograph of the original slide is removed, and a diagram showing the narrowing scope of the claim as bar lengths was designed anew |
| 2.2  | `qdm-signalling-network` | B | The concept of the complexity of a cell signaling network | Neither the Reactome nor the Wikimedia figure is used; a conceptual diagram of anonymous nodes was designed anew |
| 2.3  | `qdm-xyz` | A | The author's x--y--z simulation ($\rho_{xy}=0.7$, $\rho_{yz}=0.5$, $\rho_{xz}=-0.1$) | **Generated in R** (`R/snippets/qdm-xyz.R`, `set.seed(1)`). Since the text prints the same code and console output, the figure has to come from R too, or the numbers would disagree |
| 2.4  | `qdm-anscombe` | A | The 4 sets of 11 pairs published by Anscombe (1973) | The numbers are facts. The figure is drawn anew (the Wikimedia SVG is not used). The summary statistics are recomputed by `R/snippets/qdm-anscombe.R` from R's built-in `anscombe` data |
| 2.5  | `qdm-simpson` | B | The concept of Simpson's paradox | The Wikimedia figure is not used; five strata were simulated and drawn directly |
| 2.6  | `qdm-korea-mortality` | A | National Data Agency (formerly Statistics Korea), causes of death statistics 2008--2024 (final) and birth and death statistics 2025 (preliminary) | Public statistics, drawn directly. The numbers are facts and carry no copyright |
| 2.7  | `qdm-dose-vs-exposure` | C | None (devised for the argument of section 2.3.3) | Simulated data with between-subject variability in clearance ($n=72$), generated and drawn directly |
| 2.8  | `qdm-likelihood-interval` | C | None (devised for the argument of section 2.3.6) | The likelihood of binomial data with $n=10$, $x=2$, computed and drawn directly. The numbers in the figure agree with the frozen output of `R/snippets/qdm-li.R` (LI $(0.0232, 0.5589)$, Wald $(-0.0479, 0.4479)$) |
| 2.9  | `qdm-certainty-information` | B | The asymmetric growth of certainty and information over the stages of development | Drawn anew |
| 2.10 | `qdm-disciplines-venn` | B | The disciplines needed for quantitative reasoning | Drawn anew |

Figures 1.3 to 1.6 of chapter 1 (levels of evidence, the decision tree for the
control group, the scenarios of a three-arm trial, the reading of ITT against
PP) are **original TikZ drawings inside the manuscript** and so are not in this
table.

## What was dropped instead of drawn

These were in the original lecture material but could not be reproduced without
a copyright problem, so **they are not in the book as figures**. The content
was carried over as text or as a table instead.

| Original slide | Why it was dropped | What replaced it |
|---|---|---|
| The game record of AlphaGo against Lee Sedol, game 1 | The image is a third-party work, and transcribing the coordinates invites error | Text (section 2.5.2) |
| The restaurant menu cartoon 'RISKS / BENEFITS' (signed) | A signed third-party cartoon | Text (section 1.10.4) |
| Lipinski's rules, in vitro targets, an antifungal TPP example (three page scans from a Korean textbook) | Page scans of a Korean textbook | The content was rewritten as tables in the text, with the source named |
| A screen capture of Drugs@FDA | Contains the agency's logo and marks | Text (section 2.5.4) |
| A histogram of the cLogP of marketed drugs | A third-party figure of unknown origin, with no underlying data | Dropped |
| Eleven book covers and the cover of a Korean textbook | Publishers' works | Entries in the further reading and the bibliography |

## How to reproduce them

Run from the root of the repository. The figures are frozen as PDF in
`figures/` and committed, so there is normally no need to run this.

```sh
python pyfig/mkfig_data.py      # the figures drawn from data
python pyfig/mkfig_schema.py    # the conceptual diagrams
python pyfig/mkfig_extra.py     # the figures devised for the text
Rscript -e "source('R/_freeze.R'); freeze('qdm-xyz', seed=1, fig=TRUE, fig.w=7.0, fig.h=2.6)"
```

- What you need: Python 3 with matplotlib, and the **Arial** face (the face of
  the figures of this edition). On another system, change
  `rcParams["font.family"]` in `mkfig_common.py`.
- The scripts carry the labels of the Korean edition and translate them through
  the dictionary in `labels_en.py` as each label is created. `CTDA_LANG` selects
  the language and defaults to `en` here; `mkfig_common.save()` raises if a
  label is missing from the dictionary, so no Korean label can slip through.
- `NAME_MAP` in `mkfig_common.py` maps the figure names of the original lecture
  to the file names of the book (`ov-*` for chapter 1, `qdm-*` for chapter 2).
  Saving under a name that is not in the map raises, which prevents a figure
  from going missing quietly.
- The PDFs embed a subset of the font with `pdf.fonttype = 42`, so the text can
  be searched and copied.
- The two-color (black and navy) print mode of the book reassigns TikZ colors
  only, so the colors of these figures (navy `#1f4e79`, orange-brown `#b45309`,
  gray) print as they are. The three differ in lightness, so they stay apart in
  black and white.
