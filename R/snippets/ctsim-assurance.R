# 참 효과를 사전분포에서 뽑아 시험을 생성하고 Go 규칙을 적용 -> assurance
assurance <- function(nsim, n, mprior, sdprior, alpha = 0.1) {
  go <- replicate(nsim, {
    delta <- rnorm(1, mprior, sdprior)          # 사전분포에서 뽑은 참 효과
    x <- rnorm(n, 0, 1);  y <- rnorm(n, delta, 1)
    t.test(x, y, alternative = "less")$p.value < alpha   # y>x 이면 Go
  })
  c(assurance = mean(go))
}
assurance(nsim = 10000, n = 40, mprior = 0.4, sdprior = 0.2)  # 사전분포 반영 성공확률
power.t.test(n = 40, delta = 0.4, sd = 1,
             sig.level = 0.1, alternative = "one.sided")$power  # 효과=0.4 고정 시 검정력
