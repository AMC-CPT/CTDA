alpha1 <- 0.05
mx <- mean(x)
mx + c(-1, 1) * qnorm(1 - alpha1/2) * sig1 / sqrt(n1)  # normal distribution
mx + c(-1, 1) * qt(1 - alpha1/2, n1 - 1) * sd(x) / sqrt(n1)  # using the t distribution
