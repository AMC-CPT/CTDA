fy <- function(mu, sigma) -log(prod(dnorm(x, mean = mu, sd = sigma)))   # -log likelihood
nPoint <- 101
Mu  <- seq(8, 12, length.out = nPoint)
Sig <- seq(1, 3, length.out = nPoint)
mLL <- matrix(NA, nrow = nPoint, ncol = nPoint)
for (i in 1:nPoint) for (j in 1:nPoint) mLL[i, j] <- fy(Mu[i], Sig[j])
contour(Mu, Sig, mLL)
persp(Mu, Sig, mLL, theta = 30)
library(rgl)             # 없으면 먼저 설치
persp3d(Mu, Sig, mLL, col = "lightblue", alpha = 0.5)
