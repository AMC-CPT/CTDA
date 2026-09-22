# standard 2x2 crossover BE model: sequence SEQ, subject SUBJ (nested in SEQ),
# period PRD, formulation TRT
# (for the ANOVA machinery, Type 3 SS, error terms and EMS, see the ANOVA chapter)
ci <- exp(PDIFF(log(CMAX) ~ SEQ/SUBJ + PRD + TRT, BEdata, "TRT",
                conf.level = 0.90, rev = TRUE)[1:3])
names(ci) <- c("GMR", "lower", "upper")
round(ci, 4)
# average bioequivalence decision: does the 90% CI lie entirely within [0.80, 1.25]?
c(BE = unname((ci["lower"] > 0.80) & (ci["upper"] < 1.25)))
