Sim <- function(a0, a1, b0, b1, x1min, x1max, x2min, x2max, nSim, sig1, sig2, rho) {
  x1 <- seq(x1min, x1max, length.out = nSim)
  x2 <- seq(x2min, x2max, length.out = nSim)
  xs <- cbind(x1, x2)
  ve1 <- sig1^2;  ve2 <- sig2^2
  coves <- rho * sig1 * sig2
  mCov <- matrix(c(ve1, coves, coves, ve2), ncol = 2)
  es <- MASS::mvrnorm(n = nSim, mu = c(0, 0), Sigma = mCov)
  ys <- cbind(a0 + a1*x1 + es[, 1], b0 + b1*x2 + es[, 2])
  vx1 <- (x1max - x1min)^2/12;  vx2 <- (x2max - x2min)^2/12
  covxs <- sqrt(vx1) * sqrt(vx2)
  vy1 <- a1^2*vx1 + ve1;  vy2 <- b1^2*vx2 + ve2
  covys <- a1*b1*covxs + coves
  corys <- covys / sqrt(vy1) / sqrt(vy2)
  list(corE = cor(es),  corEt = matrix(c(1, rho, rho, 1), ncol = 2),
       covX = var(xs),  covXt = matrix(c(vx1, covxs, covxs, vx2), ncol = 2),
       corX = cor(xs),  corXt = matrix(c(1, 1, 1, 1), ncol = 2),
       covY = var(ys),  covYt = matrix(c(vy1, covys, covys, vy2), ncol = 2),
       corY = cor(ys),  corYt = matrix(c(1, corys, corys, 1), ncol = 2))
}
