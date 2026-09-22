OM0 <- matrix(c(0.2, 0.1, 0.1,  0.1, 0.2, 0.1,  0.1, 0.1, 0.2), nrow = nEta)
SG0 <- diag(c(0.1, 0.1))
EXPP1 <- exp(0.1)
# scales that map back to the Cholesky factor (diagonal exp, off-diagonal linear)
ScaleVar <- function(VarMat, dim1) {
  M1 <- chol(VarMat);  V1 <- diag(M1)
  M2 <- abs(10*(M1 - diag(V1, nrow = dim1))) + diag(V1/EXPP1, nrow = dim1)
  t(M2)
}
OMscl <- ScaleVar(OM0, nEta);  SGscl <- ScaleVar(SG0, nEps)
