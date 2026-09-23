# =====================================================================
#  R/build.R  -  regenerate all frozen R output and figures
#  Run from the repository root:   Rscript R/build.R
#  Add one freeze(...) line per snippet as chapters are written.
# =====================================================================
if (!dir.exists("R/snippets"))
  stop("Run from the repository root (where R/snippets/ lives).")

dir.create("output",  showWarnings = FALSE)
dir.create("figures", showWarnings = FALSE)
source("R/_freeze.R")

message("Freezing R output/figures ...")

## ---- Chapter 2: Analysis of a Single Variable -------------------------------
new_session()
# continuous variable: descriptive statistics
freeze("ch02-summary")
freeze("ch02-varsd", digits = 4)
freeze("ch02-univ")
freeze("ch02-describe", digits = 4)
# continuous variable: plotting
freeze("ch02-ts-box",       fig = TRUE, fig.w = 6.2, fig.h = 3.3)
freeze("ch02-hist-density", fig = TRUE, fig.w = 6.2, fig.h = 3.3)
freeze("ch02-hist-overlay", fig = TRUE, fig.w = 5.0, fig.h = 3.3)
freeze("ch02-stem")
freeze("ch02-stripchart",   fig = TRUE, fig.w = 5.0, fig.h = 2.6)
freeze("ch02-violin",       fig = TRUE, fig.w = 3.0, fig.h = 2.4)   # size of the axis tick labels
# continuous variable: tabulation
freeze("ch02-cut-table")                          # defines lh2
freeze("ch02-barplot",      fig = TRUE, fig.w = 4.6, fig.h = 3.0)
freeze("ch02-lh3")                                # defines lh3
# continuous variable: inference
freeze("ch02-tsum0", digits = 4)
freeze("ch02-ttest")
# tests of normality
freeze("ch02-shapiro")
freeze("ch02-qqnorm",       fig = TRUE, fig.w = 6.2, fig.h = 3.4)
freeze("ch02-fitdistr")
freeze("ch02-fitdistr-recon")
# categorical variable
freeze("ch02-str-va")
freeze("ch02-table-cell")
freeze("ch02-crosstable")
freeze("ch02-plot-barplot", fig = TRUE, fig.w = 6.2, fig.h = 3.3)
freeze("ch02-pie",          fig = TRUE, fig.w = 4.2, fig.h = 3.6)
freeze("ch02-proptest")
freeze("ch02-lik-curve",    fig = TRUE, fig.w = 5.2, fig.h = 3.4)  # defines Lik; prints integrate
freeze("ch02-argmax")
freeze("ch02-nlminb")
# time variable
freeze("ch02-lifetab", digits = 4)                # defines tis, t1
freeze("ch02-tmed")                               # defines tmed
freeze("ch02-surv-hazard",  fig = TRUE, fig.w = 6.2, fig.h = 3.3)
freeze("ch02-survfit")                            # defines r3
freeze("ch02-km",           fig = TRUE, fig.w = 5.2, fig.h = 3.4)

## ---- Chapter 3: Probability (simulation; reproducible with a fixed seed) ----------
new_session()
freeze("ch03-ball",       fig = TRUE, fig.w = 2.5, fig.h = 3.8)   # size of the axis tick labels
freeze("ch03-electron",   fig = TRUE, fig.w = 2.5, fig.h = 3.0)   # size of the axis tick labels
freeze("ch03-complement")
freeze("ch03-bertrand1")                              # defines DistB, N, Radius
freeze("ch03-bertrand1-plot", fig = TRUE, fig.w = 6.2, fig.h = 3.2)
freeze("ch03-bertrand2")                              # defines Dist
freeze("ch03-bertrand2-plot", fig = TRUE, fig.w = 6.2, fig.h = 3.2)
freeze("ch03-bertrand3")                              # defines DistC, Dist1
freeze("ch03-bertrand3-plot", fig = TRUE, fig.w = 6.2, fig.h = 3.2)
freeze("ch03-even-theta",     fig = TRUE, fig.w = 4.2, fig.h = 4.2)
freeze("ch03-polar-cartesian", fig = TRUE, fig.w = 4.6, fig.h = 4.6)
freeze("ch03-gambler")                                # defines Res
freeze("ch03-gambler-hist",   fig = TRUE, fig.w = 4.8, fig.h = 3.0)
freeze("ch03-coupon")                                 # redefines Res
freeze("ch03-coupon-hist",    fig = TRUE, fig.w = 4.8, fig.h = 3.0)
freeze("ch03-coupon-theory")
freeze("ch03-montyhall")
freeze("ch03-fire-def")                               # defines Fire
freeze("ch03-fire-sim")                               # ~3 s; defines Res
freeze("ch03-fire-hist-time", fig = TRUE, fig.w = 4.8, fig.h = 3.0)
freeze("ch03-fire-hist-tree", fig = TRUE, fig.w = 4.8, fig.h = 3.0)
freeze("ch03-fire-scatter",   fig = TRUE, fig.w = 4.8, fig.h = 3.4)

## ---- Chapter 7: Comparing Two Groups ----------------------------------------
new_session()
freeze("ch07-ttest-basic")
freeze("ch07-ttest-manual")                       # defines t.val, Df, ci, ...
freeze("ch07-ttest-htest")                        # htest mimic (uses above)
freeze("ch07-grip-load")                          # defines d2 (vendored CSV)
freeze("ch07-grip-full")
freeze("ch07-grip-20")
freeze("ch07-grip-rand", seed = 1)                # sample() -> seed fixed
freeze("ch07-grip-sign")
freeze("ch07-lm-ttest")
freeze("ch07-aspirin-wald")                        # library(sasLM); RD/RR/OR
freeze("ch07-aspirin-prop")
freeze("ch07-aspirin-mn")
freeze("ch07-aspirin-score")
freeze("ch07-strata")
freeze("ch07-casecontrol")

## ---- Snippets of the former chapter 8, 'simple simulations' ---------
##  The chapter is gone and its sections were spread out: random numbers and
##  sampling distributions to the probability distributions chapter, the bootstrap
##  to the estimation chapter, ellipses, joint confidence regions and the
##  correlation simulation to the linear regression chapter, and the power
##  simulations to the sample size chapter.  The ids stay as they are, because
##  the book calls them by these names.
new_session()
freeze("ch08-chisq-setup")
freeze("ch08-chisq-gen")                           # defines mZ, rV
freeze("ch08-chisq-gen2")                          # defines rV2
freeze("ch08-chisq-theory")                        # defines x, y1, y2
freeze("ch08-chisq-plot", fig = TRUE, fig.w = 5.6, fig.h = 3.6)
freeze("ch08-chisq-mean1")
freeze("ch08-chisq-mean2")
freeze("ch08-chisq-fit")
freeze("ch08-boot-gen")                            # defines x, n1, sig1
freeze("ch08-boot-formula")                        # defines alpha1, mx
freeze("ch08-boot-run")                            # defines Res
freeze("ch08-boot-ci")                             # defines ci0
freeze("ch08-boot-reverse")
freeze("ch08-power-ttest1")
freeze("ch08-power-simt")                          # defines Sim.t
freeze("ch08-power-ptest")
freeze("ch08-power-fn")                            # defines Power.t
freeze("ch08-power-run1")
freeze("ch08-power-run2")
freeze("ch08-chisqpow")
freeze("ch08-ellipse1", fig = TRUE, fig.w = 4.2, fig.h = 4.2)   # library(mathr)
freeze("ch08-ellipse2", fig = TRUE, fig.w = 4.2, fig.h = 4.2)
freeze("ch08-ellipse3", fig = TRUE, fig.w = 4.2, fig.h = 4.2)
freeze("ch08-elliprange1")
freeze("ch08-elliprange2")
freeze("ch08-jcr1", fig = TRUE, fig.w = 4.4, fig.h = 4.4)       # defines mu0, mCov0, r1
freeze("ch08-jcr2", fig = TRUE, fig.w = 4.4, fig.h = 4.4, digits = 4)   # defines Data, mu, mCov
freeze("ch08-jcr-range", digits = 4)
freeze("ch08-cor-sim")                             # defines Sim
freeze("ch08-cor-sim-run", digits = 3)
freeze("ch08-cor-sim2")                            # defines Sim2
freeze("ch08-cor-sim2-run", digits = 3)
freeze("ch08-cor-sim3")                            # defines Sim3
freeze("ch08-cor-sim3-run", digits = 3)

## ---- Chapter 9: Design Matrices --------------------------------------------
new_session()
freeze("ch09-mm-age")                              # defines d1
freeze("ch09-mm-treat")                            # defines d2, x1
freeze("ch09-mm-treat-ni")                         # defines x0
freeze("ch09-solve")
freeze("ch09-modelmatrix")                         # library(sasLM); x2

## ---- Chapter 10: Linear Regression ------------------------------------------
new_session()
freeze("ch10-scatter",   fig = TRUE, fig.w = 4.6, fig.h = 3.4)   # defines x, y
freeze("ch10-lm1")
freeze("ch10-manual1")                             # hand reproduction (simple)
freeze("ch10-mlr-data")                            # y, x1, x2, d2
freeze("ch10-mlr-lm")
freeze("ch10-mlr-manual")                          # defines X, b, yhat, ...
freeze("ch10-anova")                               # uses y, yhat, b
freeze("ch10-diag",      fig = TRUE, fig.w = 5.6, fig.h = 6.6)   # pD(lm(hp~disp))

## ---- Chapter 11: Analysis of Variance ------------------------------------------
new_session()
freeze("ch11-css-intro")                           # library(sasLM); rx
freeze("ch11-g2sweep")                             # A
freeze("ch11-type3-demo")                          # d1; library(car); contr.sum
freeze("ch11-aov3")
freeze("ch11-alias")
freeze("ch11-type1")                               # d2 = CO2[-1,]
freeze("ch11-e1")                                  # x, ce1
freeze("ch11-e1-css")                              # rx
freeze("ch11-e1-intercept")
freeze("ch11-e2")                                  # ce2
freeze("ch11-e3")                                  # rx2, ce3
freeze("ch11-be-glm")
freeze("ch11-be-rantest")
freeze("ch11-be-ems")
freeze("ch11-be-adm")
freeze("ch11-be-pdiff")
freeze("ch11-be-gmr")

## ---- Chapter 12: Generalized Linear Models -----------------------------------
new_session()
freeze("ch12-setup")                               # dobson; doctors/beetle/Cars
freeze("ch12-pois-glm")                            # r1
freeze("ch12-pois-resid", digits = 4)
freeze("ch12-pois-X")                              # y, ni, sumlfacty, X
freeze("ch12-pois-llp")                            # LLp
freeze("ch12-pois-optim")                          # r2
freeze("ch12-pois-byhand")                         # uses X, r1
freeze("ch12-pois-interaction")                    # r4
freeze("ch12-bin-data")
freeze("ch12-bin-glm")                             # r5
freeze("ch12-bin-prep")                            # X, n, y, sumlogny (beetle)
freeze("ch12-bin-llb")                             # LLb
freeze("ch12-bin-optim")                           # r6
freeze("ch12-bin-byhand")
freeze("ch12-mn-cars")
freeze("ch12-mn-reshape")                          # d7
freeze("ch12-mn-prep")                             # Y, X, ni, nyLevel
freeze("ch12-mn-llm")                              # LLm
freeze("ch12-mn-nlm1", digits = 3)                 # r7
freeze("ch12-mn-nlm2", digits = 3)                 # r8 (X redefined)
freeze("ch12-mn-nnet")                             # nnet::multinom

## ---- Chapter 4: Random Variables --------------------------------------------
new_session()
freeze("ch04-binom", seed = 1)                    # E(X), V(X) by simulation
freeze("ch04-pmf",   seed = 1, fig = TRUE, fig.w = 5, fig.h = 3.0)

## ---- Chapter 6: Parameter Estimation and Hypothesis Testing -------------------------------
new_session()
freeze("ch06-binomtest")
freeze("ch06-var-ci", seed = 1)                   # rnorm(20); asymmetric variance CI

## ---- Chapter 5: Probability Distributions --------------------------------------------
new_session()
freeze("ch05-chisq-exp")                          # qchisq(p,2) == -2 log(1-p)
freeze("ch05-metaP")                              # Fisher's combined p-value
freeze("ch05-chisq-qnorm")                        # qnorm^2 vs qchisq identity
freeze("ch05-Flimit-q1", digits = 3)              # chi-square vs F, q = 1
freeze("ch05-Flimit-q2", digits = 4)              # chi-square vs F, q = 2

## ---- Chapter 13: Survival Analysis -------------------------------------------
new_session()
freeze("ch13-ovarian")
freeze("ch13-km-fit")                              # r1 = survfit(ovarian)
freeze("ch13-km-plot",   fig = TRUE, fig.w = 5.4, fig.h = 4.6)
freeze("ch13-logrank")
freeze("ch13-cox")                                 # r3 = coxph
freeze("ch13-coxzph")
freeze("ch13-km-tables")                           # s1, d0, d1, d2, n1=5, n2=7
freeze("ch13-km-byhand", digits = 5)               # d1 by hand
freeze("ch13-km-diff")                             # d2, difference CI
freeze("ch13-lr-data",   width = 88, digits = 5)   # d3, n1=n2=13
freeze("ch13-lr-eiv",    width = 96, digits = 4)   # Oi/Ei/Vi
freeze("ch13-lr-chisq")                            # r4 survdiff-class
freeze("ch13-cox-byhand")                          # r5 = optim
freeze("ch13-tte",       width = 84)               # source data/TTE.R
freeze("ch13-median-fit")                          # lung, r2 = survfit
freeze("ch13-median-plot", fig = TRUE, fig.w = 6.2, fig.h = 5.0)
freeze("ch13-median-ci")
freeze("ch13-gomp-data", width = 80)               # d1 = ExTTE.csv
freeze("ch13-gomp-fns")
freeze("ch13-gomp-mll")
freeze("ch13-gomp-nlminb")                         # r3 = nlminb, SE0
freeze("ch13-gomp-flexsurv")                       # r1 = flexsurvreg
freeze("ch13-gomp-summary")
freeze("ch13-gomp-plot",     fig = TRUE, fig.w = 5.9, fig.h = 2.5)   # size of the axis tick labels
freeze("ch13-gomp-sex")                            # r2 = flexsurvreg(~SEX)
freeze("ch13-gomp-sex-plot", fig = TRUE, fig.w = 6.4, fig.h = 3.4)

## ---- Chapter 14: Linear Mixed-Effects Models ---------------------------------
new_session()
freeze("ch14-lattice", fig = TRUE, fig.w = 6.6, fig.h = 7.4)   # require(nlme)
freeze("ch14-ids")                                 # IDs, nID
freeze("ch14-twostage", digits = 5)
freeze("ch14-lmlist")
freeze("ch14-ml-fit",        width = 84)           # Orth.ML
freeze("ch14-ml-intervals",  width = 84)
freeze("ch14-ml-apvar",      width = 88)
freeze("ch14-ml-varcov",     width = 84)
freeze("ch14-ml-ranef",      digits = 5)
freeze("ch14-ml-augpred", fig = TRUE, fig.w = 6.6, fig.h = 7.4)
freeze("ch14-ml-coef",       digits = 5)
freeze("ch14-reml-fit",      width = 84)           # Orth.REML
freeze("ch14-reml-varcov",   width = 84)
freeze("ch14-reml-augpred", fig = TRUE, fig.w = 6.6, fig.h = 7.4)
freeze("ch14-t3",            width = 84)           # sasLM T3test/aov3
freeze("ch14-anova",         width = 84)
# a user-defined ML objective function
freeze("ch14-cml-init")
freeze("ch14-cml-design")                          # Y, X, Z, nPar*
freeze("ch14-cml-indices")                         # ind, Vi, iVi, bi, Oi
freeze("ch14-cml-objml")                           # ObjML (no output)
freeze("ch14-cml-result",    width = 84)           # r1 = optim(ObjML)
freeze("ch14-cml-ic")
freeze("ch14-cml-re",        digits = 6)
freeze("ch14-cml-fe",        width = 84, digits = 5)
freeze("ch14-cml-sas",       width = 84, digits = 5)
freeze("ch14-cml-cibeta",    digits = 5)
freeze("ch14-cml-ciomega",   digits = 5)
freeze("ch14-cml-varcov",    digits = 5)
freeze("ch14-cml-icoef",     digits = 5)
# a user-defined REML objective function
freeze("ch14-creml-obj")                           # ObjREML (no output)
freeze("ch14-creml-result",  width = 84)           # r2 = optim(ObjREML)
freeze("ch14-creml-ic")
freeze("ch14-creml-re",      digits = 6)
freeze("ch14-creml-fe",      width = 84, digits = 5)
freeze("ch14-creml-varcov",  digits = 5)

## ---- Chapter 15: Nonlinear Regression (wnl) ----------------------------------
##  NOTE: this R install intermittently segfaults on trivial ops; if the
##  freeze dies mid-chapter, just re-run (the fit is deterministic).
new_session()
freeze("ch15-data",  fig = TRUE, fig.w = 5.2, fig.h = 3.4)   # require(wnl)
freeze("ch15-pcomp", fig = TRUE, fig.w = 4.2, fig.h = 3.2)   # wnl::pComp diagram
freeze("ch15-nlr",   width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)                             # r1 = nlr(fPK)
freeze("ch15-pprof", fig = TRUE, fig.w = 5.6, fig.h = 5.2)   # likelihood profile
freeze("ch15-dx",    fig = TRUE, fig.w = 6.2, fig.h = 3.4)   # diagnostics

## ---- Chapter 16: Nonlinear Mixed-Effects Models (nmw / NONMEM FO) --------------
##  Only the FO pipeline is executed (fast, deterministic).  FOCE (~2min)
##  and LAPL (~4min) plus the transform helpers are shown illustratively
##  (ch16-foce/-lapl/-transform/-objeta/-scalevar/-desclvar/-nmctl are NOT
##  frozen; displayed as code only via \rcode).
new_session()
freeze("ch16-lattice", fig = TRUE, fig.w = 6.4, fig.h = 5.0)  # require(lattice)
freeze("ch16-init-prep")                          # deriv FGD/H, PRED (session state)
freeze("ch16-init")                               # require(nmw); InitStep (invisible)
freeze("ch16-est",     width = 88, digits = 4)    # EstStep Final Estimates
freeze("ch16-cov",     width = 88, digits = 4)    # CovStep SE + eigenvalues
freeze("ch16-posthoc", width = 80, digits = 4)    # PostHocEta (EBE)
freeze("ch16-tab",     width = 88, digits = 4)    # TabStep, subject 1
freeze("ch16-ode",     width = 80, digits = 4)    # deSolve lsoda vs analytic
## ch16 supplement: NONMEM engine from scratch (FO frozen; FOCE-I/LAPL illustrative)
freeze("ch16b-setup")
freeze("ch16b-alpha")
freeze("ch16b-scale")
freeze("ch16b-descl", width = 76)
freeze("ch16b-util",  width = 76)
freeze("ch16b-pred")
freeze("ch16b-obj")
freeze("ch16b-est",   width = 84)
freeze("ch16b-cov",   width = 84, digits = 5)
freeze("ch16b-ebe",   width = 76, digits = 5)
freeze("ch16b-wres",  width = 80, digits = 4)
#  FOCE-I: the inner EBE search makes this take about 2.5 minutes.  Once frozen
#  the reader never has to run it again, and the numbers of the nmbox table in
#  the text can be checked against the output (2026-09-20).
freeze("ch16b-focei-objeta")                      # defines ObjEta (no output)
freeze("ch16b-focei-obj1",  width = 84)           # OBJ1 + the fit (~2.5 min)
# ch16b-lapli-* are illustrative-only (not frozen): the shown OBJ2 block is a
# fragment, not a runnable function.

## ---- Chapter 17: Dose-Response Analysis ---------------------
##  IMPORTANT: the wnl/nmw-heavy examples segfault when many nlr() fits
##  run in ONE process (memory-fragile).  For a clean regeneration, run
##  each new_session() group below as a SEPARATE Rscript invocation
##  (with a retry loop), not the whole build.R in one process.
##  Data (r.acr.kr/MFDS) vendored to data/.  wnl 0.8.5, nmw 0.3.1.
new_session()                                      # G1: logistic + Cochran-Armitage
freeze("ch17-logit-dose")
freeze("ch17-logit-dose-plot",   fig = TRUE, fig.w = 5.0, fig.h = 3.4)
freeze("ch17-logit-dose-jitter", fig = TRUE, fig.w = 5.0, fig.h = 3.4, seed = 1)
freeze("ch17-logit-auc")
freeze("ch17-logit-auc-plot",    fig = TRUE, fig.w = 5.0, fig.h = 3.4)
freeze("ch17-ca", width = 84)
freeze("ch17-ca-cmh", width = 84)
freeze("ch17-ca-logit", width = 84)

new_session()                                      # G2: MTD Bayesian (seed inside ch17-mtd-mc)
freeze("ch17-mtd-grid", width = 84)
freeze("ch17-mtd-norm", width = 84)
freeze("ch17-mtd-marg",  fig = TRUE, fig.w = 5.2, fig.h = 6.4)
freeze("ch17-mtd-joint", fig = TRUE, fig.w = 6.2, fig.h = 3.4)
freeze("ch17-mtd-mc", width = 84)
freeze("ch17-mtd-dens",  fig = TRUE, fig.w = 3.7, fig.h = 5.0)   # size of the axis tick labels
freeze("ch17-mtd-hist",  fig = TRUE, fig.w = 5.4, fig.h = 3.4)
freeze("ch17-mtd-curves", fig = TRUE, fig.w = 5.4, fig.h = 4.6)

new_session()                                      # G3: survival
freeze("ch17-surv-trt", width = 84)
freeze("ch17-surv-trt-plot",  fig = TRUE, fig.w = 5.4, fig.h = 4.4)
freeze("ch17-surv-trt-tests", width = 84)
freeze("ch17-surv-q", width = 84)
freeze("ch17-surv-q-plot",    fig = TRUE, fig.w = 5.4, fig.h = 4.4)
freeze("ch17-surv-q-tests", width = 84)

new_session()                                      # G4: bax ANOVA/ANCOVA (sasLM)
freeze("ch17-bax-load", width = 84)
freeze("ch17-bax-plot", fig = TRUE, fig.w = 4.6, fig.h = 3.3)
freeze("ch17-bax-tsum", width = 84)
freeze("ch17-bax-aov", width = 84)
freeze("ch17-bax-lsm", width = 84)
freeze("ch17-bax-pdiff", fig = TRUE, fig.w = 5.2, fig.h = 4.4, width = 84)
freeze("ch17-bax-ancova", width = 84)
freeze("ch17-bax-ancova-lsm", width = 84)
freeze("ch17-bax-ancova-pdiff", fig = TRUE, fig.w = 5.2, fig.h = 4.4, width = 84)

new_session()                                      # G5: bax Sigmoid Emax (wnl + LBI)
freeze("ch17-bax-load")                            # reload d6
freeze("ch17-bax-emax-full", width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)
freeze("ch17-bax-emax-red",  width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)
freeze("ch17-bax-emax-lrt",  width = 84)
freeze("ch17-bax-emax-prof", fig = TRUE, fig.w = 5.6, fig.h = 5.4)
freeze("ch17-bax-emax-dx",   fig = TRUE, fig.w = 6.2, fig.h = 3.4)

new_session()                                      # G6: continuous DoseRes Emax (wnl)
freeze("ch17-doseres-load", width = 84)
freeze("ch17-doseres-plot", fig = TRUE, fig.w = 6.2, fig.h = 3.2)
freeze("ch17-doseres-fit",  width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)
freeze("ch17-doseres-prof", fig = TRUE, fig.w = 5.0, fig.h = 4.6)
freeze("ch17-doseres-dx",   fig = TRUE, fig.w = 6.2, fig.h = 3.4)

## G7: conc-effect covariate (wnl) - SPLIT into <=3 fits/process to avoid
##     segfaults.  require(wnl) must be loaded before the fit snippets that
##     lack it (ch17-ce-full/-err); load it in the driver, e.g.
##     source("R/_freeze.R"); suppressMessages(require(wnl)); new_session()
new_session()
freeze("ch17-ce-load")
freeze("ch17-ce-pooled", width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)               # require(wnl) here
freeze("ch17-ce-trt1", width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)
freeze("ch17-ce-trt0", width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)
freeze("ch17-ce-full", width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)                 # (needs wnl already loaded)
freeze("ch17-ce-red",  width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)
freeze("ch17-ce-prof", fig = TRUE, fig.w = 5.6, fig.h = 5.4)
freeze("ch17-ce-dx",   fig = TRUE, fig.w = 6.2, fig.h = 3.4)
freeze("ch17-ce-lrt",  width = 84)
freeze("ch17-ce-frepro", width = 84)
freeze("ch17-ce-cmpchi", width = 84)
freeze("ch17-ce-err", width = 84, trim = c("Cov", "run", "Prediction", "Residual"), drop = "Elapsed Time", squeeze = TRUE)
# (the population-model example of 17.9 was dropped: it duplicated the nmw
#  scaffolding of ch16, 2026-07-04)

## ---- Sample size and power (ch-samplesize) - base R stats, deterministic ------
new_session()
freeze("ss-mean")                                  # power.t.test (continuous)
freeze("ss-mean-hand")                             # reproduces the normal-approximation formula
freeze("ss-prop")                                  # power.prop.test (binary)
freeze("ss-ni")                                    # the non-inferiority margin formula
freeze("ss-surv")                                  # Schoenfeld number of events (survival)
freeze("ss-dropout")                               # adjustment for dropout

## ---- Clinical trial simulation (ch-ctsim) - base R, deterministic --------
new_session()
freeze("ctsim-one")                                # defines simTrial() + one trial
freeze("ctsim-oc")                                 # defines oper(); the type I error rate
freeze("ctsim-peek")                               # error inflation of an unadjusted interim analysis
freeze("ctsim-power")                              # power against power.t.test (verification)
freeze("ctsim-ss", fig = TRUE, fig.w = 5.2, fig.h = 3.4)   # the sample size curve
freeze("ctsim-dropout")                            # power with dropout
freeze("ctsim-binary")                             # power for a binary outcome
freeze("ctsim-assurance")                          # Go/No-Go, assurance

## ---- Bioequivalence (ch-be) - sasLM BEdata + sample size by simulation ----
new_session()
freeze("be-data", width = 84)                      # library(sasLM); the structure of BEdata
freeze("be-ci")                                    # GMR 90% CI + the equivalence decision
freeze("be-ss-sim")                                # beSim(): the sample size by simulation
freeze("be-ss-curve", fig = TRUE, fig.w = 5.2, fig.h = 3.4)   # the power curve

## ---- Appendix A (R intro/install) & B (R basics) -------------------
new_session()
freeze("appA-eqtest",  width = 84)                 # floating-point equality
freeze("appB-bracket", width = 84)                 # `[` is a function
freeze("appB-operator", width = 84, seed = 1)      # user-defined %^% (rnorm)
freeze("appB-machine", width = 84)                 # .Machine, double.eps
freeze("appB-merge",   width = 84)                 # join variants
freeze("appB-reshape", width = 84)                 # wide <-> long
# appA-rprofile/-sessioninfo/-methods are illustrative-only (not frozen).

## ---- Appendix C (R Markdown) & D (Meta-analysis) ------------------
new_session()
freeze("appC-plot", fig = TRUE, fig.w = 5.0, fig.h = 3.6)   # mtcars plot
new_session()                                       # E: meta + sasLM
freeze("appD-metabin", width = 84)                 # meta::metabin
freeze("appD-rr", width = 84)                       # sasLM::RR, log
freeze("appD-fixed", width = 84)                    # MH/IV weights, fixed effect
freeze("appD-hetero", width = 84)                   # Q, p-value
freeze("appD-random", width = 84)                   # tau^2, random effect
freeze("appD-funcs", width = 84)                    # metaRR() wrapper
# Appendix E (Sim/List) is illustrative-only (eval=F results), not frozen.

## ---- Chapters 1-2 (overview / quantitative decision making under uncertainty) -----------
new_session()
freeze("qdm-xyz", seed = 1, fig = TRUE, fig.w = 6.0, fig.h = 2.3)  # trivariate normal: two positive and one negative correlation
new_session()
freeze("qdm-anscombe", digits = 4)                 # summary statistics of Anscombe's quartet
new_session()
freeze("qdm-li", digits = 5)                       # binomial 1/15 likelihood interval against the Wald CI
new_session()
freeze("qdm-logp", digits = 4)                     # LogP against oral bioavailability (data/LogP-F.csv)
# The other 22 figures of chapters 1-2 are generated in Python: see pyfig/.

message("Done.")
