Power.t <- function(mu1, mu2, sig1, sig2, n1, n2, N = 2000) {
  Res <- rep(NA, N)
  for (i in 1:N) {
    x1 <- rnorm(n1, mu1, sig1)
    x2 <- rnorm(n2, mu2, sig2)
    Res[i] <- t.test(x1, x2)$p.value
  }
  sum(Res < 0.05) / N
}
