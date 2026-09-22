Pred <- function(TH) {              # Emax structural model
  Dose <- e$DATA[, "Dose"]
  Emax <- TH[1];  ED50 <- TH[2]
  Emax*Dose/(ED50 + Dose)
}
require(wnl)
r5 <- nlr(Pred, d5, c("Emax", "ED50"), c(150, 20));  r5
e5 <- EnvObj(envir = e)
