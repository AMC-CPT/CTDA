d3 <- read.csv("data/Surv-Trt.csv")
require(survival)
r3 <- survfit(Surv(y, Status) ~ x, d3)
summary(r3)
