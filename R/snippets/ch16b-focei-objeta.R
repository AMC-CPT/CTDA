ObjEta <- function(ETA) {          # q_i(eta): 데이터 부적합 + 사전분포 벌점
  FGH <- PRED(THETA, ETA)
  Hi <- FGH[, HNames, drop = FALSE]              # FOCE-I는 항상 INTER: 현재 ETA에서 H
  Ri <- DATA[DATA$ID == cID, "DV"] - FGH[, "F"]
  Vi <- diag(Hi %*% SG %*% t(Hi))
  sum(log(Vi) + Ri*Ri/Vi) + t(ETA) %*% invOM %*% ETA
}
EBE <- cbind(ID = IDs, ETA1 = 0, ETA2 = 0, ETA3 = 0, Oi = 0)   # 지속 유지되는 전역 행렬
