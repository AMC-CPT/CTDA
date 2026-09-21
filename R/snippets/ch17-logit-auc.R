d2 <- read.csv("data/AUC-Resp-Logistic.csv")
r2 <- glm(y2 ~ x2, d2, family = "binomial")
summary(r2)
predict(r2, d2, type = "response")
