# repeat nsim trials and obtain the 'success (p<0.05)' proportion and its Monte Carlo SE
oper <- function(nsim, n1, n2 = n1, delta, sd1 = 1, sd2 = sd1) {
  p      <- replicate(nsim, simTrial(n1, n2, delta, sd1, sd2))
  reject <- mean(p < 0.05)                      # success (rejection) proportion
  mcse   <- sqrt(reject * (1 - reject) / nsim)  # Monte Carlo standard error
  c(reject = reject, mcse = mcse)
}
oper(nsim = 10000, n1 = 64, delta = 0)  # truth = H0: type I error rate
