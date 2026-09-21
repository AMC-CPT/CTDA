oPar <- par(mfrow = c(2, 1))
plot(A, mpA, type = "l", xlab = expression(beta[0]), ylab = "Density")
plot(B, mpB, type = "l", xlab = expression(beta[1]), ylab = "Density")
par(oPar)
