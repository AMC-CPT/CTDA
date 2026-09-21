Orth.ML <- lme(distance ~ age, random = ~ age | Subject, data = Orthodont, method = "ML")
summary(Orth.ML)
