d4 <- read.csv("data/Surv-Quartile.csv")
require(survival)
r4 <- survfit(Surv(y, Status) ~ x, d4)
summary(r4)
