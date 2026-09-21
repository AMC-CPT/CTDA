N     <- 2000
Nboot <- 2000
nMax  <- 456
nSamp <- 20
Res2 <- matrix(ncol = 2, nrow = N)
for (i in 1:N) {
  d1 <- sample(nMax, nSamp)
  ResBoot1 <- rep(NA, Nboot)
  ResBoot2 <- ResBoot1
  for (j in 1:Nboot) {
    b1 <- sample(d1, nSamp, replace = TRUE)
    ResBoot1[j] <- 2 * mean(b1) - 1
    ResBoot2[j] <- max(b1) * (nSamp + 1) / nSamp
  }
  ci3 <- quantile(ResBoot1, c(0.025, 0.975))
  ci4 <- quantile(ResBoot2, c(0.025, 0.975))
  Res2[i, 1] <- ifelse(ci3[1] <= nMax & ci3[2] >= nMax, TRUE, FALSE)
  Res2[i, 2] <- ifelse(ci4[1] <= nMax & ci4[2] >= nMax, TRUE, FALSE)
}
colMeans(Res2)   # coverage 0.9335 0.6135
