par(mfrow = c(1, 2))
plot(r2, newdata = d1[d1$SEX == 0, ], col = "#123669", main = "SEX=0", xlab = "Time", ylab = "Survival Probability")
plot(r2, newdata = d1[d1$SEX == 1, ], col = "#123669", main = "SEX=1", xlab = "Time", ylab = "Survival Probability")
