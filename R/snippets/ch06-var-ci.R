n <- 20
alpha <- 0.05
x <- rnorm(n)
S2 <- var(x)
ci <- (n - 1) * S2 / c(qchisq(1 - alpha/2, n - 1), qchisq(alpha/2, n - 1))
ci
