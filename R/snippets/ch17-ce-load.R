d5b <- read.csv("data/Dose-ContResp.csv")   # conc, TRT (0=control, 1=test), DV
Pred <- function(TH) {                       # common Emax
  x <- e$DATA[, "conc"];  Emax <- TH[1];  EC50 <- TH[2]
  Emax*x/(EC50 + x)
}
Pred2 <- function(TH) {                      # Emax depends on TRT
  x <- e$DATA[, "conc"];  Emax <- TH[1] + TH[3]*e$DATA[, "TRT"];  EC50 <- TH[2]
  Emax*x/(EC50 + x)
}
Pred3 <- function(TH) {                      # both Emax and EC50 depend on TRT
  x <- e$DATA[, "conc"]
  Emax <- TH[1] + TH[3]*e$DATA[, "TRT"];  EC50 <- TH[2] + TH[4]*e$DATA[, "TRT"]
  Emax*x/(EC50 + x)
}
d5c <- d5b[d5b$TRT == 1, ];  d5d <- d5b[d5b$TRT == 0, ]
