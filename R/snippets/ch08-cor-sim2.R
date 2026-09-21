Sim2 <- function(a0, a1, x1min, x1max, nSim, sig1) {
  x1 <- seq(x1min, x1max, length.out = nSim)
  e1 <- rnorm(n = nSim, mean = 0, sd = sig1)
  y1 <- a0 + a1*x1 + e1
  ve1 <- sig1^2
  vx1 <- (x1max - x1min)^2/12
  vy1 <- a1^2*vx1 + ve1
  r1 <- summary(lm(y1 ~ x1))
  d1 <- cbind(e1, x1, y1)
  covex <- 0;  covey <- ve1;  covxy <- a1*vx1
  m1 <- matrix(c(ve1, covex, covey, covex, vx1, covxy, covey, covxy, vy1), ncol = 3)
  list(coveXY = var(d1), coveXYt = m1,
       coreXY = cor(d1), coreXYt = cov2cor(m1),
       rx = r1, r = sqrt(r1$r.squared))
}
