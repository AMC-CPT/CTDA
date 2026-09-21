LLb <- function(b) {   # 이항 분포의 -log likelihood
  Xb <- X %*% b
  LogLik <- sum(y * Xb - n * log(1 + exp(Xb))) + sumlogny
  -LogLik
}
