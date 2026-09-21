n <- nrow(d5b)                              # 전체 관측 수
n/2*log(1 + qf(0.95, 1, n - 5)/(n - 5))     # 델타 로그가능도 임계값
d2LL <- r2$`-2LL` - r3$`-2LL`;  d2LL        # 델타 -2LL
Fval <- (exp(d2LL/n) - 1)*(n - 5);  Fval    # F 값
1 - pf(Fval, 1, n - 5)                      # p-값
