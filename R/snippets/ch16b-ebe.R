ObjEta <- function(ETA) {                    # MAP 목적함수: 데이터 부적합 + 사전분포 벌점
  FGH <- PRED(THETA, ETA)
  Ri <- DATA[DATA$ID == cID, "DV"] - FGH[, "F"]
  if (INTER == TRUE) Hi <- FGH[, HNames, drop = FALSE]
  else               Hi <- PRED(THETA, rep(0, nEta))[, HNames, drop = FALSE]  # eta=0
  Vi <- diag(Hi %*% SG %*% t(Hi))
  sum(log(Vi) + Ri*Ri/Vi) + t(ETA) %*% invOM %*% ETA
}
INTER <- FALSE                               # FO는 교호작용 없음
THETA <- r1$THETA;  invOM <- solve(r1$OMEGA);  SG <- r1$SIGMA
EBE <- cbind(ID = IDs, ETA1 = 0, ETA2 = 0, ETA3 = 0)
for (i in 1:nID) {
  cID <<- IDs[i]
  EBE[i, 2:(nEta + 1)] <- optim(rep(0, nEta), ObjEta, method = "BFGS")$par
}
EBE
