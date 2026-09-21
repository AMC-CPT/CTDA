plot(x, y2, type = "l", col = "#123669", ylab = "Density")
lines(density(rV2), lty = 2, col = "#123669")
lines(x, y1)
lines(density(rV), lty = 2)
legend(17, 0.1,
       c("Df=10 이론", "Df=10 모의", "Df=9 이론", "Df=9 모의"),
       lty = c(1, 2, 1, 2), col = c("black", "black", "#123669", "#123669"))
