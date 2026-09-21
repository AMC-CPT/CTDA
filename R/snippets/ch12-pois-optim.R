r2 <- optim(c(1, 1, 1, 1), LLp, method = "L-BFGS-B", hessian = TRUE);  r2
COV2 <- solve(r2$hessian);  SE2 <- sqrt(diag(COV2));  SE2
