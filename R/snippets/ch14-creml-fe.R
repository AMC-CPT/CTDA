Var1 <- solve(FIM)                       # REML은 추가 보정 불필요
SE   <- sqrt(diag(Var1))
Df   <- nRec - qr(X)$rank - (nID - 1)    # nlme 자유도 80
tVal <- Beta/SE
fixedPE <- cbind(Beta, SE, Df, tVal, 2*(1 - pt(abs(tVal), Df)))
colnames(fixedPE) <- c("Value", "Std.Error", "DF", "t-value", "p-value")
fixedPE
Df1 <- nID - 1                           # SAS 자유도 26
fixedSol <- cbind(Beta, SE, Df1, tVal, 2*(1 - pt(abs(tVal), Df1)))
colnames(fixedSol) <- c("Value", "Std.Error", "DF", "t-value", "p-value")
fixedSol
