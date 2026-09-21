# 비열등성: 마진 M=0.5, 참 차이 0, 단측 alpha=0.025, 검정력 0.80, sd=1
M <- 0.5;  sd <- 1;  a <- 0.025;  pw <- 0.80
n <- 2 * sd^2 * (qnorm(1 - a) + qnorm(pw))^2 / M^2
c(n = n, n_ceil = ceiling(n))
