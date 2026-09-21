library(KMsurv)
tis    <- c(0, 2, 3, 5, 7, 11, 17, 25, 37, 53, NA)   # length 11
nsubs  <- c(927, 848, 774, 649, 565, 449, 296, 186, 112, 27)  # length 10
nlost  <- c(2, 3, 6, 9, 7, 5, 3, rep(0, 3))
nevent <- c(77, 71, 119, 75, 109, 148, 107, 74, 85, 27)
t1 <- lifetab(tis, nsubs[1], nlost, nevent)
t1
