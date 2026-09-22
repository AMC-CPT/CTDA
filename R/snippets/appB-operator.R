"%^%" <- function(M, x) with(eigen(M), vectors %*% (abs(values)^x * t(vectors)))
m0 <- matrix(rnorm(9), ncol = 3);  m1 <- crossprod(m0);  m1
A <- m1 %^% (1/3);  A %*% A %*% A     # cubing the cube root gives the matrix back
A %^% 3
B <- m1 %^% -0.5;  solve(B %*% B)     # square root of the inverse
