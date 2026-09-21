mLL <- function(p) -log(Lik(p))
nlminb(0.5, mLL, lower = 0, upper = 1)
