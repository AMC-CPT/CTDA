# OBJ2: FOCE-I의 OBJ1과 동일하되, 곡률(Hsum)만 정확한 2계 항으로 교체
Hsum <- invOM
for (j in 1:length(TIME)) {
  Dij <- matrix(c(D11[j],D21[j],D31[j], D21[j],D22[j],D32[j], D31[j],D32[j],D33[j]), nrow = nEta)
  Hsum <- Hsum + (Gi[j, ] %*% t(Gi[j, ]) - (Yi[j] - Fi[j])*Dij)/Vi[j]   # 정확한 Hessian
}
