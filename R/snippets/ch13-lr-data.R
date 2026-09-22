d3 <- ovarian[order(ovarian$futime), c("futime", "fustat", "rx")]
length(unique(d3$futime)) == nrow(d3)   # TRUE: all times are distinct

d3$di1 <- as.numeric(d3$rx == 2 & d3$fustat)   # events in the test group (Oi)
d3$di2 <- as.numeric(d3$rx == 1 & d3$fustat)   # events in the control group (Oi)

n1 <- sum(d3$rx == 2)                   # 13 in the test group
n2 <- sum(d3$rx == 1)                   # 13 in the control group
d3$Yi1 <- c(n1, rep(NA, n1 + n2 - 1))   # risk set, test group
d3$Yi2 <- c(n2, rep(NA, n1 + n2 - 1))   # risk set, control group
for (i in 2:nrow(d3)) {
  d3[i, "Yi1"] <- d3[i - 1, "Yi1"] - as.numeric(d3[i - 1, "rx"] == 2)
  d3[i, "Yi2"] <- d3[i - 1, "Yi2"] - as.numeric(d3[i - 1, "rx"] == 1)
}
d3
