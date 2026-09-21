d2 <- CO2[-1, ]   # 첫 행 제거 -> 불균형 자료
anova(lm(uptake ~ Type + Treatment, d2))
anova(lm(uptake ~ Treatment + Type, d2))   # 순서에 따라 달라짐
