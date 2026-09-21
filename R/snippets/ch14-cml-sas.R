SE1  <- sqrt(diag(Var1))                 # SAS output
Df1  <- nID - 1                          # SAS 자유도 26
tVal1 <- Beta/SE1
fixedSol <- cbind(Beta, SE1, Df1, tVal1, 2*(1 - pt(abs(tVal1), Df1)))
colnames(fixedSol) <- c("Value", "Std.Error", "DF", "t-value", "p-value")
fixedSol
