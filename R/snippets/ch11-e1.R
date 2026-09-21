x <- ModelMatrix(uptake ~ Type + Treatment, d2)
ce1 <- e1(crossprod(x$X));  zapsmall(ce1)
