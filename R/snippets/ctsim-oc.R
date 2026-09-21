# nsim 건의 시험을 반복하여 '성공(p<0.05)' 비율과 그 몬테카를로 표준오차를 구한다
oper <- function(nsim, n1, n2 = n1, delta, sd1 = 1, sd2 = sd1) {
  p      <- replicate(nsim, simTrial(n1, n2, delta, sd1, sd2))
  reject <- mean(p < 0.05)                      # 성공(기각) 비율
  mcse   <- sqrt(reject * (1 - reject) / nsim)  # 몬테카를로 표준오차
  c(reject = reject, mcse = mcse)
}
oper(nsim = 10000, n1 = 64, delta = 0)          # 진실이 귀무가설: 제1종 오류율
