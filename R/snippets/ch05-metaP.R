# Fisher's method: combine the one-sided p-values of several studies.
metaP <- function(one.sided.p) {
  ChiSq <- -2 * sum(log(one.sided.p))
  p.value <- 1 - pchisq(ChiSq, 2 * length(one.sided.p))
  c(ChiSq = ChiSq, p.value = p.value)
}
metaP(c(0.3279, 0.0859, 0.1254, 0.0723, 0.1025))
