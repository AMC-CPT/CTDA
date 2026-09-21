STEP <- "EST"
OBJ0(rep(0.1, nPara))                       # 시작값에서 141.3076
r0 <- optim(rep(0.1, nPara), OBJ0, method = "L-BFGS-B")   # 11개 UCP 최소화 (~2초)
OBJ0(r0$par)                                # 최종 OFV 57.32106
r1 <- s2o(r0$par);  r1                       # THETA/OMEGA/SIGMA 로 복원
