par(mfrow = c(1, 3))
plot(r1, col = "#123669", main = "Survival Probability", xlab = "Time", ylab = "Survival Probability")
plot(r1, col = "#123669", type = "cumhaz", main = "Cumulative Hazard", xlab = "Time", ylab = "Cumulative Hazard")
plot(r1, col = "#123669", type = "hazard", main = "Hazard", xlab = "Time", ylab = "Hazard Rate")
