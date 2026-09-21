lung <- sasLM::af(lung, c("sex", "inst"))
r2 <- survfit(Surv(time, status == 2) ~ sex, lung)
