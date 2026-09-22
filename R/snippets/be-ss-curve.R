# BE power curve against the total number of subjects N (CV = 25%, GMR = 0.95)
Ns <- seq(16, 44, by = 2)
pw <- sapply(Ns, beSim)
plot(Ns, pw, type = "b", pch = 19, ylim = c(0, 1),
     xlab = "Total number of subjects N", ylab = "BE power",
     main = "CV = 25%, GMR = 0.95")
abline(h = 0.8, lty = 2)
Ns[which(pw >= 0.8)[1]]                      # first N reaching 80%
