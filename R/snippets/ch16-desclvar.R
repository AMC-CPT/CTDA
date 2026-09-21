DesclVar <- function(mUCP, mSCL) {
  nRow <- dim(mUCP)[1]
  maT <- matrix(nrow = nRow, ncol = nRow)
  for (i in 1:nRow) for (j in 1:nRow) {
    if (i == j)      maT[i,j] <- exp(mUCP[i,j]) * mSCL[i,j]
    else if (i > j)  maT[i,j] <- mUCP[i,j] * mSCL[i,j]
    else             maT[i,j] <- 0
  }
  maT %*% t(maT)
}
