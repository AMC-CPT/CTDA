r5 <- glm(y/n ~ x, weight = n, "binomial", beetle)
summary(r5)
logLik(r5)
