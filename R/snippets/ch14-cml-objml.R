ObjML <- function(TH) {
  eTH <- exp(TH)
  rho <- (eTH[3] - 1)/(eTH[3] + 1)
  Cov <- rho*eTH[1]*eTH[2]
  OM  <- matrix(c(eTH[1]*eTH[1], Cov, Cov, eTH[2]*eTH[2]), nrow = 2)  # G matrix
  SG  <- eTH[4]*eTH[4]                                                # R matrix

  for (i in 1:nID) {
    Zi <- Z[ind[[i]], ]
    Vi[[i]]  <<- Zi %*% OM %*% t(Zi) + diag(SG, nrow = iRec[i])
    iVi[[i]] <<- solve(Vi[[i]])
  }
  S1 <- matrix(0, 2, 2);  S2 <- matrix(0, 2, 1)
  for (i in 1:nID) {
    XiV <- t(X[ind[[i]], ]) %*% iVi[[i]]
    S1 <- S1 + XiV %*% X[ind[[i]], ]
    S2 <- S2 + XiV %*% Y[ind[[i]]]
  }
  FIM  <<- S1                 # Davidian p78 eq 3.15
  Beta <<- solve(S1) %*% S2   # Davidian p78 eq 3.13
  for (i in 1:nID) {
    qi  <- Y[ind[[i]]] - X[ind[[i]], ] %*% Beta
    iVq <- iVi[[i]] %*% qi
    bi[i, ] <<- OM %*% t(Z[ind[[i]], ]) %*% iVq
    Oi[i]   <<- determinant(Vi[[i]], logarithm = TRUE)$modulus[[1]] + t(qi) %*% iVq
  }
  (nRec*log(2*pi) + sum(Oi))/2   # 음의 로그가능도
}
