r3 <- Sim3(1, 2, 1, 2, 2000, 0.3, 0.5)
print(cbind(r3$coveXY, NA, r3$coveXYt), na.print = "")
print(cbind(r3$coreXY, NA, r3$coreXYt), na.print = "")
r3$r
