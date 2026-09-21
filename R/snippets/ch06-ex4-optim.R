fx <- function(Theta) -log(prod(dnorm(x, mean = Theta[1], sd = Theta[2])))
r1 <- optim(c(8, 1), fx, method = "BFGS", hessian = TRUE);  r1
r1$par                            # 점추정
r1$value                          # -log likelihood
exp(-r1$value)                    # likelihood
sqrt(diag(solve(r1$hessian)))     # standard error
