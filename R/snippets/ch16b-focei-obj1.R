OBJ1 <- function(p) {              # the exact FOCE-I objective function
  if (STEP == "EST") { r <- s2o(p); THETA <<- r$THETA; OM <- r$OMEGA; SG <<- r$SIGMA }
  else               { THETA <<- p[1:nTheta]; OM <- ltv2mat(p[iOM]); SG <<- diag(p[iSG]) }
  invOM <<- solve(OM)
  Term3 <- determinant(OM, logarithm = TRUE)$modulus[[1]]      # log|OMEGA|
  for (i in 1:nID) {
    cID <<- IDs[i]
    Res <- optim(EBE[i, 2:(nEta + 1)], ObjEta, method = "BFGS")   # <-- inner EBE search
    FGH <- PRED(THETA, Res$par)
    Gi <- FGH[, GNames, drop = FALSE];  Hi <- FGH[, HNames, drop = FALSE]
    Vi <- diag(Hi %*% SG %*% t(Hi))
    Hsum <- invOM + t(Gi) %*% solve(diag(Vi)) %*% Gi   # first-order curvature
    EBE[i, 2:(1 + nEta)] <<- Res$par
    EBE[i, (2 + nEta)]   <<- Res$value + Term3 +
                             determinant(Hsum, logarithm = TRUE)$modulus[[1]]
  }
  sum(EBE[, 5])
}
STEP <- "EST"
r0 <- optim(r0$par[1:nPara], OBJ1, method = "L-BFGS-B") # inner EBE search too (~2 min)
OBJ1(r0$par)                                # final OFV 92.21562
r1 <- s2o(r0$par);  r1                       # back to THETA/OMEGA/SIGMA
