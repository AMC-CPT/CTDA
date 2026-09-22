y1 <- d1[d1$DV == 1, "TIME"]            # event times
y2 <- d1[d1$DV == 0, "TIME"]            # censoring times
mll <- function(th) {                   # th[1]=a=shape, th[2]=b=rate
  r1 <- sum(log(St(y1, th[1], th[2])) + log(ht(y1, th[1], th[2])))   # events
  r2 <- sum(log(St(y2, th[1], th[2])))                              # censored
  -(r1 + r2)
}
