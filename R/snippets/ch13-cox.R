r3 <- coxph(Surv(futime, fustat) ~ rx, ovarian);  summary(r3)
