r7 <- nlm(LLm, c(-1, -1, 1, 1, -1, -1, 1, 1), hessian = TRUE)
COV2 <- solve(r7$hessian);  SE2 <- sqrt(diag(COV2))
data.frame(PE = r7$estimate, SE = SE2,
           expBeta = exp(r7$estimate),
           expLL = exp(r7$estimate - 1.96*SE2),
           expUL = exp(r7$estimate + 1.96*SE2))
