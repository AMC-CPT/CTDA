# one virtual trial: control mean 0, active mean delta, Welch two-sample t test
simTrial <- function(n1, n2 = n1, delta, sd1 = 1, sd2 = sd1) {
  x <- rnorm(n1, mean = 0,     sd = sd1)   # control arm
  y <- rnorm(n2, mean = delta, sd = sd2)   # active arm
  t.test(x, y)$p.value                      # two-sided Welch p value
}
simTrial(n1 = 64, delta = 0.5)             # one simulated trial
