# 한 번의 가상 시험: 대조군 평균 0, 시험군 평균 delta, Welch 두 표본 t 검정
simTrial <- function(n1, n2 = n1, delta, sd1 = 1, sd2 = sd1) {
  x <- rnorm(n1, mean = 0,     sd = sd1)   # 대조군
  y <- rnorm(n2, mean = delta, sd = sd2)   # 시험군
  t.test(x, y)$p.value                      # 양측 Welch p-값
}
simTrial(n1 = 64, delta = 0.5)             # 한 건의 모의 시험
