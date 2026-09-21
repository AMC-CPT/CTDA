plot(y2 ~ x2, d2, pch = 16, xlab = "AUC", ylab = "Probability")
x0 <- seq(min(d2$x2), max(d2$x2), length.out = 101)
y0 <- r2$coefficients[1] + r2$coefficients[2]*x0
p0 <- exp(y0)/(exp(y0) + 1)
lines(x0, p0, lty = 3)
