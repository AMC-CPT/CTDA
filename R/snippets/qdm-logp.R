# 45개 약물의 LogP(분배계수)와 경구 생체이용률 F
d = read.csv("data/LogP-F.csv")
nrow(d)
cor(d$LogP, d$F)             # 두 변수의 상관계수: 거의 0 에 가깝다

Opt = d$LogP > 0 & d$LogP < 3                     # 교과서가 말하는 최적 구간
c(n.in = sum(Opt), n.out = sum(!Opt))             # 구간 안/밖의 약물 수
t1 = t.test(d$F[Opt], d$F[!Opt])                  # Welch t 검정
c(F.in = t1$estimate[[1]], F.out = t1$estimate[[2]],
  p.value = t1$p.value)      # 평균 F 는 구간 안팎에서 구별되지 않는다
