require(wnl)
d1 <- Theoph
colnames(d1) <- c("ID", "BWT", "DOSE", "TIME", "DV")
d2 <- d1[d1$ID == 1, ]
plot(d2[, "TIME"], d2[, "DV"], type = "o",
     xlab = "Time (h)", ylab = "Concentration (mg/L)")
