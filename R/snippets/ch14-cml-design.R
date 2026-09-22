Y <- Orthodont[, "distance"]
X <- model.matrix(distance ~ age, Orthodont)
Z <- X
head(X)
nParF <- ncol(X)                    # number of fixed-effect betas
nEta  <- ncol(Z)                    # random effects forming the G matrix
nEps  <- 1                          # one sigma (R matrix)
nParR <- nEta*(nEta + 1)/2 + nEps   # number of random-effect parameters
nParA <- nParF + nParR              # total number of parameters
c(nParF = nParF, nParR = nParR, nParA = nParA)
