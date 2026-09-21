alpha <- 0.05
Len   <- qt(1 - alpha/2, Df)*sqrt(diag(Var1))
CIbeta <- cbind(Beta - Len, Beta, Beta + Len)
colnames(CIbeta) <- c("lower", "est", "upper");  CIbeta
