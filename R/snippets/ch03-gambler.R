p  <- 18/38   # 이길 확률
m0 <- 5       # 시작 금액
m1 <- 10      # 목표 금액
N  <- 1000    # 시뮬레이션 횟수
Res <- data.frame(n = rep(NA, N), Result = rep(NA, N))
for (i in 1:N) {
  cM <- m0   # 현재 금액
  cT <- 0    # 게임 횟수
  while ((cM > 0) & (cM < m1)) {
    cM <- ifelse(runif(1) < p, cM + 1, cM - 1)
    cT <- cT + 1
  }
  Res[i, "n"] <- cT
  Res[i, "Result"] <- ifelse(cM == 0, "Bankrupt", "Earn")
}
mean(Res[, "n"])
sum(Res[, "Result"] == "Bankrupt") / N
