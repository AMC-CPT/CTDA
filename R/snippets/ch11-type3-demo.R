weight <- c(8, 13, 9, 12, 7, 11, 6, 12, 12, 14, 9, 7, 14, 16, 10, 14, 11, 13)
treatment <- c("ta","ta","ta","ta","ta","ta","tb","tb","tb","tb",
               "tc","tc","tc","tc","tc","tc","tc","tc")
variety <- c("va","va","va","vc","vd","vd","va","va","vb","vb",
             "vb","vb","vc","vc","vd","vd","vd","vd")
d1 <- data.frame(weight, treatment, variety)

library(car)
options(contrasts = c("contr.sum", "contr.poly"))
Anova(lm(weight ~ treatment * variety, d1), type = 3, singular.ok = TRUE)   # SAS 와 다름
