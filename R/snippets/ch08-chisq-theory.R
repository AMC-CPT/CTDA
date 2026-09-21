x <- seq(0, 30, length.out = 101)
y1 <- dchisq(x, df = Df)
y2 <- dchisq(x, df = Df - 1)
