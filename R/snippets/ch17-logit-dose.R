d1 <- read.csv("data/Dose-Resp-Logistic.csv")
r1 <- glm(y ~ x, d1, family = "binomial")
summary(r1)
predict(r1, d1, type = "response")
