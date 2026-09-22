# binary outcome: response rate p1 vs p2, n per arm, power of the chi-square test
simBin <- function(n, p1, p2) {
  x1 <- rbinom(1, n, p1);  x2 <- rbinom(1, n, p2)
  suppressWarnings(prop.test(c(x1, x2), c(n, n))$p.value)
}
mean(replicate(10000, simBin(80, 0.30, 0.50)) < 0.05)     # 30% vs 50%, 80 per arm
