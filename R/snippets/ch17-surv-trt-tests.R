survdiff(Surv(y, Status) ~ x, d3)                 # 로그순위 검정
r3b <- coxph(Surv(y, Status) ~ x, d3);  summary(r3b)   # Cox 비례위험
cox.zph(r3b)                                      # 비례위험 가정 (p > 0.05)
r3c <- survreg(Surv(y, Status) ~ x, d3, dist = "exponential");  summary(r3c)
