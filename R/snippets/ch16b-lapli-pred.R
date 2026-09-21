PRED <- function(THETA, ETA) {
  FGDres <- FGD(THETA[1], THETA[2], THETA[3], ETA[1], ETA[2], ETA[3],
                DOSE = 320, DATA[DATA$ID == cID, "TIME"])
  Gres <- attr(FGDres, "gradient")
  Hres <- attr(H(FGDres, 0, 0), "gradient")
  Dres <- attr(FGDres, "hessian")               # 3x3x3 2계 도함수
  Res <- cbind(FGDres, Gres, Hres, Dres[,1,1], Dres[,2,1], Dres[,2,2], Dres[,3,])
  colnames(Res) <- c("F","G1","G2","G3","H1","H2","D11","D21","D22","D31","D32","D33")
  Res
}
