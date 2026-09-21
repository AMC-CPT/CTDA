survdiff(Surv(y, Status) ~ x, d4)                 # 로그순위 검정
r4b <- coxph(Surv(y, Status) ~ x, d4);  summary(r4b)   # Cox 비례위험
cox.zph(r4b)                                      # p > 0.05
r4c <- survreg(Surv(y, Status) ~ x, d4, dist = "exponential");  summary(r4c)
