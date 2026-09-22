OBJ0 <- function(p) {
  if (STEP == "EST") { r <- s2o(p); THETA <- r$THETA; OM <- r$OMEGA; SG <- r$SIGMA }
  else               { THETA <- p[1:nTheta]; OM <- ltv2mat(p[iOM]); SG <- diag(p[iSG]) }
  Oi <- vector(length = nID)
  for (i in 1:nID) {
    cID <<- IDs[i]
    FGH <- PRED(THETA, rep(0, nEta))        # FO: evaluated at eta = 0
    Yi <- DATA[DATA$ID == cID, "DV"];  Fi <- FGH[, "F"]
    Gi <- FGH[, GNames, drop = FALSE];  Hi <- FGH[, HNames, drop = FALSE]
    Ri <- Yi - Fi
    Ci <- Gi %*% OM %*% t(Gi) + diag(diag(Hi %*% SG %*% t(Hi)))
    Oi[i] <- determinant(Ci, logarithm = TRUE)$modulus[[1]] + t(Ri) %*% solve(Ci) %*% Ri
  }
  sum(Oi)
}
