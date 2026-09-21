Sim3 <- function(b0, b1, x1min, x1max, nSim, sig1, sig2) {
  x1 <- seq(x1min, x1max, length.out = nSim)
  e1 <- rnorm(n = nSim, mean = 0, sd = sig1)
  x2 <- x1 + e1
  e2 <- rnorm(n = nSim, mean = 0, sd = sig2)
  y1 <- b0 + b1*(x1 + e1) + e2
  ve1 <- sig1^2;  ve2 <- sig2^2
  vx1 <- (x1max - x1min)^2/12;  vx2 <- vx1 + ve1
  vy1 <- b1^2*vx1 + b1^2*ve1 + ve2
  cx1x2 <- vx1;  cx1y <- b1*vx1;  cx2y <- b1*vx1 + b1*ve1
  ce1y <- b1*ve1;  ce2y <- ve2
  r1 <- summary(lm(y1 ~ x2))
  d1 <- cbind(y1, x1, x2, e1, e2)
  m1 <- matrix(c(vy1, cx1y, cx2y, ce1y, ce2y,
                 cx1y, vx1, cx1x2, 0, 0,
                 cx2y, cx1x2, vx2, ve1, 0,
                 ce1y, 0, ve1, ve1, 0,
                 ce2y, 0, 0, 0, ve2), ncol = 5)
  list(coveXY = var(d1), coveXYt = m1,
       coreXY = cor(d1), coreXYt = cov2cor(m1),
       r = sqrt(r1$r.squared))
}
