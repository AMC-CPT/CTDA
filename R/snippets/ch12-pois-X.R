y <- doctors[, "deaths"]
ni <- doctors[, "ni"]
sumlfacty <- sum(lfactorial(y))               # precomputed to save work
X <- model.matrix(~ Smoke + Age + I(Age*Age), data = doctors);  X
