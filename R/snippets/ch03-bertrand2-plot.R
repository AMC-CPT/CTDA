th <- seq(0, 2 * pi, length.out = 500)
par(mfrow = c(1, 2))
plot(0, 0, type = "n", xlim = c(-1, 1), ylim = c(-1, 1), asp = 1, bty = "n",
     xlab = "Chords", ylab = "", xaxp = c(-1, 1, 2), yaxp = c(-1, 1, 2))
for (i in 1:200) {
  col <- if (Dist[i, 4] <= Radius / 2) "#123669" else "gray70"
  abline(a = -Dist[i, 1] * Dist[i, 3] + Dist[i, 2], b = Dist[i, 3], col = col)
}
lines(cos(th), sin(th), lwd = 2)
ms <- Dist[, 3]
ns <- -Dist[, 3] * Dist[, 1] + Dist[, 2]
msqp1 <- ms * ms + 1
Xs <- -ms * ns / msqp1
Ys <- ns / msqp1
plot(Xs, Ys, type = "p", xlim = c(-1, 1), ylim = c(-1, 1), asp = 1, pch = 20, cex = 0.1,
     bty = "n", yaxt = "n", xlab = "Midpoints", ylab = "", xaxp = c(-1, 1, 2), yaxp = c(-1, 1, 2))
lines(cos(th), sin(th), lwd = 2)
