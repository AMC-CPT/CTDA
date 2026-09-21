"%^%" <- function(M, x) with(eigen(M), vectors %*% (abs(values)^x * t(vectors)))
m0 <- matrix(rnorm(9), ncol = 3);  m1 <- crossprod(m0);  m1
A <- m1 %^% (1/3);  A %*% A %*% A     # 세제곱근을 세제곱하면 원래 행렬
A %^% 3
B <- m1 %^% -0.5;  solve(B %*% B)     # 역행렬의 제곱근
