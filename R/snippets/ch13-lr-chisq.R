O1 <- sum(d3$di1);  O2 <- sum(d3$di2)
E1 <- sum(d3$Ei1);  E2 <- sum(d3$Ei2)
V1 <- sum(d3$Vi1);  V2 <- sum(d3$Vi2)
Chi0 <- (O1 - E1)^2 / V1

r4 <- list()
r4$n      <- table(ovarian$rx)            # 각 군의 대상자 수 (13, 13)
names(r4$n) <- paste0("rx=", names(r4$n))
r4$obs    <- c(O2, O1)                     # rx=1(대조), rx=2(시험) 순서로
r4$exp    <- c(E2, E1)
r4$var    <- matrix(c(V1, -V1, -V2, V2), nrow = 2)
r4$chisq  <- Chi0
r4$pvalue <- 1 - pchisq(Chi0, 1)
class(r4) <- "survdiff"
r4                                       # survdiff 결과를 재현
