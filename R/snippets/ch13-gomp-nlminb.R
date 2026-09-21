r3 <- nlminb(c(0.01, 0.01), mll);  r3
require(numDeriv)
H0 <- hessian(mll, r3$par)
SE0 <- sqrt(diag(solve(H0)));  SE0      # nlminb는 Hessian을 주지 않음
