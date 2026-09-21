Var1 <- solve(FIM)                       # SAS/NONMEM style
Var2 <- Var1*nRec/(nRec - qr(X)$rank)    # nlme style (bias 보정)
SE   <- sqrt(diag(Var2))
Df   <- nRec - qr(X)$rank - (nID - 1)    # nlme 자유도 80
tVal <- Beta/SE
fixedPE <- cbind(Beta, SE, Df, tVal, 2*(1 - pt(abs(tVal), Df)))
colnames(fixedPE) <- c("Value", "Std.Error", "DF", "t-value", "p-value")
fixedPE
cov2cor(Var2)[lower.tri(Var2)]           # intercept-age 추정값 상관
