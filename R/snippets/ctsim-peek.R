# test halfway and at the end; reject if either is significant (no boundary adjustment)
simPeek <- function(n, delta = 0) {
  x <- rnorm(n, 0, 1);  y <- rnorm(n, delta, 1)
  h  <- n %/% 2                                # interim analysis point (half)
  p1 <- t.test(x[1:h], y[1:h])$p.value         # first half of the data
  p2 <- t.test(x,      y)$p.value              # all the data
  (p1 < 0.05) | (p2 < 0.05)
}
mean(replicate(10000, simPeek(64)))            # inflated type I error rate
