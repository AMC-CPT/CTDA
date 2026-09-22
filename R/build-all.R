# =====================================================================
#  R/build-all.R  -  remake everything, chapter 17 included
#
#      Rscript R/build-all.R
#
#  R/build.R freezes every snippet in one R process.  That works for every
#  chapter but 17: the dose-response examples fit many nonlinear models with
#  wnl::nlr, and run one after another in a single process they fail in eigen()
#  with "infinite or missing values in 'x'".  Chapter 11 also sets
#  options(contrasts = c("contr.sum", "contr.poly")) for its Type III examples,
#  and that setting outlives the chapter, so the Cox models of chapter 17 would
#  come out in sum coding instead of the treatment coding the book prints.
#
#  This script therefore freezes everything except chapter 17 in one pass and
#  then runs chapter 17 one group at a time, each in a fresh Rscript process.
#  A fresh process starts with R's own contrasts and with the memory the fits
#  need, which settles both problems.  The groups are the new_session() groups
#  of R/build.R.
#
#  R/build.R on its own is still the way to remake a single chapter; the
#  ctda.only option below selects any subset by a regular expression.
# =====================================================================
if (!dir.exists("R/snippets"))
  stop("Run from the repository root (where R/snippets/ lives).")

CH17_GROUPS <- c("^ch17-(logit|ca)",
                 "^ch17-mtd",
                 "^ch17-surv",
                 "^ch17-bax-(load|plot|tsum|aov|lsm|pdiff|ancova)",
                 "^ch17-bax-(load|emax)",
                 "^ch17-doseres",
                 "^ch17-ce")

args <- commandArgs(trailingOnly = TRUE)
if (length(args)) {
  #  called by the loop below: freeze one group of chapter 17
  i <- as.integer(args[1])
  options(ctda.only = CH17_GROUPS[i])
  source("R/build.R")
} else {
  options(ctda.skip = "^ch17-")
  source("R/build.R")

  RSCRIPT <- file.path(R.home("bin"), "Rscript")
  for (i in seq_along(CH17_GROUPS)) {
    message(sprintf("Chapter 17 group %d/%d  %s  (separate process) ...",
                    i, length(CH17_GROUPS), CH17_GROUPS[i]))
    st <- system2(RSCRIPT, c("R/build-all.R", i))
    if (!identical(as.integer(st), 0L))
      message("  group ", i, " ended with status ", st)
  }
  message("Done (chapter 17 groups included).")
}
