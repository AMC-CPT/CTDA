mZ <- matrix(rnorm(nV * Df), nrow = nV, ncol = Df)   # matrix of Zs
rV <- rowSums(mZ^2)                                   # sum of squares of 10 free Zs
length(rV)                                           # must equal nV
