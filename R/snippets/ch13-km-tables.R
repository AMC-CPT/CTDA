s1 <- summary(r1)
n1 <- 5;  n2 <- 7   # test, control 군
d0 <- data.frame(time = s1$time, n.risk = s1$n.risk, n.event = s1$n.event)
d2 <- d0[1:n2, ]
d1 <- d0[(n2 + 1):(n2 + n1), ];  d1
