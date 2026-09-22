# power falls when each enrolled subject drops out at random (no data) with prob. pdrop
simDrop <- function(n, delta, pdrop = 0.15) {
  x <- rnorm(n, 0,     1)[runif(n) > pdrop]   # remaining controls
  y <- rnorm(n, delta, 1)[runif(n) > pdrop]   # remaining active arm
  t.test(x, y)$p.value
}
mean(replicate(10000, simDrop(64, delta = 0.5)) < 0.05)   # power with dropout
