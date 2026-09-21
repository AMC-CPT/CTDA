mZ <- matrix(rnorm(nV * Df), nrow = nV, ncol = Df)   # Z 들의 행렬
rV <- rowSums(mZ^2)                                   # 자유로운 10개 Z 의 제곱합
length(rV)                                           # nV 와 같아야 함
