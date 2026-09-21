Slope <- 1
mean(tan(runif(10000, 0, pi/2)) < Slope)   # 이론값 atan(1)/(pi/2) = 0.5
atan(Slope)              # pi/4
atan(Slope) / (pi/2)     # 0.5
mp <- tan(pi/4)
mean(tan(runif(10000, 0, pi/2)) > mp)       # 0.5
plot(0, 0, type = "n", xlim = c(-1, 1), ylim = c(-1, 1), asp = 1, xlab = "", ylab = "")
for (i in 1:9) {
  abline(a = 0, b = i * 1e6, col = "gray55")
  abline(a = 0, b = tan(i/10 * pi/2), col = "#123669")
}
abline(h = 0); abline(a = 0, b = 1); abline(v = c(-1, 1))
y0 <- seq(0, 1, length.out = 6)
points(x = c(rep(1, 6), rep(-1, 6)), y = c(y0, -y0), pch = 20, col = "gray55")
points(x = cos((0:10)/10 * pi/2), y = sin((0:10)/10 * pi/2), pch = 20, col = "#123669")
th <- seq(0, 2 * pi, length.out = 101)
lines(cos(th), sin(th), lwd = 2)
