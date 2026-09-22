Power.chisq <- function(n, p1, p2, N = 10000, alpha = 0.05) {
  Res <- rep(NA, N)
  for (i in 1:N) {
    n11 <- rbinom(1, n, p1);  n12 <- n - n11
    n21 <- rbinom(1, n, p2);  n22 <- n - n21
    A <- matrix(c(n11, n12, n21, n22), ncol = 2, byrow = TRUE)
    if (any(A < 5)) Res[i] <- fisher.test(A)$p.value
    else            Res[i] <- chisq.test(A)$p.value
  }
  mean(Res < alpha)
}
Power.chisq(44, 0.5, 0.2)   # about 0.8
