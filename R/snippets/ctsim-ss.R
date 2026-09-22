# sweep the per-arm sample size n, plot the power curve, find the n reaching 0.8
ns  <- seq(30, 110, by = 10)
pow <- sapply(ns, function(n) oper(nsim = 4000, n1 = n, delta = 0.5)["reject"])
plot(ns, pow, type = "b", pch = 19, ylim = c(0, 1),
     xlab = "Sample size per arm n", ylab = "Power")
abline(h = 0.8, lty = 2)
ns[which(pow >= 0.8)[1]]   # first n reaching 0.8 (grid resolution)
