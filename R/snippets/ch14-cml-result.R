r1 <- optim(c(0.1, 0.1, 0.1, 0.1), ObjML, method = "L-BFGS-B", hessian = TRUE)
r1                                   # $value = 음의 로그가능도
