library(MASS)
npoints <- 100
Data <- mvrnorm(npoints, mu0, mCov0)
head(Data, 10)
mu <- colMeans(Data);  mu
mCov <- cov(Data);  mCov
eg <- eigen(mCov)
alpha <- atan(eg$vectors[2, 1] / eg$vectors[1, 1]);  alpha * 180/pi
radius <- sqrt(dimR * qf(ci, dimR, npoints - npara) * eg$values)   # from the sample
mathr::ellipse(mu0, radius0, alpha0, col = "#123669", asp = 1)
mathr::ellipse(mu, radius, alpha, asp = 1, add = TRUE)
points(Data)
points(mu0[1], mu0[2], pch = "*", col = "#123669");  points(mu[1], mu[2], pch = "+")
abline(a = 0, b = 1, lty = 2, col = "#123669");  abline(a = 0, b = -1, lty = 2, col = "#123669")
abline(h = 0, lty = 3);  abline(v = 0, lty = 3)
