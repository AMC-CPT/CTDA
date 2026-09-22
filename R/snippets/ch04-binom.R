# Check the expectation and variance of the binomial B(n, p) by simulation.
n <- 20
p <- 0.3
x <- rbinom(100000, size = n, prob = p)

# sample mean vs theoretical np
c(sample_mean = mean(x), np = n * p)

# sample variance vs theoretical np(1-p)
c(sample_var = var(x), "np(1-p)" = n * p * (1 - p))
