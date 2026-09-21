# 이분형 결과: 반응률 p1 대 p2, 군당 n명, 카이제곱 검정의 검정력
simBin <- function(n, p1, p2) {
  x1 <- rbinom(1, n, p1);  x2 <- rbinom(1, n, p2)
  suppressWarnings(prop.test(c(x1, x2), c(n, n))$p.value)
}
mean(replicate(10000, simBin(80, 0.30, 0.50)) < 0.05)     # 30% 대 50%, 군당 80명
