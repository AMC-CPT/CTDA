require(meta)
e.t <- c(49, 44, 27, 102, 85, 246)       # deaths, treated
n.t <- c(615, 758, 317, 832, 810, 2267)  # total, treated
e.c <- c(67, 64, 32, 126, 52, 219)       # deaths, control
n.c <- c(624, 771, 309, 850, 406, 2257)  # total, control
r6 <- metabin(e.t, n.t, e.c, n.c)
summary(r6)
