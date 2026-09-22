ObjEta <- function(ETAi) {
# external variables: e$INTER, e$DATAi, e$THETA, e$invOM, e$SG, e$nEta, e$HNames
# external function: e$PRED
  FGHDi <- e$PRED(e$THETA, ETAi, e$DATAi)
  Ri    <- e$DATAi[, "DV"] - FGHDi[, "F"]
  if (e$INTER == TRUE) {
    Hi <- FGHDi[, e$HNames, drop = FALSE]
  } else {
    FGHD0 <- e$PRED(e$THETA, rep(0, e$nEta), e$DATAi)
    Hi <- FGHD0[, e$HNames, drop = FALSE]
  }
  Vi <- diag(Hi %*% e$SG %*% t(Hi))
  sum(log(Vi) + Ri*Ri/Vi) + t(ETAi) %*% e$invOM %*% ETAi
}
