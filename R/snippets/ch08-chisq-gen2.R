mZ2 <- mZ
mZ2[, 10] <- -rowSums(mZ[, 1:(Df - 1)]) / (Df - 1)   # constrain the 10th Z
rV2 <- rowSums(mZ2^2)                                # 9 free + 1 dependent Z
