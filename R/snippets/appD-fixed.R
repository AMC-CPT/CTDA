wi0 <- e.c*n.t/(n.t + n.c)                 # Mantel-Haenszel weights
pwi <- wi0/sum(wi0)*100;  pwi              # % (compare with the metabin output)
Vi <- r9$SElog^2;  wi <- 1/Vi              # inverse-variance weights
sumwi <- sum(wi)
th.hat <- sum(wi*thi)/sumwi;  th.hat       # fixed-effect estimate (log scale)
seth.hat <- sqrt(1/sumwi);  seth.hat
exp(th.hat)                                # RR on the original scale
exp(th.hat + c(-1, 1)*1.96*seth.hat)       # 95% confidence interval
