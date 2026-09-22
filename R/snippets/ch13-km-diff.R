# SE of the difference in survival and Wald 95% CI (independent samples)
pe1 <- d1[n1, "surv"]
d2$surv <- cumprod(1 - d2$n.event / d2$n.risk)
d2.se <- sqrt(cumsum(d2$n.event / (d2$n.risk * (d2$n.risk - d2$n.event))))
d2$se <- d2$surv * d2.se
pe2 <- d2[n2, "surv"]
pe3 <- pe1 - pe2
se3 <- sqrt(d1[n1, "se"]^2 + d2[n2, "se"]^2)
ci3 <- pe3 + c(-1, 1) * qnorm(0.975) * se3
c(PE = pe3, LL = ci3[1], UL = ci3[2]) * 100   # percent; includes 0 -> NS
