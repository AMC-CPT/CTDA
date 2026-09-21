# 이항자료: n = 10 명 중 x = 2 명에서 반응이 관찰되었다.
n = 10 ;  x = 2
phat = x/n                            # 최대가능도추정값
phat

# 상대가능도 L(p)/L(phat). 로그 스케일로 계산하여 수치적으로 안정하게 한다.
LL = function(p) x*log(p) + (n - x)*log(1 - p)
RL = function(p) exp(LL(p) - LL(phat))

k = 1/15                              # Fisher 가 제안한 절단값
Root = function(lo, hi) uniroot(function(p) RL(p) - k, c(lo, hi),
                                tol = 1e-12)$root
LI = c(lower = Root(1e-10, phat), upper = Root(phat, 1 - 1e-10))
LI            # 1/15 가능도구간: phat 을 중심으로 비대칭이다

SE = sqrt(phat*(1 - phat)/n)
Wald = c(lower = phat - 1.96*SE, upper = phat + 1.96*SE)
Wald          # 대칭 Wald 신뢰구간: 하한이 음수, 즉 모수 정의역을 벗어난다
