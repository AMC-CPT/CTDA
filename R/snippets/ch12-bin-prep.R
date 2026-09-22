X <- model.matrix(~ x, data = beetle)
n <- beetle$n
y <- beetle$y
sumlogny <- sum(lchoose(beetle$n, beetle$y))   # saves computation
