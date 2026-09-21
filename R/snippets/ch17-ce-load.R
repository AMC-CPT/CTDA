d5b <- read.csv("data/Dose-ContResp.csv")   # conc, TRT(0=대조,1=시험), DV
Pred <- function(TH) {                       # 공통 Emax
  x <- e$DATA[, "conc"];  Emax <- TH[1];  EC50 <- TH[2]
  Emax*x/(EC50 + x)
}
Pred2 <- function(TH) {                      # Emax가 TRT에 의존
  x <- e$DATA[, "conc"];  Emax <- TH[1] + TH[3]*e$DATA[, "TRT"];  EC50 <- TH[2]
  Emax*x/(EC50 + x)
}
Pred3 <- function(TH) {                      # Emax와 EC50 모두 TRT에 의존
  x <- e$DATA[, "conc"]
  Emax <- TH[1] + TH[3]*e$DATA[, "TRT"];  EC50 <- TH[2] + TH[4]*e$DATA[, "TRT"]
  Emax*x/(EC50 + x)
}
d5c <- d5b[d5b$TRT == 1, ];  d5d <- d5b[d5b$TRT == 0, ]
