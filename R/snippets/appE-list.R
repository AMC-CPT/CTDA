List <- function(N = 100000, n, alpha = 0.05) {
  Res <- vector(length = N)
  for (i in 1:N) Res[i] <- Sim(n, alpha)
  sum(Res)/N
}
