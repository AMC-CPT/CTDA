intercept <- TRUE
X <- cbind(intercept, x1, x2)
XpX  <- t(X) %*% X
iXpX <- solve(XpX)
b <- iXpX %*% t(X) %*% y
t(b)                                          # beta hat
yhat <- X %*% b;  t(yhat)                     # fitted values
e <- y - yhat;  t(e)                          # residuals
SSE <- sum(e^2)
DFr <- length(y) - qr(XpX)$rank;  DFr
MSE <- as.numeric(SSE / DFr);  MSE
Vcov <- iXpX * MSE;  Vcov
SE <- sqrt(diag(Vcov));  SE
t.val <- b / SE;  t(t.val)
p.val <- 2 * (1 - pt(abs(t.val), DFr));  t(p.val)
Vyhat <- X %*% Vcov %*% t(X)
alpha <- 0.05
B <- qt(1 - alpha/2, DFr) * sqrt(diag(Vyhat))
data.frame(yhat, lwr = yhat - B, upr = yhat + B)
B2 <- qt(1 - alpha/2, DFr) * sqrt(MSE + diag(Vyhat))
data.frame(yhat, lwr = yhat - B2, upr = yhat + B2)
