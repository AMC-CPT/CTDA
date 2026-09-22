ltv2mat <- function(vec) {   # lower-triangular vector -> symmetric matrix
  L <- length(vec);  D <- round((sqrt(8*L + 1) - 1)/2, 0)
  if (D*(D + 1)/2 != L) return(NULL)
  mat <- matrix(nrow = D, ncol = D)
  for (m in 1:D) for (n in 1:D) { k <- max(m,n); l <- min(m,n); mat[m,n] <- vec[k*(k-1)/2 + l] }
  mat
}
s2o <- function(p) {   # "scaled to original": UCP -> THETA/OMEGA/SIGMA
  p1 <- exp(p[1:nTheta] - alpha)
  list(THETA = p1/(p1 + 1)*(UB - LB) + LB,
       OMEGA = DesclVar(ltv2mat(p[iOM]), OMscl),
       SIGMA = DesclVar(diag(p[iSG]), SGscl))
}
s2o(rep(0.1, nPara))                        # all-0.1 UCP -> initial estimates
