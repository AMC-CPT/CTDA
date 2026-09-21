sampMeans <- c(mean(x), mean(y))                 # 표본평균
PE <- sampMeans[1] - sampMeans[2]                # 차이의 점추정
ns <- c(length(x), length(y))                    # 표본크기
vars <- c(var(x), var(y)) / ns                   # 표본평균 분산의 추정값
SE <- sqrt(sum(vars))                            # 표준오차
nullHypo <- 0                                    # 귀무가설하의 차이
t.val <- (PE - nullHypo) / SE;  t.val            # t 값
dfs <- ns - 1                                    # 각 표본평균의 자유도
Df <- sum(vars)^2 / sum(vars^2 / dfs);  Df       # Satterthwaite 자유도
p.val <- 2 * pt(-abs(t.val), Df)                 # p 값
alpha <- 0.05                                    # 유의수준
ci <- PE + c(-1, 1) * qt(1 - alpha/2, Df) * SE;  ci   # 신뢰구간
