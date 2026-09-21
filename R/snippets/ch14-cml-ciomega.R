vPE <- r1$par;  Var <- solve(r1$hessian)
vB  <- qnorm(1 - alpha/2)*sqrt(diag(Var))
vLL <- exp(vPE[1:2] - vB[1:2]);  vUL <- exp(vPE[1:2] + vB[1:2])
rhoLL <- (exp(vPE[3] - vB[3]) - 1)/(exp(vPE[3] - vB[3]) + 1)
rhoUL <- (exp(vPE[3] + vB[3]) - 1)/(exp(vPE[3] + vB[3]) + 1)
CIomega <- cbind(c(vLL, rhoLL), c(SDs[1:2], rho), c(vUL, rhoUL))
rownames(CIomega) <- c("sd((Intercept))", "sd(age)", "cor((Intercept),age)")
colnames(CIomega) <- c("lower", "est.", "upper");  CIomega
CIsigma <- SDs[3]*exp(c(-1, 0, 1)*vB[4])
names(CIsigma) <- c("lower", "est.", "upper");  CIsigma
