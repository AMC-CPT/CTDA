require(flexsurv)
r1 <- flexsurvreg(Surv(TIME, DV) ~ 1, data = d1, dist = "gompertz");  r1
