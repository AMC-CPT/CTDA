cEBE  <- EBE[EBE[, "ID"] == cID, 2:(nEta + 1)]
FGH1  <- PRED(THETA, cEBE)                       # 개별: eta = EBE
F1i <- FGH1[, "F"];  G1i <- FGH1[, GNames, drop = FALSE];  H1i <- FGH1[, HNames, drop = FALSE]
R1i <- DATA[DATA$ID == cID, "DV"] - F1i
C1i <- G1i %*% OM %*% t(G1i) + diag(diag(H1i %*% SG %*% t(H1i)))
CWRES <- SqrtInvCov(C1i) %*% (R1i + G1i %*% cEBE)   # 조건부 가중 잔차
