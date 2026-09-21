# Fisher의 방법: 여러 연구의 단측 p-value 를 병합한다.
metaP <- function(one.sided.p) {
  ChiSq <- -2 * sum(log(one.sided.p))
  p.value <- 1 - pchisq(ChiSq, 2 * length(one.sided.p))
  c(ChiSq = ChiSq, p.value = p.value)
}
metaP(c(0.3279, 0.0859, 0.1254, 0.0723, 0.1025))
