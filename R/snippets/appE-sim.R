require(sasLM)
Sim <- function(n, alpha = 0.05) {
  SigSq <- exp(rnorm(1, -2.77, 1.42857))                  # 오차분산 ~ 로그정규
  Delta <- rbinom(1, 1, 0.5) * rnorm(1, 0.4, sqrt(SigSq)) # 50%는 효과 없음
  XBarDiff <- rnorm(1, Delta, sqrt(SigSq*2/n))
  Var1 <- SigSq/(n - 1)*rchisq(1, n - 1)
  Var2 <- SigSq/(n - 1)*rchisq(1, n - 1)
  t.val <- XBarDiff/sqrt(Var1/n + Var2/n)
  t0 <- qt(1 - alpha/2, satt(c(Var1, Var2), c(n - 1, n - 1))[[2]])
  abs(t.val) > t0                                          # 양측 Welch t 검정
}
