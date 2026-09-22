iCoef <- bi
for (i in 1:nID) iCoef[i, ] <- iCoef[i, ] + t(Beta)   # per-subject intercept, slope
head(iCoef)
