Q <- sum(wi*(thi - th.hat)^2);  Q          # heterogeneity statistic
k <- length(e.t);  k
1 - pchisq(Q, k - 1)                        # p value
