simAUC <- function(AUC0 = 100, Mult = 2, CV = 50, n = 6, N = 2000) {
  Res <- matrix(nrow = N, ncol = 4)
  logMu0 <- log(AUC0);  logMu1 <- log(AUC0*Mult)
  logSD0 <- sqrt(log((CV/100)^2 + 1))   # original CV -> log-scale sigma
  logSD1 <- logSD0
  for (i in 1:N) {
    r1 <- rnorm(n, logMu0, logSD0)
    r2 <- rnorm(n, logMu1, logSD1)
    Res[i, 1] <- mean(exp(r1));  Res[i, 2] <- mean(exp(r2))   # arithmetic means
    Res[i, 3] <- exp(mean(r1));  Res[i, 4] <- exp(mean(r2))   # geometric means
  }
  c(sum(Res[, 1] > Res[, 2])/N, sum(Res[, 3] > Res[, 4])/N)
}
simAUC();  simAUC(Mult = 1.5);  simAUC(Mult = 1.33)
