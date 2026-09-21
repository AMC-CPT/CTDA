y <- doctors[, "deaths"]
ni <- doctors[, "ni"]
sumlfacty <- sum(lfactorial(y))               # 계산량을 줄이기 위해 미리 준비
X <- model.matrix(~ Smoke + Age + I(Age*Age), data = doctors);  X
