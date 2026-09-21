# 이항분포 B(20, 0.3)의 확률질량함수(pmf)
n <- 20
p <- 0.3
xs <- 0:n
par(mar = c(4, 4, 1, 1))
plot(xs, dbinom(xs, n, p), type = "h", lwd = 2, col = "grey40",
     xlab = "x", ylab = "P(X = x)")
points(xs, dbinom(xs, n, p), pch = 16, cex = 0.8)
abline(v = n * p, lty = 2, col = "steelblue")
