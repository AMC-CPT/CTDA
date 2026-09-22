N     <- 2000
nMax  <- 456
nSamp <- 20
qt0975 <- qt(0.975, nSamp - 1)
Res <- as.data.frame(matrix(ncol = 10, nrow = N))
colnames(Res) <- c("th1", "LL1", "UL1", "in1", "th2", "LL2", "UL2", "in2", "LL3", "in3")
for (i in 1:N) {
  d1 <- sample(nMax, nSamp)                        # strictly, replace = TRUE is needed
  th1 <- mean(d1) * 2 - 1
  sd1 <- sqrt((th1^2 - 1) / (3 * nSamp))
  ci1 <- th1 + c(-1, 1) * qt0975 * sd1
  Res[i, 1] <- th1;  Res[i, 2:3] <- ci1
  Res[i, 4] <- ifelse(ci1[1] < nMax & ci1[2] > nMax, TRUE, FALSE)
  Yn <- max(d1)
  th2 <- Yn * (nSamp + 1) / nSamp
  sd2 <- sqrt(th2^2 / (nSamp * (nSamp + 2)))
  ci2 <- th2 + c(-1, 1) * qt0975 * sd2
  Res[i, 5] <- th2;  Res[i, 6:7] <- ci2
  Res[i, 8] <- ifelse(ci2[1] < nMax & ci2[2] > nMax, TRUE, FALSE)
  Res[i, 9] <- Yn
  Res[i, 10] <- ifelse(Yn <= nMax & ci2[2] > nMax, TRUE, FALSE)
}
colMeans(Res)
mean(Res[, 3] - Res[, 2])   # width of ci1, 246.08 -> widest
mean(Res[, 7] - Res[, 6])   # width of ci2,  91.15
mean(Res[, 7] - Res[, 9])   # width of ci3,  67.33 -> narrowest
