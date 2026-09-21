# 이항분포 B(n, p)의 기대값과 분산을 시뮬레이션으로 확인한다.
n <- 20
p <- 0.3
x <- rbinom(100000, size = n, prob = p)

# 표본평균 vs 이론값 np
c(sample_mean = mean(x), np = n * p)

# 표본분산 vs 이론값 np(1-p)
c(sample_var = var(x), "np(1-p)" = n * p * (1 - p))
