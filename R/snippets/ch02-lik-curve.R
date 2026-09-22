y <- 3
n <- 10
Lik <- function(p) choose(n, y) * p^y * (1 - p)^(n - y)   # same as dbinom
curve(Lik, 0, 1, xlab = "Unknown parameter p",
      ylab = "Probability of y/n = 3/10", bty = "l")
integrate(Lik, 0, 1)   # not a pdf, so not 1
