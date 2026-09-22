Res <- data.frame(ID = IDs, Intercept = NA, age = NA)
for (i in 1:nID)
  Res[i, 2:3] <- lm(distance ~ age, Orthodont[Orthodont$Subject == IDs[i], ])$coefficients
colMeans(Res[, 2:3])                 # mean vector of the betas
cov(Res[, 2:3])                      # variance-covariance matrix
cor(Res[, 2:3])[2, 1]                # correlation
