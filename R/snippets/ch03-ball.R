x <- c(0, -1, -1, 1, 1, 0, 0)
y <- c(1, 1, 0, 0, 1, 1, 0)
plot(0, 0, type = "n", xlim = c(-1, 1), ylim = c(0, 5.5), axes = FALSE,
     xlab = "", ylab = "", asp = 1)
lines(x, y); lines(x, y + 1.5); lines(x, y + 3); lines(x, y + 4.5)
px <- c(-0.667, -0.333, -0.5, 0.5, -0.5, 0.5, 0.333, 0.667)
py <- c(5, 5, 3.5, 3.5, 2, 2, 0.5, 0.5)
points(px, py, pch = 21, cex = 2, bg = "#DDEEFF")
text(px, py, c("1", "2", "1", "2", "2", "1", "1", "2"), cex = 0.8)
