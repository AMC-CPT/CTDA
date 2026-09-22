LLp <- function(Beta) {   # -log likelihood of the Poisson
  LogLam <- log(ni) + X %*% Beta
  LogLik <- sum(y * LogLam - exp(LogLam)) - sumlfacty
  -LogLik
}
