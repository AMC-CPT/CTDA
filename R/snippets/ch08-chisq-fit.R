library(MASS)
fitdistr(rV, dchisq, start = list(df = mean(rV)), lower = 0)
fitdistr(rV2, dchisq, start = list(df = mean(rV2)), lower = 0)
