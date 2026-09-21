SqrtInvCov <- function(M) {                  # 스펙트럼 분해로 M^{-1/2}
  e <- eigen(as.matrix(M))
  e$vectors %*% diag(1/sqrt(abs(e$values))) %*% t(e$vectors)
}
OM <- r1$OMEGA;  tSD <- NULL
for (i in 1:nID) {
  cID <- IDs[i]
  FGH0 <- PRED(THETA, rep(0, nEta))          # FO 표: eta = 0
  F0i <- FGH0[, "F"];  G0i <- FGH0[, GNames, drop = FALSE];  H0i <- FGH0[, HNames, drop = FALSE]
  R0i <- DATA[DATA$ID == cID, "DV"] - F0i
  C0i <- G0i %*% OM %*% t(G0i) + diag(diag(H0i %*% SG %*% t(H0i)))
  WRES <- SqrtInvCov(C0i) %*% R0i            # 가중 잔차 = C^{-1/2} r
  tSD <- rbind(tSD, cbind(DATA[DATA$ID == cID, c("ID", "TIME", "DV")],
                          PRED = F0i, RES = R0i, WRES))
}
head(tSD, 11)                                # 첫 대상자
