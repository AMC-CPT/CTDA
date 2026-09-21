ScaleVar <- function(VarMat, dim1) {
  M1 <- chol(VarMat)
  V1 <- diag(M1)
  M2 <- abs(10*(M1 - diag(V1, nrow = dim1))) + diag(V1/exp(0.1), nrow = dim1)
  t(M2)
}
