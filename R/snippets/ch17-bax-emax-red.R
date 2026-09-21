Pred <- function(TH) {              # Gamma를 제외한 Emax 모형
  Dose <- e$DATA[, "Dose"]
  E0 <- TH[1];  Emax <- TH[2];  ED50 <- TH[3]
  E0 + Emax*Dose/(ED50 + Dose)
}
r6b <- nlr(Pred, d6, pNames = c("E0", "Emax", "ED50"),
           IE = c(-10, -30, 1.5), LB = c(-1e6, -1e6, 0), UB = c(0, 0, 100))
r6b
e6b <- EnvObj(envir = e)
