library(mathr)
mathr::ellipse(asp = 1)   # 기본: 중심 (0,0), 반지름 (2,1), 수평
points(0, 0, pch = "*")
abline(h = 0, lty = 3);  abline(v = 0, lty = 3)
