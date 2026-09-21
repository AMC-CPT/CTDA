p1 <- exp(STP - alpha)
p2 <- p1/(p1 + 1)*(UB - LB) + LB   # p2가 원래 척도의 파라미터, STP는 변환된 파라미터(UCP)
