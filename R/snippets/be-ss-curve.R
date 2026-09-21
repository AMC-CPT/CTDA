# 총 대상자 수 N에 따른 BE 검정력 곡선 (CV = 25%, GMR = 0.95)
Ns <- seq(16, 44, by = 2)
pw <- sapply(Ns, beSim)
plot(Ns, pw, type = "b", pch = 19, ylim = c(0, 1),
     xlab = "총 대상자 수 N", ylab = "BE 검정력", main = "CV = 25%, GMR = 0.95")
abline(h = 0.8, lty = 2)
Ns[which(pw >= 0.8)[1]]                      # 80%에 처음 도달하는 N
