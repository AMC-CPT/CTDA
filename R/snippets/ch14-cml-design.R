Y <- Orthodont[, "distance"]
X <- model.matrix(distance ~ age, Orthodont)
Z <- X
head(X)
nParF <- ncol(X)                    # 고정효과 beta 개수
nEta  <- ncol(Z)                    # G matrix 원소를 이루는 임의효과 수
nEps  <- 1                          # sigma (R matrix) 1개
nParR <- nEta*(nEta + 1)/2 + nEps   # 임의효과 파라미터 수
nParA <- nParF + nParR              # 전체 파라미터 수
c(nParF = nParF, nParR = nParR, nParA = nParA)
