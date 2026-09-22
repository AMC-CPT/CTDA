r4 <- glm(deaths ~ Smoke + Age + I(Age*Age) + Age:Smoke + offset(log(ni)),
          "poisson", doctors)
summary(r4)
exp(r4$coef[-1])          # rate ratios
anova(r1, r4)             # compare models with and without the interaction
