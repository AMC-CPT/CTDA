# normal-approximation formula: n = 2 sd^2 (z_{1-a/2} + z_{1-b})^2 / delta^2
a <- 0.05;  pw <- 0.90;  delta <- 0.5;  sd <- 1
n <- 2 * sd^2 * (qnorm(1 - a/2) + qnorm(pw))^2 / delta^2
c(n = n, n_ceil = ceiling(n))
