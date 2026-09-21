d1$surv <- cumprod(1 - d1$n.event / d1$n.risk)              # 누적 생존율
d1.se <- sqrt(cumsum(d1$n.event / (d1$n.risk * (d1$n.risk - d1$n.event))))
d1$se <- d1$surv * d1.se                                    # Greenwood formula
d1$ll <- pmax(0, exp(log(d1$surv) + qnorm(0.025) * d1.se))
d1$ul <- pmin(1, exp(log(d1$surv) + qnorm(0.975) * d1.se))
d1
cbind(d0, data.frame(surv = s1$surv, std.err = s1$std.err,
      lower = s1$lower, upper = s1$upper))[(n2 + 1):(n2 + n1), ]   # survfit 결과와 동일
