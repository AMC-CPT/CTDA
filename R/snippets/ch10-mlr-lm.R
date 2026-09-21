r2 <- lm(y ~ x1 + x2, d2)
summary(r2)
predict(r2, d2, interval = "confidence")
predict(r2, d2, interval = "prediction")
