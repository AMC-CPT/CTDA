y1 <- d1[d1$DV == 1, "TIME"]            # 사망 시점
y2 <- d1[d1$DV == 0, "TIME"]            # 중도절단 시점
mll <- function(th) {                   # th[1]=a=shape, th[2]=b=rate
  r1 <- sum(log(St(y1, th[1], th[2])) + log(ht(y1, th[1], th[2])))   # 사건
  r2 <- sum(log(St(y2, th[1], th[2])))                              # 절단
  -(r1 + r2)
}
