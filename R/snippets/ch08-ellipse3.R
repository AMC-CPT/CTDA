mathr::ellipse(c(1, 1), c(3, 2), pi/4, asp = 1)   # 중심 (1,1) 로 이동
points(1, 1, pch = "*")
abline(a = 0, b = 1, lty = 2);  abline(a = 2, b = -1, lty = 2)
abline(h = 0, lty = 3);  abline(v = 0, lty = 3)
