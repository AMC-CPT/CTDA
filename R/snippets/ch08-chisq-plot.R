plot(x, y2, type = "l", col = "#123669", ylab = "Density")
lines(density(rV2), lty = 2, col = "#123669")
lines(x, y1)
lines(density(rV), lty = 2)
legend(17, 0.1,
       c("Df=10 theory", "Df=10 simulated", "Df=9 theory", "Df=9 simulated"),
       lty = c(1, 2, 1, 2), col = c("black", "black", "#123669", "#123669"))
