th <- seq(0, 2 * pi, length.out = 500)
par(mfrow = c(1, 2))
plot(0, 0, type = "n", xlim = c(-1, 1), ylim = c(-1, 1), asp = 1, bty = "n",
     xlab = "Chords", ylab = "", xaxp = c(-1, 1, 2), yaxp = c(-1, 1, 2))
for (i in 1:200) {
  col <- if (DistB[i, 3] >= 2/3 * pi & DistB[i, 3] <= 4/3 * pi) "#123669" else "gray70"
  lines(cos(DistB[i, 1:2]), sin(DistB[i, 1:2]), col = col)
}
lines(cos(th), sin(th), lwd = 2)
midXs <- Radius * (cos(DistB[, 1]) + cos(DistB[, 2])) / 2
midYs <- Radius * (sin(DistB[, 1]) + sin(DistB[, 2])) / 2
plot(midXs, midYs, type = "p", xlim = c(-1, 1), ylim = c(-1, 1), asp = 1, pch = 20,
     cex = 0.1, bty = "n", yaxt = "n", xlab = "Midpoints", ylab = "",
     xaxp = c(-1, 1, 2), yaxp = c(-1, 1, 2))
lines(cos(th), sin(th), lwd = 2)
