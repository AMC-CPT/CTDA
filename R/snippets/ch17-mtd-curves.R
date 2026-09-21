plot(0, 0, type = "n", xlim = c(0, 100), ylim = c(0, 1), bty = "l",
     xlab = "Dose", ylab = "Probability of DLT")
x <- 0:100
for (i in 1:100) {
  yy <- 1/(1 + exp(-samp_A[i] - samp_B[i]*x))
  lines(x, yy, col = "#96AAC8")
  points(samps[i, "MTD"], p.cut, cex = 0.5)
}
abline(h = p.cut, lty = 3)
points(d0$x, d0$y/d0$n, pch = 16, col = "#123669")
