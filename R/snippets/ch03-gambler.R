p  <- 18/38   # probability of winning
m0 <- 5       # starting money
m1 <- 10      # target money
N  <- 1000    # number of simulations
Res <- data.frame(n = rep(NA, N), Result = rep(NA, N))
for (i in 1:N) {
  cM <- m0   # current money
  cT <- 0    # number of games
  while ((cM > 0) & (cM < m1)) {
    cM <- ifelse(runif(1) < p, cM + 1, cM - 1)
    cT <- cT + 1
  }
  Res[i, "n"] <- cT
  Res[i, "Result"] <- ifelse(cM == 0, "Bankrupt", "Earn")
}
mean(Res[, "n"])
sum(Res[, "Result"] == "Bankrupt") / N
