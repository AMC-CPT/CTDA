par(mfrow = c(1, 2))
plot(tmed, t1$surv, type = "o", xlab = "Time (month)", ylab = "Survival Probability",
     cex.axis = 0.8, cex.lab = 0.8)
plot(tmed, t1$hazard, type = "o", xlab = "Time (month)", ylab = "Hazard Rate",
     cex.axis = 0.8, cex.lab = 0.8)
