N <- 2000
Res <- matrix(NA, nrow = N, ncol = 2)
k <- 1
while (k <= N) {
  x <- runif(2)
  if (runif(1, 0, 2) < x[1] + x[2]) {
    Res[k, ] <- x
    k <- k + 1
  }
}
colMeans(Res)   # theoretical 7/12 = 0.5833333
cov(Res)        # theoretical -1/144 = -0.006944444

x <- seq(0, 1, by = 0.01);  y <- seq(0, 1, by = 0.01)
z <- outer(x, y, "+")
library(rgl)
persp3d(x, y, z, alpha = 0.5)
points3d(Res[, 1], Res[, 2], 0)
