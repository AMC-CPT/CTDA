mathr::ellipse(c(0, 0), c(3, 2), pi/4, asp = 1)   # 장·단반경 3,2; 45도 회전
points(0, 0, pch = "*")
abline(a = 0, b = 1, lty = 2);  abline(a = 0, b = -1, lty = 2)
abline(h = 0, lty = 3);  abline(v = 0, lty = 3)
