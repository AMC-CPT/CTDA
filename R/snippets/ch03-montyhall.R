Rule <- "Change"
N <- 1000
Res <- rep(NA, N)
for (i in 1:N) {
  Hidden <- sample(3, 1)
  Choice <- sample(3, 1)
  Show0 <- setdiff(1:3, union(Hidden, Choice))
  if (length(Show0) == 1) Show <- Show0 else Show <- Show0[sample(2, 1)]
  if (Rule == "Change") Choice2 <- setdiff(1:3, union(Choice, Show)) else Choice2 <- Choice
  Res[i] <- (Hidden == Choice2)
}
mean(Res)
