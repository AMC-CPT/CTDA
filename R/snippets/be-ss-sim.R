# 2x2 교차설계 BE 표본크기: 개체내 CV로부터 검정력을 시뮬레이션(90% CI ⊂ [0.8,1.25])
beSim <- function(N, GMR = 0.95, CV = 0.25, nsim = 3000) {
  sw <- sqrt(log(1 + CV^2))                # 로그척도 개체내 표준편차
  d  <- log(GMR)
  pass <- replicate(nsim, {
    di <- rnorm(N, d, sqrt(2) * sw)         # 개체별 (logT - logR)
    m  <- mean(di);  se <- sd(di) / sqrt(N)
    tc <- qt(0.95, N - 2)                   # 90% CI 임계값 (df = N-2)
    (exp(m - tc * se) > 0.80) & (exp(m + tc * se) < 1.25)
  })
  mean(pass)
}
N <- c(20, 24, 28, 32, 36, 40)
setNames(round(sapply(N, beSim), 3), N)     # 총 대상자 수별 BE 검정력
