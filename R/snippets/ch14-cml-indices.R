ind <- list();  Vi <- list();  iVi <- list()
iRec <- vector(length = nID)
for (i in 1:nID) {
  ind[[i]]  <- Orthodont$Subject == IDs[i]
  iRec[i]   <- sum(ind[[i]])
  Vi[[i]]   <- matrix(NA, nrow = iRec[i], ncol = iRec[i])
  iVi[[i]]  <- matrix(NA, nrow = iRec[i], ncol = iRec[i])
}
bi <- matrix(nrow = nID, ncol = ncol(Z));  rownames(bi) <- IDs   # EBE 저장
Oi <- rep(NA, nID)                                               # 개체별 OFV
