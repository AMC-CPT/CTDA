Y <- d7[, c("y1", "y2", "y3")]
X <- model.matrix(~ sexN + as.factor(ageN), d7)
ni <- rowSums(Y)
nyLevel <- ncol(Y)
