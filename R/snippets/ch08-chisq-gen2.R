mZ2 <- mZ
mZ2[, 10] <- -rowSums(mZ[, 1:(Df - 1)]) / (Df - 1)   # 10번째 Z 를 제약
rV2 <- rowSums(mZ2^2)                                # 9개 자유 + 1개 종속 Z
