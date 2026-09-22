# draw the true effect from the prior, generate the trial, apply the Go rule
# -> assurance
assurance <- function(nsim, n, mprior, sdprior, alpha = 0.1) {
  go <- replicate(nsim, {
    delta <- rnorm(1, mprior, sdprior)          # true effect drawn from the prior
    x <- rnorm(n, 0, 1);  y <- rnorm(n, delta, 1)
    t.test(x, y, alternative = "less")$p.value < alpha   # Go if y > x
  })
  c(assurance = mean(go))
}
assurance(nsim = 10000, n = 40, mprior = 0.4, sdprior = 0.2)  # PoS over the prior
power.t.test(n = 40, delta = 0.4, sd = 1,
             sig.level = 0.1, alternative = "one.sided")$power  # power at effect 0.4
