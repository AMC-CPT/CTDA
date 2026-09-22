intercept <- TRUE
X <- cbind(intercept, x);  X
XpX  <- t(X) %*% X                            # crossprod(X)
iXpX <- solve(XpX)                            # inverse of XpX
b <- iXpX %*% t(X) %*% y;  t(b)               # beta hat
yhat <- X %*% b;  t(yhat)                     # fitted values
e <- y - yhat;  t(e)                          # residuals
SSE <- sum(e^2)                               # error sum of squares
DFr <- length(y) - qr(XpX)$rank;  DFr         # residual df
MSE <- as.numeric(SSE / DFr);  MSE            # estimated error variance
Vcov <- iXpX * MSE;  Vcov                     # variance-covariance matrix of beta hat
SE <- sqrt(diag(Vcov));  SE                   # standard errors of beta hat
t.val <- b / SE;  t(t.val)                    # t values
p.val <- 2 * (1 - pt(abs(t.val), DFr));  t(p.val)   # p values
Vyhat <- X %*% Vcov %*% t(X)
alpha <- 0.05
B <- qt(1 - alpha/2, DFr) * sqrt(diag(Vyhat))          # margin of error, mean response
data.frame(yhat, lwr = yhat - B, upr = yhat + B)       # confidence interval
B2 <- qt(1 - alpha/2, DFr) * sqrt(MSE + diag(Vyhat))   # margin, individual prediction
data.frame(yhat, lwr = yhat - B2, upr = yhat + B2)     # prediction interval
