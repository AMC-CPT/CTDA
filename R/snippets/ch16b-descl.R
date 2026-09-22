DesclVar <- function(mUCP, mSCL) {   # inverse of ScaleVar: UCP -> L%*%t(L)
  nRow <- dim(mUCP)[1];  maT <- matrix(nrow = nRow, ncol = nRow)
  for (i in 1:nRow) for (j in 1:nRow) {
    if (i == j)      maT[i, j] <- exp(mUCP[i, j]) * mSCL[i, j]   # diagonal: exp()
    else if (i > j)  maT[i, j] <- mUCP[i, j] * mSCL[i, j]   # lower triangle: linear
    else             maT[i, j] <- 0                              # upper triangle: 0
  }
  maT %*% t(maT)
}
DesclVar(matrix(rep(0.1, nEta*nEta), nrow = nEta), OMscl)   # recovers OM0
DesclVar(diag(rep(0.1, nEps)), SGscl)                       # recovers SG0
