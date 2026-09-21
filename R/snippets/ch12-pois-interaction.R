r4 <- glm(deaths ~ Smoke + Age + I(Age*Age) + Age:Smoke + offset(log(ni)),
          "poisson", doctors)
summary(r4)
exp(r4$coef[-1])          # 율비 (rate ratio)
anova(r1, r4)             # 교호작용 유무 모형 비교
