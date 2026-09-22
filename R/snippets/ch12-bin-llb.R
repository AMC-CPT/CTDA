LLb <- function(b) {   # -log likelihood of the binomial
  Xb <- X %*% b
  LogLik <- sum(y * Xb - n * log(1 + exp(Xb))) + sumlogny
  -LogLik
}
