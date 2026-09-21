doctors[, "Age"]   <- as.numeric(as.ordered(doctors$age))
doctors[, "Smoke"] <- as.numeric(doctors$smoking == "smoker")
doctors[, "ni"]    <- doctors$'person-years'
r1 <- glm(deaths ~ Smoke + Age + I(Age*Age) + offset(log(ni)), "poisson", doctors)
summary(r1)
