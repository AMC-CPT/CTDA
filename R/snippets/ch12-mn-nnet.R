library(nnet)
d8 <- reshape(d7, timevar = "Y", times = c("0-no", "1-yes", "2-very"),
              v.names = "Count", varying = c("y1", "y2", "y3"), direction = "long")
r9  <- multinom(Y ~ sexN + as.factor(ageN), weights = Count, data = d8, trace = FALSE)
r10 <- multinom(Y ~ sexN + ageN, weights = Count, data = d8, trace = FALSE)
summary(r10)
anova(r10, r9)
