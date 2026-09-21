d0 <- data.frame(x = c(35, 50, 75, 70, 69), n = c(3, 3, 4, 3, 3), y = c(0, 0, 2, 1, 0.9))
X <- cbind(1, d0$x);  n <- d0$n;  y <- d0$y
sumlogny <- sum(lfactorial(n) - lfactorial(y) - lfactorial(n - y))
LL <- function(b) {                       # 이항 로그가능도
  Xb <- X %*% b
  sum(y*Xb - n*log1p(exp(Xb))) + sumlogny
}
minAlpha <- -20;  maxAlpha <- 0
minBeta <- 1e-8;  maxBeta <- -minAlpha/100
nA <- nB <- 51
A <- seq(minAlpha, maxAlpha, length.out = nA)
B <- seq(minBeta, maxBeta, length.out = nB)

vMean <- c(-5, 0.1)                        # 사전분포 평균
mCov <- matrix(c(5, -0.01, -0.01, 0.1), nrow = 2)   # 사전분포 공분산
dbinorm <- function(b, Mean, Cov) 1/(2*pi)/sqrt(det(Cov)) * exp(-mahalanobis(b, Mean, Cov)/2)

Pri  <- matrix(1, nrow = nA, ncol = nA)
LogL <- matrix(0, nrow = nA, ncol = nA)
for (i in 1:nA) for (j in 1:nB) {
  b <- c(A[i], B[j])
  Pri[i, j]  <- dbinorm(b, vMean, mCov)    # 무정보 사전분포면 이 줄을 생략
  LogL[i, j] <- LL(b)
}
Post <- exp(LogL)*Pri                       # 정규화 전 (근사) 사후밀도
