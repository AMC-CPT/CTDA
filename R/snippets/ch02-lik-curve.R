y <- 3
n <- 10
Lik <- function(p) choose(n, y) * p^y * (1 - p)^(n - y)   # dbinom 과 동일
curve(Lik, 0, 1, xlab = "Unknown parameter p",
      ylab = "Probability of y/n = 3/10", bty = "l")
integrate(Lik, 0, 1)   # pdf 가 아니므로 1 이 아니다
