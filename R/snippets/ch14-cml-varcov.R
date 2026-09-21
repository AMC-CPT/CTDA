Cov <- rho*SDs[1]*SDs[2]
OM  <- matrix(c(SDs[1]*SDs[1], Cov, Cov, SDs[2]*SDs[2]), nrow = 2);  OM   # G matrix
SG  <- SDs[3]*SDs[3];  SG                                                # R matrix
Z[ind[[1]], ] %*% OM %*% t(Z[ind[[1]], ]) + diag(nrow(Z[ind[[1]], ]))*SG # V matrix
