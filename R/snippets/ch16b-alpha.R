IE <- c(2, 50, 0.1)            # initial estimates of KA, V, K
LB <- rep(0, nTheta)          # lower bounds
UB <- rep(1e6, nTheta)        # upper bounds
# choose the offset alpha so that UCP = 0.1 maps exactly onto the initial estimates
alpha <- 0.1 - log((IE - LB)/(UB - LB)/(1 - (IE - LB)/(UB - LB)))
p0 <- rep(0.1, nTheta)
p1 <- exp(p0 - alpha)
p2 <- p1/(p1 + 1)*(UB - LB) + LB;  p2      # must be c(2, 50, 0.1) (sanity check)
