pA <- apply(Post, 1, function(x) integrate(approxfun(B, x), minBeta, maxBeta)$value)
pB <- apply(Post, 2, function(y) integrate(approxfun(A, y), minAlpha, maxAlpha)$value)
integrate(approxfun(A, pA), minAlpha, maxAlpha)   # 정규화 전 총 부피
tVol <- mean(c(integrate(approxfun(A, pA), minAlpha, maxAlpha)$value,
             integrate(approxfun(B, pB), minBeta, maxBeta)$value));  tVol
mpA <- pA/tVol;  mpB <- pB/tVol             # 주변밀도
nPost <- Post/tVol                          # 정규화된 결합 사후밀도
