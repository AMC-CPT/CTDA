library(MASS)
Mu0 <- c(1, 2, 3)
Cov0 <- matrix(c(1, 0.7, -0.1, 0.7, 1, 0.5, -0.1, 0.5, 1), nrow = 3)
chol(Cov0)   # check positive definiteness

n <- 300
d1 <- mvrnorm(n, Mu0, Cov0)
colnames(d1) <- c("x", "y", "z")
cov(d1);  cor(d1)

d2 <- as.data.frame(d1)
par(mfrow = c(2, 2))
plot(y ~ x, d2);  abline(lm(y ~ x, d2))
plot(z ~ y, d2);  abline(lm(z ~ y, d2))
plot(z ~ x, d2);  abline(lm(z ~ x, d2))
