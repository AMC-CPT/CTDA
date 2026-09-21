r6 <- optim(c(-1, 1), LLb, method = "L-BFGS-B", hessian = TRUE);  r6
-r6$value                          # log likelihood
Vcov0 <- solve(r6$hessian);  SE0 <- sqrt(diag(Vcov0))
r6$par / SE0                       # Wald 통계량
