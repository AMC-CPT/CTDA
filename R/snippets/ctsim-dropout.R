# 등록 후 각 대상자가 확률 pdrop로 무작위 탈락(자료 없음)하면 검정력이 떨어진다
simDrop <- function(n, delta, pdrop = 0.15) {
  x <- rnorm(n, 0,     1)[runif(n) > pdrop]   # 남은 대조군
  y <- rnorm(n, delta, 1)[runif(n) > pdrop]   # 남은 시험군
  t.test(x, y)$p.value
}
mean(replicate(10000, simDrop(64, delta = 0.5)) < 0.05)   # 탈락이 있을 때의 검정력
