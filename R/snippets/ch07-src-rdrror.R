RD <- function(y1, n1, y2, n2, conf.level = 0.95) {   # Risk Difference
  p1 <- y1/n1;  p2 <- y2/n2
  pe <- p1 - p2
  se <- sqrt(p1*(1 - p1)/n1 + p2*(1 - p2)/n2)          # SE of pe
  z.crit <- qnorm(0.5 + conf.level/2)
  data.frame(p1 = p1, p2 = p2, RD = pe, SE = se,
             lower = pe - z.crit*se, upper = pe + z.crit*se)
}

RR <- function(y1, n1, y2, n2, conf.level = 0.95) {   # Relative Risk
  p1 <- y1/n1;  p2 <- y2/n2
  pe <- p1/p2
  selog <- sqrt(1/y1 - 1/n1 + 1/y2 - 1/n2)             # SE of log(pe)
  z.crit <- qnorm(0.5 + conf.level/2)
  data.frame(p1 = p1, p2 = p2, RR = pe, SElog = selog,
             lower = exp(log(pe) - z.crit*selog), upper = exp(log(pe) + z.crit*selog))
}

OR <- function(y1, n1, y2, n2, conf.level = 0.95) {   # Odds Ratio
  o1 <- y1/(n1 - y1);  o2 <- y2/(n2 - y2)
  pe <- o1/o2
  selog <- sqrt(1/y1 + 1/(n1 - y1) + 1/y2 + 1/(n2 - y2))
  z.crit <- qnorm(0.5 + conf.level/2)
  data.frame(odd1 = o1, odd2 = o2, OR = pe, SElog = selog,
             lower = exp(log(pe) - z.crit*selog), upper = exp(log(pe) + z.crit*selog))
}
