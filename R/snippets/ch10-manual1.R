intercept <- TRUE
X <- cbind(intercept, x);  X
XpX  <- t(X) %*% X                            # crossprod(X)
iXpX <- solve(XpX)                            # XpX 의 역행렬
b <- iXpX %*% t(X) %*% y;  t(b)               # beta hat
yhat <- X %*% b;  t(yhat)                     # 적합값
e <- y - yhat;  t(e)                          # 잔차
SSE <- sum(e^2)                               # 오차제곱합
DFr <- length(y) - qr(XpX)$rank;  DFr         # 잔차 자유도
MSE <- as.numeric(SSE / DFr);  MSE            # 오차분산 추정값
Vcov <- iXpX * MSE;  Vcov                     # beta hat 의 분산공분산 행렬
SE <- sqrt(diag(Vcov));  SE                   # beta hat 의 표준오차
t.val <- b / SE;  t(t.val)                    # t 값
p.val <- 2 * (1 - pt(abs(t.val), DFr));  t(p.val)   # p 값
Vyhat <- X %*% Vcov %*% t(X)
alpha <- 0.05
B <- qt(1 - alpha/2, DFr) * sqrt(diag(Vyhat))          # 평균반응 오차한계
data.frame(yhat, lwr = yhat - B, upr = yhat + B)       # 신뢰구간
B2 <- qt(1 - alpha/2, DFr) * sqrt(MSE + diag(Vyhat))   # 개별예측 오차한계
data.frame(yhat, lwr = yhat - B2, upr = yhat + B2)     # 예측구간
