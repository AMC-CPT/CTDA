DesclVar <- function(mUCP, mSCL) {          # ScaleVar의 역: UCP -> L%*%t(L) (양정치 보장)
  nRow <- dim(mUCP)[1];  maT <- matrix(nrow = nRow, ncol = nRow)
  for (i in 1:nRow) for (j in 1:nRow) {
    if (i == j)      maT[i, j] <- exp(mUCP[i, j]) * mSCL[i, j]   # 대각: exp()
    else if (i > j)  maT[i, j] <- mUCP[i, j] * mSCL[i, j]        # 하삼각: 선형
    else             maT[i, j] <- 0                              # 상삼각: 0
  }
  maT %*% t(maT)
}
DesclVar(matrix(rep(0.1, nEta*nEta), nrow = nEta), OMscl)   # OM0 복원
DesclVar(diag(rep(0.1, nEps)), SGscl)                       # SG0 복원
