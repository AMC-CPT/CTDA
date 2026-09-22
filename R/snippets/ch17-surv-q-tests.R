survdiff(Surv(y, Status) ~ x, d4)                 # log-rank test
r4b <- coxph(Surv(y, Status) ~ x, d4);  summary(r4b)   # Cox proportional hazards
cox.zph(r4b)                                      # p > 0.05
r4c <- survreg(Surv(y, Status) ~ x, d4, dist = "exponential");  summary(r4c)
