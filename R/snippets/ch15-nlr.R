DOSE <- 320                      # mg
TIME <- d2[, "TIME"]
fPK <- function(THETA) {         # 예측함수 (구조 모형)
  K  <- THETA[1]
  Ka <- THETA[2]
  V  <- THETA[3]
  DOSE/V*Ka/(Ka - K)*(exp(-K*TIME) - exp(-Ka*TIME))
}
r1 <- nlr(fPK, d2, pNames = c("k", "ka", "V"), IE = c(0.1, 3, 500),
          SecNames = c("CL", "Thalf", "MRT"), SecForms = c(~ V*k, ~ log(2)/k, ~ 1/k))
r1
