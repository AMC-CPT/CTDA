OBJ1 <- function(p) {              # 정확한 FOCE-I 목적함수
  if (STEP == "EST") { r <- s2o(p); THETA <<- r$THETA; OM <- r$OMEGA; SG <<- r$SIGMA }
  else               { THETA <<- p[1:nTheta]; OM <- ltv2mat(p[iOM]); SG <<- diag(p[iSG]) }
  invOM <<- solve(OM)
  Term3 <- determinant(OM, logarithm = TRUE)$modulus[[1]]      # log|OMEGA|
  for (i in 1:nID) {
    cID <<- IDs[i]
    Res <- optim(EBE[i, 2:(nEta + 1)], ObjEta, method = "BFGS")   # <-- 내부 EBE 탐색
    FGH <- PRED(THETA, Res$par)
    Gi <- FGH[, GNames, drop = FALSE];  Hi <- FGH[, HNames, drop = FALSE]
    Vi <- diag(Hi %*% SG %*% t(Hi))
    Hsum <- invOM + t(Gi) %*% solve(diag(Vi)) %*% Gi             # 1차 곡률 항
    EBE[i, 2:(1 + nEta)] <<- Res$par
    EBE[i, (2 + nEta)]   <<- Res$value + Term3 +
                             determinant(Hsum, logarithm = TRUE)$modulus[[1]]
  }
  sum(EBE[, 5])
}
STEP <- "EST"
r0 <- optim(r0$par[1:nPara], OBJ1, method = "L-BFGS-B")   # 내부 EBE 탐색까지 (~2분)
OBJ1(r0$par)                                # 최종 OFV 92.21562
r1 <- s2o(r0$par);  r1                       # THETA/OMEGA/SIGMA 로 복원
