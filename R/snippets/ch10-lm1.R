r1 <- lm(y ~ x)
summary(r1)
predict(r1, data.frame(x), interval = "confidence")
predict(r1, data.frame(x), interval = "prediction")
