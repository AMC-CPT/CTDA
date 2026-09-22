# The squared upper 2.5% normal quantile equals the upper 5% quantile of chi-square(1).
c(qnorm(1 - 0.05/2)^2, qchisq(1 - 0.05, 1))
