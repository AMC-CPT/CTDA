# 2x2 crossover BE sample size: simulate the power from the within-subject CV
# (success = 90% CI within [0.8, 1.25])
beSim <- function(N, GMR = 0.95, CV = 0.25, nsim = 3000) {
  sw <- sqrt(log(1 + CV^2))                # within-subject SD on the log scale
  d  <- log(GMR)
  pass <- replicate(nsim, {
    di <- rnorm(N, d, sqrt(2) * sw)         # per-subject (logT - logR)
    m  <- mean(di);  se <- sd(di) / sqrt(N)
    tc <- qt(0.95, N - 2)                   # 90% CI critical value (df = N-2)
    (exp(m - tc * se) > 0.80) & (exp(m + tc * se) < 1.25)
  })
  mean(pass)
}
N <- c(20, 24, 28, 32, 36, 40)
setNames(round(sapply(N, beSim), 3), N)     # BE power by total number of subjects
