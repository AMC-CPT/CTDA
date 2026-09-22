k <- 100    # kinds of card
N <- 1000   # number of simulations
Res <- rep(NA, N)
for (i in 1:N) {
  nCard <- rep(0, k)   # 0: not yet, 1: collected
  nT <- 0
  while (sum(nCard) < k) {
    nCard[sample(k, 1)] <- 1
    nT <- nT + 1
  }
  Res[i] <- nT
}
mean(Res)
summary(Res)
