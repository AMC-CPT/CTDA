d0 <- data.frame(x = c(35, 50, 75, 70, 69), n = c(3, 3, 4, 3, 3), y = c(0, 0, 2, 1, 0.9))
X <- cbind(1, d0$x);  n <- d0$n;  y <- d0$y
sumlogny <- sum(lfactorial(n) - lfactorial(y) - lfactorial(n - y))
LL <- function(b) {                       # binomial log-likelihood
  Xb <- X %*% b
  sum(y*Xb - n*log1p(exp(Xb))) + sumlogny
}
minAlpha <- -20;  maxAlpha <- 0
minBeta <- 1e-8;  maxBeta <- -minAlpha/100
nA <- nB <- 51
A <- seq(minAlpha, maxAlpha, length.out = nA)
B <- seq(minBeta, maxBeta, length.out = nB)

vMean <- c(-5, 0.1)                        # prior mean
mCov <- matrix(c(5, -0.01, -0.01, 0.1), nrow = 2)   # prior covariance
dbinorm <- function(b, Mean, Cov) 1/(2*pi)/sqrt(det(Cov)) * exp(-mahalanobis(b, Mean, Cov)/2)

Pri  <- matrix(1, nrow = nA, ncol = nA)
LogL <- matrix(0, nrow = nA, ncol = nA)
for (i in 1:nA) for (j in 1:nB) {
  b <- c(A[i], B[j])
  Pri[i, j]  <- dbinorm(b, vMean, mCov)    # omit for a non-informative prior
  LogL[i, j] <- LL(b)
}
Post <- exp(LogL)*Pri                       # unnormalized (approximate) posterior
