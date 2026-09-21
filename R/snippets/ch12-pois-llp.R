LLp <- function(Beta) {   # 포아송 분포의 -log likelihood
  LogLam <- log(ni) + X %*% Beta
  LogLik <- sum(y * LogLam - exp(LogLam)) - sumlfacty
  -LogLik
}
