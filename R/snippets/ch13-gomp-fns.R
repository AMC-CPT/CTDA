St <- function(y, a, b) exp(b/a * (1 - exp(a*y)))   # Gompertz 생존함수
ht <- function(y, a, b) b * exp(a*y)                # Gompertz 위험함수
