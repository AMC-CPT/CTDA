pA <- apply(Post, 1, function(x) integrate(approxfun(B, x), minBeta, maxBeta)$value)
pB <- apply(Post, 2, function(y) integrate(approxfun(A, y), minAlpha, maxAlpha)$value)
integrate(approxfun(A, pA), minAlpha, maxAlpha)   # total volume before normalization
tVol <- mean(c(integrate(approxfun(A, pA), minAlpha, maxAlpha)$value,
             integrate(approxfun(B, pB), minBeta, maxBeta)$value));  tVol
mpA <- pA/tVol;  mpB <- pB/tVol             # marginal densities
nPost <- Post/tVol                          # normalized joint posterior
