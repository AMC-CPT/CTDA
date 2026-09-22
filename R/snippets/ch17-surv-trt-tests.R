survdiff(Surv(y, Status) ~ x, d3)                 # log-rank test
r3b <- coxph(Surv(y, Status) ~ x, d3);  summary(r3b)   # Cox proportional hazards
cox.zph(r3b)                                      # PH assumption holds (p > 0.05)
r3c <- survreg(Surv(y, Status) ~ x, d3, dist = "exponential");  summary(r3c)
