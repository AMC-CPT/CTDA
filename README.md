# Scientific Inference in Clinical Trials with R: example repository

*한국어 설명은 [README.ko.md](README.ko.md) 에 있습니다.*

The companion repository of Kyun-Seop Bae, *Scientific Inference in Clinical
Trials with R* (임상시험에서의 과학적 추론 with R). Its purpose is to let a
reader **remake every number and every figure in the book**; the text of the
book is not here.

All you need is R. No commercial software, no license.

**The code here is the English edition's**: the comments in the snippets, the
truncation mark in the frozen output and the labels in the figures are all
English. The book was written in Korean first and the Korean edition prints the
same code with Korean comments; a reader of either edition can use this
repository, because the file names, the chapter numbering, the numbers in the
console output and the data do not change with the language. Only one set of
code is kept here, so that there is one place to look.

## Getting started

```sh
git clone https://github.com/AMC-CPT/CTDA
cd CTDA
Rscript R/build-all.R
```

That remakes the console output in `output/` and the figures in `figures/`.
They are committed already, so they can simply be read without running
anything. To follow one chapter, open that chapter's files in `R/snippets/` and
run them yourself.

`R/build.R` is what does the freezing and `R/build-all.R` drives it. The
difference is the `ch17-*` snippets (chapter 20 of the book), whose many
nonlinear fits need one R process per group; the comment at the head of
`R/build-all.R` says why. To remake a single chapter, run `R/build.R`.

## Structure

```
R/snippets/<name>.R   the R code printed in the book. 401 files
R/build.R             runs the snippets in order and makes output/ and figures/
R/build-all.R         the same, with the ch17-* snippets run one group per R process
R/_freeze.R           its helper (fixes the seed, shares the session, tidies the output)
output/<name>.txt     frozen console output, as printed in the book. 339 files
figures/<name>.pdf    frozen figures. 91 files
data/                 the example data
pyfig/                the matplotlib scripts of the Ch 1-2 diagrams, and FIGURE-PROVENANCE.md
```

The number in a snippet's name is **not** the chapter number of the printed
book. The names keep the numbering of the manuscript's files, which did not
change when chapters were added and moved, and the book refers to the snippets
by these names. The chapters of the book that each group of files belongs to:

| Files | Chapter of the book |
|---|---|
| `qdm-*` | 1, 2 |
| `ch02-*` | 3 |
| `ch03-*` | 4 |
| `ch04-*` | 5 |
| `ch05-*` | 6 |
| `ch06-*` | 7 |
| `ch07-*` | 8 |
| `ch08-*` | 6, 7, 11, 18 (the sections of a former chapter, now spread out) |
| `ch09-*` | 10 |
| `ch10-*` | 11 |
| `ch11-*` | 12 |
| `ch12-*` | 13 |
| `ch13-*` | 14 |
| `ch14-*` | 15 |
| `ch15-*` | 16 |
| `ch16-*`, `ch16b-*` | 17 |
| `ss-*` | 18 |
| `ctsim-*` | 19 |
| `ch17-*` | 20 |
| `be-*` | 21 |
| `appA-*` to `appE-*` | Appendices A to E |

Chapters 9, 22 and 23 print their code in the text itself and chapter 24 has
none, so there are no files for them here. The comments of `R/build.R` and
`R/build-all.R` number chapters the same way as the files: their chapter 17 is
the `ch17-*` files, chapter 20 of the book.

The scripts in `pyfig/` are the ones the Korean edition uses; they carry its
labels and translate them through `pyfig/labels_en.py` as each label is drawn,
which is why their comments are still Korean. `CTDA_LANG` selects the language
and defaults to English here, so running them reproduces the figures in
`figures/`.

## Why the code and its output cannot drift apart

The book prints `R/snippets/<name>.R` **as a whole file**, and takes the output
it shows from `output/<name>.txt`, which was produced by running that same
file. Code and output come from one source, so nothing is retyped and nothing
can fall out of step. `R/build.R` is that freezing step, and `R/_freeze.R`
manages the random seed and the session.

The snippets run in order, **as though one R session ran through them all**: a
later snippet uses the objects an earlier one made. So running one file on its
own can fail with an object-not-found error. When that happens, run the
chapter's earlier snippets first; the order in `R/build.R` is that order.

## R packages

Most of it runs on base R; some chapters need these.

```r
install.packages(c("sasLM", "MASS", "survival", "nlme", "lattice", "psych", "nnet",
                   "car", "gmodels", "PropCIs", "KMsurv", "ggplot2", "ggsurvfit",
                   "dobson", "rgl", "mathr", "flexsurv", "numDeriv", "wnl", "nmw",
                   "deSolve", "LBI", "vcdExtra", "meta"))
```

`mathr` is on CRAN as well; its development version is at
<https://github.com/ksbae/mathr>.

## Where the data come from

Everything in `data/` is either the author's own or public statistics. It used
to live at `http://r.acr.kr/` and was bundled into the repository so that
nothing depends on a remote host.

| File | Contents |
|---|---|
| `2017KoBody.csv` | 2017 Korean National Fitness Survey (original: `http://r.acr.kr/2017KoBody.csv`) |
| `LogP-F.csv` | LogP and oral bioavailability for 45 drugs, compiled by the author from public sources |
| `Paxlovid.csv`, `pax0.csv` | survival analysis examples |
| `ExTTE.csv`, `TTE.R` | a time-to-event example and its helper functions |
| `Surv-Trt.csv`, `Surv-Quartile.csv` | survival analysis examples |
| `bax.csv` | a dose--response example (change in systolic blood pressure, baseline, eGFR) |
| `Dose-ContResp.csv`, `Dose-Resp-Logistic.csv`, `AUC-Resp-Logistic.csv`, `DoseRes.csv`, `Pop-SigEmax.csv` | dose- and exposure--response examples |

The provenance and copyright handling of the Chapter 1-2 diagrams is recorded
figure by figure in `pyfig/FIGURE-PROVENANCE.md`. Not one third-party image is
used.

## Solutions to the exercises

They are not in the book and they are not here. Instructors may request them
from `ksbae@acr.kr`.

## Copyright and license

The copyright in the text of the book belongs to the author and the publisher,
and the text is not here. The code, the data and the frozen output and figures
in this repository are published under the **GNU General Public License v3.0 or
later** (`LICENSE`). Running them and changing them is free, and a modified
version distributed to others carries the source under the same terms.

Copyright (C) 2026 Kyun-Seop Bae. This program is free software: you can redistribute it
and/or modify it under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your option) any later
version. It is distributed WITHOUT ANY WARRANTY; see `LICENSE` for details.

## The other books in the series

| | |
|---|---|
| 1 Scientific Computation with R | <https://github.com/AMC-CPT/SciCompR> |
| 3 Pharmacokinetics with R | <https://github.com/AMC-CPT/PKwR> |
| 4 Pharmacometrics with NONMEM and R | <https://github.com/AMC-CPT/PMx> |
| 5 Essentials of Clinical Drug Development (online appendix) | <https://github.com/AMC-CPT/CDD> |
