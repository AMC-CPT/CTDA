r1 <- survfit(Surv(futime, fustat) ~ rx, ovarian);  summary(r1)
