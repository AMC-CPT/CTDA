par(mfrow = c(1, 2))
plot(DV ~ Dose, d5)            # 쌍곡선형(hyperbolic)
plot(DV ~ Dose, d5, log = "x") # 로그축에서 sigmoid
