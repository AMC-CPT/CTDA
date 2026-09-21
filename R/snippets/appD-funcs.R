require(sasLM)
metaRR <- function(e.t, n.t, e.c, n.c, conf.level = 0.95) {
  r1 <- RR(e.t, n.t, e.c, n.c, conf.level = conf.level)
  thi <- log(r1$RR);  wi <- 1/(r1$SElog)^2
  wi0 <- e.c*n.t/(n.t + n.c);  r1$pwi <- wi0/sum(wi0)*100
  sumwi <- sum(wi)
  th.hat <- sum(wi*thi)/sumwi;  seth.hat <- sqrt(1/sumwi)
  z <- qnorm(0.5 + conf.level/2)
  r2 <- data.frame(RR = exp(th.hat), CI.lower = exp(th.hat - z*seth.hat),
                   CI.upper = exp(th.hat + z*seth.hat))
  Q <- sum(wi*(thi - th.hat)^2);  k <- length(e.t)
  r3 <- data.frame(Q = Q, prob = 1 - pchisq(Q, k - 1))
  tau2 <- (Q - (k - 1))/(sumwi - sum(wi^2)/sumwi)
  wsi <- 1/(1/wi + tau2);  sumwsi <- sum(wsi);  r1$pwsi <- wsi/sumwsi*100
  th.hat.ran <- sum(wsi*thi)/sumwsi;  se2 <- sqrt(1/sumwsi)
  r4 <- data.frame(RR = exp(th.hat.ran), CI.lower = exp(th.hat.ran - z*se2),
                   CI.upper = exp(th.hat.ran + z*se2))
  list(RelRisk = r1, Heterogeneity = r3, tau2 = tau2, Fixed = r2, Random = r4)
}
metaRR(e.t, n.t, e.c, n.c)
