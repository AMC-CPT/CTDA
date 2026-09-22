n <- nrow(d5b)                              # total observations
n/2*log(1 + qf(0.95, 1, n - 5)/(n - 5))     # critical delta log-likelihood
d2LL <- r2$`-2LL` - r3$`-2LL`;  d2LL        # delta -2LL
Fval <- (exp(d2LL/n) - 1)*(n - 5);  Fval    # F value
1 - pf(Fval, 1, n - 5)                      # p value
