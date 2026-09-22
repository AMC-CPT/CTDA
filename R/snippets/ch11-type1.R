d2 <- CO2[-1, ]   # drop the first row -> unbalanced data
anova(lm(uptake ~ Type + Treatment, d2))
anova(lm(uptake ~ Treatment + Type, d2))   # depends on the order
