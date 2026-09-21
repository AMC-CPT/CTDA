d3 <- ovarian[order(ovarian$futime), c("futime", "fustat", "rx")]
length(unique(d3$futime)) == nrow(d3)   # TRUE: 모든 시점이 유일

d3$di1 <- as.numeric(d3$rx == 2 & d3$fustat)   # test 군 사건수 (Oi)
d3$di2 <- as.numeric(d3$rx == 1 & d3$fustat)   # control 군 사건수 (Oi)

n1 <- sum(d3$rx == 2)                   # test 군 13명
n2 <- sum(d3$rx == 1)                   # control 군 13명
d3$Yi1 <- c(n1, rep(NA, n1 + n2 - 1))   # test 군 위험집합
d3$Yi2 <- c(n2, rep(NA, n1 + n2 - 1))   # control 군 위험집합
for (i in 2:nrow(d3)) {
  d3[i, "Yi1"] <- d3[i - 1, "Yi1"] - as.numeric(d3[i - 1, "rx"] == 2)
  d3[i, "Yi2"] <- d3[i - 1, "Yi2"] - as.numeric(d3[i - 1, "rx"] == 1)
}
d3
