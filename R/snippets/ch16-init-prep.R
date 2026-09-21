nTheta <- 3;  nEta <- 3;  nEps <- 2
THETAinit <- c(2, 50, 0.1)
OMinit <- matrix(c(0.2, 0.1, 0.1,  0.1, 0.2, 0.1,  0.1, 0.1, 0.2), nrow = nEta)
SGinit <- diag(c(0.1, 0.1))
LB <- rep(0, nTheta);  UB <- rep(1000000, nTheta)   # lower/upper bound

# 예측함수의 1차(G) 및 2차(D) 편미분을 기호미분으로 준비
FGD <- deriv(~ DOSE/(TH2*exp(ETA2))*TH1*exp(ETA1)/(TH1*exp(ETA1) - TH3*exp(ETA3))*
               (exp(-TH3*exp(ETA3)*TIME) - exp(-TH1*exp(ETA1)*TIME)),
             c("ETA1", "ETA2", "ETA3"),
             function.arg = c("TH1", "TH2", "TH3", "ETA1", "ETA2", "ETA3", "DOSE", "TIME"),
             func = TRUE, hessian = TRUE)
H <- deriv(~ F + F*EPS1 + EPS2, c("EPS1", "EPS2"),
           function.arg = c("F", "EPS1", "EPS2"), func = TRUE)

PRED <- function(THETA, ETA, DATAi) {
  FGDres <- FGD(THETA[1], THETA[2], THETA[3], ETA[1], ETA[2], ETA[3], DOSE = 320, DATAi[, "TIME"])
  Gres <- attr(FGDres, "gradient")
  Hres <- attr(H(FGDres, 0, 0), "gradient")
  if (e$METHOD == "LAPL") {
    Dres <- attr(FGDres, "hessian")
    Res <- cbind(FGDres, Gres, Hres, Dres[,1,1], Dres[,2,1], Dres[,2,2], Dres[,3,])
    colnames(Res) <- c("F","G1","G2","G3","H1","H2","D11","D21","D22","D31","D32","D33")
  } else {
    Res <- cbind(FGDres, Gres, Hres)
    colnames(Res) <- c("F", "G1", "G2", "G3", "H1", "H2")
  }
  Res
}
