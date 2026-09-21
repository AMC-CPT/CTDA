r2 <- Sim2(a0 = 1, a1 = 2, x1min = 0, x1max = 1, nSim = 20000, sig1 = 0.5)
print(cbind(r2$coveXY, NA, r2$coveXYt), na.print = "")
print(cbind(r2$coreXY, NA, r2$coreXYt), na.print = "")
r2$r
