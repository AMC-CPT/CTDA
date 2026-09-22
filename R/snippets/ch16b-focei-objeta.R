ObjEta <- function(ETA) {          # q_i(eta): misfit to data + prior penalty
  FGH <- PRED(THETA, ETA)
  Hi <- FGH[, HNames, drop = FALSE]   # FOCE-I is always INTER: H at ETA
  Ri <- DATA[DATA$ID == cID, "DV"] - FGH[, "F"]
  Vi <- diag(Hi %*% SG %*% t(Hi))
  sum(log(Vi) + Ri*Ri/Vi) + t(ETA) %*% invOM %*% ETA
}
EBE <- cbind(ID = IDs, ETA1 = 0, ETA2 = 0, ETA3 = 0, Oi = 0) # persistent global
