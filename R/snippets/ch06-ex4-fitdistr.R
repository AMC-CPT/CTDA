library(MASS)
fitdistr(x, dnorm, list(mean = mean(x), sd = sd(x)))
