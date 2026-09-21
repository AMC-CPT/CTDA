Res <- data.frame(ID = IDs, Intercept = NA, age = NA)
for (i in 1:nID)
  Res[i, 2:3] <- lm(distance ~ age, Orthodont[Orthodont$Subject == IDs[i], ])$coefficients
colMeans(Res[, 2:3])                 # beta들의 모평균 벡터
cov(Res[, 2:3])                      # 분산-공분산 행렬
cor(Res[, 2:3])[2, 1]                # 상관계수
