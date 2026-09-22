# non-inferiority: margin M=0.5, true diff. 0, one-sided alpha=0.025, power 0.8, sd=1
M <- 0.5;  sd <- 1;  a <- 0.025;  pw <- 0.80
n <- 2 * sd^2 * (qnorm(1 - a) + qnorm(pw))^2 / M^2
c(n = n, n_ceil = ceiling(n))
