par(mfrow = c(1, 2))
plot(DV ~ Dose, d5)            # hyperbolic
plot(DV ~ Dose, d5, log = "x") # sigmoid on the log axis
