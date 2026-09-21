N <- 1000
Res <- data.frame(nTree = rep(NA, N), Time = rep(NA, N))
for (i in 1:N) Res[i, ] <- Fire(PLOT = FALSE)
