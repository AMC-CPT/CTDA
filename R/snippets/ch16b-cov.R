STEP <- "COV"
p <- c(r1$THETA, r1$OMEGA[upper.tri(r1$OMEGA, diag = TRUE)], diag(r1$SIGMA))
require(numDeriv)
Rmat <- hessian(OBJ0, p)/2                  # R matrix = Hessian / 2
OiS0 <- function(p) {                        # O_i of one subject (for the S matrix)
  THETA <- p[1:nTheta]; OM <- ltv2mat(p[iOM]); SG <- diag(p[iSG])
  FGH <- PRED(THETA, rep(0, nEta))
  Fi <- FGH[, "F"]; Gi <- FGH[, GNames, drop = FALSE]; Hi <- FGH[, HNames, drop = FALSE]
  Ri <- DATA[DATA$ID == cID, "DV"] - Fi
  Ci <- Gi %*% OM %*% t(Gi) + diag(diag(Hi %*% SG %*% t(Hi)))
  determinant(Ci, logarithm = TRUE)$modulus[[1]] + t(Ri) %*% solve(Ci) %*% Ri
}
CalcSmat <- function(p) {                    # S = (1/4) sum grad(O_i) grad(O_i)'
  Smat <- matrix(0, nPara, nPara)
  for (i in 1:nID) { cID <<- IDs[i]; gr <- grad(OiS0, p); Smat <- Smat + gr %*% t(gr) }
  Smat/4
}
Smat <- CalcSmat(p)
invR <- solve(Rmat)
Cov <- invR %*% Smat %*% invR               # sandwich covariance
SE  <- sqrt(diag(Cov));  SE                  # standard errors
EigenVal <- sort(eigen(cov2cor(Cov))$values);  EigenVal   # condition-number diagnostic
