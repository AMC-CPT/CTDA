RDmn1 <- function(y1, n1, y2, n2, conf.level = 0.95, eps = 1e-8) {
  p1 <- y1/n1;  p2 <- y2/n2
  RD <- p1 - p2
  v0 <- qchisq(conf.level, 1)
  Obj <- function(rd) {
    mLL <- function(p1t) -dbinom(y1, n1, p1t, log = TRUE) - dbinom(y2, n2, p1t - rd, log = TRUE)
    p1t <- nlminb(p1, mLL, lower = max(0, RD), upper = min(1, RD + 1))$par
    p2t <- max(0, min(p1t - rd, 1))
    var0 <- (p1t*(1 - p1t)/n1 + p2t*(1 - p2t)/n2)*(n1 + n2)/(n1 + n2 - 1)
    ((rd - RD)^2/var0 - v0)^2
  }
  options(warn = -1)
  LL <- nlminb(max(eps - 1, RD - eps), Obj, lower = max(-1, RD - 1), upper = RD)$par
  UL <- nlminb(min(1 - eps, RD + eps), Obj, lower = RD, upper = min(RD + 1, 1))$par
  options(warn = 1)
  data.frame(p1 = p1, p2 = p2, RD = RD, lower = LL, upper = UL)
}

RRmn1 <- function(y1, n1, y2, n2, conf.level = 0.95, eps = 1e-8) {
  p1 <- y1/n1;  p2 <- y2/n2
  RR <- p1/p2
  v0 <- qchisq(conf.level, 1)
  Obj <- function(rr) {
    mLL <- function(p2t) -dbinom(y1, n1, p2t*rr, log = TRUE) - dbinom(y2, n2, p2t, log = TRUE)
    p2t <- nlminb(p2, mLL, lower = 0, upper = 1)$par
    p1t <- p2t*rr
    var0 <- (p1t*(1 - p1t)/n1 + RR*RR*p2t*(1 - p2t)/n2)*(n1 + n2)/(n1 + n2 - 1)
    ((p1t - p2t*RR)^2/var0 - v0)^2
  }
  options(warn = -1)
  LL <- nlminb(max(eps, RR - eps), Obj, lower = 0, upper = RR)$par
  UL <- nlminb(RR + eps, Obj, lower = RR)$par
  options(warn = 1)
  data.frame(p1 = p1, p2 = p2, RR = RR, lower = LL, upper = UL)
}

ORmn1 <- function(y1, n1, y2, n2, conf.level = 0.95, eps = 1e-8) {
  p1 <- y1/n1;  p2 <- y2/n2
  o1 <- y1/(n1 - y1);  o2 <- y2/(n2 - y2)
  OR <- o1/o2
  v0 <- qchisq(conf.level, 1)
  Obj <- function(or) {
    mLL <- function(p2t) {
      p1t <- p2t*or/(1 + p2t*(or - 1))
      -dbinom(y1, n1, p1t, log = TRUE) - dbinom(y2, n2, p2t, log = TRUE)
    }
    p2t <- nlminb(p2, mLL, lower = 0, upper = 1)$par
    p1t <- p2t*or/(1 + p2t*(or - 1))
    div <- (p1 - p1t)/(p1t*(1 - p1t)) - (p2 - p2t)/(p2t*(1 - p2t))
    var0 <- (1/(n1*p1t*(1 - p1t)) + 1/(n2*p2t*(1 - p2t)))*(n1 + n2)/(n1 + n2 - 1)
    (div^2/var0 - v0)^2
  }
  options(warn = -1)
  LL <- nlminb(max(eps, OR - eps), Obj, lower = 0, upper = OR)$par
  UL <- nlminb(OR + eps, Obj, lower = OR)$par
  options(warn = 1)
  data.frame(odd1 = o1, odd2 = o2, OR = OR, lower = LL, upper = UL)
}
