r2 <- optim(c(0.1, 0.1, 0.1, 0.1), ObjREML, method = "L-BFGS-B", hessian = TRUE)
r2
