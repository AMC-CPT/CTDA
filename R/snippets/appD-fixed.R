wi0 <- e.c*n.t/(n.t + n.c)                 # Mantel-Haenszel 가중치
pwi <- wi0/sum(wi0)*100;  pwi              # % (metabin 출력과 비교)
Vi <- r9$SElog^2;  wi <- 1/Vi              # 역분산(inverse variance) 가중치
sumwi <- sum(wi)
th.hat <- sum(wi*thi)/sumwi;  th.hat       # 고정효과 점추정 (log scale)
seth.hat <- sqrt(1/sumwi);  seth.hat
exp(th.hat)                                # 원척도 RR
exp(th.hat + c(-1, 1)*1.96*seth.hat)       # 95% 신뢰구간
