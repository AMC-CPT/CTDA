r3b <- nlr(Pred3, d5b, IE = c(200, 0.15, 100, 0.1), LB = c(0, 0, 0, -0.1),
           pNames = c("Emax", "EC50", "Effect1", "Effect2"), Error = "P")
r3b                                 # proportional error
r3c <- nlr(Pred3, d5b, IE = c(200, 0.15, 100, 0.1), LB = c(0, 0, 0, -0.1),
           pNames = c("Emax", "EC50", "Effect1", "Effect2"), Error = "C")
r3c                                 # combined error
r3d <- nlr(Pred3, d5b, IE = c(200, 0.15, 100, 0.1), LB = c(0, 0, 0, -0.1),
           pNames = c("Emax", "EC50", "Effect1", "Effect2"), Error = "Pois")
r3d                                 # quasi-Poisson error
