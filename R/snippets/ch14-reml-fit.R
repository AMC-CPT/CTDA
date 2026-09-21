Orth.REML <- lme(distance ~ age, random = ~ age | Subject, data = Orthodont)  # REML 기본
summary(Orth.REML)
