n <- 20
id0 <- sample(1:5200, n)
t.test(d2$Grip[id0], d2$GripD[id0])
t.test(d2$Grip[id0], d2$GripD[id0], paired = TRUE)
