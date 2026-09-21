t.test(d2$Grip[1:20], d2$GripD[1:20])                # independent
t.test(d2$Grip[1:20], d2$GripD[1:20], paired = TRUE) # paired
