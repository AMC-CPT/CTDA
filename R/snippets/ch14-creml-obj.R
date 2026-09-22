ObjREML <- function(TH) {
  eTH <- exp(TH)
  rho <- (eTH[3] - 1)/(eTH[3] + 1)
  Cov <- rho*eTH[1]*eTH[2]
  OM  <- matrix(c(eTH[1]*eTH[1], Cov, Cov, eTH[2]*eTH[2]), nrow = 2)
  SG  <- eTH[4]*eTH[4]

  for (i in 1:nID) {
    Zi <- Z[ind[[i]], ]
    Vi[[i]]  <<- Zi %*% OM %*% t(Zi) + diag(SG, nrow = iRec[i])
    iVi[[i]] <<- solve(Vi[[i]])
  }
  S1 <- matrix(0, 2, 2);  S2 <- matrix(0, 2, 1);  S3 <- 0
  for (i in 1:nID) {
    XiV <- t(X[ind[[i]], ]) %*% iVi[[i]]
    S1 <- S1 + XiV %*% X[ind[[i]], ]
    S2 <- S2 + XiV %*% Y[ind[[i]]]
    S3 <- S3 + determinant(Vi[[i]], logarithm = TRUE)$modulus[[1]]
  }
  FIM  <<- S1;  Beta <<- solve(S1) %*% S2
  S4 <- 0
  for (i in 1:nID) {
    qi  <- Y[ind[[i]]] - X[ind[[i]], ] %*% Beta
    iVq <- iVi[[i]] %*% qi
    bi[i, ] <<- OM %*% t(Z[ind[[i]], ]) %*% iVq
    S4 <- S4 + t(qi) %*% iVq
  }
  S0 <- (nRec - nParF)*log(2*pi)   # constant term (differs from ML)
  (S0 + S3 + S4 + determinant(S1, logarithm = TRUE)$modulus[[1]])/2 # -logLik
}
