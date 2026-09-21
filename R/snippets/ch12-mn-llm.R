LLm <- function(Beta) {   # 다항 분포의 -log likelihood
  b <- matrix(Beta, ncol = nyLevel - 1)
  Xb <- X %*% b
  LogLik <- sum(Y[, -1] * Xb) - sum(ni * log(1 + rowSums(exp(Xb))))
  -LogLik
}
