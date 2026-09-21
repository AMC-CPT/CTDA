N <- 2000
Res <- rep(NA, N)
for (i in 1:N) Res[i] <- mean(x[sample(n1, n1, replace = TRUE)])
