th <- seq(0, 2 * pi, length.out = 500)
ms <- -Dist1[, 1] / Dist1[, 2]         # 기울기
ns <- -ms * Dist1[, 1] + Dist1[, 2]    # y 절편
par(mfrow = c(1, 2))
plot(0, 0, type = "n", xlim = c(-1, 1), ylim = c(-1, 1), asp = 1, bty = "n",
     xlab = "Chords", ylab = "", xaxp = c(-1, 1, 2), yaxp = c(-1, 1, 2))
for (i in 1:min(300, nrow(Dist1))) {
  col <- if (Dist1[i, 3] <= Radius / 2) "#123669" else "gray70"
  abline(a = ns[i], b = ms[i], col = col)
}
lines(cos(th), sin(th), lwd = 2)
plot(DistC[, 1], DistC[, 2], type = "p", xlim = c(-1, 1), ylim = c(-1, 1), pch = 20,
     bty = "n", asp = 1, cex = 0.1, yaxt = "n", xlab = "Midpoints", ylab = "",
     xaxp = c(-1, 1, 2), yaxp = c(-1, 1, 2))
lines(cos(th), sin(th), lwd = 2)
lines(cos(th) / 2, sin(th) / 2, lwd = 2)
