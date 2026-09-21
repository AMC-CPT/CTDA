# 군당 표본크기 n을 훑으며 검정력 곡선을 그리고, 목표 0.8에 도달하는 n을 찾는다
ns  <- seq(30, 110, by = 10)
pow <- sapply(ns, function(n) oper(nsim = 4000, n1 = n, delta = 0.5)["reject"])
plot(ns, pow, type = "b", pch = 19, ylim = c(0, 1),
     xlab = "군당 표본크기 n", ylab = "검정력")
abline(h = 0.8, lty = 2)
ns[which(pow >= 0.8)[1]]                             # 0.8에 처음 도달하는 n (격자 해상도)
