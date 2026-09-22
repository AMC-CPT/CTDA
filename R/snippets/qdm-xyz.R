# mimic the net exposure (x) -> biomarker (y) -> clinical outcome (z) with a
# trivariate normal.
# deliberately give x-y positive (0.7), y-z positive (0.5) but x-z negative (-0.1).
require(MASS)
Mu0 = c(1, 2, 3)                        # population means of the three variables
Cov0 = matrix(c( 1.0,  0.7, -0.1,       # rho(x,y) =  0.7
                 0.7,  1.0,  0.5,       # rho(y,z) =  0.5
                -0.1,  0.5,  1.0),      # rho(x,z) = -0.1
              nrow = 3, byrow = TRUE,
              dimnames = list(c("x", "y", "z"), c("x", "y", "z")))
chol(Cov0)   # an upper triangular matrix without error = positive definite = possible

n = 300
d1 = mvrnorm(n, Mu0, Cov0)              # trivariate normal sample
colnames(d1) = c("x", "y", "z")
round(cov(d1), 3)                       # sample variance-covariance matrix
round(cor(d1), 3)   # sample correlations: two positive, one negative

# scatter plots of the three pairs; the third can be negative although the first
# two are positive.
par(mfrow = c(1, 3), mar = c(4, 4, 3, 1))
Pair = list(c("x", "y"), c("y", "z"), c("x", "z"))
Lab = c(x = "x (exposure: AUC or dose)", y = "y (biomarker)",
        z = "z (clinical outcome)")
Main = c("(a) exposure - biomarker", "(b) biomarker - clinical outcome",
         "(c) exposure - clinical outcome")
for (i in 1:3) {
  a = Pair[[i]][1] ;  b = Pair[[i]][2]
  r1 = cor(d1[, a], d1[, b])
  plot(d1[, a], d1[, b], xlab = Lab[a], ylab = Lab[b], main = Main[i],
       pch = 1, cex = 0.7, col = "gray35")
  abline(lm(d1[, b] ~ d1[, a]), lwd = 2, col = "darkorange3")
  legend(if (r1 > 0) "topleft" else "topright", bty = "n", cex = 1.1,
         text.col = "darkorange3", legend = sprintf("r = %+.3f", r1))
}
