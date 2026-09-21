# 노출(x) -> biomarker(y) -> 임상 결과(z) 의 그물망을 3변량 정규분포로 모사한다.
# x-y 는 양(0.7), y-z 도 양(0.5)인데 x-z 는 음(-0.1)인 상관구조를 일부러 준다.
require(MASS)
Mu0 = c(1, 2, 3)                        # 세 변수의 모평균
Cov0 = matrix(c( 1.0,  0.7, -0.1,       # rho(x,y) =  0.7
                 0.7,  1.0,  0.5,       # rho(y,z) =  0.5
                -0.1,  0.5,  1.0),      # rho(x,z) = -0.1
              nrow = 3, byrow = TRUE,
              dimnames = list(c("x", "y", "z"), c("x", "y", "z")))
chol(Cov0)          # 오류 없이 상삼각행렬이 나온다 = 양정치 = 실재 가능한 상관구조

n = 300
d1 = mvrnorm(n, Mu0, Cov0)              # 3변량 정규 표본
colnames(d1) = c("x", "y", "z")
round(cov(d1), 3)                       # 표본 분산-공분산행렬
round(cor(d1), 3)                       # 표본상관행렬: 둘은 양, 하나는 음

# 세 쌍의 산점도. 앞의 두 관계가 양이어도 나머지 하나는 음일 수 있다.
par(mfrow = c(1, 3), mar = c(4, 4, 3, 1))
Pair = list(c("x", "y"), c("y", "z"), c("x", "z"))
Lab = c(x = "x (노출: AUC 또는 용량)", y = "y (biomarker)", z = "z (임상 결과)")
Main = c("(가) 노출 - biomarker", "(나) biomarker - 임상 결과",
         "(다) 노출 - 임상 결과")
for (i in 1:3) {
  a = Pair[[i]][1] ;  b = Pair[[i]][2]
  r1 = cor(d1[, a], d1[, b])
  plot(d1[, a], d1[, b], xlab = Lab[a], ylab = Lab[b], main = Main[i],
       pch = 1, cex = 0.7, col = "gray35")
  abline(lm(d1[, b] ~ d1[, a]), lwd = 2, col = "darkorange3")
  legend(if (r1 > 0) "topleft" else "topright", bty = "n", cex = 1.1,
         text.col = "darkorange3", legend = sprintf("r = %+.3f", r1))
}
