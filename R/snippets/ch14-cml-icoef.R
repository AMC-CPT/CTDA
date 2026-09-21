iCoef <- bi
for (i in 1:nID) iCoef[i, ] <- iCoef[i, ] + t(Beta)   # 개체별 intercept, slope
head(iCoef)
