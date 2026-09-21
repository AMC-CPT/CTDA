# 등고선 값 라벨은 좁은 패널에서 서로 겹치고 뒤집혀 읽히므로 끄고, 등고선 수도 줄인다.
oPar <- par(mfrow = c(1, 2))
contour(A, B, Pri,   xlab = expression(beta[0]), ylab = expression(beta[1]),
        main = "Joint Prior",     nlevels = 8, drawlabels = FALSE)
contour(A, B, nPost, xlab = expression(beta[0]), ylab = expression(beta[1]),
        main = "Joint Posterior", nlevels = 8, drawlabels = FALSE)
par(oPar)
