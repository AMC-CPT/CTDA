X <- model.matrix(~ sexN + ageN, d7)   # age 를 연속형으로
r8 <- nlm(LLm, c(-1, -1, 1, -1, -1, 1), hessian = TRUE)
COV4 <- solve(r8$hessian);  SE4 <- sqrt(diag(COV4))
data.frame(PE = r8$estimate, SE = SE4,
           expBeta = exp(r8$estimate),
           expLL = exp(r8$estimate - 1.96*SE4),
           expUL = exp(r8$estimate + 1.96*SE4))
