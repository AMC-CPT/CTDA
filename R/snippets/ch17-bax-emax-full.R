Pred <- function(TH) {              # Sigmoid Emax 구조 모형
  Dose <- e$DATA[, "Dose"]
  E0 <- TH[1];  Emax <- TH[2];  ED50 <- TH[3];  Gamm <- TH[4]
  E0 + Emax*Dose^Gamm/(ED50^Gamm + Dose^Gamm)
}
require(wnl)
r6a <- nlr(Pred, d6, pNames = c("E0", "Emax", "ED50", "Gamma"),
           IE = c(-10, -30, 1.5, 1), LB = c(-1e6, -1e6, 0, 0), UB = c(0, 0, 100, 10))
r6a
