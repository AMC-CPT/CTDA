Var1 <- solve(FIM)                       # REML needs no further correction
SE   <- sqrt(diag(Var1))
Df   <- nRec - qr(X)$rank - (nID - 1)    # nlme df 80
tVal <- Beta/SE
fixedPE <- cbind(Beta, SE, Df, tVal, 2*(1 - pt(abs(tVal), Df)))
colnames(fixedPE) <- c("Value", "Std.Error", "DF", "t-value", "p-value")
fixedPE
Df1 <- nID - 1                           # SAS df 26
fixedSol <- cbind(Beta, SE, Df1, tVal, 2*(1 - pt(abs(tVal), Df1)))
colnames(fixedSol) <- c("Value", "Std.Error", "DF", "t-value", "p-value")
fixedSol
