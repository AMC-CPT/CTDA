STEP <- "EST"
OBJ0(rep(0.1, nPara))                       # 141.3076 at the starting values
r0 <- optim(rep(0.1, nPara), OBJ0, method = "L-BFGS-B")   # minimize the 11 UCPs (~2 s)
OBJ0(r0$par)                                # final OFV 57.32106
r1 <- s2o(r0$par);  r1                       # back to THETA/OMEGA/SIGMA
