ovarian$Z <- ovarian$rx - 1
mLL <- function(b) {                     # Kim JH, p.143
  Div <- vector(length = nrow(ovarian))
  for (i in 1:nrow(ovarian))
    Div[i] <- sum(exp(ovarian[ovarian$futime >= ovarian[i, "futime"], "Z"] * b))
  -sum(ovarian$fustat * (ovarian$Z * b - log(Div)))
}
r5 <- optim(0, mLL, method = "L-BFGS-B", hessian = TRUE);  r5
se5 <- sqrt(diag(solve(r5$hessian)))
ci5a <- r5$par + c(-1, 1) * qnorm(1 - 0.05/2) * se5
c('exp(coef)' = exp(r5$par), lower = exp(ci5a[1]), upper = exp(ci5a[2]))
