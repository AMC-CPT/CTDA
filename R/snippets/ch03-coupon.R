k <- 100    # 카드 종류
N <- 1000   # 시뮬레이션 횟수
Res <- rep(NA, N)
for (i in 1:N) {
  nCard <- rep(0, k)   # 0: 없음, 1: 있음
  nT <- 0
  while (sum(nCard) < k) {
    nCard[sample(k, 1)] <- 1
    nT <- nT + 1
  }
  Res[i] <- nT
}
mean(Res)
summary(Res)
