DistC <- matrix(NA, nrow = N, ncol = 3)
for (i in 1:N) {
  DistC[i, 1:2] <- runif(2, -1, 1)
  DistC[i, 3]   <- sqrt(DistC[i, 1]^2 + DistC[i, 2]^2)
}
Dist1 <- DistC[DistC[, 3] < 1, ]
mean(Dist1[, 3] < Radius / 2)   # theoretical value 1/4
