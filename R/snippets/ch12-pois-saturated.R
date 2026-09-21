LLs <- sum(y*log(y) - y - lfactorial(y));  LLs   # 포화모형의 LL, -27.53397
2 * (LLs + r2$value)                              # deviance, 12.17572
1 - pchisq(2*(LLs + r2$value), length(y) - length(r2$par))   # p = 0.05816
