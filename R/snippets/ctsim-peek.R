# 절반 시점과 종료 시점에 각각 검정하여 '둘 중 하나라도 유의'하면 기각 (경계 보정 없음)
simPeek <- function(n, delta = 0) {
  x <- rnorm(n, 0, 1);  y <- rnorm(n, delta, 1)
  h  <- n %/% 2                                # 중간분석 시점(절반)
  p1 <- t.test(x[1:h], y[1:h])$p.value         # 전반부 자료
  p2 <- t.test(x,      y)$p.value              # 전체 자료
  (p1 < 0.05) | (p2 < 0.05)
}
mean(replicate(10000, simPeek(64)))            # 부풀려진 제1종 오류율
