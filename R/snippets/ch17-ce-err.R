r3b <- nlr(Pred3, d5b, IE = c(200, 0.15, 100, 0.1), LB = c(0, 0, 0, -0.1),
           pNames = c("Emax", "EC50", "Effect1", "Effect2"), Error = "P");  r3b  # 비례오차
r3c <- nlr(Pred3, d5b, IE = c(200, 0.15, 100, 0.1), LB = c(0, 0, 0, -0.1),
           pNames = c("Emax", "EC50", "Effect1", "Effect2"), Error = "C");  r3c  # 결합오차
r3d <- nlr(Pred3, d5b, IE = c(200, 0.15, 100, 0.1), LB = c(0, 0, 0, -0.1),
           pNames = c("Emax", "EC50", "Effect1", "Effect2"), Error = "Pois");  r3d # 유사포아송
