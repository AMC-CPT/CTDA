# Scientific Inference in Clinical Trials with R — example repository

*한국어 설명은 [README.ko.md](README.ko.md) 에 있습니다.*

The companion repository of Kyun-Seop Bae, *Scientific Inference in Clinical
Trials with R* (임상시험에서의 과학적 추론 with R). Its purpose is to let a
reader **remake every number and every figure in the book**; the text of the
book is not here.

All you need is R. No commercial software, no licence.

**The book is written in Korean, and so are the comments in about half of the
code files.** The rest is not language-bound: the file names, the chapter
numbering, the console output, the figures and the data are the same in any
language, so the code can be read and run, and your result compared against the
book's, without Korean. An English edition of the book is in preparation; when
it is ready its translated code will be added here as `En/`, as it already has
been for volume 4.

## Getting started

```sh
git clone https://github.com/AMC-CPT/CTDA
cd CTDA
Rscript R/build.R
```

That remakes the console output in `output/` and the figures in `figures/`.
They are committed already, so they can simply be read without running
anything. To follow one chapter, open that chapter's files in `R/snippets/` and
run them yourself.

## Structure

```
R/snippets/chNN-*.R   the R code printed in the book (chapter number = the book's). 401 files
R/build.R             runs the snippets in order and makes output/ and figures/
R/_freeze.R           its helper (fixes the seed, shares the session, tidies the output)
output/<name>.txt     frozen console output, as printed in the book. 339 files
figures/<name>.pdf    frozen figures. 91 files
data/                 the example data
pyfig/                the matplotlib scripts of the Ch 1-2 diagrams, and FIGURE-PROVENANCE.md
```

## Why the code and its output cannot drift apart

The book prints `R/snippets/<name>.R` **as a whole file**, and takes the output
it shows from `output/<name>.txt`, which was produced by running that same
file. Code and output come from one source, so nothing is retyped and nothing
can fall out of step. `R/build.R` is that freezing step, and `R/_freeze.R`
manages the random seed and the session.

The snippets run in order, **as though one R session ran through them all**: a
later snippet uses the objects an earlier one made. So running one file on its
own can fail with an object-not-found error. When that happens, run the
chapter's earlier snippets first — the order in `R/build.R` is that order.

## R packages

Most of it runs on base R; some chapters need these.

```r
install.packages(c("sasLM", "MASS", "survival", "nlme", "lattice", "psych", "nnet",
                   "car", "gmodels", "PropCIs", "KMsurv", "ggplot2", "ggsurvfit",
                   "dobson", "rgl"))
```

`mathr` is not on CRAN; install it from <https://github.com/ksbae/mathr>.

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

## Copyright and licence

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
