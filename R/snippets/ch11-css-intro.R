anova(lm(uptake ~ Type, CO2))

library(sasLM)
rx <- REG(uptake ~ Type, CO2, summarize = FALSE)
cSS(t(c(0, -1, 1)), rx)
