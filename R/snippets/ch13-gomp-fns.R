St <- function(y, a, b) exp(b/a * (1 - exp(a*y)))   # Gompertz survival function
ht <- function(y, a, b) b * exp(a*y)                # Gompertz hazard function
