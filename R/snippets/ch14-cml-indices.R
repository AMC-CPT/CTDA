ind <- list();  Vi <- list();  iVi <- list()
iRec <- vector(length = nID)
for (i in 1:nID) {
  ind[[i]]  <- Orthodont$Subject == IDs[i]
  iRec[i]   <- sum(ind[[i]])
  Vi[[i]]   <- matrix(NA, nrow = iRec[i], ncol = iRec[i])
  iVi[[i]]  <- matrix(NA, nrow = iRec[i], ncol = iRec[i])
}
bi <- matrix(nrow = nID, ncol = ncol(Z));  rownames(bi) <- IDs   # stores the EBEs
Oi <- rep(NA, nID)                                               # per-subject OFV
