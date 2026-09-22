r3 <- nlr(Pred3, d5b, IE = c(200, 0.15, 100, 0.1), LB = c(0, 0, 0, -0.1),
          pNames = c("Emax", "EC50", "Effect1", "Effect2"))   # full model
r3
