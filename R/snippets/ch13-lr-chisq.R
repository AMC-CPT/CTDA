O1 <- sum(d3$di1);  O2 <- sum(d3$di2)
E1 <- sum(d3$Ei1);  E2 <- sum(d3$Ei2)
V1 <- sum(d3$Vi1);  V2 <- sum(d3$Vi2)
Chi0 <- (O1 - E1)^2 / V1

r4 <- list()
r4$n      <- table(ovarian$rx)            # subjects per group (13, 13)
names(r4$n) <- paste0("rx=", names(r4$n))
r4$obs    <- c(O2, O1)                     # in the order rx=1 (control), rx=2 (test)
r4$exp    <- c(E2, E1)
r4$var    <- matrix(c(V1, -V1, -V2, V2), nrow = 2)
r4$chisq  <- Chi0
r4$pvalue <- 1 - pchisq(Chi0, 1)
class(r4) <- "survdiff"
r4                                       # reproduces the survdiff result
