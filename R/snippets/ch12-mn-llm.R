LLm <- function(Beta) {   # -log likelihood of the multinomial
  b <- matrix(Beta, ncol = nyLevel - 1)
  Xb <- X %*% b
  LogLik <- sum(Y[, -1] * Xb) - sum(ni * log(1 + rowSums(exp(Xb))))
  -LogLik
}
