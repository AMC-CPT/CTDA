IE <- c(2, 50, 0.1)            # KA, V, K의 초기 추정값
LB <- rep(0, nTheta)          # 하한
UB <- rep(1e6, nTheta)        # 상한
# UCP = 0.1 이 초기 추정값으로 정확히 사상되도록 오프셋 alpha를 정한다
alpha <- 0.1 - log((IE - LB)/(UB - LB)/(1 - (IE - LB)/(UB - LB)))
p0 <- rep(0.1, nTheta)
p1 <- exp(p0 - alpha)
p2 <- p1/(p1 + 1)*(UB - LB) + LB;  p2      # c(2, 50, 0.1) 이어야 함 (온전성 점검)
