# R 내장 anscombe 자료: 네 쌍 (x1,y1) ... (x4,y4), 각 11개 관측값
Stat = function(k) {
  x = anscombe[[paste0("x", k)]]
  y = anscombe[[paste0("y", k)]]
  r1 = lm(y ~ x)
  c("mean.x" = mean(x), "var.x" = var(x),      # 평균 x, 표본분산 x
    "mean.y" = mean(y), "var.y" = var(y),      # 평균 y, 표본분산 y
    "cor" = cor(x, y),                         # 상관계수
    "intercept" = coef(r1)[[1]], "slope" = coef(r1)[[2]],
    "R.squared" = summary(r1)$r.squared)       # 결정계수
}
Res = sapply(1:4, Stat)                        # 열 = 자료 1~4
colnames(Res) = paste0("data", 1:4)
round(Res, 3)   # 여덟 개 요약통계량이 네 자료에서 사실상 같다
