Max <- 100
Min <- -100
Dist <- matrix(NA, nrow = N, ncol = 4)
n <- 0
while (n < N) {
  x1 <- runif(1, Min, Max)
  y1 <- runif(1, Min, Max)
  m  <- tan(runif(1, 0, pi))
  dist1 <- abs(m * x1 - y1) / sqrt(m * m + 1)
  if (dist1 > Radius) next
  n <- n + 1
  Dist[n, ] <- c(x1, y1, m, dist1)
}
mean(Dist[, 4] < Radius / 2)   # 이론값 1/2
