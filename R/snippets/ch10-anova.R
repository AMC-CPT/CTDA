SST <- sum((y - mean(y))^2)                   # total variation (corrected)
SSE <- sum((y - yhat)^2)                      # error sum of squares
SSR <- SST - SSE                              # regression sum of squares
Rsq <- SSR / SST;  Rsq                        # R-square
n <- length(y);  p <- length(b)
R2adj <- 1 - (1 - Rsq) * (n - 1) / (n - p);  R2adj   # adjusted R-square
SS <- c(SSR, SSE, SST)
DF <- c(p - 1, n - p, n - 1)
MS <- c(SS[1:2] / DF[1:2], NA)
Fval <- MS[1] / MS[2]
Fcrit <- qf(1 - 0.05, p - 1, n - p)
pval <- 1 - pf(Fval, p - 1, n - p)
r3 <- cbind(SS, DF, MS, c(Fval, NA, NA), c(Fcrit, NA, NA), c(pval, NA, NA))
rownames(r3) <- c("Regression", "Error", "Total")
colnames(r3) <- c("Sum Sq", "Df", "Mean Sq", "F value", "F crit", "Pr(>F)")
class(r3) <- "anova"
r3                                            # compare with anova(r2), summary(r2)
