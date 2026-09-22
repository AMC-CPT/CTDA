library(mathr)
mathr::ellipse(asp = 1)   # default: center (0,0), radii (2,1), horizontal
points(0, 0, pch = "*")
abline(h = 0, lty = 3);  abline(v = 0, lty = 3)
