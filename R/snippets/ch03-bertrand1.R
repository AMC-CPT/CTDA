N <- 2000
Radius <- 1
DistB <- matrix(NA, nrow = N, ncol = 3)
for (i in 1:N) DistB[i, 1:2] <- runif(2, 0, 2 * pi)
DistB[, 3] <- abs(DistB[, 1] - DistB[, 2])
mean(DistB[, 3] >= 2/3 * pi & DistB[, 3] <= 4/3 * pi)   # 이론값 1/3
