# OBJ2: same as OBJ1 of FOCE-I, but the curvature (Hsum) uses the exact 2nd-order term
Hsum <- invOM
for (j in 1:length(TIME)) {
  Dij <- matrix(c(D11[j],D21[j],D31[j], D21[j],D22[j],D32[j], D31[j],D32[j],D33[j]), nrow = nEta)
  Hsum <- Hsum + (Gi[j, ] %*% t(Gi[j, ]) - (Yi[j] - Fi[j])*Dij)/Vi[j]   # exact Hessian
}
