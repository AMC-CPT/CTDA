simCmax <- function(Cmax0 = 100, Mult = 2, CV = 50, n = 6, N = 2000) {
  Res <- matrix(nrow = N, ncol = 2)
  SD0 <- Cmax0*CV/100
  Cmax1 <- Cmax0*Mult
  SD1 <- Cmax1*CV/100                 # 두 용량군의 CV 동일
  for (i in 1:N) {
    Res[i, 1] <- mean(rnorm(n, Cmax0, SD0))
    Res[i, 2] <- mean(rnorm(n, Cmax1, SD1))
  }
  sum(Res[, 1] > Res[, 2]) / N
}
simCmax()             # 2배 증량
simCmax(Mult = 1.5)   # 1.5배 증량
simCmax(Mult = 1.33)  # 1.33배 증량
