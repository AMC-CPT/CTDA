require(deSolve)
PKo1c <- function(t, y, p) {   # first 2: original ODEs; next 6: d/d eta of them
  dy1dt <- -p["ka"]*y[1]
  dy2dt <-  p["ka"]*y[1] - p["k"]*y[2]
  dy3dt <- -p["ka"]*y[1] - p["ka"]*y[3]
  dy4dt <- -p["ka"]*y[4]
  dy5dt <- -p["ka"]*y[5]
  dy6dt <-  p["ka"]*y[1] + p["ka"]*y[3] - p["k"]*y[6]
  dy7dt <- -p["k"]*y[7]
  dy8dt <- -p["k"]*y[2] - p["k"]*y[8]
  list(c(dy1dt, dy2dt, dy3dt, dy4dt, dy5dt, dy6dt, dy7dt, dy8dt))
}
V     <- EstRes[[4]][2]
Para  <- c(ka = EstRes[[4]][1], k = EstRes[[4]][3])
Times <- DATA[DATA$ID == 1, "TIME"]
Out   <- lsoda(y = c(320,0,0,0,0,0,0,0), times = Times, func = PKo1c, parms = Para)
Out   <- cbind(Out, F = Out[,"2"]/V)
Out   <- cbind(Out,
               G1 = (Out[,"6"] - Out[,"F"]*0)/V,   # dF/deta1  (dV/deta1 = 0)
               G2 = (Out[,"7"] - Out[,"F"]*V)/V,   # dF/deta2  (dV/deta2 = V)
               G3 = (Out[,"8"] - Out[,"F"]*0)/V,   # dF/deta3  (dV/deta3 = 0)
               H1 = Out[,"F"], H2 = 1)
Out[, c("F", "G1", "G2", "G3", "H1", "H2")]   # compare with the TabStep result
