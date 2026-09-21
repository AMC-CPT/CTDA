d7 <- reshape(Cars, direction = "wide", idvar = c("sex", "age"), timevar = "response")
colnames(d7) <- c("sex", "age", "y1", "y2", "y3")
d7[, "sexN"] <- as.numeric(d7$sex == "men")
d7[, "ageN"] <- rep(0:2, 2)
d7
