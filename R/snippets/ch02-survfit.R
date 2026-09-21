library(MASS)      # VA dataset
library(survival)  # survfit, Surv
r3 <- survfit(Surv(stime, status == 1) ~ 1, VA)
r3
