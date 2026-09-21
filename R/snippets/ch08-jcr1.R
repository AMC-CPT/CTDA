ci <- 0.95
dimR <- 2      # 그림 차원
npara <- 5     # mu: 2, mCov: 3
mu0 <- c(0, 0)
mCov0 <- matrix(c(1, 0.5, 0.5, 1), nrow = 2)
eg0 <- eigen(mCov0)
alpha0 <- atan(eg0$vectors[2, 1] / eg0$vectors[1, 1])
radius0 <- sqrt(qchisq(ci, dimR) * eg0$values)   # 정규분포로부터
r1 <- mathr::ellipse(mu0, radius0, alpha0, col = "#123669", asp = 1)
points(mu0[1], mu0[2], pch = "*", col = "#123669")
abline(a = 0, b = 1, lty = 2);  abline(a = 0, b = -1, lty = 2)
abline(h = 0, lty = 3);  abline(v = 0, lty = 3)
