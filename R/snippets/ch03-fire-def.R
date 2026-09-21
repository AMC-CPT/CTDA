Fire <- function(p = 0.5, nRow = 41, nCol = 41, PLOT = TRUE) {
  mTree1 <- matrix(0, nrow = nRow, ncol = nCol)
  mTree1[median(1:nRow), median(1:nCol)] <- 1   # 0=Alive, 1=onFire, 2=Burnt
  fAlive <- (sum(mTree1 == 1) > 0)
  fireTime <- 0
  mTree2 <- mTree1
  while (fAlive) {
    for (j in 1:nRow) {
      for (k in 1:nCol) {
        if (mTree1[j, k] == 1) {
          mTree2[j, k] <- 2
          if (j < nRow) if (mTree1[j + 1, k] == 0) mTree2[j + 1, k] <- rbinom(1, 1, p)
          if (j > 1)    if (mTree1[j - 1, k] == 0) mTree2[j - 1, k] <- rbinom(1, 1, p)
          if (k < nCol) if (mTree1[j, k + 1] == 0) mTree2[j, k + 1] <- rbinom(1, 1, p)
          if (k > 1)    if (mTree1[j, k - 1] == 0) mTree2[j, k - 1] <- rbinom(1, 1, p)
        }
      }
    }
    mTree1 <- mTree2
    fireTime <- fireTime + 1
    fAlive <- (sum(mTree1 == 1) > 0)
    if (PLOT) {
      filled.contour(mTree1, nlevels = 3, col = c("green", "red", "black", "black"), axes = FALSE)
      Sys.sleep(0.1)
    }
  }
  c(burntTree = sum(mTree1 == 2), fireTime = fireTime)
}
