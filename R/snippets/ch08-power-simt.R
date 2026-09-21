Sim.t <- function(mu1, mu2, sig1, sig2, n1, n2) {
  x1 <- rnorm(n1, mu1, sig1)
  x2 <- rnorm(n2, mu2, sig2)
  t.test(x1, x2)$p.value
}
Sim.t(10, 12, 2, 2, 10, 10)
