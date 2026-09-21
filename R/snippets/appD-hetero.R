Q <- sum(wi*(thi - th.hat)^2);  Q          # 이질성(heterogeneity) 통계량
k <- length(e.t);  k
1 - pchisq(Q, k - 1)                        # p-value
