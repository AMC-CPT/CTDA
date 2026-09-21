PRED <- function(THETA, ETA) {
# 외부 변수: DATA, cID (현재 대상자); 용량 320은 식에 직접 사용
  KA <- THETA[1]*exp(ETA[1]);  V <- THETA[2]*exp(ETA[2]);  K <- THETA[3]*exp(ETA[3])
  TIME <- DATA[DATA$ID == cID, "TIME"]
  T1 <- KA/(KA - K);  T2 <- K/(KA - K);  T3 <- 320/V*T1
  T4 <- exp(-K*TIME); T5 <- exp(-KA*TIME)
  F  <- T3*(T4 - T5)                        # 예측값
  G1 <- -F*T2 + KA*TIME*T3*T5               # dF/d eta1
  G2 <- -F                                  # dF/d eta2
  G3 <- F*T2 - K*TIME*T3*T4                 # dF/d eta3
  H1 <- F                                   # dY/d eps1 (비례오차)
  H2 <- 1                                   # dY/d eps2 (가법오차)
  cbind(F, G1, G2, G3, H1, H2)
}
