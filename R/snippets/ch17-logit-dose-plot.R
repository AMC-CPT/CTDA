plot(y ~ x, d1, pch = 16, xlab = "Dose", ylab = "Probability")   # points overlap
x0 <- seq(min(d1$x), max(d1$x), length.out = 101)
y0 <- r1$coefficients[1] + r1$coefficients[2]*x0
p0 <- exp(y0)/(exp(y0) + 1)
lines(x0, p0, lty = 3)
