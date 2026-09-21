X <- model.matrix(~ x, data = beetle)
n <- beetle$n
y <- beetle$y
sumlogny <- sum(lchoose(beetle$n, beetle$y))   # 계산량 감소
