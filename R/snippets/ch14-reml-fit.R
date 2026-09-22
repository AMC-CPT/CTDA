Orth.REML <- lme(distance ~ age, random = ~ age | Subject, data = Orthodont) # REML default
summary(Orth.REML)
